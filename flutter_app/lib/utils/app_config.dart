/// Central configuration for all remote service endpoints.
///
/// For development, the Docker services are exposed on localhost.
/// Override these values via --dart-define for staging/production builds:
///   flutter run --dart-define=CONNECTOR_URL=https://api.sabitou.cm
abstract final class AppConfig {
  // ---------------------------------------------------------------------------
  // Go connector (auth + sync upload)
  // ---------------------------------------------------------------------------

  /// Base URL of the Go connector service.
  static const String connectorUrl = String.fromEnvironment(
    'CONNECTOR_URL',
    defaultValue: 'http://localhost:8080',
  );

  /// WebSocket endpoint of the self-hosted PowerSync service.
  static const String powerSyncUrl = String.fromEnvironment(
    'POWERSYNC_URL',
    defaultValue: 'http://localhost:8457',
  );

  // ---------------------------------------------------------------------------
  // MinIO (S3-compatible object storage)
  // ---------------------------------------------------------------------------

  /// Base URL of the MinIO service.
  static const String minioUrl = String.fromEnvironment(
    'MINIO_URL',
    defaultValue: 'http://localhost:9000',
  );

  /// MinIO bucket for storing product images.
  static const String minioBucket = String.fromEnvironment(
    'MINIO_BUCKET',
    defaultValue: 'sabitou-media',
  );

  /// MinIO region.
  static const String minioRegion = String.fromEnvironment(
    'MINIO_REGION',
    defaultValue: 'us-east-1',
  );

  /// MinIO access key.
  static const String minioAccessKey = String.fromEnvironment(
    'MINIO_ACCESS_KEY',
    defaultValue: 'minioadmin',
  );

  /// MinIO secret key.
  static const String minioSecretKey = String.fromEnvironment(
    'MINIO_SECRET_KEY',
    defaultValue: 'minioadmin',
  );
}
