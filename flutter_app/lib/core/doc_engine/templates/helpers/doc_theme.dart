import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Shared typography & color constants for all Sabitou PDF documents.
/// Mirrors the SabitouColors design system (deep navy + amber + off-white).
abstract class DocTheme {
  /// Deep navy — primary brand color.
  static const primary = PdfColor(0.102, 0.180, 0.290); // #1A2E4A

  /// Amber — accent / highlight.
  static const accent = PdfColor(0.961, 0.620, 0.043); // #F59E0B

  /// Near-black text.
  static const textDark = PdfColor(0.122, 0.161, 0.216); // #1F2937

  /// Muted grey text.
  static const textMuted = PdfColor(0.420, 0.447, 0.502); // #6B7280

  /// Off-white background.
  static const background = PdfColor(0.976, 0.973, 0.961); // #F9F8F5

  /// Light divider line.
  static const divider = PdfColor(0.898, 0.906, 0.922); // #E5E7EB

  static const white = PdfColors.white;
  static const black = PdfColors.black;

  /// Status: paid / completed.
  static const statusGreen = PdfColor(0.067, 0.588, 0.290); // #118A4A

  /// Status: draft / pending.
  static const statusOrange = PdfColor(0.941, 0.502, 0.098); // #F08019

  /// Status: cancelled / void.
  static const statusRed = PdfColor(0.788, 0.149, 0.149); // #C92626

  /// Large title text style (bold, primary color).
  static pw.TextStyle titleLarge(pw.Font? bold) => pw.TextStyle(
    fontSize: 16,
    fontWeight: pw.FontWeight.bold,
    font: bold,
    color: primary,
  );

  static pw.TextStyle titleMedium(pw.Font? bold) => pw.TextStyle(
    fontSize: 13,
    fontWeight: pw.FontWeight.bold,
    font: bold,
    color: primary,
  );

  static pw.TextStyle bodyRegular(pw.Font? regular, {double size = 9}) =>
      pw.TextStyle(fontSize: size, font: regular, color: textDark);

  static pw.TextStyle bodyBold(pw.Font? bold, {double size = 9}) =>
      pw.TextStyle(
        fontSize: size,
        fontWeight: pw.FontWeight.bold,
        font: bold,
        color: textDark,
      );

  static pw.TextStyle muted(pw.Font? regular, {double size = 8}) =>
      pw.TextStyle(fontSize: size, font: regular, color: textMuted);

  static pw.TextStyle accentBold(pw.Font? bold, {double size = 10}) =>
      pw.TextStyle(
        fontSize: size,
        fontWeight: pw.FontWeight.bold,
        font: bold,
        color: accent,
      );

  static pw.TextStyle primaryBold(pw.Font? bold, {double size = 10}) =>
      pw.TextStyle(
        fontSize: size,
        fontWeight: pw.FontWeight.bold,
        font: bold,
        color: primary,
      );

  static pw.TextStyle thermalTitle(pw.Font? bold) => pw.TextStyle(
    fontSize: 12,
    fontWeight: pw.FontWeight.bold,
    font: bold,
    color: black,
  );

  static pw.TextStyle thermalBody(pw.Font? regular, {double size = 8}) =>
      pw.TextStyle(fontSize: size, font: regular, color: black);

  static pw.TextStyle thermalBold(pw.Font? bold, {double size = 8}) =>
      pw.TextStyle(
        fontSize: size,
        fontWeight: pw.FontWeight.bold,
        font: bold,
        color: black,
      );

  static pw.TextStyle thermalMuted(pw.Font? regular, {double size = 7}) =>
      pw.TextStyle(fontSize: size, font: regular, color: textMuted);
}
