import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

/// Thrown when a MinIO operation fails.
class MinioException implements Exception {
  /// The error message.
  final String message;

  /// The HTTP status code.
  final int? statusCode;

  /// Constructs a new [MinioException].
  const MinioException(this.message, {this.statusCode});

  @override
  String toString() => 'MinioException($statusCode): $message';
}

/// MinIO / S3-compatible service.
///
/// Uses AWS Signature V4 (HMAC-SHA256) to authenticate requests directly
/// against a self-hosted MinIO instance. No SDK dependency — only `dio`
/// and `crypto`.
///
/// Configure via [MinioConfig] before calling any method.
class MinioService {
  /// Singleton instance.
  static final MinioService instance = GetIt.I.get<MinioService>();

  final MinioConfig _config;
  final Dio _dio;

  /// Constructs a new [MinioService].
  MinioService({required MinioConfig config})
    : _config = config,
      _dio = Dio(
        BaseOptions(
          baseUrl: config.endpoint,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
        ),
      );

  /// Uploads [bytes] to [objectKey] inside [bucket].
  /// Returns the public-accessible URL of the object.
  Future<String> upload({
    required Uint8List bytes,
    required String bucket,
    required String objectKey,
    String contentType = 'application/octet-stream',
    void Function(int sent, int total)? onProgress,
  }) async {
    final now = DateTime.now().toUtc();
    final dateStr = DateFormat('yyyyMMdd').format(now);
    final datetimeStr = DateFormat("yyyyMMdd'T'HHmmss'Z'").format(now);

    final headers = _buildAuthHeaders(
      method: 'PUT',
      bucket: bucket,
      objectKey: objectKey,
      contentType: contentType,
      payload: bytes,
      now: now,
      dateStr: dateStr,
      datetimeStr: datetimeStr,
    );

    try {
      await _dio.put(
        '/$bucket/$objectKey',
        data: Stream.fromIterable([bytes]),
        options: Options(
          headers: {
            ...headers,
            'Content-Type': contentType,
            'Content-Length': bytes.length,
          },
          sendTimeout: const Duration(seconds: 120),
        ),
        onSendProgress: onProgress,
      );

      return _buildObjectUrl(bucket, objectKey);
    } on DioException catch (e, st) {
      Error.throwWithStackTrace(
        MinioException(
          'Upload failed: ${e.message}',
          statusCode: e.response?.statusCode,
        ),
        st,
      );
    }
  }

  /// Downloads [objectKey] from [bucket] and saves it to [localPath].
  Future<File> download({
    required String bucket,
    required String objectKey,
    required String localPath,
    void Function(int received, int total)? onProgress,
  }) async {
    final now = DateTime.now().toUtc();
    final dateStr = DateFormat('yyyyMMdd').format(now);
    final datetimeStr = DateFormat("yyyyMMdd'T'HHmmss'Z'").format(now);

    final headers = _buildAuthHeaders(
      method: 'GET',
      bucket: bucket,
      objectKey: objectKey,
      contentType: '',
      payload: const [],
      now: now,
      dateStr: dateStr,
      datetimeStr: datetimeStr,
    );

    try {
      await _dio.download(
        '/$bucket/$objectKey',
        localPath,
        options: Options(headers: headers),
        onReceiveProgress: onProgress,
      );

      return File(localPath);
    } on DioException catch (e, st) {
      Error.throwWithStackTrace(
        MinioException(
          'Download failed: ${e.message}',
          statusCode: e.response?.statusCode,
        ),
        st,
      );
    }
  }

  /// Ensures [bucket] exists, creates it if not (silently ignores 409).
  Future<void> ensureBucketExists(String bucket) async {
    final now = DateTime.now().toUtc();
    final dateStr = DateFormat('yyyyMMdd').format(now);
    final datetimeStr = DateFormat("yyyyMMdd'T'HHmmss'Z'").format(now);

    final headers = _buildAuthHeaders(
      method: 'PUT',
      bucket: bucket,
      objectKey: '',
      contentType: '',
      payload: const [],
      now: now,
      dateStr: dateStr,
      datetimeStr: datetimeStr,
    );

    try {
      await _dio.put('/$bucket', options: Options(headers: headers));
    } on DioException catch (e, st) {
      // 409 BucketAlreadyOwnedByYou is fine.
      if (e.response?.statusCode != 409) {
        Error.throwWithStackTrace(
          MinioException(
            'ensureBucketExists failed: ${e.message}',
            statusCode: e.response?.statusCode,
          ),
          st,
        );
      }
    }
  }

