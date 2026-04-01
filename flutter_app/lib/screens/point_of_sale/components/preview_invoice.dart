import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
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

  Future<Uint8List> _buildInvoicePdf(
    PdfMode format,
    BuildContext context,
  ) async {
    final cartData = context.read<CartProvider>().currentCashReceipt;
    if (cartData == null) {
      return Uint8List.fromList([]);
    }
    final posTemplate = PosTemplate(cashReceipt: cartData, store: store);

    return posTemplate.buildPdfInvoiceMini(format);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
      ),
      child: Builder(
        builder: (context) {
          final cartData = cart.currentCashReceipt;

          final hasCartItems = cart.getCartItems().isNotEmpty;
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
              itemsLength: cart.getCartItems().length,
            ),
            maxPageWidth: 300,
            onShared: (context) async {
              final pdf = await _buildInvoicePdf(PdfMode.TICKET, context);
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
