import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:sabitou_rpc/models.dart';

import '../sabitou_doc_engine.dart';

/// Central engine for all document operations in Sabitou.
///
/// ### Setup (once, in main.dart or a DI layer)
/// ```dart
/// SabitouDocEngine.instance
///   ..registerDefaultTemplate(DefaultCashReceiptTemplate())
///   ..registerDefaultTemplate(DefaultPurchaseOrderTemplate());
/// ```
///
/// ### Usage
/// ```dart
/// await SabitouDocEngine.instance.preview(context, myReceipt, company);
/// ```
class SabitouDocEngine {
  SabitouDocEngine._();

  static final SabitouDocEngine instance = SabitouDocEngine._();

  /// Returns the registered template for [T], or throws if none found.
  DocumentTemplate<T> _resolve<T>(DocumentTemplate<T>? override) {
    if (override != null) {
      return override;
    }
    switch (T) {
      case Bill:
        return const DefaultBillTemplate() as DocumentTemplate<T>;
      case CashReceiptDoc:
        return const DefaultCashReceiptTemplate() as DocumentTemplate<T>;
      case GiftVoucher:
        return const DefaultGiftVoucherTemplate() as DocumentTemplate<T>;
      case Payment:
        return const DefaultPaymentTemplate() as DocumentTemplate<T>;
      case PurchaseOrder:
        return const DefaultPurchaseOrderTemplate() as DocumentTemplate<T>;
      case ReceivingNote:
        return const DefaultReceivingNoteTemplate() as DocumentTemplate<T>;
      default:
        throw StateError(
          '[SabitouDocEngine] No template registered for type $T. '
          'Call registerDefaultTemplate<$T>() during setup.',
        );
    }
  }

  /// Builds the PDF bytes for [data] using the resolved template.
  ///
  /// If [formatOverride] is supplied it takes precedence over the
  /// template's [defaultFormat].
  Future<Uint8List> buildBytes<T>(
    T data,
    Store company, {
    DocumentTemplate<T>? overrideTemplate,
    SabitouDocFormat? formatOverride,
  }) async {
    final template = _resolve<T>(overrideTemplate);
    final format = (formatOverride ?? template.defaultFormat).toPdfPageFormat();

    return template.build(data, company, format);
  }

  // ─── Actions ─────────────────────────────────────────────────────────────

  /// Opens the built-in PDF preview screen (works on mobile + web).
  Future<void> preview<T>(
    BuildContext context,
    T data,
    Store company, {
    DocumentTemplate<T>? overrideTemplate,
    SabitouDocFormat? formatOverride,
    String? title,
  }) async {
    final template = _resolve<T>(overrideTemplate);
    final format = (formatOverride ?? template.defaultFormat).toPdfPageFormat();

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PdfPreview(
          // `printing` package handles web/mobile/desktop differences.
          build: (_) => template.build(data, company, format),
          pdfFileName: title ?? _defaultFilename<T>(),
          initialPageFormat: format,
          dynamicLayout: (formatOverride ?? template.defaultFormat).isThermal,
        ),
      ),
    );
  }

  /// Sends the document directly to the system print dialog.
  /// Works on Android, iOS, macOS, Windows, Linux, and Web.
  Future<void> print<T>(
    T data,
    Store company, {
    DocumentTemplate<T>? overrideTemplate,
    SabitouDocFormat? formatOverride,
    String? jobName,
  }) async {
    final bytes = await buildBytes<T>(
      data,
      company,
      overrideTemplate: overrideTemplate,
      formatOverride: formatOverride,
    );
    await Printing.layoutPdf(
      onLayout: (_) => bytes,
      name: jobName ?? _defaultFilename<T>(),
    );
  }

  /// Silently prints without a dialog — for cashier thermal printers
  /// where the receipt must auto-print on validation.
  Future<void> autoPrint<T>(
    T data,
    Store company, {
    DocumentTemplate<T>? overrideTemplate,
    SabitouDocFormat? formatOverride,
    PrintingInfo? printerInfo,
  }) async {
    final bytes = await buildBytes<T>(
      data,
      company,
      overrideTemplate: overrideTemplate,
      formatOverride: formatOverride,
    );
    // Pick the first available printer, or let `Printing` pick default.
    final printers = await Printing.listPrinters();
    final printer = printers.isNotEmpty ? printers.first : null;

    await Printing.directPrintPdf(
      printer: printer ?? const Printer(url: ''),
      onLayout: (_) => bytes,
    );
  }

  /// Saves the PDF to the device (Downloads on Android/Web, Files on iOS).
  Future<void> download<T>(
    T data,
    Store company, {
    DocumentTemplate<T>? overrideTemplate,
    SabitouDocFormat? formatOverride,
    String? filename,
  }) async {
    final bytes = await buildBytes<T>(
      data,
      company,
      overrideTemplate: overrideTemplate,
      formatOverride: formatOverride,
    );
    await Printing.sharePdf(
      bytes: bytes,
      filename: filename ?? _defaultFilename<T>(),
    );
  }

  String _defaultFilename<T>() {
    final ts = DateTime.now().millisecondsSinceEpoch;

    return '${T.toString().toLowerCase()}_$ts.pdf';
  }
}
