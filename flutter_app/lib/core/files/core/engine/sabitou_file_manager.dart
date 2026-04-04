import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

import '../../../../utils/logger.dart';
import '../../../../utils/utils.dart';
import '../../common/compression_service.dart';
import '../../common/file_cache_manager.dart';
import '../../common/file_category.dart';
import '../../services/minio_service.dart';
import 'upload_queue.dart';

/// Configuration passed to [SabitouFileManager.init].
class FileManagerConfig {
  /// The Minio connection configuration.
  final MinioConfig minioConfig;

  /// Called when an upload completes to update the `ResourceLink.target_uri`
  /// in the local DB and via gRPC.
  ///
  /// Parameters: `(resourceLinkId, remoteUrl)`
  final Future<bool> Function(String resourceLinkId, String remoteUrl)?
  onUploadComplete;

  /// Constructs a new [FileManagerConfig].
  const FileManagerConfig({required this.minioConfig, this.onUploadComplete});
}

/// The central coordinator for all file operations in Sabitou.
///
/// ## Architecture
///
/// ```
/// SabitouFilePicker  ──▶  SabitouFileManager.prepareAndUpload()
///                                │
///                    ┌──────────▼─────────────┐
///                    │  CompressionService      │  resize + compress
///                    └──────────┬─────────────┘
///                               │ compressed File
///                    ┌──────────▼─────────────┐
///                    │  UploadQueue.enqueue()   │  write to SQLite via
///                    │  + ResourceLink upsert   │  ResourceLinkRepository
///                    └──────────┬─────────────┘
///                               │ background
///                    ┌──────────▼─────────────┐
///                    │  MinioService.upload()   │  S3-compatible PUT
///                    └────────────────────────┘
/// ```
///
/// DB stores only the `ResourceLink.ref_id`. The actual binary lives in MinIO.
/// The local file at `app_docs/{category}/{uuid}` acts as an offline cache.
class SabitouFileManager {
  /// The singleton instance.
  static final SabitouFileManager instance = GetIt.I.get<SabitouFileManager>();

  final _logger = LoggerApp('SabitouFileManager');

  FileManagerConfig? _config;
  bool _initialised = false;

  /// Pending uploads staged in memory, keyed by resourceLinkId.
  /// Populated by [prepareOnly], consumed by [confirmUpload] or [cancelPending].
  final Map<String, _PendingUpload> _pendingUploads = {};

  /// Set of file content hashes for duplicate detection within a session.
  /// Maps file hash -> resourceLinkId to track which file is already staged.
  final Map<String, String> _fileHashes = {};

  /// Constructs a new [SabitouFileManager].

  // ─────────────────────────────────────────────────────────────────────────
  // Lifecycle
  // ─────────────────────────────────────────────────────────────────────────

