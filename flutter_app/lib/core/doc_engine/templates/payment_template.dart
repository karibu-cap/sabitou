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

/// A4 template for [Payment] (Reçu de paiement fournisseur).
class DefaultPaymentTemplate extends DocumentTemplate<Payment> {
  /// Constructs a [DefaultPaymentTemplate].
  const DefaultPaymentTemplate();

  /// Default currency for purchase orders.
  final defaultCurrency = 'XAF';

  @override
  SabitouDocFormat get defaultFormat => SabitouDocFormat.a4;

  @override
  Future<Uint8List> build(
    Payment data,
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

    final doc = pw.Document();
    final currency = data.currency.isNotEmpty ? data.currency : defaultCurrency;

    doc.addPage(
      pw.Page(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(24),
        build: (ctx) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            DocHelpers.a4Header(company, logo),
            pw.SizedBox(height: 8),
            DocHelpers.divider(thickness: 1, color: DocTheme.primary),
            pw.SizedBox(height: 4),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'REÇU DE PAIEMENT',
                  style: DocTheme.titleMedium(DocHelpers.bold),
                ),
                pw.Text(
                  'N° ${data.refId}',
                  style: DocTheme.titleMedium(DocHelpers.bold),
                ),
              ],
            ),
            DocHelpers.divider(),
            pw.SizedBox(height: 24),

            // ── Amount highlight ───────────────────────────────────
            pw.Center(
              child: pw.Container(
                padding: const pw.EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                decoration: const pw.BoxDecoration(
                  color: DocTheme.background,
                  borderRadius: pw.BorderRadius.all(pw.Radius.circular(8)),
                  border: pw.Border.fromBorderSide(
                    pw.BorderSide(color: DocTheme.primary),
                  ),
                ),
                child: pw.Column(
                  children: [
                    pw.Text(
                      'MONTANT PAYÉ',
                      style: DocTheme.bodyBold(DocHelpers.bold),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      DocHelpers.formatAmount(data.amount, currency),
                      style: pw.TextStyle(
                        font: DocHelpers.bold,
                        fontSize: 20,
                        color: DocTheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            pw.SizedBox(height: 24),

            // ── Details ────────────────────────────────────────────
            pw.Container(
              padding: const pw.EdgeInsets.all(12),
              decoration: const pw.BoxDecoration(
                color: DocTheme.background,
                borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
              ),
              child: pw.Column(
                children: [
                  DocHelpers.infoRow('Payeur', data.payerId),
                  pw.SizedBox(height: 4),
                  DocHelpers.infoRow('Destinataire', data.receiverRef),
                  pw.SizedBox(height: 4),
                  DocHelpers.infoRow(
                    'Mode de paiement',
                    _methodLabel(data.paymentMethod),
                  ),
                  pw.SizedBox(height: 4),
                  DocHelpers.infoRow(
                    'Date',
                    Formatters.formatDateTimeShort(
                      data.paymentDate.toDateTime(toLocal: true),
                    ),
                  ),
                  if (data.hasReferenceNumber()) ...[
                    pw.SizedBox(height: 4),
                    DocHelpers.infoRow('N° Référence', data.referenceNumber),
                  ],
                  if (data.hasNotes() && data.notes.isNotEmpty) ...[
                    pw.SizedBox(height: 4),
                    DocHelpers.infoRow('Notes', data.notes),
                  ],
                ],
              ),
            ),

            // ── Related docs ───────────────────────────────────────
            if (data.relatedDocs.isNotEmpty) ...[
              pw.SizedBox(height: 16),
              pw.Text(
                'Documents liés:',
                style: DocTheme.bodyBold(DocHelpers.bold),
              ),
              pw.SizedBox(height: 4),
              ...data.relatedDocs.map(
                (d) => pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 2),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        d.docId,
                        style: DocTheme.bodyRegular(DocHelpers.regular),
                      ),
                      pw.Text(
                        DocHelpers.formatAmount(d.amount, defaultCurrency),
                        style: DocTheme.bodyBold(DocHelpers.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            pw.Spacer(),
            DocHelpers.divider(),
            pw.SizedBox(height: 4),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Généré par Sabitou',
                  style: DocTheme.muted(DocHelpers.regular),
                ),
                pw.Text(
                  Formatters.formatDateTimeShort(DateTime.now()),
                  style: DocTheme.muted(DocHelpers.regular),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return doc.save();
  }

  String _methodLabel(PaymentMethod m) => switch (m) {
    PaymentMethod.PAYMENT_METHOD_CASH => 'Espèces',
    PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY => 'Mobile Money',
    PaymentMethod.PAYMENT_METHOD_ORANGE_MONEY => 'Orange Money',
    PaymentMethod.PAYMENT_METHOD_MTN_MONEY => 'MTN MoMo',
    PaymentMethod.PAYMENT_METHOD_CREDIT_CARD => 'Carte bancaire',
    PaymentMethod.PAYMENT_METHOD_VOUCHER => 'Bon d\'achat',
    _ => 'Non spécifié',
  };
}
