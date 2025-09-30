import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/formatters.dart';
import '../point_of_sale_controller.dart';

/// The order selected component
class OrderSelected extends StatelessWidget {
  /// Constructor of new [OrderSelected].
  const OrderSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PointOfSaleController>(
      builder: (context, controller, child) {
        return ListenableBuilder(
          listenable: GetIt.I.get<CartManager>(),
          builder: (context, value) {
            // final items = CartManager.to.currentOrder?.OrderLineItems;
            final items = [];

            return Expanded(
              child: ShadCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        const Icon(LucideIcons.shoppingCart),
                        Expanded(
                          child: Text(
                            Intls.to.cart,
                            style: ShadTheme.of(context).textTheme.small,
                          ),
                        ),
                        ShadBadge(
                          child: Text('${items.length ?? 0} ${Intls.to.items}'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (items.isEmpty)
                      Expanded(
                        child: Center(
                          // ignore: avoid-shrink-wrap-in-lists
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              const Icon(LucideIcons.shoppingCart, size: 20),
                              const SizedBox(height: 12),
                              Center(
                                child: Text(
                                  Intls.to.emptyCart,
                                  style: ShadTheme.of(context).textTheme.small,
                                ),
                              ),
                              Center(
                                child: Text(
                                  Intls.to.scanOrSearchProduct,
                                  style: ShadTheme.of(context).textTheme.small,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    // else
                    //   Expanded(
                    //     child: ListView.builder(
                    //       itemCount: items.length,
                    //       itemBuilder: (context, index) {
                    //         final item = items[index];

                    //         return Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: _CartItemCard(item: item),
                    //         );
                    //       },
                    //     ),
                    //   ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _CartItemCard extends StatelessWidget {
  const _CartItemCard({required this.item});

  final OrderLineItem item;

  @override
  Widget build(BuildContext context) {
    final maxQuantity = 8;
    // context
    //     .read<NewOrderController>()
    //     .productsSubject
    //     .valueOrNull
    //     ?.firstWhere((p) => p.storeProduct.refId == item.storeProductId)
    //     .storeProduct
    //     .stockQuantity ??
    // 0;

    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'item.productName',
                style: ShadTheme.of(
                  context,
                ).textTheme.small.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                '${Formatters.formatCurrency(item.unitPrice.toDouble())} ${Intls.to.each}',
                style: ShadTheme.of(context).textTheme.muted,
              ),
              const SizedBox(height: 4),
              Text(
                '${Intls.to.max}: $maxQuantity',
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ],
          ),
        ),
        _CartItemControls(item: item),
        const ShadButton.outline(
          size: ShadButtonSize.sm,
          // onPressed: () => CartManager.to.removeItem(item.storeProductId),
          child: Icon(LucideIcons.trash, size: 12),
        ),
      ],
    );
  }
}

class _CartItemControls extends StatelessWidget {
  const _CartItemControls({required this.item});

  final OrderLineItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const ShadButton.outline(
              size: ShadButtonSize.sm,
              // onPressed: () => CartManager.to.updateQuantity(
              //   item.storeProductId,
              //   item.quantity - 1,
              // ),
              child: Icon(LucideIcons.minus, size: 12),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                item.quantity.toString(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const ShadButton.outline(
              size: ShadButtonSize.sm,
              // onPressed: () => CartManager.to.updateQuantity(
              //   item.storeProductId,
              //   item.quantity + 1,
              // ),
              child: Icon(LucideIcons.plus, size: 12),
            ),
          ],
        ),
      ],
    );
  }
}