  /// Deletes [objectKey] from [bucket].
  Future<void> delete({
    required String bucket,
    required String objectKey,
  }) async {
    final now = DateTime.now().toUtc();
    final dateStr = DateFormat('yyyyMMdd').format(now);
    final datetimeStr = DateFormat("yyyyMMdd'T'HHmmss'Z'").format(now);

    final headers = _buildAuthHeaders(
      method: 'DELETE',
      bucket: bucket,
      objectKey: objectKey,
      contentType: '',
      payload: const [],
      now: now,
      dateStr: dateStr,
      datetimeStr: datetimeStr,
    );

    try {
      await _dio.delete(
        '/$bucket/$objectKey',
        options: Options(headers: headers),
      );
    } on DioException catch (e, st) {
      Error.throwWithStackTrace(
        MinioException(
          'Delete failed: ${e.message}',
          statusCode: e.response?.statusCode,
        ),
        st,
      );
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // AWS Signature V4 helpers
  // ─────────────────────────────────────────────────────────────────────────

  String _buildObjectUrl(String bucket, String objectKey) =>
      '${_config.endpoint}/$bucket/$objectKey';

  Map<String, String> _buildAuthHeaders({
    required String method,
    required String bucket,
    required String objectKey,
    required String contentType,
    required List<int> payload,
    required DateTime now,
    required String dateStr,
    required String datetimeStr,
  }) {
    final canonicalUri = objectKey.isEmpty ? '/$bucket' : '/$bucket/$objectKey';

    final payloadHash = sha256.convert(payload).toString();

    final headers = <String, String>{
      'Host': _config.host,
      'x-amz-date': datetimeStr,
      'x-amz-content-sha256': payloadHash,
      if (contentType.isNotEmpty) 'Content-Type': contentType,
    };

    final sortedKeys = headers.keys.toList()..sort();
    final canonicalHeaders = sortedKeys
        .map((k) => '${k.toLowerCase()}:${headers[k]}\n')
        .join();
    final signedHeaders = sortedKeys.map((k) => k.toLowerCase()).join(';');

    final canonicalRequest = [
      method,
      canonicalUri,
      '', // query string
      canonicalHeaders,
      signedHeaders,
      payloadHash,
    ].join('\n');

    final scope = '$dateStr/${_config.region}/s3/aws4_request';
    final stringToSign = [
      'AWS4-HMAC-SHA256',
      datetimeStr,
      scope,
      sha256.convert(utf8.encode(canonicalRequest)).toString(),
    ].join('\n');

    final signature = _sign(
      _config.secretKey,
      dateStr,
      _config.region,
      stringToSign,
    );

    final authorization =
        'AWS4-HMAC-SHA256 Credential=${_config.accessKey}/$scope, '
        'SignedHeaders=$signedHeaders, Signature=$signature';

    return {...headers, 'Authorization': authorization};
  }

  String _sign(
    String secretKey,
    String dateStr,
    String region,
    String stringToSign,
  ) {
    List<int> _hmac(List<int> key, String data) =>
        Hmac(sha256, key).convert(utf8.encode(data)).bytes;

    final kDate = _hmac(utf8.encode('AWS4$secretKey'), dateStr);
    final kRegion = _hmac(kDate, region);
    final kService = _hmac(kRegion, 's3');
    final kSigning = _hmac(kService, 'aws4_request');

    return _hmac(
      kSigning,
      stringToSign,
    ).map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }
}

/// MinIO connection configuration.
class MinioConfig {
  /// Full base URL, e.g. `http://localhost:9000` or `https://minio.yourapp.com`.
  final String endpoint;

  /// Just the host part, e.g. `localhost:9000`.
  final String host;

  /// AWS region — MinIO typically uses `us-east-1`.
  final String region;

  /// The access key.
  final String accessKey;

  /// The secret key.
  final String secretKey;

  /// Constructs a new [MinioConfig].
  const MinioConfig({
    required this.endpoint,
    required this.host,
    required this.accessKey,
    required this.secretKey,
    this.region = 'us-east-1',
  });
}
