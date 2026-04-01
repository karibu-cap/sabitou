import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../repositories/resource_link_repository.dart';
import '../../../utils/formatters.dart';
import '../core/doc_format.dart';
import '../core/document_template.dart';
import 'helpers/doc_helpers.dart';
import 'helpers/doc_theme.dart';

/// Thermal template for [GiftVoucher] — auto-printed after receipt validation.
class DefaultGiftVoucherTemplate extends DocumentTemplate<GiftVoucher> {
  const DefaultGiftVoucherTemplate();

  /// Default currency for purchase orders.
  final defaultCurrency = 'XAF';

  @override
  SabitouDocFormat get defaultFormat => SabitouDocFormat.roll80;

  @override
  Future<Uint8List> build(
    GiftVoucher data,
    Store company,
    PdfPageFormat format,
  ) async {
    final logoSnapshot = !company.hasLogoLinkId()
        ? null
        : await ResourceLinkRepository.instance.getResourceLink(
            company.logoLinkId,
          );
    final logo = logoSnapshot == null
        ? null
        : await networkImage(logoSnapshot.targetUri);

    final doc = pw.Document()
      ..addPage(
        pw.Page(
          pageFormat: format,
          margin: pw.EdgeInsets.symmetric(
            horizontal: format.marginLeft,
            vertical: PdfPageFormat.mm * 6,
          ),
          build: (ctx) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              DocHelpers.thermalHeader(company, logo),
              pw.SizedBox(height: 4),
              DocHelpers.dashedDivider(width: format.availableWidth),
              pw.SizedBox(height: 6),

              // ── Title ─────────────────────────────────────────────
              pw.Center(
                child: pw.Text(
                  'BON D\'ACHAT',
                  style: pw.TextStyle(
                    font: DocHelpers.bold,
                    fontSize: 13,
                    color: DocTheme.accent,
                  ),
                ),
              ),
              pw.SizedBox(height: 6),

              // ── Value ─────────────────────────────────────────────
              pw.Center(
                child: pw.Text(
                  DocHelpers.formatAmount(data.remainingValue, defaultCurrency),
                  style: pw.TextStyle(
                    font: DocHelpers.bold,
                    fontSize: 16,
                    color: DocTheme.primary,
                  ),
                ),
              ),
              pw.SizedBox(height: 2),
              pw.Center(
                child: pw.Text(
                  'Valeur initiale: ${DocHelpers.formatAmount(data.initialValue, defaultCurrency)}',
                  style: DocTheme.thermalMuted(DocHelpers.regular),
                ),
              ),

              pw.SizedBox(height: 6),
              DocHelpers.dashedDivider(width: format.availableWidth),
              pw.SizedBox(height: 4),

              // ── Code ──────────────────────────────────────────────
              pw.Center(
                child: pw.Text(
                  'CODE',
                  style: DocTheme.muted(DocHelpers.bold, size: 7),
                ),
              ),
              pw.SizedBox(height: 2),
              pw.Center(
                child: pw.BarcodeWidget(
                  barcode: pw.Barcode.code128(),
                  data: data.voucherCode,
                  width: format.availableWidth * 0.85,
                  height: 32,
                  drawText: false,
                ),
              ),
              pw.SizedBox(height: 2),
              pw.Center(
                child: pw.Text(
                  data.voucherCode,
                  style: pw.TextStyle(
                    font: DocHelpers.bold,
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),
              ),

              pw.SizedBox(height: 4),
              DocHelpers.dashedDivider(width: format.availableWidth),
              pw.SizedBox(height: 4),

              // ── Meta ──────────────────────────────────────────────
              DocHelpers.infoRow(
                'Émis le',
                Formatters.formatDate(data.issuedAt.toDateTime(toLocal: true)),
              ),
              DocHelpers.infoRow(
                'Expire le',
                Formatters.formatDate(
                  data.validUntil.toDateTime(toLocal: true),
                ),
              ),
              if (data.hasIssuedToCustomer())
                DocHelpers.infoRow('Client', data.issuedToCustomer),

              pw.SizedBox(height: 4),
              DocHelpers.dashedDivider(width: format.availableWidth),
              pw.SizedBox(height: 4),

              // ── Footer ────────────────────────────────────────────
              pw.Center(
                child: pw.Text(
                  'Non remboursable · Non échangeable',
                  style: DocTheme.thermalMuted(DocHelpers.regular, size: 6),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );

    return doc.save();
  }
}
