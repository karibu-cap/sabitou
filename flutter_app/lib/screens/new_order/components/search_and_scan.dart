import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/mobile_scanner_view.dart';
import '../new_order_controller.dart';

/// The search and filter view.
class SearchAndScanView extends StatelessWidget {
  /// Constructs of new [SearchAndScanView].
  const SearchAndScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final popoverController = ShadPopoverController();
    final controller = context.read<NewOrderController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadPopover(
          controller: popoverController,
          child: ShadInput(
            controller: controller.searchQueryController,
            decoration: ShadDecoration(
              color: ShadTheme.of(context).colorScheme.background,
            ),
            placeholder: Text(Intls.to.scanOrSearchProduct),
            leading: const Icon(LucideIcons.search, size: 16),
            trailing: kIsWeb
                ? null
                : MobileScannerView(
                    onResult: (result) {
                      controller.searchQueryController.text = result;
                      controller.searchQuery.add(result);
                      popoverController.show();
                    },
                  ),
            onChanged: (value) {
              if (value.isEmpty) {
                popoverController.hide();

                return;
              }
              controller.searchQuery.add(value);
              popoverController.show();
            },
          ),
          popover: (context) => SizedBox(
            width: constraints.maxWidth,
            child: StreamBuilder(
              stream: controller.filteredProductsStream,
              builder: (context, snapshot) {
                final products = snapshot.data;
                if (!snapshot.hasData || products == null) {
                  return const Loading();
                }

                if (products.isEmpty) {
                  return Text(Intls.to.noProductsFound);
                }

                return ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                product.globalProduct.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                minFontSize: 8,
                                style: ShadTheme.of(context).textTheme.large
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              if (product.globalProduct.hasBarCodeValue())
                                Text(
                                  product.globalProduct.barCodeValue,
                                  style: ShadTheme.of(context).textTheme.muted
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                            ],
                          ),
                          Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                Formatters.formatCurrency(
                                  product.storeProduct.price.toDouble(),
                                ),
                                style: ShadTheme.of(context).textTheme.small
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              ShadButton.outline(
                                onPressed: () {
                                  CartManager.to.addItem(
                                    product.storeProduct.refId,
                                    product.globalProduct.name,
                                    1,
                                    product.storeProduct.price.toDouble(),
                                  );
                                },
                                child: const Icon(LucideIcons.plus400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
