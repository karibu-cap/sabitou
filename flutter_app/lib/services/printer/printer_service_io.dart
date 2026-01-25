import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
import 'package:flutter_thermal_printer/utils/printer.dart';
import 'package:image/image.dart' as img;
import 'package:screenshot/screenshot.dart';

import 'printer_model.dart';

class PrinterService {
  final _flutterThermalPrinter = FlutterThermalPrinter.instance;

  Printer? _connectedPackagePrinter;
  PrinterDevice? _connectedPrinter;

  // Cache scanned printers to map back to package objects
  final List<Printer> _scannedPackagePrinters = [];

  // Get connected printer
  PrinterDevice? get connectedPrinter => _connectedPrinter;

  // Check if printer is connected
  bool get isConnected => _connectedPrinter != null;

  Future<void> connectBluethooth() async {
    final isTurnOn = await _flutterThermalPrinter.isBleTurnedOn();
    debugPrint('turn on --- $isTurnOn');
    if (!isTurnOn) {
      await _flutterThermalPrinter.turnOnBluetooth();
      debugPrint('turn on ---');
    }
  }

  // Scan for Bluetooth printers
  Future<List<PrinterDevice>> scanBluetoothPrinters() async {
    try {
      await connectBluethooth();

      // We will wait for the stream to emit results
      final completer = Completer<List<Printer>>();
      List<Printer> currentList = [];

      final subscription = _flutterThermalPrinter.devicesStream.listen((event) {
        debugPrint('event ------ $event');
        currentList = List.from(event);
      });

      await _flutterThermalPrinter.getPrinters(
        connectionTypes: [
          ConnectionType.BLE,
          ConnectionType.NETWORK,
          ConnectionType.USB,
        ],
        androidUsesFineLocation: true,
      );

      // Wait for scan to collect devices
      // The original code waited 4 seconds.
      await Future.delayed(const Duration(seconds: 4));

      subscription.cancel();
      await _flutterThermalPrinter.stopScan();

      _scannedPackagePrinters.clear();
      _scannedPackagePrinters.addAll(currentList);

      debugPrint('------ Scan result: $currentList');

      return currentList.map(_mapToDevice).toList();
    } catch (e) {
      print('Error scanning Bluetooth printers: $e');

      return [];
    }
  }

  PrinterDevice _mapToDevice(Printer p) {
    PrinterConnectionType type;
    switch (p.connectionType) {
      case ConnectionType.BLE:
        type = PrinterConnectionType.ble;
        break;
      case ConnectionType.NETWORK:
        type = PrinterConnectionType.network;
        break;
      case ConnectionType.USB:
        type = PrinterConnectionType.usb;
        break;
      default:
        type = PrinterConnectionType.ble;
    }

    return PrinterDevice(
      name: p.name,
      address: p.address,
      connectionType: type,
    );
  }

  // Connect to printer
  Future<bool> connectToPrinter(PrinterDevice printer) async {
    try {
      // Find the package printer object
      final pkgPrinter = _scannedPackagePrinters.firstWhere(
        (p) => p.address == printer.address && p.name == printer.name,
        orElse: () => throw Exception('Printer not found in cache'),
      );

      final result = await _flutterThermalPrinter.connect(pkgPrinter);
      if (result) {
        _connectedPrinter = printer;
        _connectedPackagePrinter = pkgPrinter;

        return true;
      }

      return false;
    } catch (e) {
      print('Error connecting to printer: $e');

      return false;
    }
  }

  // Print raw bytes
  Future<bool> printBytes(
    List<int> bytes, {
    bool longData = false,
    int? chunkSize,
  }) async {
    final connected = _connectedPackagePrinter;
    if (connected == null) {
      print('No printer connected');

      return false;
    }

    try {
      await _flutterThermalPrinter.printData(
        connected,
        bytes,
        longData: longData,
        chunkSize: chunkSize,
      );

      return true;
    } catch (e) {
      print('Error printing: $e');

      return false;
    }
  }
}

class WidgetPrinter {
  final PrinterService _printerService;
  final ScreenshotController _screenshotController = ScreenshotController();

  WidgetPrinter(this._printerService);

  Future<void> printWidget(Widget widget, {int maxWidth = 384}) async {
    try {
      // 1. Capture widget as image with high pixel ratio for text clarity
      final imageBytes = await _screenshotController.captureFromLongWidget(
        widget,
        pixelRatio: 2.0,
      );

      // 2. Pre-process image: resize, grayscale, threshold
      final optimizedImage = _optimizeImageForPrinting(
        imageBytes,
        targetWidth: maxWidth,
      );

      if (optimizedImage == null) {
        print('Failed to optimize image');

        return;
      }

      // 3. Print the optimized image
      await _printChunkedWidget(image: optimizedImage);
    } catch (e) {
      print('Error printing widget: $e');
    }
  }

