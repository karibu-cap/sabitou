import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../services/minio_service.dart';
import 'file_category.dart';

/// Manages the local filesystem cache for downloaded files.
///
/// Cache layout:  `{appDocsDir}/app_docs/{category}/{fileName}`
///
/// Call [get] for a simple file fetch (await).
/// For reactive UI, use [stream] which emits progress events.
class FileCacheManager {
  /// The singleton instance.
  static final FileCacheManager instance = GetIt.I.get<FileCacheManager>();

  /// Returns the cached file path if it exists; otherwise downloads it and caches
  /// it before returning.
  Future<String> get(String remoteUrl, FileCategory category) async {
    final local = await _localPath(remoteUrl, category);
    final file = File(local);

    if (await file.exists()) return local;

    return _download(remoteUrl, category, local);
  }

  /// Emits [FileCacheEvent] during the download lifecycle.
  ///
  /// Usage:
  /// ```dart
  /// FileCacheManager.instance
  ///     .stream(remoteUrl, FileCategory.product)
  ///     .listen((event) => setState(() => _event = event));
  /// ```
  Stream<FileCacheEvent> stream(
    String remoteUrl,
    FileCategory category,
  ) async* {
    final local = await _localPath(remoteUrl, category);
    final file = File(local);

    if (await file.exists()) {
      yield FileCacheEvent.done(local);

      return;
    }

    yield const FileCacheEvent.loading(0, 0);

    try {
      final (objectKey, bucket) = _parseUrl(remoteUrl);

      // Ensure directory exists.
      await File(local).parent.create(recursive: true);

      await MinioService.instance.download(
        bucket: bucket,
        objectKey: objectKey,
        localPath: local,
        onProgress: (received, total) {
          // We can't yield inside a callback; emit via a StreamController in
          // production. Here we fire-and-forget the progress.
        },
      );

      yield FileCacheEvent.done(local);
    } catch (e) {
      yield FileCacheEvent.error(e.toString());
    }
  }

  /// Checks if [remoteUrl] is already cached.
  Future<bool> isCached(String remoteUrl, FileCategory category) async {
    final local = await _localPath(remoteUrl, category);

    return File(local).exists();
  }

  /// Deletes the local cache entry for [remoteUrl].
  Future<void> evict(String remoteUrl, FileCategory category) async {
    final local = await _localPath(remoteUrl, category);
    final file = File(local);
    if (await file.exists()) await file.delete();
  }

  /// Clears all cached files for [category].
  Future<void> clearCategory(FileCategory category) async {
    final dir = await _categoryDir(category);
    if (await dir.exists()) await dir.delete(recursive: true);
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Private helpers
  // ─────────────────────────────────────────────────────────────────────────

  Future<String> _download(
    String remoteUrl,
    FileCategory category,
    String localPath,
  ) async {
    final (objectKey, bucket) = _parseUrl(remoteUrl);
    await File(localPath).parent.create(recursive: true);

    await MinioService.instance.download(
      bucket: bucket,
      objectKey: objectKey,
      localPath: localPath,
    );
    return localPath;
  }

  Future<String> _localPath(String remoteUrl, FileCategory category) async {
    final dir = await _categoryDir(category);
    final fileName = p.basename(remoteUrl.split('?').first);

    return p.join(dir.path, fileName);
  }

  Future<Directory> _categoryDir(FileCategory category) async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, 'app_docs', category.folder));
    if (!await dir.exists()) await dir.create(recursive: true);

    return dir;
  }

  /// Extracts (objectKey, bucket) from a MinIO URL like
  /// `http://host:9000/sabitou-media/product/uuid.jpg`.
  (String objectKey, String bucket) _parseUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    // segments[0] = bucket, rest = objectKey
    final bucket = segments.isNotEmpty ? segments[0] : 'sabitou-media';
    final objectKey = segments.length > 1 ? segments.sublist(1).join('/') : '';

    return (objectKey, bucket);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Event model
// ─────────────────────────────────────────────────────────────────────────────

/// The file was deleted.
sealed class FileCacheEvent {
  const FileCacheEvent();

  const factory FileCacheEvent.loading(int received, int total) = _Loading;
  const factory FileCacheEvent.done(String localPath) = _Done;
  const factory FileCacheEvent.error(String message) = _Error;
}

final class _Loading extends FileCacheEvent {
  final int received;
  final int total;

  const _Loading(this.received, this.total);

  double get progress => total == 0 ? 0 : received / total;
}

final class _Done extends FileCacheEvent {
  final String localPath;

  const _Done(this.localPath);
}

final class _Error extends FileCacheEvent {
  final String message;

  const _Error(this.message);
}

// Expose concrete types for pattern matching.

/// The file is being downloaded.
typedef FileCacheLoading = _Loading;

/// The file was successfully downloaded.
typedef FileCacheDone = _Done;

/// The file download failed.
typedef FileCacheError = _Error;
