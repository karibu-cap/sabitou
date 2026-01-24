import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
import 'package:flutter_thermal_printer/utils/printer.dart';

import 'logger.dart';

export 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
export 'package:flutter_thermal_printer/utils/printer.dart';

/// The printer management.
class PrinterManagement {
  final _logger = LoggerApp('PrinterManagement');
  final FlutterThermalPrinter _thermalPrinter = FlutterThermalPrinter.instance;

  StreamSubscription<List<Printer>>? _devicesStreamSubscription;
  List<Printer> _cachedPrinters = [];

  /// Check if Bluetooth is enabled
  Future<bool> isBluetoothEnabled() async {
    try {
      return _thermalPrinter.isBleTurnedOn();
    } catch (e) {
      _logger.severe('Bluetooth check failed: $e');

      return false;
    }
  }

  /// Get all available printers (Bluetooth/BLE, WiFi/Network, USB).
  Future<List<Printer>> getAllPrinters() async {
    try {
      // Ask to turn on the bluetooth
      if (!await isBluetoothEnabled()) {
        await _thermalPrinter.turnOnBluetooth();
      }
      // Start scanning for all types
      await _thermalPrinter.getPrinters(
        connectionTypes: [
          ConnectionType.USB,
          ConnectionType.BLE,
          ConnectionType.NETWORK,
        ],
      );

      // Wait a bit for devices to be discovered
      await Future.delayed(const Duration(seconds: 2));

      return _cachedPrinters;
    } catch (e) {
      _logger.severe('Error getting printers: $e');

      return [];
    }
  }

  /// Get bonded/paired Bluetooth devices.
  Future<List<Printer>> getBondedDevices() async {
    try {
      // Start scanning for BLE devices
      await _thermalPrinter.getPrinters(connectionTypes: [ConnectionType.BLE]);

      // Wait for devices to be discovered
      await Future.delayed(const Duration(seconds: 3));

      // Filter for BLE devices only
      final bleDevices = _cachedPrinters
          .where((device) => device.connectionType == ConnectionType.BLE)
          .toList();

      _logger.info('--- ${bleDevices.length} BLE devices found');

      return bleDevices;
    } catch (e) {
      _logger.severe('Error getting bonded devices: $e');

      return [];
    }
  }

  /// Check if a printer is connected
  Future<bool> isPrinterConnected(Printer device) async {
    try {
      return device.isConnected == true;
    } catch (e) {
      _logger.severe('Error checking connection: $e');

      return false;
    }
  }

  /// Connect to a printer
  Future<void> connect(Printer device) async {
    try {
      await _thermalPrinter.connect(device);
      _logger.severe('Connected to ${device.name}');
    } catch (e) {
      _logger.severe('Error connecting to printer: $e');
      rethrow;
    }
  }

  /// Disconnect from a printer
  Future<void> disconnect(Printer device) async {
    try {
      await _thermalPrinter.disconnect(device);
      _logger.severe('Disconnected from ${device.name}');
    } catch (e) {
      _logger.severe('Error disconnecting: $e');
      rethrow;
    }
  }

  /// Write/Print data to the printer
  Future<void> writeData(
    Printer device,
    List<int> data, {
    bool longData = true,
  }) async {
    try {
      await _thermalPrinter.printData(device, data, longData: longData);
      _logger.info('Data sent successfully to ${device.name}');
    } catch (e) {
      _logger.severe('Error writing data: $e');
      rethrow;
    }
  }

  /// Print widget to printer
  Future<void> printWidget(
    BuildContext context,
    Printer device,
    Widget widget, {
    bool cutAfterPrinted = true,
    bool printOnBle = false,
    PaperSize paperSize = PaperSize.mm80,
  }) async {
    try {
      await _thermalPrinter.printWidget(
        context,
        printer: device,
        widget: widget,
        cutAfterPrinted: cutAfterPrinted,
        printOnBle: printOnBle,
        paperSize: paperSize,
      );
      _logger.info('Widget printed successfully to ${device.name}');
    } catch (e) {
      _logger.severe('Error printing widget: $e');
      rethrow;
    }
  }

