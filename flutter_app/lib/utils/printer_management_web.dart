import 'dart:async';

import 'package:flutter/material.dart';

import 'logger.dart';

/// Stub ConnectionType for Web
enum ConnectionType { BLE, NETWORK, USB }

/// Stub PaperSize for Web
enum PaperSize { mm58, mm80 }

/// Stub Printer class for Web
class Printer {
  String? name;
  String? address;
  String? deviceId;
  ConnectionType? connectionType;
  bool? isConnected;

  Printer({
    this.name,
    this.address,
    this.deviceId,
    this.connectionType,
    this.isConnected,
  });

  factory Printer.fromJson(Map<String, dynamic> json) {
    return Printer(
      name: json['name'] as String?,
      address: json['address'] as String?,
      deviceId: json['deviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'address': address, 'deviceId': deviceId};
  }
}

class FlutterThermalPrinter {
  static final FlutterThermalPrinter instance = FlutterThermalPrinter();

  Stream<List<Printer>> get devicesStream => Stream.value([]);

  Future<void> getPrinters({
    List<ConnectionType>? connectionTypes,
    bool? androidUsesFineLocation,
  }) async {
    // No-op
  }

  Future<bool> isBleTurnedOn() async => false;
  Future<void> turnOnBluetooth() async {}
  Future<void> stopScan() async {}
}

/// The printer management stub for Web.
class PrinterManagement {
  final _logger = LoggerApp('PrinterManagement');
  final List<Printer> _cachedPrinters = [];

  StreamSubscription<List<Printer>>? _devicesStreamSubscription;

  /// Check if Bluetooth is sorted out
  Future<bool> isBluetoothEnabled() async {
    _logger.info('Bluetooth check on Web (Stub)');

    return false;
  }

  /// Get all available printers.
  Future<List<Printer>> getAllPrinters() async {
    _logger.info('getAllPrinters on Web (Stub)');

    return [];
  }

  /// Get bonded/paired Bluetooth devices.
  Future<List<Printer>> getBondedDevices() async {
    _logger.info('getBondedDevices on Web (Stub)');

    return [];
  }

  /// Check if a printer is connected
  Future<bool> isPrinterConnected(Printer device) async {
    return false;
  }

  /// Connect to a printer
  Future<void> connect(Printer device) async {
    _logger.info('Connect on Web (Stub)');
  }

  /// Disconnect from a printer
  Future<void> disconnect(Printer device) async {
    _logger.info('Disconnect on Web (Stub)');
  }

  /// Write/Print data to the printer
  Future<void> writeData(
    Printer device,
    List<int> data, {
    bool longData = true,
  }) async {
    _logger.info('writeData on Web (Stub)');
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
    _logger.info('printWidget on Web (Stub)');
  }

  /// Start scanning for printers with stream listener
  Future<void> startScan({
    Duration timeout = const Duration(seconds: 4),
    Function(List<Printer>)? onDevicesFound,
    List<ConnectionType>? connectionTypes,
  }) async {
    _logger.info('startScan on Web (Stub)');
    if (onDevicesFound != null) {
      onDevicesFound([]);
    }
  }

  /// Stop scanning
  Future<void> stopScan() async {
    _logger.info('stopScan on Web (Stub)');
  }

  /// Get current connected printer
  Future<Printer?> getConnectedPrinter() async {
    return null;
  }

  /// Scan for specific connection type
  Future<List<Printer>> scanByType(
    ConnectionType type, {
    Duration timeout = const Duration(seconds: 4),
  }) async {
    return [];
  }

  /// Scan for WiFi/Network printers
  Future<List<Printer>> scanWifiPrinters({
    Duration timeout = const Duration(seconds: 4),
  }) async {
    return [];
  }

  /// Scan for USB printers
  Future<List<Printer>> scanUsbPrinters({
    Duration timeout = const Duration(seconds: 4),
  }) async {
    return [];
  }

  /// Scan for BLE/Bluetooth printers
  Future<List<Printer>> scanBluetoothPrinters({
    Duration timeout = const Duration(seconds: 4),
  }) async {
    return [];
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
  Future<void> dispose() async {}
}
