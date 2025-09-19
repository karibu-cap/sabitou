import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';

import '../network_status_provider.dart';

/// Real network status provider by DNS lookup.
class RealNetworkStatusProvider implements NetworkStatusProvider {
  /// The polling period.
  final Duration pollingPeriod;

  /// The DNS address to use for the lookup.
  final InternetAddress _dns;

  /// The timer used for polling.
  Timer? _timer;

  /// The stream controller.
  final StreamController<bool> _controller = StreamController.broadcast();

  /// Creates a new instance of the real network status provider.
  RealNetworkStatusProvider({
    this.pollingPeriod = const Duration(seconds: 1),
    required InternetAddress dns,
  }) : _dns = dns;

  @override
  Stream<bool> get connectivityStream => _controller.stream;

  @override
  Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup(_dns.address);
      debugPrint('DNS lookup result: ${result.isNotEmpty}');

      return result.isNotEmpty;
    } on Exception catch (e) {
      debugPrint('DNS lookup failed: $e');

      return false;
    }
  }

  @override
  void startPolling() {
    stopPolling();
    _controller.add(false);
    _timer = Timer.periodic(pollingPeriod, (_) async {
      _controller.add(await checkConnectivity());
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
