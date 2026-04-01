import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../repositories/resource_link_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/formatters.dart';
import '../core/doc_format.dart';
import '../core/document_template.dart';
import 'helpers/doc_helpers.dart';
import 'helpers/doc_theme.dart';

/// A4 template for [Bill] (Facture fournisseur).
class DefaultBillTemplate extends DocumentTemplate<Bill> {
  const DefaultBillTemplate();

  @override
  SabitouDocFormat get defaultFormat => SabitouDocFormat.a4;

  /// Default currency for purchase orders.
  final defaultCurrency = 'XAF';

  @override
  Future<Uint8List> build(
    Bill data,
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
        pw.MultiPage(
          pageFormat: format,
          margin: const pw.EdgeInsets.all(24),
          header: (ctx) => _header(data, company, logo),
          footer: (ctx) =>
              DocHelpers.a4Footer(data.refId, ctx.pageNumber, ctx.pagesCount),
          build: (ctx) => [
            pw.SizedBox(height: 16),
            _statusBadge(data.status),
            pw.SizedBox(height: 12),
            _metaBlock(data),
            pw.SizedBox(height: 16),
            _itemsTable(data, defaultCurrency),
            pw.SizedBox(height: 16),
            DocHelpers.a4TotalsBlock(
              subTotal: data.subTotal,
              taxTotal: data.taxTotal,
              totalAmount: data.totalAmount,
              currency: defaultCurrency,
              balanceDue: data.balanceDue,
              amountPaid: data.totalAmount - data.balanceDue,
            ),
            if (data.notes.isNotEmpty) ...[
              pw.SizedBox(height: 16),
              pw.Text(
                Intls.to.notesLabel,
                style: DocTheme.bodyBold(DocHelpers.bold),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                data.notes,
                style: DocTheme.bodyRegular(DocHelpers.regular),
              ),
            ],
          ],
        ),
      );

    return doc.save();
  }

  pw.Widget _header(Bill data, Store company, pw.ImageProvider? logo) =>
      pw.Column(
        children: [
          DocHelpers.a4Header(company, logo),
          pw.SizedBox(height: 8),
          DocHelpers.divider(thickness: 1, color: DocTheme.primary),
          pw.SizedBox(height: 4),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                Intls.to.billTitle,
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

  pw.Widget _statusBadge(BillStatus status) {
    final (label, color) = switch (status) {
      BillStatus.BILL_STATUS_PAID => (
        Intls.to.paid.toUpperCase(),
        DocTheme.statusGreen,
      ),
      BillStatus.BILL_STATUS_OVERDUE => (
        Intls.to.overdueStatus,
        DocTheme.statusRed,
      ),
      BillStatus.BILL_STATUS_OPEN => (Intls.to.openStatus, DocTheme.accent),
      BillStatus.BILL_STATUS_VOID => (Intls.to.voidStatus, DocTheme.textMuted),
      BillStatus.BILL_STATUS_PARTIALLY_PAID => (
        Intls.to.partiallyPaid.toUpperCase(),
        DocTheme.statusOrange,
      ),
      _ => (Intls.to.draft.toUpperCase(), DocTheme.textMuted),
    };

    return DocHelpers.statusBadge(label, color);
  }

  pw.Widget _metaBlock(Bill data) => pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              Intls.to.supplier.toUpperCase(),
              style: DocTheme.muted(DocHelpers.regular),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              data.supplierId,
              style: DocTheme.bodyRegular(DocHelpers.regular),
            ),
          ],
        ),
      ),
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            DocHelpers.infoRow(
              Intls.to.billDate,
              Formatters.formatDate(data.billDate.toDateTime(toLocal: true)),
            ),
            pw.SizedBox(height: 4),
            DocHelpers.infoRow(
              Intls.to.dueDate,
              Formatters.formatDate(data.dueDate.toDateTime(toLocal: true)),
            ),
            pw.SizedBox(height: 4),
            if (data.hasRelatedPurchaseOrderId()) ...[
              DocHelpers.infoRow(
                Intls.to.purchaseOrderRef,
                data.relatedPurchaseOrderId,
              ),
              pw.SizedBox(height: 4),
            ],
            DocHelpers.infoRow(
              Intls.to.createdAt,
              Formatters.formatDate(data.createdAt.toDateTime(toLocal: true)),
            ),
          ],
        ),
      ),
    ],
  );

  pw.Widget _itemsTable(Bill data, String currency) {
    final headers = [
      Intls.to.description,
      Intls.to.qty,
      Intls.to.prixUnit,
      Intls.to.tva,
      Intls.to.totalHT,
    ];
    final rows = data.items
        .map(
          (item) => [
            item.description.isNotEmpty ? item.description : item.productId,
            '${item.quantity}',
            DocHelpers.formatAmount(item.unitPrice, currency),
            DocHelpers.formatAmount(item.taxAmount, currency),
            DocHelpers.formatAmount(item.total, currency),
          ],
        )
        .toList();

    return DocHelpers.a4Table(
      headers: headers,
      columnWidths: [5, 1, 2, 2, 2],
      rows: rows,
      alignments: [
        pw.Alignment.centerLeft,
        pw.Alignment.centerRight,
        pw.Alignment.centerRight,
        pw.Alignment.centerRight,
        pw.Alignment.centerRight,
      ],
    );
  }
}
