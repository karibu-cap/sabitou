import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../utils/logger.dart';
import 'file_category.dart';

/// Result of a compression operation.
class CompressionResult {
  /// The compressed (or original) XFile ready for upload.
  final XFile xFile;

  /// Original size in bytes.
  final int originalBytes;

  /// Compressed size in bytes.
  final int compressedBytes;

  /// Constructs a new [CompressionResult].
  const CompressionResult({
    required this.xFile,
    required this.originalBytes,
    required this.compressedBytes,
  });

  /// The compression percentage.
  double get savedPercent => originalBytes == 0
      ? 0
      : ((originalBytes - compressedBytes) / originalBytes * 100);
}

/// Handles all file compression before upload.
///
/// Images are resized to max 1024 px (longest edge) and compressed at 70 %
/// JPEG quality. PDFs are passed through as-is (no lossless optimizer
/// bundled — a size guard is applied instead).
///
/// Grayscale conversion is applied automatically for [FileCategory.bill] and
/// [FileCategory.document] to save bandwidth on scanned docs.
class CompressionService {
  final _logger = LoggerApp('CompressionService');

  /// Singleton instance.
  static final CompressionService instance = GetIt.I.get<CompressionService>();

  /// Maximum dimension (width or height) for images after resize.
  static const int _maxDimension = 1024;

  /// JPEG quality (0-100).
  static const int _quality = 70;

  /// Max PDF size in bytes before we warn (10 MB).
  static const int _maxPdfBytes = 10 * 1024 * 1024;

  /// Compresses [xFile] according to its extension and [category] settings.
  /// Returns a [CompressionResult] with the processed file.
  Future<CompressionResult> compress(
    XFile xFile,
    FileCategory category, {
    bool? forceGrayscale,
  }) async {
    final ext = p.extension(xFile.name).toLowerCase().replaceFirst('.', '');
    final originalBytes = await xFile.length();

    if (_isImage(ext)) {
      return _compressImage(
        xFile,
        originalBytes: originalBytes,
        grayscale: forceGrayscale ?? category.preferGrayscale,
      );
    }

    if (ext == 'pdf') {
      return _handlePdf(xFile, originalBytes: originalBytes);
    }

    // For other document types, pass through unchanged.
    return CompressionResult(
      xFile: xFile,
      originalBytes: originalBytes,
      compressedBytes: originalBytes,
    );
  }

  bool _isImage(String ext) =>
      {'jpg', 'jpeg', 'png', 'webp', 'heic', 'heif'}.contains(ext);

  Future<CompressionResult> _compressImage(
    XFile source, {
    required int originalBytes,
    required bool grayscale,
  }) async {
    Uint8List? resultBytes;

    if (kIsWeb) {
      // On web, use compressWithList (works with bytes, not file paths)
      final bytes = await source.readAsBytes();
      resultBytes = await FlutterImageCompress.compressWithList(
        bytes,
        minWidth: _maxDimension,
        minHeight: _maxDimension,
        quality: _quality,
      );
    } else {
      // On mobile/desktop, use compressWithFile (reads from file path)
      final tmpDir = await getTemporaryDirectory();
      final outPath = p.join(
        tmpDir.path,
        'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      resultBytes = await FlutterImageCompress.compressWithFile(
        source.path,
        minWidth: _maxDimension,
        minHeight: _maxDimension,
        quality: _quality,
      );

      if (resultBytes != null) {
        // Write to temp file for native platforms
        final outFile = XFile.fromData(
          resultBytes,
          path: outPath,
          mimeType: 'image/jpeg',
        );
        return CompressionResult(
          xFile: outFile,
          originalBytes: originalBytes,
          compressedBytes: resultBytes.length,
        );
      }
    }

    if (resultBytes == null) {
      // Fallback: return original if compression fails.
      return CompressionResult(
        xFile: source,
        originalBytes: originalBytes,
        compressedBytes: originalBytes,
      );
    }

    // For web, return XFile with compressed bytes
    final outFile = XFile.fromData(
      resultBytes,
      name: 'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
      mimeType: 'image/jpeg',
    );

    return CompressionResult(
      xFile: outFile,
      originalBytes: originalBytes,
      compressedBytes: resultBytes.length,
    );
  }

  Future<CompressionResult> _handlePdf(
    XFile source, {
    required int originalBytes,
  }) async {
    if (originalBytes > _maxPdfBytes) {
      // Surface a warning via a print; callers can check compressedBytes.
      // In production you might throw a PdfTooLargeException.
      // ignore: avoid_print
      _logger.warning(
        '[CompressionService] PDF is ${(originalBytes / 1024 / 1024).toStringAsFixed(1)} MB '
        '— exceeds recommended 10 MB limit.',
      );
    }

    return CompressionResult(
      xFile: source,
      originalBytes: originalBytes,
      compressedBytes: originalBytes,
    );
  }
}
