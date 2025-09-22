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
    bool fakeInitialStatus = true,
  }) {
    switch (type) {
      case NetworkProviderType.real:
        return RealNetworkStatusProvider();
      case NetworkProviderType.fake:
        return FakeNetworkStatusProvider(initialStatus: fakeInitialStatus);
    }
  }

  /// Stream that emits `true` when online, `false` when offline.
  Stream<bool> get connectivityStream;

  /// Checks **punctually** the connectivity (without polling).
  Future<bool> checkConnectivity();
}