  /// Must be called once, before any file feature is used.
  ///
  /// Typically placed in `main.dart` after `GetIt` setup:
  ///
  /// ```dart
  /// SabitouFileManager.instance.init(
  ///   FileManagerConfig(
  ///     minioConfig: MinioConfig(
  ///       endpoint: 'http://localhost:9000',
  ///       host: 'localhost:9000',
  ///       accessKey: 'minioadmin',
  ///       secretKey: 'minioadmin',
  ///     ),
  ///     onUploadComplete: (linkId, url) async {
  ///       await ResourceLinkRepository.instance.updateTargetUri(linkId, url);
  ///     },
  ///   ),
  /// );
  /// ```
  Future<void> init(FileManagerConfig config) async {
    _config = config;
    GetIt.I.registerSingletonIfAbsent(
      () => MinioService(config: config.minioConfig),
    );
    GetIt.I.registerSingletonIfAbsent(CompressionService.new);
    GetIt.I.registerSingletonIfAbsent(FileCacheManager.new);
    GetIt.I.registerSingletonIfAbsent(UploadQueue.new);

    /// Wait few seconds for the services to be initialized.
    await Future.delayed(const Duration(seconds: 1));

    // Listen for completed uploads and call the DB update callback.
    UploadQueue.instance.events.listen((event) {
      if (event is UploadDone && _config != null) {
        _config?.onUploadComplete
            ?.call(event.item.resourceLinkId, event.remoteUrl)
            .catchError((e) => _logger.severe('onUploadComplete error: $e'));
      }
    });

    // Start the background flush loop.
    UploadQueue.instance.start();

    // Ensure the default bucket exists.
    try {
      await MinioService.instance.ensureBucketExists('sabitou-media');
    } catch (e) {
      _logger.warning('ensureBucketExists failed (non-fatal): $e');
    }

    _initialised = true;
    _logger.info('SabitouFileManager initialised.');
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Core API
  // ─────────────────────────────────────────────────────────────────────────

  /// Prepares [file] for a given [category]:
  ///
  /// 1. Compresses / resizes the file.
  /// 2. Saves a compressed copy in `app_docs/{category}/`.
  /// 3. Creates a placeholder `ResourceLink` in the local DB (path only).
  /// 4. Enqueues the upload (fires immediately if online).
  ///
  /// Returns the `ResourceLink.ref_id` to store in your model (e.g.
  /// `StoreProduct.images_links_ids`).
  ///
  /// **The returned ID is immediately usable** — the UI can display the local
  /// file while the upload happens in the background.
  Future<PrepareResult> prepareAndUpload(
    XFile xFile,
    FileCategory category, {
    bool? forceGrayscale,
    String? existingResourceLinkId,
  }) async {
    _assertInit();

    // 1. Compress.
    final compression = await CompressionService.instance.compress(
      xFile,
      category,
      forceGrayscale: forceGrayscale,
    );
    _logger.info(
      'Compressed ${category.name}: '
      '${(compression.originalBytes / 1024).toStringAsFixed(0)} KB → '
      '${(compression.compressedBytes / 1024).toStringAsFixed(0)} KB '
      '(${compression.savedPercent.toStringAsFixed(0)}% saved)',
    );

    // 2. Generate a resource link ID (caller may pass an existing one for
    //    updates).
    final resourceLinkId =
        existingResourceLinkId ?? AppUtils.generateSmartDatabaseId('MDI');

    // The remote URL is the MinIO URL that will exist once the upload
    // completes. We derive it now so the DB entry is consistent.
    // Use xFile.name (original filename) instead of xFile.path because on
    // Flutter Web, path is a blob URL without extension.
    final ext = p.extension(compression.xFile.name);
    final ts = DateTime.now().millisecondsSinceEpoch;
    final objectKey = '${category.objectPrefix}${resourceLinkId}_$ts$ext';
    final futureRemoteUrl =
        '${_config?.minioConfig.endpoint}/${category.bucket}/$objectKey';

    // 3. Enqueue upload with the SAME objectKey used for futureRemoteUrl.
    final compressedBytes = await compression.xFile.readAsBytes();
    await UploadQueue.instance.enqueue(
      xFile: compression.xFile,
      bytes: compressedBytes,
      category: category,
      resourceLinkId: resourceLinkId,
      objectKey: objectKey,
    );

    return PrepareResult(
      resourceLinkId: resourceLinkId,
      localPath: compression.xFile.path,
      futureRemoteUrl: futureRemoteUrl,
    );
  }

  /// Prepares [xFile] for upload but does NOT enqueue yet.
  ///
  /// Use this during the file pick phase to show local preview immediately.
  /// The actual upload happens only when [confirmUpload] is called.
  ///
  /// ## Deduplication
  /// If [existingResourceLinkId] is provided (update scenario), the same
  /// objectKey is reused, overwriting the old file on MinIO instead of
  /// creating a duplicate.
  ///
  /// ## Duplicate Detection
  /// If the same file content is prepared twice in the same session,
  /// [isDuplicate] in the returned [PrepareResult] will be true and
  /// [existingResourceLinkId] will point to the first occurrence.
  ///
  /// Returns the [PrepareResult] containing localPath for preview and
  /// resourceLinkId to store in your model.
  Future<PrepareResult> prepareOnly(
    XFile xFile,
    FileCategory category, {
    bool? forceGrayscale,
    String? existingResourceLinkId,
  }) async {
    _assertInit();

    // 0. Check for duplicates by computing a content hash.
    final fileHash = await _computeFileHash(xFile);
    final existingId = _fileHashes[fileHash];
    if (existingId != null && existingResourceLinkId == null) {
      // This exact file is already staged in this session.
      _logger.info(
        '[prepareOnly] Duplicate file detected: ${xFile.name} -> '
        'already staged as $existingId',
      );
      final pending = _pendingUploads[existingId];
      if (pending != null) {
        return PrepareResult(
          resourceLinkId: existingId,
          localPath: pending.xFile.path,
          futureRemoteUrl:
              '${_config?.minioConfig.endpoint}/${category.bucket}/${pending.objectKey}',
          isDuplicate: true,
          existingResourceLinkId: existingId,
        );
      }
    }

    // 1. Compress.
    final compression = await CompressionService.instance.compress(
      xFile,
      category,
      forceGrayscale: forceGrayscale,
    );
    _logger.info(
      '[prepareOnly] ${category.name}: '
      '${(compression.originalBytes / 1024).toStringAsFixed(1)} KB → '
      '${(compression.compressedBytes / 1024).toStringAsFixed(1)} KB',
    );

    // 2. Generate or reuse resource link ID.
    final resourceLinkId =
        existingResourceLinkId ?? AppUtils.generateSmartDatabaseId('MDI');

    // 3. Build object key.
    // For updates: reuse same key (overwrites old file on MinIO).
    // For new files: include timestamp to make unique.
    final ext = p.extension(compression.xFile.name);
    final objectKey = existingResourceLinkId != null
        ? '${category.objectPrefix}$resourceLinkId$ext'
        : '${category.objectPrefix}${resourceLinkId}_${DateTime.now().millisecondsSinceEpoch}$ext';
    final futureRemoteUrl =
        '${_config?.minioConfig.endpoint}/${category.bucket}/$objectKey';

    // 4. Read compressed bytes immediately (web blob URLs don't persist)
    final compressedBytes = await compression.xFile.readAsBytes();

    // 5. Store for later upload.
    _pendingUploads[resourceLinkId] = _PendingUpload(
      xFile: compression.xFile,
      bytes: compressedBytes,
      category: category,
      objectKey: objectKey,
    );

    // 5. Track hash for duplicate detection.
    if (existingResourceLinkId == null) {
      _fileHashes[fileHash] = resourceLinkId;
    }

    return PrepareResult(
      resourceLinkId: resourceLinkId,
      localPath: compression.xFile.path,
      futureRemoteUrl: futureRemoteUrl,
    );
  }

  /// Computes a content-based hash for duplicate detection.
  /// Uses size + samples from start, middle, and end for efficiency.
  Future<String> _computeFileHash(XFile xFile) async {
    try {
      final bytes = await xFile.readAsBytes();
      final size = bytes.length;

      // Take samples: first 2KB, middle 2KB, last 2KB
      const sampleSize = 2048;
      final samples = <int>[...bytes.take(sampleSize)]
      // First sample
      ;

      // Middle sample
      if (bytes.length > sampleSize * 2) {
        final middleStart = (bytes.length - sampleSize) ~/ 2;
        samples.addAll(bytes.skip(middleStart).take(sampleSize));
      }

      // Last sample
      if (bytes.length > sampleSize) {
        samples.addAll(bytes.skip(bytes.length - sampleSize).take(sampleSize));
      }

      // Include size in hash (avoid setInt64 - not supported on web)
      samples.addAll([
        size & 0xFF,
        (size >> 8) & 0xFF,
        (size >> 16) & 0xFF,
        (size >> 24) & 0xFF,
        if (size > 0xFFFFFFFF) ...[
          (size >> 32) & 0xFF,
          (size >> 40) & 0xFF,
          (size >> 48) & 0xFF,
          (size >> 56) & 0xFF,
        ],
      ]);

      return base64Encode(samples);
    } catch (e) {
      // Fallback to path + name if reading fails (e.g., web)
      _logger.warning(
        '[prepareOnly] Hash computation failed, using fallback: $e',
      );
      final length = await xFile.length();

      return '${xFile.path}_${xFile.name}_$length';
    }
  }

  /// Confirms upload for the given [resourceLinkIds].
  ///
  /// This actually enqueues the uploads to MinIO. Call this when the user
  /// clicks "Confirm" or "Save" in your form.
  ///
  /// Any IDs not found in pending (already uploaded or cancelled) are skipped.
  Future<void> confirmUpload(List<String> resourceLinkIds) async {
    _assertInit();

    for (final id in resourceLinkIds) {
      final pending = _pendingUploads.remove(id);
      if (pending == null) {
        _logger.warning('[confirmUpload] No pending upload for $id, skipping');
        continue;
      }

      await UploadQueue.instance.enqueue(
        xFile: pending.xFile,
        bytes: pending.bytes,
        category: pending.category,
        resourceLinkId: id,
        objectKey: pending.objectKey,
      );
      _logger.info('[confirmUpload] Enqueued $id → ${pending.objectKey}');
    }
  }

  /// Cancels pending uploads for [resourceLinkIds] without uploading.
  ///
  /// Call this when the user cancels the picker or removes files before
  /// confirming. This cleans up memory and prevents orphaned uploads.
  void cancelPending(List<String> resourceLinkIds) {
    for (final id in resourceLinkIds) {
      final removed = _pendingUploads.remove(id);
      if (removed != null) {
        // Also remove from hash map to allow re-adding this file
        _fileHashes.removeWhere((hash, rid) => rid == id);
        _logger.info('[cancelPending] Cancelled $id');
      }
    }
  }

  /// Retrieves the local file path for [remoteUrl], downloading from MinIO if
  /// necessary.
  Future<String> getFile(String remoteUrl, FileCategory category) =>
      FileCacheManager.instance.get(remoteUrl, category);

  /// Deletes a file from MinIO using its [remoteUrl].
  ///
  /// Also removes the file from the local cache if it exists.
  /// The [category] is used to determine which bucket to delete from.
  Future<void> delete(String remoteUrl, FileCategory category) async {
    _assertInit();

    try {
      // Parse the URL to extract bucket and objectKey
      // URL format: ${endpoint}/${bucket}/${objectKey}
      final uri = Uri.parse(remoteUrl);
      final pathSegments = uri.pathSegments;

      if (pathSegments.length < 2) {
        throw ArgumentError('Invalid MinIO URL: $remoteUrl');
      }

      final bucket = pathSegments.first;
      final objectKey = pathSegments.sublist(1).join('/');

      // Delete from MinIO
      await MinioService.instance.delete(bucket: bucket, objectKey: objectKey);
      _logger.info('[delete] Deleted $objectKey from bucket $bucket');

      // Remove from local cache if exists (skip on web - no filesystem)
      if (!kIsWeb) {
        await FileCacheManager.instance.evict(remoteUrl, category);
      }
    } catch (e, _) {
      _logger.severe('[delete] Failed to delete $remoteUrl: $e');
    }
  }

  /// Returns true if there are pending uploads (useful for showing a sync
  /// indicator in the app shell).
  Future<bool> hasPendingUploads() async =>
      (await UploadQueue.instance.pendingItems()).isNotEmpty;

  /// Whether the device has an active internet connection.
  Future<bool> isOnline() async {
    final result = await Connectivity().checkConnectivity();

    return !result.contains(ConnectivityResult.none) || result.length > 1;
  }

  void _assertInit() {
    if (!_initialised) {
      throw StateError(
        'SabitouFileManager not initialised. Call '
        'SabitouFileManager.instance.init(config) in main().',
      );
    }
  }
}

/// Internal holder for a pending upload staged by [prepareOnly].
class _PendingUpload {
  final XFile xFile;
  final Uint8List bytes;
  final FileCategory category;
  final String objectKey;

  const _PendingUpload({
    required this.xFile,
    required this.bytes,
    required this.category,
    required this.objectKey,
  });
}

/// Returned by [SabitouFileManager.prepareAndUpload] and [prepareOnly].
class PrepareResult {
  /// The ResourceLink ID to persist in your model immediately.
  final String resourceLinkId;

  /// The local file path (use for immediate UI display).
  final String localPath;

  /// The MinIO URL that will be accessible once the upload finishes.
  final String futureRemoteUrl;

  /// Whether this file is a duplicate of an already-staged file in this session.
  final bool isDuplicate;

  /// If [isDuplicate] is true, this is the ID of the first occurrence.
  final String? existingResourceLinkId;

  /// Constructs a new [PrepareResult].
  const PrepareResult({
    required this.resourceLinkId,
    required this.localPath,
    required this.futureRemoteUrl,
    this.isDuplicate = false,
    this.existingResourceLinkId,
  });
}
