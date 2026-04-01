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

/// A4 template for [PurchaseOrder] (Bon de Commande).
class DefaultPurchaseOrderTemplate extends DocumentTemplate<PurchaseOrder> {
  const DefaultPurchaseOrderTemplate();

  /// Default currency for purchase orders.
  final defaultCurrency = 'XAF';

  @override
  SabitouDocFormat get defaultFormat => SabitouDocFormat.a4;

  @override
  Future<Uint8List> build(
    PurchaseOrder data,
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
            ),
            if (data.hasNotes() && data.notes.isNotEmpty) ...[
              pw.SizedBox(height: 16),
              pw.Text(
                Intls.to.notesConditions,
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
              Intls.to.establishedBy,
              Intls.to.supplierStamp,
              centerLabel: Intls.to.approvedBy,
            ),
          ],
        ),
      );

    return doc.save();
  }

  pw.Widget _header(
    PurchaseOrder data,
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
            Intls.to.purchaseOrder.toUpperCase(),
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

  pw.Widget _statusBadge(PurchaseOrderStatus status) {
    final (label, color) = switch (status) {
      PurchaseOrderStatus.PO_STATUS_PENDING => (
        Intls.to.pending.toUpperCase(),
        DocTheme.accent,
      ),
      PurchaseOrderStatus.PO_STATUS_ISSUED => (
        Intls.to.inProgressStatus,
        DocTheme.primary,
      ),
      PurchaseOrderStatus.PO_STATUS_CLOSED => (
        Intls.to.closedStatus,
        DocTheme.statusGreen,
      ),
      PurchaseOrderStatus.PO_STATUS_CANCELLED => (
        Intls.to.cancelled.toUpperCase(),
        DocTheme.statusRed,
      ),
      PurchaseOrderStatus.PO_STATUS_DRAFT => (
        Intls.to.draft.toUpperCase(),
        DocTheme.textMuted,
      ),
      _ => (Intls.to.notSpecifiedStatus, DocTheme.textMuted),
    };

    return DocHelpers.statusBadge(label, color);
  }

  pw.Widget _metaBlock(PurchaseOrder data) {
    final supplierName = data.hasSupplierName()
        ? data.supplierName
        : data.supplierId;
    final storeName = data.hasStoreName() ? data.storeName : data.storeId;

    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Left: supplier info
        pw.Expanded(
          child: pw.Container(
            padding: const pw.EdgeInsets.all(8),
            decoration: const pw.BoxDecoration(
              color: DocTheme.background,
              borderRadius: pw.BorderRadius.all(pw.Radius.circular(4)),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  Intls.to.supplier.toUpperCase(),
                  style: DocTheme.muted(DocHelpers.bold),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  supplierName,
                  style: DocTheme.bodyBold(DocHelpers.bold),
                ),
              ],
            ),
          ),
        ),
        pw.SizedBox(width: 12),
        // Right: order details
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              DocHelpers.infoRow(Intls.to.stores, storeName),
              pw.SizedBox(height: 4),
              DocHelpers.infoRow(
                Intls.to.orderDate,
                Formatters.formatDate(data.orderDate.toDateTime()),
              ),
              pw.SizedBox(height: 4),
              if (data.hasExpectedDeliveryDate()) ...[
                DocHelpers.infoRow(
                  Intls.to.expectedDelivery,
                  Formatters.formatDate(data.expectedDeliveryDate.toDateTime()),
                ),
                pw.SizedBox(height: 4),
              ],
              if (data.destinationAddress.isNotEmpty)
                DocHelpers.infoRow(
                  Intls.to.deliveryTo,
                  data.destinationAddress,
                ),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _itemsTable(PurchaseOrder data, String currency) {
    final headers = [
      '#',
      Intls.to.productHeader,
      Intls.to.qtyOrdered,
      Intls.to.qtyReceived,
      Intls.to.unitPriceHT,
      Intls.to.tva,
      Intls.to.total,
    ];
    final columnWidths = [0.8, 3, 1.2, 1.2, 1.5, 1.5, 1.5];
    final rows = data.items.asMap().entries.map((e) {
      final item = e.value;
      final name = item.productName.hasEn()
          ? item.productName.en
          : item.productName.fr.isNotEmpty
          ? item.productName.fr
          : item.productId;

      return [
        '${e.key + 1}',
        name,
        '${item.quantityOrdered}',
        '${item.quantityReceived}',
        DocHelpers.formatAmount(item.unitPrice, currency),
        DocHelpers.formatAmount(item.taxAmount, currency),
        DocHelpers.formatAmount(item.total, currency),
      ];
    }).toList();

    return DocHelpers.a4Table(
      headers: headers,
      columnWidths: columnWidths,
      rows: rows,
      alignments: [
        pw.Alignment.center,
        pw.Alignment.centerLeft,
        pw.Alignment.center,
        pw.Alignment.center,
        pw.Alignment.centerRight,
        pw.Alignment.centerRight,
        pw.Alignment.centerRight,
      ],
    );
  }
}
