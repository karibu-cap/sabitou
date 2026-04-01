import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../../../utils/pos_exceptions.dart';
import '../../../widgets/input/auto_complete.dart';
import '../../../widgets/mobile_scanner_view.dart';
import '../point_of_sale_controller.dart';
import '../utils/cart_provider.dart';
import '../utils/inventory_cache.dart';

/// Product search / barcode scan input.
///
/// ### Performance
/// - Adding a product to the cart is **fully synchronous**. The item appears
///   in the cart the instant the user taps a result.
/// - Stock badges in the dropdown are read synchronously from [InventoryCache]
///   — no per-tile async work, no [StatefulWidget] per result.
class SearchAndScanView extends StatelessWidget {
  /// Creates a [SearchAndScanView].
  const SearchAndScanView({super.key});

  /// Adds the product to the cart synchronously.
  ///
  /// On [InsufficientStockException], shows a toast and does NOT add the item.
  void _onSelected(
    BuildContext context,
    StoreProductWithGlobalProduct product,
  ) {
    final item = InvoiceLineItem(
      productId: product.storeProduct.refId,
      productName: product.globalProduct.name,
      unitPrice: product.storeProduct.salePrice.toDouble(),
      quantity: 1,
      subtotal: product.storeProduct.salePrice.toDouble(),
      total: product.storeProduct.salePrice.toDouble(),
      taxAmount: 0,
    );

    try {
      context.read<CartProvider>().addItem(item);
    } on InsufficientStockException catch (e) {
      if (context.mounted) {
        showErrorToast(
          context: context,
          message:
              '${Intls.to.insufficientStockFor.trParams({'product': e.productLabel})} '
              '— ${Intls.to.available}: ${e.available}',
        );
      }
    } on Exception catch (e) {
      if (context.mounted) {
        showErrorToast(context: context, message: e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PointOfSaleController>();

    return AutoComplete<StoreProductWithGlobalProduct>(
      placeholder: Intls.to.scanOrSearchProduct,
      searchPlaceholder: Intls.to.scanOrSearchProduct,
      trailing: kIsWeb
          ? null
          : MobileScannerView(
              onResult: (barcode) {
                controller.searchQueryController.text = barcode;
              },
            ),
      optionsBuilder: controller.searchProducts,
      canReturnDataWhenEmpty: true,
      displayStringForOption: (p) => p.globalProduct.label,
      onSelected: (product) => _onSelected(context, product),
      optionViewBuilder: (product) => _ProductTile(product: product),
    );
  }
}

/// A single search-result row in the autocomplete dropdown.
///
/// Reads the stock level **synchronously** from [InventoryCache] — no
/// async work, no [StatefulWidget], no per-tile SQL queries.
///
/// Rebuilds automatically when [InventoryCache] calls [notifyListeners]
/// (i.e. when PowerSync pushes an inventory update).
class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final StoreProductWithGlobalProduct product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ListenableBuilder(
      listenable: InventoryCache.instance,
      builder: (context, _) {
        final available = InventoryCache.instance.getAvailable(
          product.storeProduct.refId,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.globalProduct.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (product.globalProduct.hasBarCodeValue())
                      Text(
                        product.globalProduct.barCodeValue,
                        style: theme.textTheme.muted,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                spacing: 8,
                children: [
                  Text(
                    Formatters.formatCurrency(
                      product.storeProduct.salePrice.toDouble(),
                    ),
                    style: theme.textTheme.small.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  _StockBadge(available: available),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Compact availability indicator.
class _StockBadge extends StatelessWidget {
  const _StockBadge({required this.available});

  final int? available;

  @override
  Widget build(BuildContext context) {
    final available = this.available;
    if (available == null) {
      return const SizedBox.shrink();
    }

    final Color bg;
    final Color fg;
    final String label;

    if (available <= 0) {
      bg = SabitouColors.dangerSoft;
      fg = SabitouColors.dangerForeground;
      label = Intls.to.outOfStock;
    } else if (available <= 5) {
      bg = SabitouColors.warningSoft;
      fg = SabitouColors.warningForeground;
      label = '${Intls.to.low}: $available';
    } else {
      bg = SabitouColors.successSoft;
      fg = SabitouColors.successForeground;
      label = Intls.to.inStock.trParams({'quantity': available.toString()});
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }
}
