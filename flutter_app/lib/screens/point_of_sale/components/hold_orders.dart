import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';

/// The hold orders.
final class HoldOrders extends StatelessWidget {
  /// Constructor of new [HoldOrders].
  const HoldOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final cartManager = GetIt.I.get<CartManager>();

    return ListenableBuilder(
      listenable: cartManager,
      builder: (_, __) {
        if (cartManager.saveCashReceipts.isEmpty) {
          return const SizedBox.shrink();
        }

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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intls.to.holdOrders,
                      style: ShadTheme.of(context).textTheme.h4,
                    ),
                    Text(
                      Intls.to.holdOrdersDescription,
                      style: ShadTheme.of(context).textTheme.muted,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Scrollbar(
                    controller: scrollController,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                        ),
                        child: DataTable(
                          horizontalMargin: 12,
                          dataRowMaxHeight: 80,
                          headingTextStyle: ShadTheme.of(context).textTheme.lead
                              .copyWith(fontWeight: FontWeight.w500),
                          headingRowColor: WidgetStateProperty.all(
                            ShadTheme.of(context).colorScheme.secondary,
                          ),
                          columns: [
                            DataColumn(label: Text(Intls.to.dateAndTime)),
                            DataColumn(label: Text(Intls.to.items)),
                            DataColumn(label: Text(Intls.to.total)),
                            DataColumn(label: Text(Intls.to.actions)),
                          ],
                          rows: cartManager.saveCashReceipts.map((order) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    Formatters.formatDate(
                                      order.transactionTime.toDateTime(),
                                    ),
                                  ),
                                ),

                                DataCell(
                                  order.items.isNotEmpty
                                      ? Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 250,
                                          ),
                                          child: Wrap(
                                            children:
                                                order.items
                                                    .map((item) {
                                                      return Text(
                                                        '${item.quantity}x ${item.label}',
                                                        style: ShadTheme.of(
                                                          context,
                                                        ).textTheme.p,
                                                      );
                                                    })
                                                    .expand(
                                                      (c) => [
                                                        c,
                                                        const Text(', '),
                                                      ],
                                                    )
                                                    .toList()
                                                  ..removeLast(),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                                DataCell(
                                  Text(
                                    Formatters.formatCurrency(
                                      order.totalAmount.toDouble(),
                                    ),
                                    style: ShadTheme.of(context).textTheme.large
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),

                                DataCell(
                                  ShadButton(
                                    onPressed: () =>
                                        cartManager.resumeCashReceipt(order),
                                    leading: const Icon(LucideIcons.play400),
                                    child: Text(Intls.to.resumeOrder),
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
      },
    );
  }
}
