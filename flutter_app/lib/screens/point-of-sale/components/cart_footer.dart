import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/custom_shad_button.dart';
import 'payment_section.dart';

/// The cart footer.
final class CartFooter extends StatelessWidget {
  /// Constructor of new [CartFooter].
  const CartFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final cart = GetIt.I.get<CartManager>();

    return ListenableBuilder(
      listenable: cart,
      builder: (context, value) {
        return Column(
          spacing: 12,
          children: [
            Divider(
              thickness: 1,
              color: ShadTheme.of(context).colorScheme.border,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    Intls.to.total,
                    style: ShadTheme.of(
                      context,
                    ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '${Formatters.formatCurrency(cart.currentCashReceipt?.totalAmount ?? 0)}',
                  style: ShadTheme.of(context).textTheme.p.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ShadTheme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const PaymentSection(),

            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              spacing: 12,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomShadButton(
                      buttonType: ShadButtonVariant.outline,
                      leading: const Icon(LucideIcons.pause400),
                      // onPressed: CartManager.to.onHoldCurrentOrder,
                      // enabled:
                      //     CartManager.to.currentOrder?.orderItems.isNotEmpty ??
                      //     false,
                      text: Intls.to.holdOrder,
                    ),
                  ),
                ),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomShadButton(
                      buttonType: ShadButtonVariant.destructive,
                      leading: const Icon(LucideIcons.trash2400),
                      onPressed: () async {
                        await Future.value();
                        CartManager.to.clearCart();
                      },
                      enabled:
                          CartManager.to.currentCashReceipt?.items.isNotEmpty ??
                          false,
                      text: Intls.to.clearOrder,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
