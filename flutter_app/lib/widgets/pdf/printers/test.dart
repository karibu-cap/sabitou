// import 'dart:io';

// import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image/image.dart' as img;
// import 'package:screenshot/screenshot.dart';

// import '../../../utils/bluetooth/bluetooth_manager.dart';

// class BluetoothPrinterHelper {
//   static final ScreenshotController _screenshotController =
//       ScreenshotController();

//   static Future<List<int>> printWidget(
//     Widget widget, {
//     int maxWidth = 284,
//   }) async {
//     try {
//       // Capture widget as image
//       final imageBytes = await _screenshotController.captureFromLongWidget(
//         Material(
//           color: Colors.white,
//           child: Container(color: Colors.white, width: widthPx, child: widget),
//         ),
//         widget,
//         pixelRatio: 2.0,
//       );

//       return _printChunkedWidget(image: imageBytes, chunkSize: 158);
//     } catch (e) {
//       print('Error printing widget: $e');

//       return [];
//     }
//   }

//   static Future<List<int>> _printChunkedWidget({
//     required Uint8List image,
//     PaperSize paperSize = PaperSize.mm58,
//     bool cutAfterPrinted = true,
//     int? chunkSize,
//   }) async {
//     final profile0 = await CapabilityProfile.load();
//     final ticket = Generator(paperSize, profile0);

//     var imagebytes = img.decodeImage(image);
//     if (imagebytes == null) {
//       throw Exception('Failed to decode image for chunked printing');
//     }

//     imagebytes = _buildImageRasterAvailable(imagebytes);

//     if ((Platform.isMacOS || Platform.isWindows)) {
//       List<int> raster;
//       raster = ticket.imageRaster(imagebytes);
//       if (cutAfterPrinted) {
//         raster += ticket.cut();
//       }

//       return raster;
//     } else {
//       // For other platforms, use chunked approach
//       const chunkHeight = 30;
//       final totalHeight = imagebytes.height;
//       final totalWidth = imagebytes.width;
//       final chunksCount = (totalHeight / chunkHeight).ceil();
//       var raster = <int>[];
//       // Print image in chunks
//       for (var i = 0; i < chunksCount; i++) {
//         final startY = i * chunkHeight;
//         final endY = (startY + chunkHeight > totalHeight)
//             ? totalHeight
//             : startY + chunkHeight;
//         final actualHeight = endY - startY;

//         final croppedImage = img.copyCrop(
//           imagebytes,
//           x: 0,
//           y: startY,
//           width: totalWidth,
//           height: actualHeight,
//         );

//         raster += ticket.imageRaster(croppedImage);
//       }

//       return raster;

//       // if (cutAfterPrinted) {
//       //   await printData(ticket.cut(), longData: true, chunkSize: chunkSize);
//       // }
//     }
//   }

//   /// Print raw data to printer
//   // Future<void> printData(
//   //   List<int> bytes, {
//   //   bool longData = false,
//   //   int? chunkSize,
//   // }) async => await _printerService.printBytes(
//   //   bytes,
//   //   longData: longData,
//   //   chunkSize: chunkSize,
//   // );

//   static img.Image _buildImageRasterAvailable(img.Image image) {
//     if (image.width % 8 == 0) {
//       return image;
//     }
//     final newWidth = _makeDivisibleBy8(image.width);

//     return img.copyResize(image, width: newWidth);
//   }

//   /// Make number divisible by 8 for printer compatibility
//   static int _makeDivisibleBy8(int number) {
//     if (number % 8 == 0) {
//       return number;
//     }

//     return number + (8 - (number % 8));
//   }

//   /// Save image to app's documents directory
//   ///
//   static Future<img.Image?> _getPngImageFromPdf(
//     Uint8List pdfBytes, {
//     String? fileName,
//   }) async {
//     // try {
//     //   // Use 203 DPI which is standard for thermal printers
//     //   await for (var page in Printing.raster(pdfBytes, pages: [0], dpi: 203)) {
//     //     final imageBytes = await page.toPng();
//     //     img.Image? image = img.decodeImage(imageBytes);
//     //     debugPrint('imagave display ${image == null}');
//     //     if (image == null) return null;