  /// Start scanning for printers with stream listener
  Future<void> startScan({
    Duration timeout = const Duration(seconds: 4),
    Function(List<Printer>)? onDevicesFound,
    List<ConnectionType>? connectionTypes,
  }) async {
    try {
      // Ask to turn on the bluetooth
      if (!await isBluetoothEnabled()) {
        await _thermalPrinter.turnOnBluetooth();
      }

      // Stop any existing scan first
      await stopScan();

      // Default connection types
      final types =
          connectionTypes ??
          [ConnectionType.BLE, ConnectionType.USB, ConnectionType.NETWORK];

      // Start scanning
      await _thermalPrinter.getPrinters(
        connectionTypes: types,
        androidUsesFineLocation: true,
      );

      // Listen to device stream
      _devicesStreamSubscription = _thermalPrinter.devicesStream.listen((
        printers,
      ) {
        // Update cached printers
        _cachedPrinters = printers;

        _logger.info(
          '--- ${_cachedPrinters.length} printers found ${printers.length}',
        );

        // Do NOT stop scanning here. Let it run for the duration or until user stops.

        // Callback with found devices
        if (onDevicesFound != null) {
          onDevicesFound(_cachedPrinters);
        }
      });

      // Auto-stop after timeout
      Future.delayed(timeout, stopScan);
    } catch (e) {
      _logger.severe('Error during scan: $e');
      if (onDevicesFound != null) {
        onDevicesFound([]);
      }
      await stopScan();
    }
  }

  Future<List<BluetoothDevice>> _getBondedDevices() async {
    try {
      final List<BluetoothDevice> devices = [];

      FlutterBluePlus.onScanResults.listen(
        (results) {
          devices
            ..clear()
            ..addAll(results.map((e) => e.device));
        },
        onError: (e) {
          throw UnsupportedError('$e');
        },
      );

      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
      await FlutterBluePlus.isScanning.where((val) => !val).first;

      // // Get bonded devices
      final bondedDevices = await FlutterBluePlus.bondedDevices;
      for (var device in bondedDevices) {
        devices.add(device);
      }

      // Also get currently connected devices
      final connectedDevices = FlutterBluePlus.connectedDevices;
      for (var device in connectedDevices) {
        // Avoid duplicates
        if (!bondedDevices.any((d) => d.remoteId == device.remoteId)) {
          devices.add(device);
        }
      }

      debugPrint('----=========--- ${devices.length}');

      return devices;
    } catch (e) {
      return [];
    }
  }

  /// Stop scanning
  Future<void> stopScan() async {
    try {
      await _devicesStreamSubscription?.cancel();
      _devicesStreamSubscription = null;
      await _thermalPrinter.stopScan();
      _logger.severe('Scan stopped');
    } catch (e) {
      _logger.severe('Error stopping scan: $e');
    }
  }

  /// Get current connected printer
  Future<Printer?> getConnectedPrinter() async {
    try {
      return _cachedPrinters.firstWhere(
        (p) => p.isConnected == true,
        orElse: () => throw StateError('No connected printer'),
      );
    } catch (e) {
      _logger.severe('No connected printer found: $e');

      return null;
    }
  }

  /// Scan for specific connection type
  Future<List<Printer>> scanByType(
    ConnectionType type, {
    Duration timeout = const Duration(seconds: 4),
  }) async {
    try {
      await _thermalPrinter.getPrinters(connectionTypes: [type]);
      await Future.delayed(timeout);

      return _cachedPrinters
          .where((device) => device.connectionType == type)
          .toList();
    } catch (e) {
      _logger.severe('Error scanning $type printers: $e');

      return [];
    }
  }

  /// Scan for WiFi/Network printers
  Future<List<Printer>> scanWifiPrinters({
    Duration timeout = const Duration(seconds: 4),
  }) async {
    return scanByType(ConnectionType.NETWORK, timeout: timeout);
  }

  /// Scan for USB printers
  Future<List<Printer>> scanUsbPrinters({
    Duration timeout = const Duration(seconds: 4),
  }) async {
    return scanByType(ConnectionType.USB, timeout: timeout);
  }

  /// Scan for BLE/Bluetooth printers
  Future<List<Printer>> scanBluetoothPrinters({
    Duration timeout = const Duration(seconds: 4),
  }) async {
    return scanByType(ConnectionType.BLE, timeout: timeout);
  }

  /// Get cached printers (from last scan)
  List<Printer> getCachedPrinters() {
    return _cachedPrinters;
  }

  /// Clear cached printers
  void clearCache() {
    _cachedPrinters.clear();
  }

  /// Dispose resources
  Future<void> dispose() async {
    await stopScan();
    clearCache();
  }
}
