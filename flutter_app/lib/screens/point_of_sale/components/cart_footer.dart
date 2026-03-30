import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/custom_shad_button.dart';
import '../utils/cart_provider.dart';
import 'payment_section.dart';

/// Cart footer — shows the order totals and action buttons.
class CartFooter extends StatelessWidget {
  /// Creates a [CartFooter].
  const CartFooter({super.key, this.showPayment = false});

  /// Whether to embed [PaymentSection] inside this footer.
  final bool showPayment;

  @override
  Widget build(BuildContext context) {
    final cart = GetIt.I.get<CartProvider>();

    return ListenableBuilder(
      listenable: cart,
      builder: (context, _) {
        return ShadCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CartTotals(cart: cart),
              const SizedBox(height: 12),
              _CartActions(cart: cart),
              if (showPayment) ...[
                const SizedBox(height: 16),
                const Divider(height: 1),
                const SizedBox(height: 16),
                const PaymentSection(),
              ],
            ],
          ),
        );
      },
    );
  }
}

/// Subtotal / tax / total rows.
class _CartTotals extends StatelessWidget {
  const _CartTotals({required this.cart});

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final items = cart.getCartItems();

    final subtotal = items.fold(0.0, (sum, i) => sum + i.subtotal);
    final taxTotal = items.fold(0.0, (sum, i) => sum + i.taxAmount);
    final total = cart.currentCashReceipt?.totalAmount ?? 0.0;

    return Column(
      children: [
        _TotalRow(label: Intls.to.subtotal, amount: subtotal),
        if (taxTotal > 0)
          _TotalRow(label: '${Intls.to.tax} (19.25%)', amount: taxTotal),
        const SizedBox(height: 6),
        Divider(height: 1, color: theme.colorScheme.border),
        const SizedBox(height: 8),
        _TotalRow(label: Intls.to.total, amount: total, isGrandTotal: true),
      ],
    );
  }
}

/// A single label / amount row in the totals section.
class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.amount,
    this.isGrandTotal = false,
    this.valueColor,
  });

  final String label;
  final double amount;

  /// When `true`, renders the row with larger, bolder typography.
  final bool isGrandTotal;

  /// Optional override color for the amount text.
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final labelStyle = isGrandTotal
        ? theme.textTheme.p.copyWith(fontWeight: FontWeight.w700)
        : theme.textTheme.small;
    final amountStyle = isGrandTotal
        ? theme.textTheme.large.copyWith(
            fontWeight: FontWeight.w700,
            color: valueColor ?? theme.colorScheme.primary,
          )
        : theme.textTheme.small.copyWith(
            color: valueColor ?? theme.colorScheme.foreground,
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(child: Text(label, style: labelStyle)),
          Text(Formatters.formatCurrency(amount), style: amountStyle),
        ],
      ),
    );
  }
}

/// Hold-order and clear-cart buttons.
class _CartActions extends StatelessWidget {
  const _CartActions({required this.cart});

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final hasItems = cart.currentCashReceipt?.items.isNotEmpty ?? false;

    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      children: [
        Expanded(
          flex: isMobile ? 0 : 1,
          child: SizedBox(
            width: double.infinity,
            child: CustomShadButton(
              buttonType: ShadButtonVariant.outline,
              leading: const Icon(LucideIcons.pause, size: 15),
              onPressed: cart.saveCurrentCashReceipt,
              enabled: hasItems,
              text: Intls.to.holdOrder,
            ),
          ),
        ),
        SizedBox(width: isMobile ? 0 : 8, height: isMobile ? 8 : 0),
        Expanded(
          flex: isMobile ? 0 : 1,
          child: SizedBox(
            width: double.infinity,
            child: CustomShadButton(
              buttonType: ShadButtonVariant.destructive,
              leading: const Icon(LucideIcons.trash2, size: 15),
              onPressed: () async {
                await Future.value();
                cart.clearCart();
              },
              enabled: hasItems,
              text: Intls.to.clearOrder,
            ),
          ),
        ),
      ],
    );
  }
}
