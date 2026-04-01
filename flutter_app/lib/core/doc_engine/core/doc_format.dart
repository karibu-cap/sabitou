import 'package:pdf/pdf.dart';

/// All paper formats supported by [SabitouDocEngine].
/// Covers both thermal (POS) and office (accounting) use cases.
enum SabitouDocFormat {
  /// Standard office documents: Bills, POs, Invoices.
  a4,

  /// Compact office / half-page summaries.
  a5,

  /// 80mm thermal roll — standard cashier printer.
  roll80,

  /// 58mm thermal roll — compact/mobile POS printer.
  roll58,

  /// 76mm thermal roll — some Cameroonian POS printers.
  roll76,
}

extension SabitouDocFormatX on SabitouDocFormat {
  /// Resolves to the [PdfPageFormat] used by the `pdf` package.
  /// Roll formats use a very tall page (10 meters) so content
  /// is clipped naturally by the printer.
  PdfPageFormat toPdfPageFormat() {
    switch (this) {
      case SabitouDocFormat.a4:
        return PdfPageFormat.a4;
      case SabitouDocFormat.a5:
        return PdfPageFormat.a5;
      case SabitouDocFormat.roll80:
        return const PdfPageFormat(
          80 * PdfPageFormat.mm,
          double.infinity, // Thermal: height is content-driven
          marginAll: 4 * PdfPageFormat.mm,
        );
      case SabitouDocFormat.roll58:
        return const PdfPageFormat(
          58 * PdfPageFormat.mm,
          double.infinity,
          marginAll: 3 * PdfPageFormat.mm,
        );
      case SabitouDocFormat.roll76:
        return const PdfPageFormat(
          76 * PdfPageFormat.mm,
          double.infinity,
          marginAll: 4 * PdfPageFormat.mm,
        );
    }
  }

  /// Whether this is a thermal/roll format.
  bool get isThermal => switch (this) {
    SabitouDocFormat.roll80 ||
    SabitouDocFormat.roll58 ||
    SabitouDocFormat.roll76 => true,
    _ => false,
  };

  /// Human-readable label (for UI pickers if needed).
  String get label => switch (this) {
    SabitouDocFormat.a4 => 'A4',
    SabitouDocFormat.a5 => 'A5',
    SabitouDocFormat.roll80 => 'Ticket 80mm',
    SabitouDocFormat.roll58 => 'Ticket 58mm',
    SabitouDocFormat.roll76 => 'Ticket 76mm',
  };
}