//     //     // CRITICAL: Process image for thermal printer
//     //     // 1. Convert to grayscale
//     //     image = img.grayscale(image);

//     //     // 2. Adjust contrast to make text darker
//     //     image = img.adjustColor(image, contrast: 1.5, brightness: 1.1);

//     //     // 3. Apply threshold to convert to pure black and white
//     //     // This is ESSENTIAL for thermal printers
//     //     image = _applyThreshold(image);

//     //     // 4. Resize to printer width (384 pixels for 58mm, 576 for 80mm)
//     //     // Use 576 for 80mm thermal printers
//     //     if (image.width > 576) {
//     //       image = img.copyResize(image, width: 576);
//     //     }

//     //     return image;
//     //   }
//     // } catch (e) {
//     //   debugPrint('Error converting PDF to image: $e');
//     // }
//     final ByteData data = await rootBundle.load('assets/images/logo.png');
//     final Uint8List bytes = data.buffer.asUint8List();
//     final img.Image? image = img.decodeImage(bytes);
//     debugPrint('image ----- ${image == null}');

//     return image;
//   }

//   /// Apply threshold to convert grayscale to pure black/white
//   static img.Image _applyThreshold(img.Image image, {int threshold = 128}) {
//     for (int y = 0; y < image.height; y++) {
//       for (int x = 0; x < image.width; x++) {
//         final pixel = image.getPixel(x, y);
//         // Get luminance (brightness) of pixel
//         final luminance = img.getLuminance(pixel);

//         // Convert to pure black or white based on threshold
//         final newColor = luminance > threshold
//             ? img.ColorRgb8(255, 255, 255) // White
//             : img.ColorRgb8(0, 0, 0); // Black

//         image.setPixel(x, y, newColor);
//       }
//     }

//     return image;
//   }

//   /// Generate ESC/POS commands for thermal printer
//   static Future<List<int>> _generatePrintCommands(img.Image image) async {
//     List<int> bytes = [];

//     try {
//       final profile = await CapabilityProfile.load();
//       final generator = Generator(PaperSize.mm58, profile);
//       final headerStyle = const PosStyles(align: PosAlign.center, bold: true);

//       // bytes += generator.setGlobalCodeTable('CP1252');
//       // bytes += generator.setStyles(const PosStyles(codeTable: 'CP1252'));

//       // Initialize printer
//       // bytes += generator.reset();

//       // Set debugPrint density (darker printing)
//       // bytes += [0x1D, 0x7C, 0x00]; // Print density command

//       // Print the image
//       bytes += generator.image(image);

//       // Add some spacing
//       bytes += generator.feed(2);

//       // Cut paper
//       bytes += generator.cut();
//     } catch (e) {
//       debugPrint('Error generating debugPrint commands: $e');
//     }

//     return bytes;
//   }

//   /// Main printing function with improved error handling
//   static Future<bool> printBluetoothReceipt({
//     required BluetoothDeviceWrapper device,
//     required Widget widget,
//   }) async {
//     try {
//       // Check connection
//       final bool isConnected = await BluetoothManager.isDeviceConnected(device);
//       debugPrint('bluethooth is connected $isConnected');
//       if (!isConnected) {
//         await _connectToDevice(device);
//       }

//       // Convert PDF to image with proper processing
//       final chunk = await printWidget(widget);
//       debugPrint('write chunk is connected $chunk');

//       await BluetoothManager.writeData(device, chunk);

//       // Delay between chunks - IMPORTANT for thermal printers
//       await Future.delayed(const Duration(milliseconds: 50));

//       debugPrint('Print job sent successfully');

//       return true;
//     } catch (e) {
//       debugPrint('Bluetooth printing error: $e');

//       return false;
//     }
//   }

//   static Future<void> _connectToDevice(BluetoothDeviceWrapper device) async {
//     // Your existing connection logic
//     await BluetoothManager.connect(device);
//   }
// }
