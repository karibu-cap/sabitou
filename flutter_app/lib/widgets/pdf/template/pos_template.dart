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

  /// Build the cashReceipt.
  // Future<Uint8List> buildInvoice(
  //   PdfPageFormat pdfPageFormat,
  //   double cellHeight,
  // ) async {
  //   final accountLogo = await imageFromAssetBundle(StaticImages.placeholder);
  //   final logoSuite = await imageFromAssetBundle(StaticImages.placeholder);

  //   final List<InvoiceLineItem> orderItems = cashReceipt.items;

  //   final tableHeaders = [
  //     Intls.to.designation,
  //     Intls.to.qte,
  //     Intls.to.prixUnit,
  //     Intls.to.discount,
  //     Intls.to.total,
  //   ];

  //   return PdfBuildShared.buildSimplePdf(
  //     pageFormat: pdfPageFormat.copyWith(height: pdfPageFormat.height),
  //     titleDoc: '${Intls.to.store}_${Intls.to.pos}_${cashReceipt.documentId}',
  //     source: store.name,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // Store Header - Conditional and detailed
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               if (store.hasName()) ...[
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Image(
  //                       accountLogo,
  //                       height: 50,
  //                       width: 50,
  //                       fit: BoxFit.fill,
  //                     ),
  //                     SizedBox(width: 10),
  //                     Expanded(
  //                       child: Text(
  //                         store.name.toUpperCase(),
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           color: PdfColors.black,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //               if (store.hasAddress() || store.hasPostalBox()) ...[
  //                 Text(
  //                   '${(store.hasAddress() ? store.address.street : '')} - BP: ${store.hasPostalBox() ? store.postalBox.toUpperCase() : ''}',
  //                   style: const TextStyle(fontSize: 8, color: PdfColors.black),
  //                 ),
  //               ],
  //               if (store.hasNui()) ...[
  //                 Text(
  //                   'R:C: ${store.nui.toUpperCase()}',
  //                   style: const TextStyle(fontSize: 8, color: PdfColors.black),
  //                 ),
  //               ],
  //               if (store.hasTaxPayerNumber()) ...[
  //                 Text(
  //                   '${Intls.to.taxPayerNumber}: ${store.taxPayerNumber.toUpperCase()}',
  //                   style: const TextStyle(fontSize: 8, color: PdfColors.black),
  //                 ),
  //               ],
  //               if (store.hasEmail()) ...[
  //                 Text(
  //                   '${Intls.to.contacts}: ${store.email}'.toUpperCase(),
  //                   style: const TextStyle(fontSize: 8, color: PdfColors.black),
  //                 ),
  //               ],
  //             ],
  //           ),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: [
  //               Row(
  //                 children: [
  //                   Column(
  //                     children: [
  //                       Text(
  //                         Intls.to.bySabitou,
  //                         style: TextStyle(
  //                           fontSize: 7,
  //                           color: PdfColors.black,
  //                           fontWeight: FontWeight.normal,
  //                         ),
  //                       ),
  //                       Text(
  //                         'sabitou@gmail.com',
  //                         style: TextStyle(
  //                           fontSize: 5,
  //                           color: PdfColors.black,
  //                           fontWeight: FontWeight.normal,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(width: 5),
  //                   Image(logoSuite, height: 20, width: 20),
  //                 ],
  //               ),
  //               SizedBox(height: 10),
  //               Container(
  //                 height: 15,
  //                 width: 150,
  //                 alignment: Alignment.centerRight,
  //                 child: BarcodeWidget(
  //                   barcode: Barcode.code128(),
  //                   data: cashReceipt.id,
  //                   drawText: false,
  //                   color: PdfColors.grey800,
  //                 ),
  //               ),
  //               // Title and Date - Conditional
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   Text(
  //                     '${Intls.to.order} ${cashReceipt.id.toUpperCase()}',
  //                     style: TextStyle(
  //                       fontSize: 12,
  //                       color: PdfColors.black,
  //                       fontWeight: FontWeight.normal,
  //                     ),
  //                   ),
  //                   Text(
  //                     Formatters.formatDate(cashReceipt.createdAt),
  //                     style: TextStyle(
  //                       fontSize: 12,
  //                       color: PdfColors.black,
  //                       fontWeight: FontWeight.normal,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),

  //       SizedBox(height: 20),

  //       TableHelper.fromTextArray(
  //         border: null,
  //         cellAlignment: Alignment.centerLeft,
  //         headerDecoration: const BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(2)),
  //           color: PdfColors.grey200,
  //         ),
  //         oddRowDecoration: const BoxDecoration(
  //           color: PdfColors.grey100,
  //           border: Border(
  //             bottom: BorderSide(color: PdfColors.grey200, width: 0.2),
  //             top: BorderSide(color: PdfColors.grey200, width: 0.2),
  //             left: BorderSide(color: PdfColors.grey200, width: 0.2),
  //             right: BorderSide(color: PdfColors.grey200, width: 0.2),
  //           ),
  //         ),
  //         headerHeight: 15,
  //         cellHeight: cellHeight,
  //         cellAlignments: {
  //           0: Alignment.centerLeft,
  //           1: Alignment.centerRight,
  //           2: Alignment.centerRight,
  //           3: Alignment.centerRight,
  //           4: Alignment.centerRight,
  //           //5: Alignment.centerRight,
  //         },
  //         columnWidths: const {
  //           0: FlexColumnWidth(5),
  //           1: FlexColumnWidth(2),
  //           2: FlexColumnWidth(3),
  //           3: FlexColumnWidth(3),
  //           4: FlexColumnWidth(3),
  //         },
  //         headerStyle: TextStyle(
  //           color: PdfColors.black,
  //           fontSize: 10,
  //           fontWeight: FontWeight.bold,
  //         ),
  //         cellStyle: TextStyle(
  //           color: PdfColors.grey700,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 7,
  //         ),
  //         rowDecoration: const BoxDecoration(
  //           border: Border(
  //             bottom: BorderSide(color: PdfColors.grey700, width: 0.2),
  //             top: BorderSide(color: PdfColors.grey700, width: 0.2),
  //             left: BorderSide(color: PdfColors.grey700, width: 0.2),
  //             right: BorderSide(color: PdfColors.grey700, width: 0.2),
  //           ),
  //         ),
  //         headers: List<String>.generate(
  //           tableHeaders.length,
  //           (col) => tableHeaders[col],
  //         ),
  //         data: List<List<Widget>>.generate(
  //           orderItems.length,
  //           (index) => [
  //             Text(
  //               orderItems[index].productName,
  //               maxLines: 5,
  //               overflow: TextOverflow.span,
  //               style: const TextStyle(color: PdfColors.grey700, fontSize: 10),
  //             ),

  //             Text(
  //               orderItems[index].quantity.toString(),
  //               maxLines: 2,
  //               textAlign: TextAlign.center,
  //               overflow: TextOverflow.span,
  //               style: TextStyle(
  //                 color: PdfColors.grey700,
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),

  //             Text(
  //               orderItems[index].unitPrice.toString(),
  //               textAlign: TextAlign.center,
  //               maxLines: 2,
  //               overflow: TextOverflow.span,
  //               style: TextStyle(
  //                 color: PdfColors.grey700,
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),

  //             Text(
  //               '0',
  //               textAlign: TextAlign.center,
  //               maxLines: 2,
  //               overflow: TextOverflow.span,
  //               style: TextStyle(
  //                 color: PdfColors.grey700,
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),

  //             Text(
  //               (orderItems[index].unitPrice * orderItems[index].quantity)
  //                   .toString(),
  //               textAlign: TextAlign.center,
  //               maxLines: 2,
  //               overflow: TextOverflow.span,
  //               style: TextStyle(
  //                 color:
  //                     (orderItems[index].unitPrice *
  //                             orderItems[index].quantity) >
  //                         0
  //                     ? PdfColors.red
  //                     : PdfColors.grey700,
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Container(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   padding: const EdgeInsets.only(
  //                     top: 15,
  //                     bottom: 10,
  //                     left: 10,
  //                     right: 10,
  //                   ),
  //                   child: Container(
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               Intls.to.subtotal.toUpperCase(),
  //                               style: TextStyle(
  //                                 fontSize: 10,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: PdfColors.black,
  //                               ),
  //                             ),
  //                             Text(
  //                               Formatters.formatCurrency(cashReceipt.subtotal),
  //                               style: TextStyle(
  //                                 fontSize: 10,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: PdfColors.black,
  //                               ),
  //                             ),
  //                           ],
  //                         ),

  //                         SizedBox(height: 3),
  //                         if (cashReceipt.hasTotalDiscount() &&
  //                             cashReceipt.totalDiscount > 0) ...[
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 '${Intls.to.discount.toUpperCase()}:',
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                               Text(
  //                                 Formatters.formatCurrency(
  //                                   cashReceipt.totalDiscount,
  //                                 ),
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                         SizedBox(height: 3),
  //                         if (cashReceipt.hasTotalVat() &&
  //                             cashReceipt.totalVat > 0) ...[
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Expanded(
  //                                 child: Text(
  //                                   '${Intls.to.totalVat.toUpperCase()}:',
  //                                   style: TextStyle(
  //                                     fontSize: 10,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: PdfColors.black,
  //                                   ),
  //                                   textAlign: TextAlign.left,
  //                                 ),
  //                               ),
  //                               Text(
  //                                 Formatters.formatCurrency(
  //                                   cashReceipt.totalVat,
  //                                 ),
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                         SizedBox(height: 3),
  //                         if (cashReceipt.hasTotal()) ...[
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 '${Intls.to.total.toUpperCase()}:',
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                               Text(
  //                                 Formatters.formatCurrency(cashReceipt.total),
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                         SizedBox(height: 3),
  //                         if (cashReceipt.hasCustomerTenderedAmount() &&
  //                             cashReceipt.customerTenderedAmount > 0) ...[
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 '${Intls.to.amountReceiced.toUpperCase()}:',
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                               Text(
  //                                 Formatters.formatCurrency(
  //                                   cashReceipt.customerTenderedAmount,
  //                                 ),
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                         if (cashReceipt.hasChangeGiven() &&
  //                             cashReceipt.changeGiven > 0) ...[
  //                           SizedBox(height: 3),
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 '${Intls.to.changeGiven.toUpperCase()}:',
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                               Text(
  //                                 Formatters.formatCurrency(
  //                                   cashReceipt.changeGiven,
  //                                 ),
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                         SizedBox(height: 3),
  //                         if ((cashReceipt.paymentData?.balanceDue ?? 0) >
  //                             0) ...[
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 Intls.to.balanceDue,
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                               Expanded(
  //                                 child: Text(
  //                                   Formatters.formatCurrency(
  //                                     cashReceipt.paymentData?.balanceDue ?? 0,
  //                                   ),
  //                                   textAlign: TextAlign.right,
  //                                   style: TextStyle(
  //                                     fontSize: 10,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: PdfColors.black,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                         Divider(
  //                           height: 1,
  //                           thickness: 0.8,
  //                           color: PdfColors.grey700,
  //                         ),
  //                         SizedBox(height: 7),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               cashReceipt.status.label,
  //                               style: TextStyle(
  //                                 fontSize: 10,
  //                                 color: PdfColors.black,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                             Text(
  //                               Formatters.formatCurrency(
  //                                 cashReceipt
  //                                         .paymentData
  //                                         ?.customerTenderedAmount ??
  //                                     0.0,
  //                               ),
  //                               style: TextStyle(
  //                                 fontSize: 10,
  //                                 color: PdfColors.black,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(height: 5),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               cashReceipt.status !=
  //                                       InvoiceStatus.INVOICE_STATUS_PAID
  //                                   ? Intls.to.restToPaid
  //                                   : Intls.to.refunded,
  //                               style: TextStyle(
  //                                 fontSize: 10,
  //                                 color: PdfColors.black,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: Text(
  //                                 Formatters.formatCurrency(
  //                                   (cashReceipt.status !=
  //                                           InvoiceStatus.INVOICE_STATUS_PAID)
  //                                       ? cashReceipt.paymentData?.balanceDue ??
  //                                             0
  //                                       : cashReceipt
  //                                                 .paymentData
  //                                                 ?.changeGiven ??
  //                                             0,
  //                                 ),
  //                                 textAlign: TextAlign.right,
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: PdfColors.black,
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),

  //                         if (cashReceipt.payments.length > 1) ...[
  //                           Column(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 Intls.to.paymentMethod,
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   color: PdfColors.black,
  //                                   fontWeight: FontWeight.bold,
  //                                 ),
  //                                 textAlign: TextAlign.left,
  //                               ),
  //                               SizedBox(height: 5),
  //                               Column(
  //                                 mainAxisAlignment: MainAxisAlignment.center,
  //                                 crossAxisAlignment: CrossAxisAlignment.end,
  //                                 children: List.generate(
  //                                   (cashReceipt.payments).length,
  //                                   (index) => Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceBetween,
  //                                     children: [
  //                                       Row(
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.start,
  //                                         children: [
  //                                           if (cashReceipt.payments[index]
  //                                               .hasTimestamp()) ...[
  //                                             Text(
  //                                               Formatters.formatDate(
  //                                                 cashReceipt
  //                                                     .payments[index]
  //                                                     .paymentDate
  //                                                     .toDateTime(),
  //                                               ),
  //                                               style: const TextStyle(
  //                                                 fontSize: 8,
  //                                               ),
  //                                             ),
  //                                           ],
  //                                           SizedBox(width: 15),

  //                                           Text(
  //                                             cashReceipt.payments[index].method
  //                                                 .toUpperCase(),

  //                                             style: TextStyle(
  //                                               fontSize: 8,
  //                                               fontWeight: FontWeight.bold,
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),

  //                                       Text(
  //                                         Formatters.formatCurrency(
  //                                           cashReceipt
  //                                               .payments[index]
  //                                               .amountDouble,
  //                                         ),
  //                                         style: const TextStyle(fontSize: 8),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                         SizedBox(height: 5),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             decoration: const BoxDecoration(
  //               border: Border.fromBorderSide(
  //                 BorderSide(width: 0.5, color: PdfColors.grey700),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),

  //       SizedBox(height: 10),

  //       if (cashReceipt.hasStatus() &&
  //           cashReceipt.hasBalanceDue() &&
  //           cashReceipt.hasTotal()) ...[
  //         Container(
  //           padding: EdgeInsets.zero,
  //           alignment: Alignment.topLeft,
  //           child: Text(
  //             cashReceipt.status != InvoiceStatus.INVOICE_STATUS_PAID
  //                 ? '${Intls.to.restToPaid}: ${Formatters.formatCurrency(cashReceipt.balanceDue)}'
  //                 : '${Intls.to.stopThePresentInvoiceAtTheSumOf}: ${Formatters.formatCurrency(cashReceipt.total)}',
  //             overflow: TextOverflow.span,
  //             textAlign: TextAlign.left,
  //             style: TextStyle(
  //               color: PdfColors.grey700,
  //               fontSize: 10,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           decoration: const BoxDecoration(
  //             borderRadius: BorderRadius.all(Radius.circular(10)),
  //             color: PdfColors.grey100,
  //           ),
  //         ),
  //       ],

  //       SizedBox(height: 10),

  //       if (Intls.to.thankYouForYourOrder.isNotEmpty) ...[
  //         Text(
  //           '*** ${Intls.to.thankYouForYourOrder} ***',
  //           softWrap: true,
  //           style: TextStyle(
  //             fontSize: 10,
  //             color: PdfColors.black,
  //             fontWeight: FontWeight.normal,
  //           ),
  //         ),
  //       ],
  //       SizedBox(height: 15),
  //     ],
  //   );
  // }

  /// Build PDF cashReceipt mini.
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
                          '${Intls.to.amountReceiced.toUpperCase()}:',
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
                  if (cashReceipt.hasChangeGiven() &&
                      cashReceipt.changeGiven > 0) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${Intls.to.changeGiven.toUpperCase()}:',
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
                          Intls.to.balanceDue.toUpperCase(),
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
