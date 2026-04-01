import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../point_of_sale_controller.dart';
import '../utils/cart_provider.dart';

/// Cart items list.
class OrderSelected extends StatelessWidget {
  /// Creates an [OrderSelected].
  const OrderSelected({super.key, this.maxHeight = 400});

  /// Maximum height of the scrollable item list in logical pixels.
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Consumer2<CartProvider, PointOfSaleController>(
      builder: (context, cart, controller, _) {
        final items = cart.getCartItems();

        return ShadCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(LucideIcons.shoppingCart, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      Intls.to.cart,
                      style: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ShadBadge(
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      '${items.length} ${Intls.to.items}',
                      style: theme.textTheme.small.copyWith(
                        color: theme.colorScheme.primaryForeground,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              if (items.isEmpty)
                _EmptyCartState()
              else
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: maxHeight),
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) =>
                        Divider(height: 1, color: theme.colorScheme.border),
                    itemBuilder: (context, index) {
                      return _CartItemRow(item: items[index]);
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _EmptyCartState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: Column(
          children: [
            Icon(
              LucideIcons.shoppingCart,
              size: 36,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(height: 12),
            Text(
              Intls.to.emptyCart,
              style: theme.textTheme.p.copyWith(
                color: theme.colorScheme.mutedForeground,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              Intls.to.scanOrSearchForProducts,
              style: theme.textTheme.muted,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// A single cart row: product info | quantity controls | line total | delete.
class _CartItemRow extends StatelessWidget {
  const _CartItemRow({required this.item});

  final InvoiceLineItem item;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: theme.textTheme.small.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${Formatters.formatCurrency(item.unitPrice.toDouble())} / ${Intls.to.unit}',
                  style: theme.textTheme.muted,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _QuantityControl(item: item),
          const SizedBox(width: 12),
          SizedBox(
            width: 90,
            child: Text(
              Formatters.formatCurrency(item.total.toDouble()),
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.end,
            ),
          ),

          const SizedBox(width: 8),

          ShadButton.ghost(
            size: ShadButtonSize.sm,
            onPressed: () => context.read<CartProvider>().removeItem(
              item.productId,
              batchId: item.batchId,
            ),
            child: Icon(
              LucideIcons.trash2,
              size: 14,
              color: theme.colorScheme.destructive,
            ),
          ),
        ],
      ),
    );
  }
}

/// Minus / quantity number / Plus inline controls.
class _QuantityControl extends StatelessWidget {
  const _QuantityControl({required this.item});

  final InvoiceLineItem item;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _QtyButton(
          icon: LucideIcons.minus,
          enabled: item.quantity > 1,
          onPressed: () => context.read<CartProvider>().updateQuantity(
            item.productId,
            item.quantity - 1,
            batchId: item.batchId,
          ),
        ),
        Container(
          width: 36,
          alignment: Alignment.center,
          child: Text(
            '${item.quantity}',
            style: theme.textTheme.small.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        _QtyButton(
          icon: LucideIcons.plus,
          enabled: true,
          onPressed: () => context.read<CartProvider>().updateQuantity(
            item.productId,
            item.quantity + 1,
            batchId: item.batchId,
          ),
        ),
      ],
    );
  }
}

/// Icon-only square button used inside [_QuantityControl].
class _QtyButton extends StatelessWidget {
  const _QtyButton({
    required this.icon,
    required this.enabled,
    required this.onPressed,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      size: ShadButtonSize.sm,
      enabled: enabled,
      onPressed: onPressed,
      child: Icon(icon, size: 12),
    );
  }
}
