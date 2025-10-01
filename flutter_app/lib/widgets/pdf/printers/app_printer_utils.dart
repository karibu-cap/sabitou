// ignore_for_file: long-method
import 'dart:async';
import 'dart:io';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
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
import '../../../utils/common_functions.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/logger.dart';

/// The printing mixin.
class AppPrinterUtils {
  static final logger = LoggerApp('MyPrinting');

  /// Pick a printer.
  static Future<AppPrinter?> pickPrinter(BuildContext context) async {
    List<String> printerURLs = [];

    final getListOfPrinters = await listPrinters(context);

    await showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: SelectPrinterWidget(
                existentPrinters: getListOfPrinters,
                builder: (selectedPrinter) {
                  printerURLs = selectedPrinter;
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
                      await AppStorageService.to.write<List<String>>(
                        PreferencesKey.printsList,
                        printerURLs,
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
    );

    return printerURLs.isNotEmpty ? AppPrinter(url: printerURLs.first) : null;
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
          final BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
          //await bluetooth.disconnect();
          bluetooth.isConnected.then((isConnected) async {
            if (isConnected == false) {
              await bluetooth.connect(printer.toBluetoothDevice()).catchError((
                error,
              ) {
                showErrorToast(
                  context: context,
                  message: Intls.to.noDeviceSelected,
                );
              });
              isConnected = await bluetooth.isDeviceConnected(
                printer.toBluetoothDevice(),
              );
            }

            await for (PdfRaster page in Printing.raster(
              await onLayout,
              dpi: format.width,
            )) {
              final int chunkHeight = 50; // Hauteur de chaque bande
              final int chunkWidth = page.width; // Largeur totale de l'image

              final img.Image? image = img.decodePng(
                cropWhiteAreas(
                  img.encodePng(setWhiteBackground(await page.toPng())),
                ),
              );

              if (image == null) {
                return;
              }

              // Parcourir l'image par bandes horizontales
              for (int y = 0; y < image.height; y += chunkHeight) {
                // Calculer la hauteur du morceau
                final int height = (y + chunkHeight > image.height)
                    ? image.height - y
                    : chunkHeight;

                // Découper la bande horizontale
                final img.Image chunk = img.copyCrop(
                  image,
                  x: 0, // Commence à 0 (début de la largeur)
                  y: y, // Position verticale actuelle
                  width: chunkWidth, // Largeur totale de l'image
                  height: height, // Hauteur du morceau
                );

                // Encoder la bande en PNG
                final Uint8List chunkBytes = img.encodePng(chunk);

                // Imprimer la bande
                bluetooth.printImageBytes(chunkBytes);
                //bluetooth.paperCut();
              }
            }
          });
        } catch (e) {
          showErrorToast(
            context: context,
            message: Intls.to.printerNotConnected.trParams({
              'printer': printer.name ?? Intls.to.theDevice,
            }),
          );
        }

        return true;
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
    final BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

    final List<AppPrinter> listPrinters = [];
    List<BluetoothDevice> devices = [];

    final bool? isConnected = await bluetooth.isConnected;
    if (isConnected == false) {
      showErrorToast(
        context: context,
        message: Intls.to.printerConfigurationError,
      );

      return [];
    }

    try {
      devices = await bluetooth.getBondedDevices();
      for (BluetoothDevice device in devices) {
        listPrinters.add(AppPrinter.fromBluetoothDevice(device));
      }
    } catch (e) {
      showErrorToast(
        context: context,
        message: Intls.to.printerConfigurationError,
      );
      logger.severe(e.toString());
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          logger.info('bluetooth device state: connected');
          break;
        case BlueThermalPrinter.DISCONNECTED:
          logger.info('bluetooth device state: disconnected');
          break;
        case BlueThermalPrinter.DISCONNECT_REQUESTED:
          logger.info('bluetooth device state: disconnect requested');
          break;
        case BlueThermalPrinter.STATE_TURNING_OFF:
          logger.info('bluetooth device state: bluetooth turning off');
          break;
        case BlueThermalPrinter.STATE_OFF:
          logger.info('bluetooth device state: bluetooth off');
          break;
        case BlueThermalPrinter.STATE_ON:
          logger.info('bluetooth device state: bluetooth on');
          break;
        case BlueThermalPrinter.STATE_TURNING_ON:
          logger.info('bluetooth device state: bluetooth turning on');
          break;
        case BlueThermalPrinter.ERROR:
          logger.info('bluetooth device state: error');
          break;
        default:
          logger.info(state.toString());
          break;
      }
    });

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

    // Seuil to determine if a pixel is "close to black"
    final int blackThreshold =
        255; // Adjust this threshold according to your needs

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
  final Function(List<String> selectedPrinter) builder;

  /// Constructor of new SelectPrinterWidget.
  SelectPrinterWidget({
    super.key,
    required this.existentPrinters,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> selectedPrinters = [];

    return ShadCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Intls.to.selectOnOrMorePrinter),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: existentPrinters.length,
              itemBuilder: (context, index) {
                final AppPrinter printer = existentPrinters[index];

                return ShadCheckbox(
                  value: selectedPrinters.contains(printer.url),
                  label: Text(printer.name ?? ''),
                  sublabel: Text(printer.url),
                  onChanged: (value) {
                    if (selectedPrinters.contains(printer.url)) {
                      selectedPrinters.remove(printer.url);
                    } else {
                      selectedPrinters.add(printer.url);
                    }
                    builder(selectedPrinters);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
