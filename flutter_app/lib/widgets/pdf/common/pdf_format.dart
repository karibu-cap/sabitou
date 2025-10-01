import 'package:pdf/pdf.dart';

enum PdfMode { PAYSAGE, A4, TICKET }

/// The pdf format.
class PdfFormat {
  /// Build the preview invoice format.
  static PdfPageFormat buildPreviewInvoiceFormat(
    PdfMode pdfMode, {
    int itemsLength = 1,
  }) {
    if (pdfMode == PdfMode.PAYSAGE) {
      final PdfPageFormat pdfPageFormat = const PdfPageFormat(
        PdfPageFormat.cm * 21.7,
        PdfPageFormat.cm * 17.7,
      );

      return pdfPageFormat;
    }
    if (pdfMode == PdfMode.A4) {
      final PdfPageFormat pdfPageFormat = PdfPageFormat.a4;

      return pdfPageFormat;
    }
    final double cellHeight = 20;
    final PdfPageFormat format = PdfPageFormat(
      PdfPageFormat.mm * 72,
      490 + (itemsLength * (cellHeight + 5)),
      marginTop: 5,
      marginBottom: 5,
      marginLeft: 5,
      marginRight: 5,
    );

    return format;
  }
}
