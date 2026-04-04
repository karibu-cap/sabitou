// ignore_for_file: long-method
import 'dart:async';
import 'dart:io';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart' as pr;
import 'package:screenshot/screenshot.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/logger.dart';
import '../../../utils/printer_management.dart' hide PaperSize;
import '../../loading.dart';
// Platform-specific Bluetooth imports

/// The printing mixin.
class AppPrinterUtils {
  static final ScreenshotController _screenshotController =
      ScreenshotController();
  static final logger = LoggerApp('MyPrinting');

  // Keep track of connected device
  static final PrinterManagement printerManagement = PrinterManagement();

  /// Pick a printer.
  static Future<Printer?> pickPrinter(BuildContext context) async {
    Printer? selectedPrinter;

    await showShadDialog(
      context: context,
      builder: (context) => _PrinterSelectionDialog(
        printerManagement: printerManagement,
        onPrinterSelected: (printer) async {
          selectedPrinter = printer;
          // await AppStorage.of<Printer>().write(PreferencesKey.printer, printer);
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
      ),
    );

    return selectedPrinter;
  }

  /// Direct print pdf.
  static FutureOr<bool> directPrintPdf({
    required Printer printer,
    required BuildContext context,
    String name = 'Document',
    PdfPageFormat format = PdfPageFormat.standard,
    bool dynamicLayout = true,
    bool usePrinterSettings = false,
    Widget? widget,
    FutureOr<Uint8List>? onLayout,
  }) async {
    if (printer.connectionType != ConnectionType.NETWORK) {
      if (printer.connectionType == ConnectionType.BLE && widget != null) {
        try {
          final bool isConnected = await printerManagement.isPrinterConnected(
            printer,
          );
          if (!isConnected) {
            await printerManagement.connect(printer);
          }
          final int widthPx = _getPrinterWidthPx(PaperSize.mm58);
          final imageBytes = await _screenshotController.captureFromLongWidget(
            Material(
              color: Colors.white,
              child: Container(
                color: Colors.white,
                width: widthPx.toDouble(),
                child: widget,
              ),
            ),
            pixelRatio: 1.0,
            delay: const Duration(milliseconds: 100),
          );

          final optimiseChunk = _optimizeImageBytes(
            imageBytes,
            targetWidth: widthPx,
          );

          final chunkWidget = await _printChunkedWidget(image: optimiseChunk);

          // Send data in small chunks to avoid Bluetooth write size limits (245 bytes)
          const int maxChunkSize = 200;
          for (int i = 0; i < chunkWidget.length; i += maxChunkSize) {
            final int end = (i + maxChunkSize < chunkWidget.length)
                ? i + maxChunkSize
                : chunkWidget.length;
            final List<int> chunk = chunkWidget.sublist(i, end);
            await printerManagement.writeData(printer, chunk);

            // Small delay between chunks to allow printer to process
            await Future.delayed(const Duration(milliseconds: 100));
          }

          return true;
        } catch (e) {
          logger.severe('Bluetooth printing error: $e');
          showErrorToast(
            context: context,
            message: Intls.to.printerNotConnected.trParams({
              'printer': printer.name ?? Intls.to.theDevice,
            }),
          );

          return false;
        }
      } else {
        return pr.Printing.directPrintPdf(
          printer: pr.Printer(url: printer.address ?? '', name: printer.name),
          onLayout: (format) {
            return onLayout ?? Future.value(Uint8List.fromList([]));
          },
          name: name,
          dynamicLayout: dynamicLayout,
          format: format,
          usePrinterSettings: usePrinterSettings,
        );
      }
    } else {
      // TODO: implement the printing pdf
      // await ClientRequests().sendPrintingPdf(
      //   await onLayout,
      //   '${Get.find<UserAccount>().structureId ?? 0}',
      //   printer.url,
      //   format,
      //   name,
      // );

      return true;
    }
  }

  /// Connect to bluetooth device
  // static Future<void> _connectToDevice(BluetoothDeviceWrapper device) async {
  //   try {
  //     // Cancel previous subscription if exists
  //     await _connectionSubscription?.cancel();

  //     final connectedDevice = _connectedDevice;

  //     // Disconnect from previous device if exists
  //     if (connectedDevice != null && connectedDevice != device) {
  //       try {
  //         await BluetoothManager.disconnect(connectedDevice);
  //       } catch (e) {
  //         logger.warning('Error disconnecting previous device: $e');
  //       }
  //     }

  //     // Connect to new device
  //     await BluetoothManager.connect(device);

  //     // Listen to connection state
  //     _connectionSubscription = BluetoothManager.listenToConnectionState(
  //       device,
  //       (state) {
  //         logger.info('Bluetooth device state: $state');
  //         if (state == BluetoothConnectionState.disconnected) {
  //           _connectedDevice = null;
  //         }
  //       },
  //     );

  //     _connectedDevice = device;
  //   } catch (e) {
  //     logger.severe('Connection error: $e');
  //     throw Exception('Failed to connect to device');
  //   }
  // }

  /// Show the pdf preview.
  static void showPdfPreview({
    required Uint8List pdfData,
    required PdfPageFormat pdfPageFormat,
    required String fileName,
    required BuildContext context,
  }) {
    showShadDialog(
      context: context,
      builder: (context) {
        return ShadDialog(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(Intls.to.preview, textAlign: TextAlign.center),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(LucideIcons.x),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Expanded(
                child: pr.PdfPreview(
                  build: (format) => pdfData,
                  canDebug: false,
                  dynamicLayout: false,
                  initialPageFormat: pdfPageFormat,
                  maxPageWidth: 800,
                  pdfFileName: fileName,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<List<int>> _printChunkedWidget({
    required Uint8List image,
    PaperSize paperSize = PaperSize.mm58,
    bool cutAfterPrinted = true,
  }) async {
    final profile0 = await CapabilityProfile.load();
    final ticket = Generator(paperSize, profile0);

    var imagebytes = img.decodeImage(image);
    if (imagebytes == null) {
      throw Exception('Failed to decode image for chunked printing');
    }

    imagebytes = _buildImageRasterAvailable(imagebytes);

    if ((Platform.isMacOS || Platform.isWindows)) {
      List<int> raster;
      raster = ticket.imageRaster(imagebytes);
      if (cutAfterPrinted) {
        raster += ticket.cut();
      }

      return raster;
    } else {
      // For Android/iOS Bluetooth devices, use smaller chunk height to stay within 245 byte limit
      const chunkHeight =
          15; // Reduced from 30 to fit within Bluetooth write limit
      final totalHeight = imagebytes.height;
      final totalWidth = imagebytes.width;
      final chunksCount = (totalHeight / chunkHeight).ceil();
      var raster = <int>[];

      // Print image in chunks
      for (var i = 0; i < chunksCount; i++) {
        final startY = i * chunkHeight;
        final endY = (startY + chunkHeight > totalHeight)
            ? totalHeight
            : startY + chunkHeight;
        final actualHeight = endY - startY;

        final croppedImage = img.copyCrop(
          imagebytes,
          x: 0,
          y: startY,
          width: totalWidth,
          height: actualHeight,
        );

        raster += ticket.imageRaster(croppedImage);
      }

      if (cutAfterPrinted) {
        raster += ticket.cut();
      }

      return raster;
    }
  }

  static img.Image _buildImageRasterAvailable(img.Image image) {
    if (image.width % 8 == 0) {
      return image;
    }
    final newWidth = _makeDivisibleBy8(image.width);

    return img.copyResize(image, width: newWidth);
  }

  /// Make number divisible by 8 for printer compatibility
  static int _makeDivisibleBy8(int number) {
    if (number % 8 == 0) {
      return number;
    }

    return number + (8 - (number % 8));
  }
}

/////
int _getPrinterWidthPx(PaperSize paperSize) {
  switch (paperSize) {
    case PaperSize.mm58:
      return 384; // 58mm = ~384px
    case PaperSize.mm80:
      return 576; // 80mm = ~576px
    default:
      return 384;
  }
}

/// Capture widget as optimized image
Future<Uint8List> _captureOptimizedImage(
  Widget widget, {
  required double widthPx,
  double pixelRatio = 1.0, // Reduced from 2.0
}) async {
  final controller = ScreenshotController();

  return await controller.captureFromLongWidget(
    Material(
      color: Colors.white,
      child: Container(color: Colors.white, width: widthPx, child: widget),
    ),
    pixelRatio: pixelRatio,
    delay: const Duration(milliseconds: 100),
  );
}

/// Further optimize image: compress, dither, resize
Uint8List _optimizeImageBytes(
  Uint8List imageBytes, {
  int? targetWidth,
  bool applyDithering = true,
}) {
  // Decode image
  img.Image? image = img.decodeImage(imageBytes);
  if (image == null) return imageBytes;

  // Resize if needed
  if (targetWidth != null && image.width != targetWidth) {
    image = img.copyResize(
      image,
      width: targetWidth,
      interpolation: img.Interpolation.linear,
    );
  }

  // Convert to grayscale for better thermal printing
  image = img.grayscale(image);

  // Apply Floyd-Steinberg dithering for better print quality
  if (applyDithering) {
    // Increase contrast
    image = img.adjustColor(image, contrast: 1.2);

    // Simple threshold dithering (thermal printers are black/white)
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final luminance = img.getLuminance(pixel);

        // Apply threshold
        final newColor = luminance > 128 ? 255 : 0;
        image.setPixel(x, y, img.ColorRgb8(newColor, newColor, newColor));
      }
    }
  }

  // Encode back to PNG (smallest format for B&W images)
  return Uint8List.fromList(img.encodePng(image, level: 9));
}

class _PrinterSelectionDialog extends StatefulWidget {
  final PrinterManagement printerManagement;
  final Function(Printer) onPrinterSelected;

  const _PrinterSelectionDialog({
    required this.printerManagement,
    required this.onPrinterSelected,
  });

  @override
  State<_PrinterSelectionDialog> createState() =>
      _PrinterSelectionDialogState();
}

class _PrinterSelectionDialogState extends State<_PrinterSelectionDialog> {
  List<Printer> _printers = [];
  Printer? _selectedPrinter;
  bool _isScanning = true;
  bool _isConnecting = false;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  Future<void> _startScan() async {
    if (mounted) setState(() => _isScanning = true);

    // Clear previous results, but keep selected if valid
    await widget.printerManagement.startScan(
      onDevicesFound: (printers) {
        if (mounted) {
          setState(() {
            _printers = printers;
            if (_selectedPrinter != null) {
              final found = _printers.any(
                (p) => p.address == _selectedPrinter?.address,
              );
              if (!found) {
                // Device no longer in scan results
              }
            }
          });
        }
      },
    );

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) setState(() => _isScanning = false);
    });
  }

  Future<void> _connectToPrinter(Printer printer) async {
    setState(() {
      _selectedPrinter = printer;
      _isConnecting = true;
      _isConnected = false;
    });

    try {
      await widget.printerManagement.connect(printer);
      if (mounted) {
        setState(() => _isConnected = true);
      }
    } catch (e) {
      if (mounted) {
        print('Connection failed: $e');
        // Optionally reset selection if connection fails
        // setState(() => _selectedPrinter = null);
      }
    } finally {
      if (mounted) setState(() => _isConnecting = false);
    }
  }

  @override
  void dispose() {
    widget.printerManagement.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      actionsMainAxisAlignment: MainAxisAlignment.end,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      actionsGap: 8,
      actionsAxis: Axis.horizontal,
      expandActionsWhenTiny: false,
      child: Material(
        color: ShadTheme.of(context).colorScheme.card,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 350, minWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Intls.to.selectOnOrMorePrinter),
                    if (_isScanning)
                      const Loading.button()
                    else
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: _startScan,
                        tooltip: 'Rescan',
                      ),
                  ],
                ),
              ),
              const Divider(),
              Flexible(
                child: SingleChildScrollView(
                  child: _printers.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              _isScanning
                                  ? 'Scanning for printers...'
                                  : 'No printers found. Try rescanning.',
                              style: ShadTheme.of(context).textTheme.muted,
                            ),
                          ),
                        )
                      : ShadRadioGroup<Printer>(
                          spacing: 8,
                          items: _printers
                              .map(
                                (e) => ShadRadio(
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(e.name ?? 'Unknown Device'),
                                      if (_selectedPrinter == e &&
                                          _isConnecting)
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Loading.button(),
                                        )
                                      else if (_selectedPrinter == e &&
                                          _isConnected)
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.check_circle,
                                            size: 16,
                                            color: Colors.green,
                                          ),
                                        ),
                                    ],
                                  ),
                                  value: e,
                                  sublabel: Text(e.deviceId ?? e.address ?? ''),
                                ),
                              )
                              .toList(),
                          initialValue: _selectedPrinter,
                          onChanged: (value) {
                            if (value != null) {
                              _connectToPrinter(value);
                            }
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ShadButton.outline(
          child: Text(Intls.to.cancel),
          onPressed: () => Navigator.pop(context),
        ),
        ShadButton(
          enabled: _selectedPrinter != null && _isConnected,
          onPressed: () {
            final printer = _selectedPrinter;
            if (printer != null) {
              widget.onPrinterSelected(printer);
              Navigator.pop(context);
            }
          },
          child: Text(Intls.to.save),
        ),
      ],
    );
  }
}
