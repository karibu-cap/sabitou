import 'dart:async';
import '../network_status_provider.dart';

/// Fake network status provider for testing purposes.
class FakeNetworkStatusProvider implements NetworkStatusProvider {
  /// The initial status.
  final bool initialStatus;

  /// The toggle interval.
  final Duration toggleEvery;

  /// The timer used for polling.
  Timer? _timer;

  /// The stream controller.
  final StreamController<bool> _controller = StreamController.broadcast();

  /// The current status.
  bool _current;

  @override
  Stream<bool> get connectivityStream => _controller.stream;

  /// Creates a new instance of the fake network status provider.
  FakeNetworkStatusProvider({
    this.initialStatus = true,
    this.toggleEvery = const Duration(seconds: 3),
  }) : _current = initialStatus;

  @override
  Future<bool> checkConnectivity() async {
    await Future.delayed(const Duration(milliseconds: 100));

    return _current;
  }

  @override
  void startPolling() {
    stopPolling();
    _controller.add(_current);
    _timer = Timer.periodic(toggleEvery, (_) {
      _current = !_current;
      _controller.add(_current);
    });
  }

  @override
  void stopPolling() => _timer?.cancel();

  @override
  void dispose() {
    stopPolling();
    _controller.close();
  }
}
