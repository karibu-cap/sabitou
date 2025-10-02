// ignore_for_file: long-method
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../common/pdf_build.dart';

/// The pos client order.
class PosTemplate {
  /// The order to preview.
  final CashReceipt cashReceipt;

  /// The store to preview.
  final Store store;

  /// Constructor of new [PosTemplate].
  PosTemplate({required this.cashReceipt, required this.store});

  /// Builds PDF cashReceipt mini.
  Future<Uint8List> buildPdfInvoiceMini(PdfPageFormat format) async {
    final accountLogo = await imageFromAssetBundle(StaticImages.placeholder);
    final logoSuite = await imageFromAssetBundle(StaticImages.placeholder);

    final List<InvoiceLineItem> orderItems = cashReceipt.items;

    return PdfBuildShared.buildSimplePdf(
      pageFormat: format,
      titleDoc:
          '${Intls.to.store}_${Intls.to.invoice}_${cashReceipt.documentId}',
      source: store.name,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(accountLogo, height: 30, width: 30, fit: BoxFit.fill),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (store.hasName()) ...[
                  Text(
                    store.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                if (store.hasNui()) ...[
                  Text(
                    'NIU: ${store.nui.toUpperCase()}',
                    style: const TextStyle(fontSize: 6, color: PdfColors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
                if (store.hasAddress() || store.hasPostalBox()) ...[
                  Text(
                    '${(store.hasAddress() ? store.address.street.toUpperCase() : '')} ${store.hasPostalBox() ? '- BP: ${store.postalBox.toUpperCase()}' : ''}',
                    style: const TextStyle(fontSize: 6, color: PdfColors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
                if (store.hasPhone() || store.hasEmail()) ...[
                  Text(
                    store.hasPhone()
                        ? store.phone
                        : store.hasEmail()
                        ? store.email
                        : '',
                    style: const TextStyle(fontSize: 6, color: PdfColors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(color: PdfColors.grey400, thickness: 0.5),
        SizedBox(height: 3),
        Center(
          child: Text(
            Intls.to.invoice.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: PdfColors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        if (cashReceipt.hasTransactionTime()) ...[
          Center(
            child: Text(
              DateFormat(
                'dd-MM-yyyy - HH:mm a',
                AppInternationalizationService.to.locale.languageCode,
              ).format(cashReceipt.transactionTime.toDateTime()),
              style: const TextStyle(fontSize: 9, color: PdfColors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 8),
              Divider(color: PdfColors.grey400, thickness: 0.5),
              SizedBox(height: 3),

              // Table Headers - Compact
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'QTE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: PdfColors.black,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      Intls.to.designation,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: PdfColors.black,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'PU',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: PdfColors.black,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      Intls.to.total.toUpperCase(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: PdfColors.black,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),

              // Order Items - Compact rows
              ...orderItems.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.quantity.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: PdfColors.black,
                            fontSize: 7,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          item.label.toUpperCase(),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            color: PdfColors.black,
                            fontSize: 7,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.unitPrice.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: PdfColors.black,
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          (item.unitPrice * item.quantity).toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: PdfColors.black,
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 5),
              Divider(color: PdfColors.grey400, thickness: 0.5),
              SizedBox(height: 3),

              // Totals Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (cashReceipt.hasSubtotal()) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${Intls.to.subtotal.toUpperCase()}:',
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                        Text(
                          Formatters.formatCurrency(cashReceipt.subtotal),
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                  ],

                  if (cashReceipt.hasTaxAmount() &&
                      cashReceipt.taxAmount > 0) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${Intls.to.totalVat.toUpperCase()}:',
                            style: const TextStyle(
                              fontSize: 8,
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                        Text(
                          Formatters.formatCurrency(cashReceipt.taxAmount),
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                  ],
                  if (cashReceipt.hasTotalAmount()) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${Intls.to.total.toUpperCase()}:',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        Text(
                          Formatters.formatCurrency(cashReceipt.totalAmount),
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                  ],
                  if (cashReceipt.hasAmountPaid() &&
                      cashReceipt.amountPaid > 0) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${Intls.to.received.toUpperCase()}:',
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                        Text(
                          Formatters.formatCurrency(cashReceipt.amountPaid),
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                  ],
                  if (cashReceipt.hasAmountPaid() &&
                      cashReceipt.amountPaid > 0) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${Intls.to.given.toUpperCase()}:',
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                        Text(
                          Formatters.formatCurrency(cashReceipt.changeGiven),
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                  ],
                  if (cashReceipt.hasOwedToCustomer() &&
                      cashReceipt.owedToCustomer > 0) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Intls.to.balance.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                        Text(
                          Formatters.formatCurrency(cashReceipt.owedToCustomer),
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),

              SizedBox(height: 5),

              // Barcode - Centered and prominent
              if (cashReceipt.hasDocumentId()) ...[
                Container(
                  height: 25,
                  width: 150,
                  alignment: Alignment.center,
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: cashReceipt.documentId,
                    drawText: false,
                  ),
                ),
                SizedBox(height: 3),
              ],

              // Thank You and Footer - Compact
              Text(
                '*** ${Intls.to.thankYouForYourOrder} ***',
                style: const TextStyle(fontSize: 7, color: PdfColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        Intls.to.bySabitou,
                        style: const TextStyle(
                          fontSize: 5,
                          color: PdfColors.black,
                        ),
                      ),
                      Text(
                        'sabitou@gmail.com',
                        style: const TextStyle(
                          fontSize: 5,
                          color: PdfColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 3),
                  Image(logoSuite, height: 12, width: 12),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
