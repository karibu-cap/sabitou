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
}
