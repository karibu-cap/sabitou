import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../../services/internationalization/internationalization.dart';
import 'doc_theme.dart';

/// Reusable PDF widget factory used by all Sabitou document templates.
/// Each method returns a [pw.Widget] composable in any [Document].
abstract class DocHelpers {
  // ─── Fonts ────────────────────────────────────────────────────────────────

  /// Loads the built-in Helvetica bold font (no asset needed).
  static pw.Font get bold => pw.Font.helveticaBold();

  /// Loads the built-in Helvetica font.
  static pw.Font get regular => pw.Font.helvetica();

  /// Loads Helvetica Oblique (italic-like).
  static pw.Font get italic => pw.Font.helveticaOblique();

  // ─── Formatting ───────────────────────────────────────────────────────────

  /// Formats a double amount for Cameroonian locale (no decimal, space separator).
  /// e.g. 1500000 → "1 500 000 XAF"
  static String formatAmount(double amount, String currency) {
    return '${numberFormat(amount)} $currency';
  }

  /// Formats a double amount for Cameroonian locale (no decimal, space separator).
  /// e.g. 1500000 → "1 500 000 XAF"
  static String numberFormat(double amount) {
    return NumberFormat(
      '#,##0',
      'fr_FR',
    ).format(amount.round()).replaceAll(',', '\u00A0');
  }

  /// Solid horizontal divider — for A4 documents.
  static pw.Widget divider({double thickness = 0.5, PdfColor? color}) =>
      pw.Divider(thickness: thickness, color: color ?? DocTheme.divider);

  /// Dashed divider line — typical for thermal receipts (full width).
  /// The [width] parameter is kept for backward compatibility but ignored.
  static pw.Widget dashedDivider({double? width}) => pw.Divider(
    thickness: 0.5,
    color: DocTheme.textMuted,
    borderStyle: pw.BorderStyle.dashed,
  );

  /// Bold separator used before totals.
  static pw.Widget boldDivider() =>
      pw.Divider(thickness: 1.5, color: DocTheme.primary);

  // ─── A4 Company Header ────────────────────────────────────────────────────

