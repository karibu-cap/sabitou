import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../widgets/pdf/common/pdf_format.dart';
import '../../../widgets/pdf/pdf_preview.dart';
import '../../../widgets/pdf/template/pos_template.dart';

/// Preview invoice.
class PreviewInvoice extends StatelessWidget {
  ///  The current store.
  final Store store;

  /// Constructors of new [PreviewInvoice].
  const PreviewInvoice({super.key, required this.store});

  Future<Uint8List> _buildInvoicePdf(PdfPageFormat format) async {
    final cartData = CartManager.instance.currentCashReceipt;
    if (cartData == null) {
      return Uint8List.fromList([]);
    }
    final posTemplate = PosTemplate(cashReceipt: cartData, store: store);

    return posTemplate.buildPdfInvoiceMini(format);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
      ),
      child: ListenableBuilder(
        listenable: GetIt.I.get<CartManager>(),
        builder: (context, value) {
          final cartData = CartManager.instance.currentCashReceipt;

          final hasCartItems = CartManager.instance.getCartItems().isNotEmpty;
          if (!hasCartItems || cartData == null || cartData.items.isEmpty) {
            return Center(child: Text(Intls.to.addProductToCart));
          }

          return PdfPreview(
            build: (format) => PdfPreviewExtents.previewInvoice(
              cashReceipt: cartData,
              store: store,
              pdfMode: PdfMode.TICKET,
            ),
            canChangeOrientation: false,
            canDebug: false,
            dynamicLayout: false,
            canChangePageFormat: false,
            useActions: false,
            initialPageFormat: PdfFormat.buildPreviewInvoiceFormat(
              PdfMode.TICKET,
              itemsLength: CartManager.instance.getCartItems().length,
            ),
            maxPageWidth: 300,
            onShared: (context) async {
              final pdf = await _buildInvoicePdf(PdfPageFormat.roll80);
              if (pdf.isNotEmpty) {
                await Printing.sharePdf(
                  bytes: pdf,
                  filename:
                      'Cart_Preview.pdf', // TODO: Use actual invoice refId
                );
              }
            },
          );
        },
      ),
    );
  }
}
