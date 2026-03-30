import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:printing/printing.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../widgets/pdf/common/pdf_format.dart';
import '../../../widgets/pdf/template/pos_template.dart';
import '../utils/cart_provider.dart';

/// Preview invoice.
class PreviewInvoice extends StatelessWidget {
  ///  The current store.
  final Store store;

  /// Constructors of new [PreviewInvoice].
  const PreviewInvoice({super.key, required this.store});

  Future<Uint8List> _buildInvoicePdf(PdfMode format) async {
    final cartData = CartProvider.instance.currentCashReceipt;
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
        listenable: GetIt.I.get<CartProvider>(),
        builder: (context, value) {
          final cartData = CartProvider.instance.currentCashReceipt;

          final hasCartItems = CartProvider.instance.getCartItems().isNotEmpty;
          if (!hasCartItems || cartData == null || cartData.items.isEmpty) {
            return Center(child: Text(Intls.to.addProductToCart));
          }

          final posTemplate = PosTemplate(cashReceipt: cartData, store: store);

          return PdfPreview(
            build: (format) => posTemplate.buildPdfInvoiceMini(PdfMode.TICKET),
            canChangeOrientation: false,
            canDebug: false,
            dynamicLayout: false,
            canChangePageFormat: false,
            useActions: false,
            initialPageFormat: PdfFormat.buildPreviewInvoiceFormat(
              PdfMode.TICKET,
              itemsLength: CartProvider.instance.getCartItems().length,
            ),
            maxPageWidth: 300,
            onShared: (context) async {
              final pdf = await _buildInvoicePdf(PdfMode.TICKET);
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
