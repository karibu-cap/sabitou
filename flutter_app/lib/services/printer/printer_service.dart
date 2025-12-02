import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

import '../../utils/app_constants.dart';
import '../../utils/common_functions.dart';
import '../../utils/extends_models.dart';
import '../../widgets/pdf/printers/app_printer_utils.dart';
import '../../widgets/pdf/printers/printer_configuration.dart';
import '../storage/app_storage.dart';

/// Simple printer service to handle printing operations
class PrinterService {
  static PrinterService? _instance;
  PrinterConfiguration? _configuration;

  /// Get the singleton instance
  static PrinterService get instance {
    final newInstance = _instance ?? PrinterService._();

    return newInstance;
  }

  /// Get the current printer configuration.
  PrinterConfiguration? get configuration => _configuration;

  /// Check if a default printer is configured.
  bool get hasDefaultPrinter => _configuration?.defaultPrinter != null;

  /// Check if auto-print is enabled.
  bool get isAutoPrintEnabled => _configuration?.autoPrintEnabled ?? false;

  PrinterService._();

  /// Initialize the printer service
  Future<void> initialize() async {
    await _loadConfiguration();
  }

  /// Load printer configuration from storage
  Future<void> _loadConfiguration() async {
    try {
      final String? configJson = await AppStorage.of<String>(
        boxKey: PreferencesKey.printerConfiguration,
      ).read(PreferencesKey.printerConfiguration);

      if (configJson != null) {
        final Map<String, dynamic> json =
            jsonDecode(configJson) as Map<String, dynamic>;
        _configuration = PrinterConfiguration.fromJson(json);
      }
    } catch (e) {
      _configuration = null;
    }
  }

  /// Print a PDF document using the default printer
  /// Returns true if printing was successful or initiated
  Future<bool> printPdf({
    required BuildContext context,
    required FutureOr<Uint8List> pdfData,
    String name = 'Receipt',
    PdfPageFormat format = PdfPageFormat.roll80,
    bool showPreviewIfNoPrinter = true,
  }) async {
    // Reload configuration in case it changed
    await _loadConfiguration();

    final AppPrinter? printer = _configuration?.defaultPrinter;

    // If no printer configured, show preview or error
    if (printer == null) {
      if (showPreviewIfNoPrinter && context.mounted) {
        // Show PDF preview instead
        final pdfBytes = await pdfData;
        AppPrinterUtils.showPdfPreview(
          pdfData: pdfBytes,
          pdfPageFormat: format,
          fileName: name,
          context: context,
        );

        return true;
      } else if (context.mounted) {
        showErrorToast(
          context: context,
          message:
              'No default printer configured. Please set up a printer in Settings.',
        );

        return false;
      }

      return false;
    }

    // Print using the configured printer
    try {
      final bool success = await AppPrinterUtils.directPrintPdf(
        printer: printer,
        onLayout: pdfData,
        context: context,
        name: name,
        format: format,
      );

      return success;
    } catch (e) {
      if (context.mounted) {
        showErrorToast(
          context: context,
          message: 'Failed to print: ${e.toString()}',
        );
      }

      return false;
    }
  }

  /// Print receipt automatically if auto-print is enabled
  /// Otherwise, ask the user or show preview
  Future<bool> printReceiptAuto({
    required BuildContext context,
    required FutureOr<Uint8List> pdfData,
    String name = 'Receipt',
    PdfPageFormat format = PdfPageFormat.roll80,
  }) async {
    await _loadConfiguration();

    // If auto-print is enabled and printer is configured, print automatically
    if (isAutoPrintEnabled && hasDefaultPrinter) {
      return await printPdf(
        context: context,
        pdfData: pdfData,
        name: name,
        format: format,
        showPreviewIfNoPrinter: false,
      );
    }

    // Otherwise, show preview or ask user
    if (context.mounted) {
      final pdfBytes = await pdfData;
      AppPrinterUtils.showPdfPreview(
        pdfData: pdfBytes,
        pdfPageFormat: format,
        fileName: name,
        context: context,
      );
    }

    return true;
  }

  /// Manually select and print to a different printer
  Future<bool> printWithPrinterSelection({
    required BuildContext context,
    required FutureOr<Uint8List> pdfData,
    String name = 'Receipt',
    PdfPageFormat format = PdfPageFormat.roll80,
  }) async {
    final AppPrinter? printer = await AppPrinterUtils.pickPrinter(context);

    if (printer == null) {
      return false;
    }

    try {
      final bool success = await AppPrinterUtils.directPrintPdf(
        printer: printer,
        onLayout: pdfData,
        context: context,
        name: name,
        format: format,
      );

      return success;
    } catch (e) {
      if (context.mounted) {
        showErrorToast(
          context: context,
          message: 'Failed to print: ${e.toString()}',
        );
      }

      return false;
    }
  }
}
