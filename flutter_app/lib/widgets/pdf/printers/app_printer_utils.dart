// ignore_for_file: long-method
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../services/storage/app_storage.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/bluetooth/bluetooth_manager.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/logger.dart';
// Platform-specific Bluetooth imports

/// The printing mixin.
class AppPrinterUtils {
  static final logger = LoggerApp('MyPrinting');

  // Keep track of connected device
  static BluetoothDeviceWrapper? _connectedDevice;
  static StreamSubscription? _connectionSubscription;

  /// Pick a printer.
  static Future<AppPrinter?> pickPrinter(BuildContext context) async {
    AppPrinter? printer;

    final getListOfPrinters = await listPrinters(context);

    await showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        child: Material(
          color: ShadTheme.of(context).colorScheme.card,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: SelectPrinterWidget(
                    existentPrinters: getListOfPrinters,
                    builder: (selectedPrinter) {
                      printer = selectedPrinter;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ShadButton.outline(
                        child: Text(Intls.to.cancel),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ShadButton(
                        child: Text(Intls.to.save),
                        onPressed: () async {
                          final _printer = printer;
                          if (_printer == null) return;
                          await AppStorage.of<AppPrinter>().write(
                            PreferencesKey.printer,
                            _printer,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return printer;
  }

  /// Direct print pdf.
  static FutureOr<bool> directPrintPdf({
    required AppPrinter printer,
    required FutureOr<Uint8List> onLayout,
    required BuildContext context,
    String name = 'Document',
    PdfPageFormat format = PdfPageFormat.standard,
    bool dynamicLayout = true,
    bool usePrinterSettings = false,
  }) async {
    if (!printer.url.contains('#6663#')) {
      if (printer.url == 'suiite-epdf-preview') {
        showPdfPreview(
          fileName: name,
          pdfData: await onLayout,
          pdfPageFormat: format,
          context: context,
        );

        return true;
      } else if (printer.url.contains(PrinterModel.bluetoothDevice.name)) {
        try {
          final BluetoothDeviceWrapper device =
              await BluetoothManager.createDeviceFromAppPrinter(printer);

          // Check if already connected
          final bool isConnected = await BluetoothManager.isDeviceConnected(
            device,
          );

          if (!isConnected) {
            await _connectToDevice(device, context);
          }

          await for (PdfRaster page in Printing.raster(
            await onLayout,
            dpi: format.width,
          )) {
            final int chunkHeight = 50; // Height of each band
            final int chunkWidth = page.width; // Total width of the image

            final img.Image? image = img.decodePng(
              cropWhiteAreas(
                img.encodePng(setWhiteBackground(await page.toPng())),
              ),
            );

            if (image == null) {
              return false;
            }

            // Iterate through the image in horizontal bands
            for (int y = 0; y < image.height; y += chunkHeight) {
              // Calculate chunk height
              final int height = (y + chunkHeight > image.height)
                  ? image.height - y
                  : chunkHeight;

              // Cut the horizontal band
              final img.Image chunk = img.copyCrop(
                image,
                x: 0,
                y: y,
                width: chunkWidth,
                height: height,
              );

              // Encode the band in PNG
              final Uint8List chunkBytes = img.encodePng(chunk);

              // Print the band
              await _printImageBytes(device, chunkBytes);
            }
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
      } else if (printer.url == 'suiite-sunmi-printer') {
        try {
          await for (PdfRaster page in Printing.raster(
            await onLayout,
            dpi: format.width,
          )) {
            final Uint8List imageBytes = cropWhiteAreas(
              img.encodePng(setWhiteBackground(await page.toPng())),
            );
            await SunmiPrinter.printImage(
              imageBytes,
              align: SunmiPrintAlign.CENTER,
            );
            SunmiPrinter.printText('');
          }
        } catch (e) {
          showErrorToast(
            context: context,
            message: Intls.to.printerNotConnected.trParams({
              'printer': printer.name ?? Intls.to.theDevice,
            }),
          );
        }

        return true;
      } else {
        return Printing.directPrintPdf(
          printer: printer.toPrinter(),
          onLayout: (format) {
            return onLayout;
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
  static Future<void> _connectToDevice(
    BluetoothDeviceWrapper device,
    BuildContext context,
  ) async {
    try {
      // Cancel previous subscription if exists
      await _connectionSubscription?.cancel();

      final connectedDevice = _connectedDevice;

      // Disconnect from previous device if exists
      if (connectedDevice != null && connectedDevice != device) {
        try {
          await BluetoothManager.disconnect(connectedDevice);
        } catch (e) {
          logger.warning('Error disconnecting previous device: $e');
        }
      }

      // Connect to new device
      await BluetoothManager.connect(device);

      // Listen to connection state
      _connectionSubscription = BluetoothManager.listenToConnectionState(
        device,
        (state) {
          logger.info('Bluetooth device state: $state');
          if (state == BluetoothConnectionState.disconnected) {
            _connectedDevice = null;
          }
        },
      );

      _connectedDevice = device;
    } catch (e) {
      logger.severe('Connection error: $e');
      throw Exception('Failed to connect to device');
    }
  }

  /// Print image bytes to bluetooth printer
  static Future<void> _printImageBytes(
    BluetoothDeviceWrapper device,
    Uint8List imageBytes,
  ) async {
    try {
      // Convert image to ESC/POS commands (simplified version)
      final List<int> commands = _convertImageToEscPos(imageBytes);

      // Send data via bluetooth manager
      await BluetoothManager.writeData(device, commands);
    } catch (e) {
      logger.severe('Error printing image: $e');
      throw Exception('Failed to print image');
    }
  }

  /// Convert image to ESC/POS commands (basic implementation)
  /// You may need to adjust this based on your printer's specifications
  static List<int> _convertImageToEscPos(Uint8List imageBytes) {
    final img.Image? image = img.decodeImage(imageBytes);
    if (image == null) return [];

    final List<int> commands = [];

    // ESC @ - Initialize printer
    commands.addAll([27, 64]);

    // Image printing command (simplified - may need adjustment)
    // This is a basic implementation - you might need ESC * or GS v 0 commands
    // depending on your printer model

    commands.addAll(imageBytes);

    // Line feed
    commands.addAll([10]);

    return commands;
  }

  /// Disconnect from bluetooth device
  static Future<void> disconnectBluetooth() async {
    try {
      await _connectionSubscription?.cancel();
      final connectedDevice = _connectedDevice;
      if (connectedDevice != null) {
        await BluetoothManager.disconnect(connectedDevice);
        _connectedDevice = null;
      }
    } catch (e) {
      logger.severe('Error disconnecting: $e');
    }
  }

  /// List the printers.
  static Future<List<AppPrinter>> listPrinters(BuildContext context) async {
    final List<AppPrinter> listPrinters = [];
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      final List<Printer> defaultPrinters = await Printing.listPrinters();
      for (Printer printer in defaultPrinters) {
        listPrinters.add(AppPrinter.fromPrinter(printer));
      }
    }

    listPrinters
      ..add(AppPrinter(url: 'suiite-epdf-preview', name: Intls.to.preview))
      ..add(AppPrinter(url: 'suiite-sunmi-printer', name: 'Sunmi printer'));

    if (Platform.isAndroid || Platform.isIOS || kIsWeb) {
      listPrinters.addAll(await listOfBluetoothDevice(context));
    }

    return listPrinters;
  }

  /// List the bluetooth device.
  static Future<List<AppPrinter>> listOfBluetoothDevice(
    BuildContext context,
  ) async {
    final List<AppPrinter> listPrinters = [];

    try {
      // Check if bluetooth is supported
      if (!await BluetoothManager.isBluetoothSupported()) {
        showErrorToast(
          context: context,
          message: 'Bluetooth not supported on this device',
        );

        return [];
      }

      // Check bluetooth adapter state
      if (!await BluetoothManager.isBluetoothEnabled()) {
        showErrorToast(
          context: context,
          message: Intls.to.printerConfigurationError,
        );

        return [];
      }

      // Get bonded/connected devices
      final List<BluetoothDeviceWrapper> devices =
          await BluetoothManager.getBondedDevices();

      for (BluetoothDeviceWrapper device in devices) {
        listPrinters.add(
          await BluetoothManager.createAppPrinterFromDevice(device),
        );
      }

      // Listen to adapter state changes
      BluetoothManager.listenToAdapterState((state) {
        logger.info('Bluetooth adapter state: $state');
      });
    } catch (e) {
      showErrorToast(
        context: context,
        message: Intls.to.printerConfigurationError,
      );
      logger.severe('Error listing bluetooth devices: $e');
    }

    return listPrinters;
  }

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
                child: PdfPreview(
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

  /// Crop the white areas from the image.
  static Uint8List cropWhiteAreas(Uint8List imageBytes) {
    // Decode the image from bytes
    final img.Image image =
        img.decodeImage(imageBytes) ?? img.Image(width: 0, height: 0);

    // Detect non-white limits
    int top = image.height;
    int bottom = 0;
    int left = image.width;
    int right = 0;

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final img.Pixel pixel = image.getPixel(x, y);
        final num r = pixel.r;
        final num g = pixel.g;
        final num b = pixel.b;

        // If the pixel is not white, update the limits
        if (r != 255 || g != 255 || b != 255) {
          if (x < left) left = x;
          if (x > right) right = x;
          if (y < top) top = y;
          if (y > bottom) bottom = y;
        }
      }
    }

    // Crop the image
    final img.Image croppedImage = img.copyCrop(
      image,
      x: left,
      y: top,
      width: right - left,
      height: bottom - top,
    );

    // Encode the cropped image in Uint8List
    final Uint8List croppedImageBytes = Uint8List.fromList(
      img.encodePng(croppedImage),
    );

    return croppedImageBytes;
  }

  /// Set a white background while preserving pixels close to black.
  static img.Image setWhiteBackground(Uint8List imageBytes) {
    // Decode the image from bytes
    final img.Image? image = img.decodeImage(imageBytes);

    if (image == null) {
      throw Exception('Failed to decode image');
    }

    // Threshold to determine if a pixel is "close to black"
    final int blackThreshold = 255;

    // Iterate through each pixel of the image
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final img.Pixel pixel = image.getPixel(x, y);

        // Get the color components and alpha channel
        final int r = pixel.r.toInt();
        final int g = pixel.g.toInt();
        final int b = pixel.b.toInt();
        final int a = pixel.a.toInt();

        // Calculate the pixel luminance (luminance method)
        final int luminance = ((r * 0.299) + (g * 0.587) + (b * 0.114)).toInt();

        // If the pixel is transparent OR (not white AND not close to black), replace it with white
        if (a < 155 ||
            (luminance > blackThreshold &&
                (r != 255 || g != 255 || b != 255))) {
          image.setPixel(x, y, img.ColorRgb8(255, 255, 255)); // White
        }
      }
    }

    // Return the modified image
    return image;
  }

  /// Process the image.
  static img.Image processImage(
    Uint8List imageBytes, {
    int blackThreshold = 50,
    int alphaThreshold = 155,
  }) {
    // Decode the image from bytes
    final img.Image? image = img.decodeImage(imageBytes);

    if (image == null) {
      throw Exception('Failed to decode image');
    }

    // Variables to detect non-white limits
    int top = image.height;
    int bottom = 0;
    int left = image.width;
    int right = 0;

    // Iterate through each pixel of the image
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final img.Pixel pixel = image.getPixel(x, y);

        // Gets the color components and alpha channel
        final int r = pixel.r.toInt();
        final int g = pixel.g.toInt();
        final int b = pixel.b.toInt();
        final int a = pixel.a.toInt();

        // Calculate the pixel luminance (luminance method)
        final int luminance = ((r * 0.299) + (g * 0.587) + (b * 0.114)).toInt();

        // Verify if the pixel is not white
        if (r != 255 || g != 255 || b != 255) {
          // Update non-white limits
          if (x < left) left = x;
          if (x > right) right = x;
          if (y < top) top = y;
          if (y > bottom) bottom = y;
        }

        // Apply a white background while preserving pixels close to black
        if (a < alphaThreshold ||
            (luminance > blackThreshold &&
                (r != 255 || g != 255 || b != 255))) {
          image.setPixel(x, y, img.ColorRgb8(255, 255, 255)); // White
        }
      }
    }

    // Crop the image to remove white zones
    final img.Image croppedImage = img.copyCrop(
      image,
      x: left,
      y: top,
      width: right - left,
      height: bottom - top,
    );

    // Encode the cropped image in PNG and return the bytes
    return croppedImage;
  }
}

/// Widget to select one or more printers.
class SelectPrinterWidget extends StatelessWidget {
  /// The existent printers.
  final List<AppPrinter> existentPrinters;

  /// The selected printers.
  final Function(AppPrinter selectedPrinter) builder;

  /// Constructor of new SelectPrinterWidget.
  SelectPrinterWidget({
    super.key,
    required this.existentPrinters,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Intls.to.selectOnOrMorePrinter),
            ),
            ShadRadioGroup<AppPrinter>(
              spacing: 8,
              items: existentPrinters.map(
                (e) => ShadRadio(
                  label: Text(e.name ?? ''),
                  value: e,
                  sublabel: Text(e.url),
                ),
              ),
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                builder(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
