import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart' as fbp;

import '../../../utils/extends_models.dart';
import 'bluetooth_manager.dart';

/// Flutter Blue Plus device wrapper
class FlutterBluePlusDeviceWrapper extends BluetoothDeviceWrapper {
  final fbp.BluetoothDevice device;

  FlutterBluePlusDeviceWrapper(this.device);

  @override
  String get remoteId => device.remoteId.str;

  @override
  String get name => device.platformName.isNotEmpty
      ? device.platformName
      : device.remoteId.str;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlutterBluePlusDeviceWrapper &&
          runtimeType == other.runtimeType &&
          device.remoteId == other.device.remoteId;

  @override
  int get hashCode => device.remoteId.hashCode;
}

/// Implementation of BluetoothManager for mobile and desktop platforms
class BluetoothManagerImpl {
  static Future<bool> isBluetoothSupported() async {
    try {
      return await fbp.FlutterBluePlus.isSupported;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> isBluetoothEnabled() async {
    try {
      final state = await fbp.FlutterBluePlus.adapterState.first;

      return state == fbp.BluetoothAdapterState.on;
    } catch (e) {
      return false;
    }
  }

  static Future<List<BluetoothDeviceWrapper>> getBondedDevices() async {
    try {
      final List<BluetoothDeviceWrapper> devices = [];

      // Get bonded devices
      final bondedDevices = await fbp.FlutterBluePlus.bondedDevices;
      for (var device in bondedDevices) {
        devices.add(FlutterBluePlusDeviceWrapper(device));
      }

      // Also get currently connected devices
      final connectedDevices = fbp.FlutterBluePlus.connectedDevices;
      for (var device in connectedDevices) {
        // Avoid duplicates
        if (!bondedDevices.any((d) => d.remoteId == device.remoteId)) {
          devices.add(FlutterBluePlusDeviceWrapper(device));
        }
      }

      return devices;
    } catch (e) {
      return [];
    }
  }

  static Future<bool> isDeviceConnected(BluetoothDeviceWrapper device) async {
    try {
      final fbpDevice = (device as FlutterBluePlusDeviceWrapper).device;
      final state = await fbpDevice.connectionState.first;

      return state == fbp.BluetoothConnectionState.connected;
    } catch (e) {
      return false;
    }
  }

  static Future<void> connect(BluetoothDeviceWrapper device) async {
    final fbpDevice = (device as FlutterBluePlusDeviceWrapper).device;
    await fbpDevice.connect(
      license: fbp.License.free,
      timeout: const Duration(seconds: 15),
    );
  }

  static Future<void> disconnect(BluetoothDeviceWrapper device) async {
    final fbpDevice = (device as FlutterBluePlusDeviceWrapper).device;
    await fbpDevice.disconnect();
  }

  static Future<void> writeData(
    BluetoothDeviceWrapper device,
    List<int> data,
  ) async {
    final fbpDevice = (device as FlutterBluePlusDeviceWrapper).device;

    // Discover services if not already discovered
    final List<fbp.BluetoothService> services = await fbpDevice
        .discoverServices();

    // Find the appropriate characteristic for printing
    fbp.BluetoothCharacteristic? writeCharacteristic;

    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.properties.write ||
            characteristic.properties.writeWithoutResponse) {
          writeCharacteristic = characteristic;
          break;
        }
      }
      if (writeCharacteristic != null) break;
    }

    if (writeCharacteristic == null) {
      throw Exception('No writable characteristic found');
    }

    // Send data in chunks (BLE has a limit of ~512 bytes per write)
    const int chunkSize = 512;
    for (int i = 0; i < data.length; i += chunkSize) {
      final int end = (i + chunkSize < data.length)
          ? i + chunkSize
          : data.length;
      final List<int> chunk = data.sublist(i, end);

      await writeCharacteristic.write(
        chunk,
        withoutResponse: writeCharacteristic.properties.writeWithoutResponse,
      );

      // Small delay to prevent buffer overflow
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  static StreamSubscription listenToConnectionState(
    BluetoothDeviceWrapper device,
    Function(BluetoothConnectionState) onStateChanged,
  ) {
    final fbpDevice = (device as FlutterBluePlusDeviceWrapper).device;

    return fbpDevice.connectionState.listen((state) {
      BluetoothConnectionState mappedState;
      switch (state) {
        case fbp.BluetoothConnectionState.disconnected:
          mappedState = BluetoothConnectionState.disconnected;
          break;
        case fbp.BluetoothConnectionState.connected:
          mappedState = BluetoothConnectionState.connected;
          break;
        default:
          mappedState = BluetoothConnectionState.disconnected;
      }
      onStateChanged(mappedState);
    });
  }

  static StreamSubscription listenToAdapterState(
    Function(BluetoothAdapterState) onStateChanged,
  ) {
    return fbp.FlutterBluePlus.adapterState.listen((state) {
      BluetoothAdapterState mappedState;
      switch (state) {
        case fbp.BluetoothAdapterState.unknown:
          mappedState = BluetoothAdapterState.unknown;
          break;
        case fbp.BluetoothAdapterState.unavailable:
          mappedState = BluetoothAdapterState.unavailable;
          break;
        case fbp.BluetoothAdapterState.unauthorized:
          mappedState = BluetoothAdapterState.unauthorized;
          break;
        case fbp.BluetoothAdapterState.turningOn:
          mappedState = BluetoothAdapterState.turningOn;
          break;
        case fbp.BluetoothAdapterState.on:
          mappedState = BluetoothAdapterState.on;
          break;
        case fbp.BluetoothAdapterState.turningOff:
          mappedState = BluetoothAdapterState.turningOff;
          break;
        case fbp.BluetoothAdapterState.off:
          mappedState = BluetoothAdapterState.off;
          break;
      }
      onStateChanged(mappedState);
    });
  }

  static Future<AppPrinter> createAppPrinterFromDevice(
    BluetoothDeviceWrapper device,
  ) async {
    final fbpDevice = (device as FlutterBluePlusDeviceWrapper).device;

    final String url =
        '${fbpDevice.remoteId.str}#U#${fbpDevice.platformName}#U#${PrinterModel.bluetoothDevice.name}';

    return AppPrinter(
      url: url,
      name: fbpDevice.platformName.isNotEmpty
          ? fbpDevice.platformName
          : fbpDevice.remoteId.str,
      model: PrinterModel.bluetoothDevice.name,
      location: fbpDevice.remoteId.str,
      comment: 'Flutter Blue Plus Device',
      isDefault: false,
    );
  }

  static Future<BluetoothDeviceWrapper> createDeviceFromAppPrinter(
    AppPrinter printer,
  ) async {
    final List<String> deviceUrl = printer.url.split('#U#');
    final String remoteId = deviceUrl[0];

    final fbpDevice = fbp.BluetoothDevice.fromId(remoteId);

    return FlutterBluePlusDeviceWrapper(fbpDevice);
  }

  static Future<void> startScan({
    Duration timeout = const Duration(seconds: 4),
    Function(List<BluetoothDeviceWrapper>)? onDevicesFound,
  }) async {
    await fbp.FlutterBluePlus.startScan(timeout: timeout);

    if (onDevicesFound != null) {
      fbp.FlutterBluePlus.scanResults.listen((results) {
        final devices = results
            .map((result) => FlutterBluePlusDeviceWrapper(result.device))
            .toList();
        onDevicesFound(devices);
      });
    }
  }

  static Future<void> stopScan() async {
    await fbp.FlutterBluePlus.stopScan();
  }
}
