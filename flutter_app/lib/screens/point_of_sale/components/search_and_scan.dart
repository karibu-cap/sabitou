import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/input/auto_complete.dart';
import '../../../widgets/mobile_scanner_view.dart';
import '../point_of_sale_controller.dart';

/// The search and filter view.
class SearchAndScanView extends StatelessWidget {
  /// Constructs of new [SearchAndScanView].
  const SearchAndScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PointOfSaleController>();

    return CustomAutoComplete<StoreProductWithGlobalProduct>(
      placeholder: Intls.to.scanOrSearchProduct,
      leading: const Icon(LucideIcons.search, size: 16),
      trailing: kIsWeb
          ? null
          : MobileScannerView(
              onResult: (result) {
                controller.searchQueryController.text = result;
                controller.searchQuery.add(result);
              },
            ),
      optionsBuilder: (textController) async {
        return await controller.filteredProductsStream.first;
      },
      displayStringForOption: (product) => product.globalProduct.label,
      onChanged: (value) {
        if (value.isEmpty) {
          return;
        }
        controller.searchQuery.add(value);
      },
      onSelected: (product, textController) {
        CartManager.to.addItem(
          InvoiceLineItem(
            productId: product.storeProduct.refId,
            productName: product.globalProduct.name,
            unitPrice: product.storeProduct.salePrice.toDouble(),
            quantity: 1,
            subtotal: product.storeProduct.salePrice.toDouble(),
            total: product.storeProduct.salePrice.toDouble(),
            taxAmount: 0,
          ),
        );
        textController.clear();
      },
      optionsViewBuilder:
          ({
            required context,
            required void Function(StoreProductWithGlobalProduct) onSelected,
            required options,
          }) {
            if (options.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(Intls.to.noProductsFound),
              );
            }

            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                for (final product in options)
                  SliverToBoxAdapter(
                    child: ListTile(
                      title: AutoSizeText(
                        product.globalProduct.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 8,
                        style: ShadTheme.of(context).textTheme.small,
                      ),
                      trailing: Text(
                        Formatters.formatCurrency(
                          product.storeProduct.salePrice.toDouble(),
                        ),
                      ),
                      subtitle: (product.globalProduct.hasBarCodeValue())
                          ? Text(
                              product.globalProduct.barCodeValue,
                              style: ShadTheme.of(context).textTheme.muted,
                            )
                          : null,
                      onTap: () => onSelected(product),
                    ),
                  ),
              ],
            );
          },
    );
  }
}
