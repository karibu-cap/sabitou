import 'dart:async';

import '../../../utils/extends_models.dart';
import 'bluetooth_manager_impl.dart'
    if (dart.library.io) 'bluetooth_manager_mobile.dart'
    if (dart.library.html) 'bluetooth_manager_web.dart';

/// Bluetooth connection state enum
enum BluetoothConnectionState {
  disconnected,
  connecting,
  connected,
  disconnecting,
}

/// Bluetooth adapter state enum
enum BluetoothAdapterState {
  unknown,
  unavailable,
  unauthorized,
  turningOn,
  on,
  turningOff,
  off,
}

/// Platform-agnostic Bluetooth device wrapper
abstract class BluetoothDeviceWrapper {
  String get remoteId;
  String get name;

  @override
  bool operator ==(Object other);

  @override
  int get hashCode;
}

/// Platform-agnostic Bluetooth manager
abstract class BluetoothManager {
  /// Check if Bluetooth is supported on this platform
  static Future<bool> isBluetoothSupported() async {
    return BluetoothManagerImpl.isBluetoothSupported();
  }

  /// Check if Bluetooth is enabled
  static Future<bool> isBluetoothEnabled() async {
    return BluetoothManagerImpl.isBluetoothEnabled();
  }

  /// Get bonded/paired devices
  static Future<List<BluetoothDeviceWrapper>> getBondedDevices() async {
    return BluetoothManagerImpl.getBondedDevices();
  }

  /// Check if device is connected
  static Future<bool> isDeviceConnected(BluetoothDeviceWrapper device) async {
    return BluetoothManagerImpl.isDeviceConnected(device);
  }

  /// Connect to a device
  static Future<void> connect(BluetoothDeviceWrapper device) async {
    return BluetoothManagerImpl.connect(device);
  }

  /// Disconnect from a device
  static Future<void> disconnect(BluetoothDeviceWrapper device) async {
    return BluetoothManagerImpl.disconnect(device);
  }

  /// Write data to device
  static Future<void> writeData(
    BluetoothDeviceWrapper device,
    List<int> data,
  ) async {
    return BluetoothManagerImpl.writeData(device, data);
  }

  /// Listen to connection state changes
  static StreamSubscription listenToConnectionState(
    BluetoothDeviceWrapper device,
    Function(BluetoothConnectionState) onStateChanged,
  ) {
    return BluetoothManagerImpl.listenToConnectionState(device, onStateChanged);
  }

  /// Listen to adapter state changes
  static StreamSubscription listenToAdapterState(
    Function(BluetoothAdapterState) onStateChanged,
  ) {
    return BluetoothManagerImpl.listenToAdapterState(onStateChanged);
  }

  /// Create AppPrinter from BluetoothDeviceWrapper
  static Future<AppPrinter> createAppPrinterFromDevice(
    BluetoothDeviceWrapper device,
  ) async {
    return BluetoothManagerImpl.createAppPrinterFromDevice(device);
  }

  /// Create BluetoothDeviceWrapper from AppPrinter
  static Future<BluetoothDeviceWrapper> createDeviceFromAppPrinter(
    AppPrinter printer,
  ) async {
    return BluetoothManagerImpl.createDeviceFromAppPrinter(printer);
  }

  /// Start scanning for devices
  static Future<void> startScan({
    Duration timeout = const Duration(seconds: 4),
    Function(List<BluetoothDeviceWrapper>)? onDevicesFound,
  }) async {
    return BluetoothManagerImpl.startScan(
      timeout: timeout,
      onDevicesFound: onDevicesFound,
    );
  }

  /// Stop scanning
  static Future<void> stopScan() async {
    return BluetoothManagerImpl.stopScan();
  }
}
