import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../point_of_sale_controller.dart';

/// The order selected component
class OrderSelected extends StatelessWidget {
  /// Constructor of new [OrderSelected].
  const OrderSelected({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = GetIt.I.get<CartManager>();

    return Consumer<PointOfSaleController>(
      builder: (context, controller, child) {
        return ListenableBuilder(
          listenable: cart,
          builder: (context, value) {
            final items = cart.getCartItems();

            return Container(
              constraints: const BoxConstraints(maxHeight: 400),
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
                          child: Text('${items.length} ${Intls.to.items}'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (items.isEmpty)
                      Expanded(
                        child: Center(
                          child: ListView(
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
                                  Intls.to.scanOrSearchForProducts,
                                  style: ShadTheme.of(context).textTheme.small,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _CartItemCard(item: item),
                            );
                          },
                        ),
                      ),
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

  final InvoiceLineItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
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
                '${Intls.to.max}:',
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ],
          ),
        ),
        _CartItemControls(item: item),
        ShadButton.outline(
          size: ShadButtonSize.sm,
          onPressed: () =>
              CartManager.to.removeItem(item.productId, batchId: item.batchId),
          child: const Icon(LucideIcons.trash, size: 12),
        ),
      ],
    );
  }
}

class _CartItemControls extends StatelessWidget {
  const _CartItemControls({required this.item});

  final InvoiceLineItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ShadButton.outline(
              size: ShadButtonSize.sm,
              enabled: item.quantity > 1,
              onPressed: () => CartManager.to.updateQuantity(
                item.productId,
                item.quantity - 1,
                batchId: item.batchId,
              ),
              child: const Icon(LucideIcons.minus, size: 12),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                item.quantity.toString(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            ShadButton.outline(
              size: ShadButtonSize.sm,
              onPressed: () => CartManager.to.updateQuantity(
                item.productId,
                item.quantity + 1,
                batchId: item.batchId,
              ),
              child: const Icon(LucideIcons.plus, size: 12),
            ),
          ],
        ),
      ],
    );
  }
}
