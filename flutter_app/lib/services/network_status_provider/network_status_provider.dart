import 'dart:io';

import 'src/fake_network_status_provider.dart';
import 'src/real_network_status_provider.dart';

/// The network status provider type.
enum NetworkProviderType {
  /// The real implementation.
  real,

  /// The fake implementation.
  fake,
}

/// Service providing the user's connectivity.
abstract class NetworkStatusProvider {
  /// Creates a new instance of the network status provider.
  factory NetworkStatusProvider.create({
    required NetworkProviderType type,
    Duration pollingPeriod = const Duration(seconds: 1),
    bool fakeInitialStatus = true,
    Duration fakeToggleDelay = const Duration(seconds: 3),
    String dnsAddress = '8.8.8.8',
  }) {
    switch (type) {
      case NetworkProviderType.real:
        return RealNetworkStatusProvider(
          pollingPeriod: pollingPeriod,
          dns: InternetAddress(dnsAddress),
        );
      case NetworkProviderType.fake:
        return FakeNetworkStatusProvider(
          initialStatus: fakeInitialStatus,
          toggleEvery: fakeToggleDelay,
        );
    }
  }

  /// Stream that emits `true` when online, `false` when offline.
  Stream<bool> get connectivityStream;

  /// Checks **punctually** the connectivity (without polling).
  Future<bool> checkConnectivity();

  /// Starts the **periodic polling**.
  void startPolling();

  /// Stops the polling.
  void stopPolling();

  /// Releases the resources (stream + timers).
  void dispose();
}
