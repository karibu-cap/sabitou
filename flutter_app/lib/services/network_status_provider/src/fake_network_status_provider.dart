import 'dart:async';
import '../network_status_provider.dart';

/// Fake network status provider for testing purposes.
class FakeNetworkStatusProvider implements NetworkStatusProvider {
  /// The initial status.
  final bool initialStatus;

  /// The timer used for polling.
  Timer? _timer;

  /// The stream controller.
  final StreamController<bool> _controller = StreamController.broadcast();

  /// The current status.
  final bool _current;

  @override
  Stream<bool> get connectivityStream => _controller.stream;

  /// Creates a new instance of the fake network status provider.
  FakeNetworkStatusProvider({this.initialStatus = true})
    : _current = initialStatus;

  @override
  Future<bool> checkConnectivity() async {
    return _current;
  }

  @override
  void startPolling() {
    stopPolling();
    _controller.add(_current);
  }

  @override
  void stopPolling() => _timer?.cancel();

  @override
  void dispose() {
    stopPolling();
    _controller.close();
  }
}
