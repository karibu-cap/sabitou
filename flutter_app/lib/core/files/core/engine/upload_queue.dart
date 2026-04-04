import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

import '../../../../utils/network_utils.dart';
import '../../common/file_category.dart';
import '../../common/upload_item.dart';
import '../../services/minio_service.dart';

/// Persistent, background-safe upload queue.
///
/// ## Persistence
/// The queue is stored in [FlutterSecureStorage] (already in your pubspec) as
/// a single JSON map keyed by item ID. No new storage dependency is needed.
///
/// ## Server reachability
/// Uses [NetworkUtils.isServerReachable()] (hits your Go connector `/health`)
/// instead of `connectivity_plus`. This works correctly whether Sabitou is
/// deployed on the internet OR on a local intranet store server — interface
/// state (WiFi/mobile) tells us nothing about whether *our* server is up.
///
/// ## Retry strategy
/// A periodic [Timer] polls every [_pollInterval] when there are pending
/// items. An immediate flush is also triggered on every [enqueue] call.
/// Maximum [_maxRetries] attempts before an item is permanently marked failed.
class UploadQueue {
  /// Singleton instance.
  static final UploadQueue instance = GetIt.I.get<UploadQueue>();

  // Storage key inside flutter_secure_storage.
  static const _storageKey = 'sabitou_upload_queue';
  static const _maxRetries = 5;

  /// How often to poll for server reachability when items are pending.
  static const _pollInterval = Duration(seconds: 30);

  final _uuid = const Uuid();
  final _storage = const FlutterSecureStorage();
  final _controller = StreamController<UploadQueueEvent>.broadcast();
  Timer? _pollTimer;
  bool _running = false;

  /// Stream of upload events for UI feedback.
  Stream<UploadQueueEvent> get events => _controller.stream;

