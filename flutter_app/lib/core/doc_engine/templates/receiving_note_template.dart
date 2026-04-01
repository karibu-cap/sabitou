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

/// A4 template for [ReceivingNote] (Bon de Réception).
class DefaultReceivingNoteTemplate extends DocumentTemplate<ReceivingNote> {
  const DefaultReceivingNoteTemplate();

  /// Default currency for purchase orders.
  final defaultCurrency = 'XAF';

  @override
  SabitouDocFormat get defaultFormat => SabitouDocFormat.a4;

  @override
  Future<Uint8List> build(
    ReceivingNote data,
    Store company,
    PdfPageFormat format,
  ) async {
    final doc = pw.Document();
    final logoSnapshot = !company.hasLogoLinkId()
        ? null
        : await ResourceLinkRepository.instance.getResourceLink(
            company.logoLinkId,
          );
    final logo = logoSnapshot == null
        ? null
        : await networkImage(logoSnapshot.targetUri);

    doc.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(24),
        header: (ctx) => _header(data, company, logo),
        footer: (ctx) =>
            DocHelpers.a4Footer(data.refId, ctx.pageNumber, ctx.pagesCount),
        build: (ctx) => [
          pw.SizedBox(height: 16),
          _metaBlock(data),
          pw.SizedBox(height: 16),
          _itemsTable(data, defaultCurrency),
          if (data.notes.isNotEmpty) ...[
            pw.SizedBox(height: 12),
            pw.Text(
              'Notes / Observations:',
              style: DocTheme.bodyBold(DocHelpers.bold),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              data.notes,
              style: DocTheme.bodyRegular(DocHelpers.regular),
            ),
          ],
          pw.SizedBox(height: 32),
          DocHelpers.signatureBlock(
            'Réceptionnaire',
            'Cachet Fournisseur',
            centerLabel: 'Responsable Logistique',
          ),
        ],
      ),
    );

    return doc.save();
  }

  pw.Widget _header(
    ReceivingNote data,
    Store company,
    pw.ImageProvider? logo,
  ) => pw.Column(
    children: [
      DocHelpers.a4Header(company, logo),
      pw.SizedBox(height: 8),
      DocHelpers.divider(thickness: 1, color: DocTheme.primary),
      pw.SizedBox(height: 4),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            'BON DE RÉCEPTION',
            style: DocTheme.titleMedium(DocHelpers.bold),
          ),
          pw.Text(
            'N° ${data.refId}',
            style: DocTheme.titleMedium(DocHelpers.bold),
          ),
        ],
      ),
      pw.SizedBox(height: 4),
      DocHelpers.divider(),
    ],
  );

  pw.Widget _metaBlock(ReceivingNote data) => pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            DocHelpers.infoRow('Fournisseur', data.supplierId),
            pw.SizedBox(height: 4),
            DocHelpers.infoRow('Magasin', data.storeId),
            pw.SizedBox(height: 4),
            DocHelpers.infoRow('Bon commande', data.relatedPurchaseOrderId),
          ],
        ),
      ),
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            DocHelpers.infoRow(
              'Reçu le',
              Formatters.formatDateTimeShort(
                data.receivedAt.toDateTime(toLocal: true),
              ),
            ),
            pw.SizedBox(height: 4),
            DocHelpers.infoRow(
              'Créé le',
              Formatters.formatDate(data.createdAt.toDateTime(toLocal: true)),
            ),
            pw.SizedBox(height: 4),
            DocHelpers.infoRow('Reçu par', data.receivedByUserId),
          ],
        ),
      ),
    ],
  );

  pw.Widget _itemsTable(ReceivingNote data, String currency) {
    final headers = [
      'Produit',
      'Attendu',
      'Reçu',
      'Rejeté',
      'Prix achat',
      'Lot',
      'Motif rejet',
    ];
    final columnWidths = [3.0, 1.0, 1.0, 1.0, 1.5, 1.5, 2.0];

    // Compute discrepancy flag for row coloring
    bool hasDiscrepancy(ReceivingNoteLineItem item) =>
        item.quantityReceived < item.quantityExpected ||
        item.quantityRejected > 0;

    final rows = data.items.map((item) {
      final discrepancy = hasDiscrepancy(item);
      final rejectionColor = item.quantityRejected > 0
          ? DocTheme.statusRed
          : null;
      final receivedColor = discrepancy && item.quantityRejected == 0
          ? DocTheme.statusRed
          : null;

      return [
        item.productId,
        '${item.quantityExpected.toStringAsFixed(0)}',
        '${item.quantityReceived.toStringAsFixed(0)}',
        '${item.quantityRejected.toStringAsFixed(0)}',
        DocHelpers.formatAmount(item.purchasePrice, currency),
        item.hasBatchId() ? item.batchId : '-',
        item.rejectionReason.isNotEmpty ? item.rejectionReason : '-',
      ];
    }).toList();

    return DocHelpers.a4Table(
      headers: headers,
      columnWidths: columnWidths,
      rows: rows,
      alignments: [
        pw.Alignment.centerLeft,
        pw.Alignment.center,
        pw.Alignment.center,
        pw.Alignment.center,
        pw.Alignment.centerRight,
        pw.Alignment.center,
        pw.Alignment.centerLeft,
      ],
    );
  }
}
