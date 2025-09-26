import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
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
        if (cartManager.listOfSaveOrder.isEmpty) {
          return const SizedBox.shrink();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            return ShadCard(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        Intls.to.holdOrders,
                        style: ShadTheme.of(
                          context,
                        ).textTheme.p.copyWith(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        Intls.to.holdOrdersDescription,
                        style: ShadTheme.of(context).textTheme.muted,
                      ),
                    ),
                    Scrollbar(
                      controller: scrollController,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        child: DataTable(
                          horizontalMargin: 12,
                          dataRowMaxHeight: 80,
                          headingTextStyle: ShadTheme.of(
                            context,
                          ).textTheme.p.copyWith(fontWeight: FontWeight.w600),
                          columns: [
                            DataColumn(label: Text(Intls.to.dateAndTime)),
                            DataColumn(label: Text(Intls.to.items)),
                            DataColumn(label: Text(Intls.to.total)),
                            DataColumn(label: Text(Intls.to.actions)),
                          ],
                          rows: cartManager.listOfSaveOrder.map((order) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    Formatters.formatDate(
                                      order.createdAt.toDateTime(),
                                    ),
                                  ),
                                ),

                                DataCell(
                                  order.orderItems.isNotEmpty
                                      ? Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 250,
                                          ),
                                          child: Wrap(
                                            children:
                                                order.orderItems
                                                    .map((item) {
                                                      return Text(
                                                        '${item.quantity}x ${item.itemName}',
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
                                      order.orderPrices.grandTotal.toDouble(),
                                    ),
                                    style: ShadTheme.of(context).textTheme.large
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),

                                DataCell(
                                  ShadButton(
                                    onPressed: () =>
                                        cartManager.resumeOrder(order),
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