  /// Call once at app startup (after [MinioService.instance.init]).
  ///
  /// Starts the periodic poll loop and attempts an immediate flush.
  void start() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(_pollInterval, (_) => _flush());
    _flush(); // immediate attempt on startup
  }

  /// Stops the periodic poll loop.
  void dispose() {
    _pollTimer?.cancel();
    _controller.close();
  }

  /// Enqueues [xFile] for upload and returns the [UploadItem.id].
  ///
  /// The [resourceLinkId] is the ID already written to the local DB so the
  /// rest of the app can reference this file immediately (offline-first).
  /// The [objectKey] must match the one used to build [futureRemoteUrl].
  /// The [bytes] are the compressed file bytes - stored directly for web
  /// compatibility since blob URLs may not persist.
  Future<String> enqueue({
    required XFile xFile,
    required Uint8List bytes,
    required FileCategory category,
    required String resourceLinkId,
    required String objectKey,
  }) async {
    final id = _uuid.v4();

    final item = UploadItem(
      id: id,
      localPath: xFile.path,
      bytes: bytes,
      objectKey: objectKey,
      resourceLinkId: resourceLinkId,
      categoryName: category.name,
      createdAt: DateTime.now(),
    );

    await _persist(item);
    _controller.add(UploadQueueEvent.enqueued(item));
    await _flush(); // try immediately; no-ops if server is unreachable

    return id;
  }

  /// Returns all pending (non-done) items.
  Future<List<UploadItem>> pendingItems() async {
    final items = await _loadAll();

    return items.where((i) => i.status != UploadStatus.done).toList();
  }

  Future<void> _flush() async {
    if (_running) return;
    _running = true;

    try {
      // Gate on actual server reachability — covers internet AND intranet.
      final reachable = await NetworkUtils.isServerReachable();
      if (!reachable) return;

      final items = await _loadAll();
      final pending = items
          .where(
            (i) =>
                i.status == UploadStatus.pending ||
                (i.status == UploadStatus.failed && i.retryCount < _maxRetries),
          )
          .toList();

      for (final item in pending) {
        // Re-check between each item — a long upload may have lost connection.
        if (!await NetworkUtils.isServerReachable()) break;
        await _processItem(item);
      }
    } finally {
      _running = false;
    }
  }

  Future<void> _processItem(UploadItem item) async {
    final uploading = item.copyWith(status: UploadStatus.uploading);
    await _persist(uploading);
    _controller.add(UploadQueueEvent.uploading(uploading));

    try {
      // Use stored bytes directly (needed for web where blob URLs don't persist)
      final bytes = item.bytes;

      final contentType = _contentType(item.localPath);
      final category = FileCategory.values.firstWhere(
        (c) => c.name == item.categoryName,
      );

      final url = await MinioService.instance.upload(
        bytes: bytes,
        bucket: category.bucket,
        objectKey: item.objectKey,
        contentType: contentType,
        onProgress: (sent, total) {
          _controller.add(UploadQueueEvent.progress(item.id, sent, total));
        },
      );

      final done = item.copyWith(status: UploadStatus.done);
      await _persist(done);
      _controller.add(UploadQueueEvent.done(done, remoteUrl: url));
    } catch (e) {
      final failed = item.copyWith(
        status: UploadStatus.failed,
        retryCount: item.retryCount + 1,
      );
      await _persist(failed);
      _controller.add(UploadQueueEvent.failed(failed, error: e.toString()));
    }
  }

  Future<List<UploadItem>> _loadAll() async {
    final raw = await _storage.read(key: _storageKey);
    if (raw == null) return [];

    final map = jsonDecode(raw) as Map<String, dynamic>;

    return map.values
        .map((v) => UploadItem.fromJsonString(v as String))
        .toList();
  }

  Future<void> _persist(UploadItem item) async {
    final raw = await _storage.read(key: _storageKey);
    final map = raw != null
        ? jsonDecode(raw) as Map<String, dynamic>
        : <String, dynamic>{};

    map[item.id] = item.toJsonString();
    await _storage.write(key: _storageKey, value: jsonEncode(map));
  }

  String _contentType(String path) {
    final ext = p.extension(path).toLowerCase();

    return switch (ext) {
      '.jpg' || '.jpeg' => 'image/jpeg',
      '.png' => 'image/png',
      '.webp' => 'image/webp',
      '.pdf' => 'application/pdf',
      _ => 'application/octet-stream',
    };
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Events
// ─────────────────────────────────────────────────────────────────────────────

/// Events emitted by [UploadQueue].
sealed class UploadQueueEvent {
  const UploadQueueEvent();

  factory UploadQueueEvent.enqueued(UploadItem item) = _Enqueued;
  factory UploadQueueEvent.uploading(UploadItem item) = _Uploading;
  factory UploadQueueEvent.progress(String id, int sent, int total) = _Progress;
  factory UploadQueueEvent.done(UploadItem item, {required String remoteUrl}) =
      _Done;
  factory UploadQueueEvent.failed(UploadItem item, {required String error}) =
      _Failed;
}

final class _Enqueued extends UploadQueueEvent {
  final UploadItem item;
  const _Enqueued(this.item);
}

final class _Uploading extends UploadQueueEvent {
  final UploadItem item;
  const _Uploading(this.item);
}

final class _Progress extends UploadQueueEvent {
  final String id;
  final int sent;
  final int total;
  const _Progress(this.id, this.sent, this.total);
  double get progress => total == 0 ? 0 : sent / total;
}

final class _Done extends UploadQueueEvent {
  final UploadItem item;
  final String remoteUrl;
  const _Done(this.item, {required this.remoteUrl});
}

final class _Failed extends UploadQueueEvent {
  final UploadItem item;
  final String error;
  const _Failed(this.item, {required this.error});
}

// Expose concrete types.

/// Type alias for [UploadQueueEvent.enqueued].
typedef UploadEnqueued = _Enqueued;

/// Type alias for [UploadQueueEvent.uploading].
typedef UploadUploading = _Uploading;

/// Type alias for [UploadQueueEvent.progress].
typedef UploadProgress = _Progress;

/// Type alias for [UploadQueueEvent.done].
typedef UploadDone = _Done;

/// Type alias for [UploadQueueEvent.failed].
typedef UploadFailed = _Failed;
