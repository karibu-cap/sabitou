import 'dart:async';

import '../../../utils/extends_models.dart';
import 'bluetooth_manager.dart';

/// Dummy device wrapper for unsupported platforms
class DummyDeviceWrapper extends BluetoothDeviceWrapper {
  @override
  String get remoteId => 'unsupported';

  @override
  String get name => 'Unsupported Platform';

  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => 0;
}

/// Fallback implementation that throws errors
class BluetoothManagerImpl {
  static Future<bool> isBluetoothSupported() async {
    return false;
  }

  static Future<bool> isBluetoothEnabled() async {
    return false;
  }

  static Future<List<BluetoothDeviceWrapper>> getBondedDevices() async {
    return [];
  }

  static Future<bool> isDeviceConnected(BluetoothDeviceWrapper device) async {
    return false;
  }

  static Future<void> connect(BluetoothDeviceWrapper device) async {
    throw UnsupportedError('Bluetooth not supported on this platform');
  }

  static Future<void> disconnect(BluetoothDeviceWrapper device) async {
    throw UnsupportedError('Bluetooth not supported on this platform');
  }

  static Future<void> writeData(
    BluetoothDeviceWrapper device,
    List<int> data,
  ) async {
    throw UnsupportedError('Bluetooth not supported on this platform');
  }

  static StreamSubscription listenToConnectionState(
    BluetoothDeviceWrapper device,
    Function(BluetoothConnectionState) onStateChanged,
  ) {
    return const Stream<BluetoothConnectionState>.empty().listen((_) {});
  }

  static StreamSubscription listenToAdapterState(
    Function(BluetoothAdapterState) onStateChanged,
  ) {
    return const Stream<BluetoothAdapterState>.empty().listen((_) {});
  }

  static Future<AppPrinter> createAppPrinterFromDevice(
    BluetoothDeviceWrapper device,
  ) async {
    throw UnsupportedError('Bluetooth not supported on this platform');
  }

  static Future<BluetoothDeviceWrapper> createDeviceFromAppPrinter(
    AppPrinter printer,
  ) async {
    throw UnsupportedError('Bluetooth not supported on this platform');
  }

  static Future<void> startScan({
    Duration timeout = const Duration(seconds: 4),
    Function(List<BluetoothDeviceWrapper>)? onDevicesFound,
  }) async {
    throw UnsupportedError('Bluetooth not supported on this platform');
  }

  static Future<void> stopScan() async {
    throw UnsupportedError('Bluetooth not supported on this platform');
  }
}
