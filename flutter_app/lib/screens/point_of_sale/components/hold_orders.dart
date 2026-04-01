import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../utils/cart_provider.dart';

/// Displays the list of orders that have been put on hold.
final class HoldOrders extends StatelessWidget {
  /// Creates a [HoldOrders] widget.
  const HoldOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final cartManager = context.read<CartProvider>();

    return ListenableBuilder(
      listenable: cartManager,
      builder: (_, __) {
        final orders = cartManager.saveCashReceipts;
        if (orders.isEmpty) return const SizedBox.shrink();

        return _HoldOrdersPanel(cartManager: cartManager, orders: orders);
      },
    );
  }
}

/// Internal panel — only rendered when [orders] is non-empty.
class _HoldOrdersPanel extends StatelessWidget {
  const _HoldOrdersPanel({required this.cartManager, required this.orders});

  final CartProvider cartManager;
  final List<CashReceipt> orders;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final scrollController = ScrollController();

    return ShadCard(
      padding: EdgeInsets.zero,
      radius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Row(
              children: [
                Icon(
                  LucideIcons.pause,
                  size: 16,
                  color: theme.colorScheme.mutedForeground,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Intls.to.holdOrders,
                        style: theme.textTheme.p.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        Intls.to.holdOrdersDescription,
                        style: theme.textTheme.muted,
                      ),
                    ],
                  ),
                ),
                ShadBadge.secondary(child: Text('${orders.length}')),
              ],
            ),
          ),

          const SizedBox(height: 12),

          LayoutBuilder(
            builder: (context, constraints) {
              return Scrollbar(
                controller: scrollController,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: DataTable(
                      horizontalMargin: 16,
                      dataRowMaxHeight: 72,
                      headingRowHeight: 40,
                      headingTextStyle: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.mutedForeground,
                      ),
                      headingRowColor: WidgetStateProperty.all(
                        theme.colorScheme.secondary,
                      ),
                      dividerThickness: 0.5,
                      columns: [
                        DataColumn(label: Text(Intls.to.dateAndTime)),
                        DataColumn(label: Text(Intls.to.items)),
                        DataColumn(label: Text(Intls.to.total)),
                        DataColumn(label: Text(Intls.to.actions)),
                      ],
                      rows: orders.map((order) {
                        return DataRow(
                          cells: [
                            // Date & time
                            DataCell(
                              Text(
                                Formatters.formatDate(
                                  order.transactionTime.toDateTime(),
                                ),
                                style: theme.textTheme.small,
                              ),
                            ),

                            DataCell(
                              order.items.isNotEmpty
                                  ? ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 240,
                                      ),
                                      child: Text(
                                        order.items
                                            .map(
                                              (i) =>
                                                  '${i.quantity}× ${i.label}',
                                            )
                                            .join(', '),
                                        style: theme.textTheme.small,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),

                            DataCell(
                              Text(
                                Formatters.formatCurrency(
                                  order.totalAmount.toDouble(),
                                ),
                                style: theme.textTheme.p.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // Actions (resume and delete)
                            DataCell(
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ShadButton.outline(
                                    size: ShadButtonSize.sm,
                                    onPressed: () =>
                                        cartManager.resumeCashReceipt(order),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(LucideIcons.play, size: 13),
                                        const SizedBox(width: 5),
                                        Text(Intls.to.resumeOrder),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  ShadButton.destructive(
                                    size: ShadButtonSize.sm,
                                    onPressed: () =>
                                        cartManager.removeCurrentCashReceipt(
                                          cashReceipt: order,
                                        ),
                                    child: const Icon(
                                      LucideIcons.trash2,
                                      size: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
