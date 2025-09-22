import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

import '../network_status_provider.dart';

/// Real network status provider using connectivity_plus package.
class RealNetworkStatusProvider implements NetworkStatusProvider {
  /// The connectivity instance.
  final Connectivity _connectivity = Connectivity();

  @override
  Stream<bool> get connectivityStream =>
      _connectivity.onConnectivityChanged.map(_isConnected);

  @override
  Future<bool> checkConnectivity() async {
    try {
      final connectivityResults = await _connectivity.checkConnectivity();
      final isConnected = _isConnected(connectivityResults);
      debugPrint(
        'Connectivity check result: $isConnected (results: $connectivityResults)',
      );

      return isConnected;
    } on Exception catch (e) {
      debugPrint('Connectivity check failed: $e');

      return false;
    }
  }

  /// Determines if the device is connected based on connectivity results.
  bool _isConnected(List<ConnectivityResult> results) {
    return results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet,
    );
  }
}
