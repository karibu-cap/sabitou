import 'dart:async';

import 'package:flutter/material.dart';

import 'printer_model.dart';

class PrinterService {
  PrinterDevice? _connectedPrinter;

  PrinterDevice? get connectedPrinter => _connectedPrinter;

  bool get isConnected => _connectedPrinter != null;

  Future<void> connectBluethooth() async {
    debugPrint('Bluetooth not supported on Web');
  }

  Future<List<PrinterDevice>> scanBluetoothPrinters() async {
    debugPrint('Scanning not supported on Web');

    return [];
  }

  Future<bool> connectToPrinter(PrinterDevice printer) async {
    debugPrint('Connecting not supported on Web');

    return false;
  }

  Future<bool> printBytes(
    List<int> bytes, {
    bool longData = false,
    int? chunkSize,
  }) async {
    debugPrint('Printing not supported on Web');

    return false;
  }
}

class WidgetPrinter {
  final PrinterService _printerService;

  WidgetPrinter(this._printerService);

  Future<void> printWidget(Widget widget, {int maxWidth = 384}) async {
    debugPrint('Widget printing not supported on Web');
  }
}

class ImagePrinter {
  final PrinterService _printerService;

  ImagePrinter(this._printerService);

  Future<void> printImage(String imagePath, {int maxWidth = 384}) async {
    debugPrint('Image printing not supported on Web');
  }
}