  /// Full company header for A4 documents (logo left, details right).
  static pw.Widget a4Header(Store company, ImageProvider? logo) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Logo
        if (logo != null) ...[
          pw.Container(width: 60, height: 60, child: pw.Image(logo)),
          pw.SizedBox(width: 12),
        ],
        // Company details
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(company.name, style: DocTheme.titleLarge(bold)),
              if (company.hasAddress())
                pw.Text(
                  company.address.country,
                  style: DocTheme.muted(regular),
                ),
              if (company.hasPhone())
                pw.Text(
                  '${Intls.to.phone}: ${company.phone}',
                  style: DocTheme.muted(regular),
                ),
              if (company.hasEmail())
                pw.Text(company.email, style: DocTheme.muted(regular)),
            ],
          ),
        ),
        // Legal info (right-aligned)
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            if (company.hasNui()) _legalRow(Intls.to.nui, company.nui),
            if (company.hasTaxPayerNumber())
              _legalRow(Intls.to.taxPayerNumber, company.taxPayerNumber),
            if (company.hasPostalBox())
              _legalRow(Intls.to.bp, company.postalBox),
          ],
        ),
      ],
    );
  }

  static pw.Widget _legalRow(String label, String value) => pw.RichText(
    text: pw.TextSpan(
      children: [
        pw.TextSpan(text: '$label: ', style: DocTheme.muted(regular, size: 7)),
        pw.TextSpan(text: value, style: DocTheme.bodyBold(bold, size: 7)),
      ],
    ),
  );

  // ─── Thermal Company Header ───────────────────────────────────────────────

  /// Compact centered header for thermal roll receipts.
  static pw.Widget thermalHeader(Store company, ImageProvider? logo) {
    final address = company.address;

    return pw.Column(
      children: [
        if (logo != null) ...[
          pw.Center(
            child: pw.Container(width: 40, height: 40, child: pw.Image(logo)),
          ),
          pw.SizedBox(height: 4),
        ],
        pw.Center(
          child: pw.Text(
            company.name,
            style: DocTheme.thermalTitle(bold),
            textAlign: pw.TextAlign.center,
          ),
        ),
        if (company.hasAddress())
          pw.Center(
            child: pw.Text(
              address.city,
              style: DocTheme.thermalMuted(regular),
              textAlign: pw.TextAlign.center,
            ),
          ),
        if (company.hasPhone())
          pw.Center(
            child: pw.Text(
              '${Intls.to.phone}: ${company.phone}',
              style: DocTheme.thermalMuted(regular),
            ),
          ),
        if (company.hasNui())
          pw.Center(
            child: pw.Text(
              '${Intls.to.nui}: ${company.nui}',
              style: DocTheme.thermalMuted(regular),
            ),
          ),
        pw.SizedBox(height: 4),
        dashedDivider(),
        pw.SizedBox(height: 4),
      ],
    );
  }

  // ─── Document Title Banner ────────────────────────────────────────────────

  /// Colored banner with document title and reference — for A4.
  static pw.Widget a4TitleBanner(String title, String refId) => pw.Container(
    padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: const pw.BoxDecoration(color: DocTheme.primary),
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
            font: bold,
            color: DocTheme.white,
          ),
        ),
        pw.Text(
          refId,
          style: pw.TextStyle(fontSize: 11, font: bold, color: DocTheme.accent),
        ),
      ],
    ),
  );

  // ─── Info Row (label: value) ──────────────────────────────────────────────

  /// Two-column label/value row for document metadata.
  static pw.Widget infoRow(
    String label,
    String value, {
    bool isHighlighted = false,
  }) => pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.SizedBox(
        width: 110,
        child: pw.Text(label, style: DocTheme.muted(regular)),
      ),
      pw.Expanded(
        child: pw.Text(
          value,
          style: isHighlighted
              ? DocTheme.bodyBold(bold, size: 8)
              : DocTheme.bodyRegular(regular, size: 8),
        ),
      ),
    ],
  );

  /// Info row for thermal receipts — label left, value right-aligned.
  static pw.Widget thermalInfoRow(String label, String value) => pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Text(label, style: DocTheme.thermalMuted(regular)),
      pw.Text(value, style: DocTheme.thermalBody(regular)),
    ],
  );

  // ─── Info Grid ────────────────────────────────────────────────────────────

  /// Two-column grid of info rows — used in PO / Bill headers.
  static pw.Widget infoGrid(
    List<(String, String)> left,
    List<(String, String)> right,
  ) => pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: left
              .map(
                (e) => pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 2),
                  child: infoRow(e.$1, e.$2),
                ),
              )
              .toList(),
        ),
      ),
      pw.SizedBox(width: 16),
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: right
              .map(
                (e) => pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 2),
                  child: infoRow(e.$1, e.$2),
                ),
              )
              .toList(),
        ),
      ),
    ],
  );

  // ─── Amount Summary Table ─────────────────────────────────────────────────

  /// Bottom-right aligned totals block (HT, TVA, TTC).
  static pw.Widget a4TotalsBlock({
    required double subTotal,
    required double taxTotal,
    required double totalAmount,
    required String currency,
    double? balanceDue,
    double? amountPaid,
  }) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Container(
        width: 240,
        child: pw.Column(
          children: [
            _totalRow(Intls.to.subtotalHT, formatAmount(subTotal, currency)),
            _totalRow(
              '${Intls.to.tva.toUpperCase()} (${(taxTotal / (subTotal == 0 ? 1 : subTotal) * 100).toStringAsFixed(2)}%)',
              formatAmount(taxTotal, currency),
            ),
            boldDivider(),
            _totalRow(
              Intls.to.totalTTC,
              formatAmount(totalAmount, currency),
              isBold: true,
              fontSize: 11,
            ),
            if (amountPaid != null)
              _totalRow(
                Intls.to.totalPaid,
                '(-) ${formatAmount(amountPaid, currency)}',
                color: DocTheme.statusRed,
              ),
            if (balanceDue != null && balanceDue > 0)
              _totalRow(
                Intls.to.restToPaid,
                formatAmount(balanceDue, currency),
                isBold: true,
                isDecorated: true,
              ),
          ],
        ),
      ),
    );
  }

  static pw.Widget _totalRow(
    String label,
    String amount, {
    bool isBold = false,
    bool isDecorated = false,
    double fontSize = 9,
    PdfColor? color,
  }) {
    final style = isBold
        ? pw.TextStyle(
            fontSize: fontSize,
            fontWeight: pw.FontWeight.bold,
            font: bold,
            color: color ?? DocTheme.textDark,
          )
        : DocTheme.bodyRegular(
            regular,
            size: fontSize,
          ).copyWith(color: color ?? DocTheme.textDark);

    if (isDecorated) {
      return pw.Container(
        padding: const pw.EdgeInsets.symmetric(vertical: 8),
        decoration: const pw.BoxDecoration(
          color: DocTheme.background,
          borderRadius: pw.BorderRadius.all(pw.Radius.circular(4)),
        ),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(label, style: style),
            pw.Text(amount, style: style),
          ],
        ),
      );
    }

    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: style),
          pw.Text(amount, style: style),
        ],
      ),
    );
  }

  // ─── Thermal Totals ───────────────────────────────────────────────────────

  static pw.Widget thermalTotalsBlock({
    required double subTotal,
    required double taxTotal,
    required double totalAmount,
    required String currency,
    double? amountPaid,
    double? changeGiven,
    double? owedToCustomer,
  }) => pw.Column(
    children: [
      _thermalAmountRow(Intls.to.subtotalHT, subTotal, currency),
      pw.SizedBox(height: 2),
      _thermalAmountRow(Intls.to.tva.toUpperCase(), taxTotal, currency),
      pw.SizedBox(height: 2),
      dashedDivider(),
      pw.SizedBox(height: 2),
      _thermalAmountRow(
        Intls.to.totalTTC,
        totalAmount,
        currency,
        isBold: true,
        fontSize: 10,
      ),
      pw.SizedBox(height: 2),
      if (amountPaid != null)
        _thermalAmountRow(Intls.to.amountReceived, amountPaid, currency),
      if (amountPaid != null) pw.SizedBox(height: 2),
      if (changeGiven != null && changeGiven > 0)
        _thermalAmountRow(
          Intls.to.changeGivenLabel,
          changeGiven,
          currency,
          isBold: true,
        ),
      if (changeGiven != null && changeGiven > 0) pw.SizedBox(height: 2),
    ],
  );

  static pw.Widget _thermalAmountRow(
    String label,
    double amount,
    String currency, {
    bool isBold = false,
    double fontSize = 8,
    PdfColor? color,
  }) {
    final style = isBold
        ? pw.TextStyle(
            fontSize: fontSize,
            fontWeight: pw.FontWeight.bold,
            font: bold,
            color: color ?? DocTheme.black,
          )
        : DocTheme.thermalBody(regular, size: fontSize);

    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(label, style: style),
        pw.Text(formatAmount(amount, currency), style: style),
      ],
    );
  }

  // ─── Status Badge ─────────────────────────────────────────────────────────

  /// Colored pill badge for document status.
  static pw.Widget statusBadge(String label, PdfColor color) => pw.Container(
    padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: pw.BoxDecoration(
      color: color,
      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
    ),
    child: pw.Text(
      label,
      style: pw.TextStyle(
        fontSize: 8,
        fontWeight: pw.FontWeight.bold,
        font: bold,
        color: DocTheme.white,
      ),
    ),
  );

  // ─── A4 Table ─────────────────────────────────────────────────────────────

  /// Styled data table for line items on A4 documents.
  static pw.Widget a4Table({
    required List<String> headers,
    required List<num> columnWidths, // relative flex widths
    required List<List<String>> rows,
    List<pw.Alignment>? alignments,
  }) {
    final aligns =
        alignments ?? List.filled(headers.length, pw.Alignment.centerLeft);

    return pw.Table(
      columnWidths: {
        for (var i = 0; i < columnWidths.length; i++)
          i: pw.FlexColumnWidth(columnWidths[i].toDouble()),
      },
      children: [
        // Header row
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: DocTheme.primary),
          children: headers
              .asMap()
              .entries
              .map(
                (e) => pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 5,
                  ),
                  alignment: aligns[e.key],
                  child: pw.Text(
                    e.value,
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                      font: bold,
                      color: DocTheme.white,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        // Data rows
        ...rows.asMap().entries.map(
          (rowEntry) => pw.TableRow(
            decoration: pw.BoxDecoration(
              color: rowEntry.key.isEven ? DocTheme.background : DocTheme.white,
            ),
            children: rowEntry.value
                .asMap()
                .entries
                .map(
                  (e) => pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    alignment: aligns[e.key],
                    child: pw.Text(
                      e.value,
                      style: DocTheme.bodyRegular(regular, size: 8),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  // ─── Thermal Table ────────────────────────────────────────────────────────

  /// Compact item list for thermal receipts (no grid lines, space-efficient).
  static pw.Widget thermalItemRow({
    required String name,
    required int qty,
    required double unitPrice,
    required double total,
    required String currency,
  }) => pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        name,
        style: DocTheme.thermalBold(bold),
        maxLines: 2,
        overflow: pw.TextOverflow.clip,
      ),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            '$qty x ${formatAmount(unitPrice, currency)}',
            style: DocTheme.thermalBody(regular, size: 7.5),
          ),
          pw.Text(
            formatAmount(total, currency),
            style: DocTheme.thermalBold(bold, size: 7.5),
          ),
        ],
      ),
      pw.SizedBox(height: 2),
    ],
  );

  // ─── A4 Footer ────────────────────────────────────────────────────────────

  static pw.Widget a4Footer(String docRef, int pageNumber, int totalPages) =>
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(docRef, style: DocTheme.muted(italic, size: 7)),
          pw.Text(Intls.to.generatedBy, style: DocTheme.muted(italic, size: 7)),
          pw.Text(
            'Page $pageNumber / $totalPages',
            style: DocTheme.muted(regular, size: 7),
          ),
        ],
      );

  // ─── Thermal Footer ───────────────────────────────────────────────────────

  static pw.Widget thermalFooter({String? message}) => pw.Column(
    children: [
      pw.SizedBox(height: 4),
      pw.Center(
        child: pw.Text(
          message ??
              '${Intls.to.thankYouForYourPurchase}\n${Intls.to.poweredBy}',
          style: DocTheme.thermalMuted(italic),
          textAlign: pw.TextAlign.center,
        ),
      ),
      pw.SizedBox(height: 8),
    ],
  );

  // ─── Signature Block ──────────────────────────────────────────────────────

  /// Signature area for A4 documents with 2 or 3 columns.
  static pw.Widget signatureBlock(
    String leftLabel,
    String rightLabel, {
    String? centerLabel,
  }) {
    final left = pw.Expanded(
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(leftLabel, style: DocTheme.bodyBold(bold, size: 8)),
          pw.SizedBox(height: 30),
          pw.Divider(thickness: 0.5, color: DocTheme.textMuted),
          pw.Text(Intls.to.signature, style: DocTheme.muted(regular, size: 7)),
        ],
      ),
    );

    final right = pw.Expanded(
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(rightLabel, style: DocTheme.bodyBold(bold, size: 8)),
          pw.SizedBox(height: 30),
          pw.Divider(thickness: 0.5, color: DocTheme.textMuted),
          pw.Text(Intls.to.signature, style: DocTheme.muted(regular, size: 7)),
        ],
      ),
    );

    if (centerLabel == null) {
      return pw.Row(children: [left, pw.SizedBox(width: 40), right]);
    }

    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Expanded(
          child: pw.Column(
            children: [
              pw.Text(leftLabel, style: DocTheme.muted(bold)),
              pw.SizedBox(height: 28),
              pw.SizedBox(
                width: 110,
                child: pw.Divider(thickness: 0.5, color: DocTheme.textMuted),
              ),
              pw.Text(
                Intls.to.signatureAndDate,
                style: DocTheme.muted(regular),
              ),
            ],
          ),
        ),
        pw.Expanded(
          child: pw.Column(
            children: [
              pw.Text(centerLabel, style: DocTheme.muted(bold)),
              pw.SizedBox(height: 28),
              pw.SizedBox(
                width: 110,
                child: pw.Divider(thickness: 0.5, color: DocTheme.textMuted),
              ),
              pw.Text(
                Intls.to.signatureAndDate,
                style: DocTheme.muted(regular),
              ),
            ],
          ),
        ),
        pw.Expanded(
          child: pw.Column(
            children: [
              pw.Text(rightLabel, style: DocTheme.muted(bold)),
              pw.SizedBox(height: 28),
              pw.SizedBox(
                width: 110,
                child: pw.Divider(thickness: 0.5, color: DocTheme.textMuted),
              ),
              pw.Text(
                Intls.to.signatureAndDate,
                style: DocTheme.muted(regular),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── QR Code placeholder ──────────────────────────────────────────────────

  /// Simple barcode-style box (real QR via qr_flutter + RepaintBoundary
  /// if needed; kept simple here to avoid extra deps).
  static pw.Widget refBox(String refId) => pw.Container(
    padding: const pw.EdgeInsets.all(6),
    decoration: const pw.BoxDecoration(
      border: pw.Border.fromBorderSide(pw.BorderSide(color: DocTheme.divider)),
      borderRadius: pw.BorderRadius.all(pw.Radius.circular(4)),
    ),
    child: pw.Column(
      children: [
        pw.Text(
          Intls.to.referenceAbbr,
          style: DocTheme.muted(regular, size: 7),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          refId,
          style: DocTheme.bodyBold(bold),
          textAlign: pw.TextAlign.center,
        ),
      ],
    ),
  );
}
