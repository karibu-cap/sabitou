import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../repositories/resource_link_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/payment_extenxion.dart';
import '../core/doc_format.dart';
import '../core/document_template.dart';
import 'helpers/doc_helpers.dart';

/// The [DefaultCashReceiptTemplate].
class DefaultCashReceiptTemplate extends DocumentTemplate<CashReceiptDoc> {
  /// Constructor of [DefaultCashReceiptTemplate].
  const DefaultCashReceiptTemplate();

  /// Default currency for purchase orders.
  final defaultCurrency = 'XAF';

  @override
  SabitouDocFormat get defaultFormat => SabitouDocFormat.roll80;

  @override
  Future<Uint8List> build(
    CashReceiptDoc dataDoc,
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
    final data = dataDoc.data;

    doc.addPage(
      pw.Page(
        pageFormat: format,
        margin: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              // ── Header ──────────────────────────────────────────────────
              DocHelpers.thermalHeader(company, logo),
              pw.Text(
                '*** ${Intls.to.cashReceipts.toUpperCase()} ***',
                style: pw.TextStyle(font: DocHelpers.bold, fontSize: 9),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 4),

              // ── Receipt meta ─────────────────────────────────────────────
              _ReceiptMeta(data: data),
              DocHelpers.dashedDivider(),

              // ── Items ────────────────────────────────────────────────────
              _ItemsTable(
                items: data.items,
                currency: data.hasCurrency() ? data.currency : defaultCurrency,
              ),
              DocHelpers.dashedDivider(),

              // ── Totals ───────────────────────────────────────────────────
              DocHelpers.thermalTotalsBlock(
                subTotal: data.subtotal,
                taxTotal: data.taxAmount,
                totalAmount: data.totalAmount,
                currency: data.hasCurrency() ? data.currency : defaultCurrency,
                amountPaid: data.amountPaid,
                changeGiven: data.changeGiven > 0 ? data.changeGiven : null,
                owedToCustomer: data.owedToCustomer > 0
                    ? data.owedToCustomer
                    : null,
              ),

              // ── Payment methods ──────────────────────────────────────────
              _PaymentsBlock(data: dataDoc),

              // ── Voucher code (conditional) ───────────────────────────────
              if (data.hasVoucherIssuedCode() && data.owedToCustomer > 0) ...[
                _VoucherBlock(
                  code: data.voucherIssuedCode,
                  amount: data.owedToCustomer,
                  currency: data.hasCurrency()
                      ? data.currency
                      : defaultCurrency,
                ),
              ],

              // ── Footer ───────────────────────────────────────────────────
              DocHelpers.thermalFooter(),
            ],
          );
        },
      ),
    );

    return doc.save();
  }
}

class _ReceiptMeta extends pw.StatelessWidget {
  _ReceiptMeta({required this.data});

  final CashReceipt data;

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/'
        '${dt.month.toString().padLeft(2, '0')}/'
        '${dt.year} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  pw.Widget build(pw.Context context) {
    final dateStr = _formatDate(data.transactionTime.toDateTime());

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        DocHelpers.thermalInfoRow('${Intls.to.receipt} N°', data.refId),
        pw.SizedBox(height: 4),
        DocHelpers.thermalInfoRow(Intls.to.date, dateStr),
        pw.SizedBox(height: 4),
        if (data.customer.isNotEmpty) ...[
          DocHelpers.thermalInfoRow(Intls.to.customerName, data.customer),
          pw.SizedBox(height: 4),
        ],
        if (data.cashierUserId.isNotEmpty)
          DocHelpers.thermalInfoRow(Intls.to.cashier, data.cashierUserId),
      ],
    );
  }
}

class _ItemsTable extends pw.StatelessWidget {
  _ItemsTable({required this.items, required this.currency});

  final List<InvoiceLineItem> items;
  final String currency;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        ...items.map(
          (item) => _ItemRow(
            name: item.productName.en,
            qty: item.quantity,
            unitPrice: item.unitPrice,
            total: item.total,
            currency: currency,
          ),
        ),
      ],
    );
  }
}

class _ItemRow extends pw.StatelessWidget {
  _ItemRow({
    required this.name,
    required this.qty,
    required this.unitPrice,
    required this.total,
    required this.currency,
  });

  final String name;
  final int qty;
  final double unitPrice;
  final double total;
  final String currency;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          name,
          style: pw.TextStyle(font: DocHelpers.bold, fontSize: 8),
          maxLines: 2,
          overflow: pw.TextOverflow.clip,
        ),
        pw.SizedBox(height: 1),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              '$qty x ${DocHelpers.formatAmount(unitPrice, currency)}',
              style: pw.TextStyle(font: DocHelpers.regular, fontSize: 7.5),
            ),
            pw.Text(
              DocHelpers.formatAmount(total, currency),
              style: pw.TextStyle(font: DocHelpers.bold, fontSize: 8),
            ),
          ],
        ),
        pw.SizedBox(height: 3),
      ],
    );
  }
}

class _PaymentsBlock extends pw.StatelessWidget {
  _PaymentsBlock({required this.data});

  final CashReceiptDoc data;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          Intls.to.paymentMethods,
          style: pw.TextStyle(font: DocHelpers.bold, fontSize: 7),
        ),
        pw.SizedBox(height: 2),
        ...data.payments.map(
          (pm) => pw.Text(
            '${pm.paymentMethod.label}',
            style: pw.TextStyle(font: DocHelpers.regular, fontSize: 7),
          ),
        ),
      ],
    );
  }
}

class _VoucherBlock extends pw.StatelessWidget {
  _VoucherBlock({
    required this.code,
    required this.amount,
    required this.currency,
  });

  final String code;
  final double amount;
  final String currency;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(4),
      decoration: const pw.BoxDecoration(
        border: pw.Border.fromBorderSide(pw.BorderSide(width: 0.5)),
      ),
      child: pw.Column(
        children: [
          pw.Text(
            Intls.to.giftVoucherTitle,
            style: pw.TextStyle(font: DocHelpers.bold, fontSize: 8),
            textAlign: pw.TextAlign.center,
          ),
          pw.SizedBox(height: 2),
          pw.Text(
            code,
            style: pw.TextStyle(font: DocHelpers.bold, fontSize: 12),
            textAlign: pw.TextAlign.center,
          ),
          pw.SizedBox(height: 2),
          pw.Text(
            '${Intls.to.valueLabel} ${DocHelpers.formatAmount(amount, currency)}',
            style: pw.TextStyle(font: DocHelpers.bold, fontSize: 9),
            textAlign: pw.TextAlign.center,
          ),
          pw.Text(
            Intls.to.keepTicketSafe,
            style: pw.TextStyle(font: DocHelpers.regular, fontSize: 7),
            textAlign: pw.TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Represents a cash receipt document to be rendered.
class CashReceiptDoc {
  /// The cash receipt data.
  final CashReceipt data;

  /// The payments associated with the cash receipt.
  final List<Payment> payments;

  /// Constructs a [CashReceiptDoc] with the given [data] and [payments].
  const CashReceiptDoc({required this.data, required this.payments});
}