  /// Optimize image for thermal printing (B&W, high contrast)
  img.Image? _optimizeImageForPrinting(
    Uint8List imageBytes, {
    int targetWidth = 384,
  }) {
    img.Image? image = img.decodeImage(imageBytes);
    if (image == null) return null;

    if (image.width != targetWidth) {
      image = img.copyResize(
        image,
        width: targetWidth,
        interpolation: img.Interpolation.cubic,
      );
    }

    image = img.grayscale(image);

    for (final pixel in image) {
      final luminance = pixel.luminance;
      if (luminance > 128) {
        pixel
          ..r = 255
          ..g = 255
          ..b = 255;
      } else {
        pixel
          ..r = 0
          ..g = 0
          ..b = 0;
      }
    }

    return image;
  }

  Future<void> _printChunkedWidget({
    required img.Image image,
    PaperSize paperSize = PaperSize.mm58,
    bool cutAfterPrinted = true,
  }) async {
    final profile0 = await CapabilityProfile.load();
    final ticket = Generator(paperSize, profile0);

    if (image.width % 8 != 0) {
      final newWidth = image.width + (8 - (image.width % 8));
      image = img.copyResize(image, width: newWidth);
    }

    // Access the private connectedPackagePrinter via the service if we could,
    // but _printerService._connectedPackagePrinter is private.
    // I need to expose it or handle connection type check differently.
    // For now I will assume not USB on desktop to keep logic simple or rely on platform check.

    // Check connection type from the service's current cached printer
    // logic from original:
    // _printerService.connectedPrinter?.connectionType == ConnectionType.USB
    final bool isUsbDesktop =
        (Platform.isMacOS || Platform.isWindows) &&
        _printerService.connectedPrinter?.connectionType ==
            PrinterConnectionType.usb;

    if (isUsbDesktop) {
      List<int> raster = ticket.imageRaster(image);
      if (cutAfterPrinted) {
        raster += ticket.cut();
      }
      await _printerService.printBytes(raster, longData: true);
    } else {
      const chunkHeight = 300;
      final totalHeight = image.height;
      final totalWidth = image.width;
      final chunksCount = (totalHeight / chunkHeight).ceil();
      var raster = <int>[];

      for (var i = 0; i < chunksCount; i++) {
        final startY = i * chunkHeight;
        final endY = (startY + chunkHeight > totalHeight)
            ? totalHeight
            : startY + chunkHeight;
        final actualHeight = endY - startY;

        final croppedImage = img.copyCrop(
          image,
          x: 0,
          y: startY,
          width: totalWidth,
          height: actualHeight,
        );

        raster += ticket.imageRaster(croppedImage);
      }

      await _printerService.printBytes(raster, longData: true);

      if (cutAfterPrinted) {
        await _printerService.printBytes(ticket.cut(), longData: true);
      }
    }
  }
}

class ImagePrinter {
  final PrinterService _printerService;

  ImagePrinter(this._printerService);

  Future<void> printImage(String imagePath, {int maxWidth = 384}) async {
    try {
      final imageFile = File(imagePath);
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) {
        print('Failed to decode image');

        return;
      }

      final resized = img.copyResize(
        image,
        width: maxWidth,
        interpolation: img.Interpolation.linear,
      );

      final monochrome = img.grayscale(resized);
      final printData = _convertToEscPosImage(monochrome);

      await _printerService.printBytes(printData);
    } catch (e) {
      print('Error printing image: $e');
    }
  }

  Uint8List _convertToEscPosImage(img.Image image) {
    final bytes = BytesBuilder();
    bytes.add(Uint8List.fromList([0x1B, 0x40]));

    final width = image.width;
    final height = image.height;

    for (int y = 0; y < height; y += 24) {
      // Logic from original file...
      // Simplified for brevity in thought, but must retain logic.
      final sliceHeight = (y + 24 <= height) ? 24 : height - y;
      final bytesPerLine = (width + 7) ~/ 8;

      bytes.add([0x1B, 0x2A, 33]);
      bytes.add([bytesPerLine & 0xFF, (bytesPerLine >> 8) & 0xFF]);

      for (int x = 0; x < width; x++) {
        for (int k = 0; k < 3; k++) {
          int slice = 0;
          for (int b = 0; b < 8; b++) {
            final pixelY = y + k * 8 + b;
            if (pixelY < height) {
              final pixel = image.getPixel(x, pixelY);
              final luminance = img.getLuminance(pixel);
              if (luminance < 128) {
                slice |= 1 << (7 - b);
              }
            }
          }
          bytes.add([slice]);
        }
      }
      bytes.add([0x0A]);
    }

    return bytes.toBytes();
  }
}
