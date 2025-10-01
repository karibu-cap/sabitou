import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'common/pdf_format.dart';
import 'template/pos_template.dart';

/// The pdf preview class.
class PdfPreviewExtents {
  /// Build the preview invoice.
  static Future<Uint8List> previewInvoice({
    required CashReceipt cashReceipt,
    required Store store,
    required PdfMode pdfMode,
  }) {
    final PdfPageFormat pdfPageFormat = PdfFormat.buildPreviewInvoiceFormat(
      pdfMode,
      itemsLength: cashReceipt.items.length,
    );

    final posTemplate = PosTemplate(cashReceipt: cashReceipt, store: store);

    final double cellHeight = 20;

    // if (pdfMode == PdfMode.PAYSAGE) {
    //   return posTemplate.buildInvoice(pdfPageFormat, cellHeight);
    // }

    return posTemplate.buildPdfInvoiceMini(pdfPageFormat);
  }
}
