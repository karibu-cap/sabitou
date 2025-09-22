import 'dart:async';
import '../network_status_provider.dart';

/// Fake network status provider for testing purposes.
class FakeNetworkStatusProvider implements NetworkStatusProvider {
  /// The initial status.
  final bool initialStatus;

  @override
  Stream<bool> get connectivityStream => Stream<bool>.value(initialStatus);

  /// Creates a new instance of the fake network status provider.
  FakeNetworkStatusProvider({this.initialStatus = true});

  @override
  Future<bool> checkConnectivity() async {
    return initialStatus;
  }
}
