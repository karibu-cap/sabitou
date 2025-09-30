import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/extensions.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/loading.dart';
import '../sales_controller.dart';

/// The products table view.
class SalesTable extends StatelessWidget {
  /// Constructs of new [SalesTable].
  const SalesTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SalesController>();

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intls.to.salesHistory,
                  style: ShadTheme.of(context).textTheme.h4,
                ),
                Text(
                  Intls.to.salesHistoryDescription,
                  style: ShadTheme.of(context).textTheme.muted,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          StreamBuilder<List<Order>>(
            stream: controller.filteredOrdersStream,
            builder: (context, snapshot) {
              final orders = snapshot.data;
              if (!snapshot.hasData || orders == null) {
                return const Loading();
              }

              return orders.isEmpty
                  ? Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(LucideIcons.wallet400, size: 50),
                        Text(Intls.to.noDataFound),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [_OrdersDataTable(orders: orders)],
                    );
            },
          ),
        ],
      ),
    );
  }
}

class _OrdersDataTable extends StatelessWidget {
  const _OrdersDataTable({required this.orders});

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Container(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: DataTable(
                horizontalMargin: 12,
                dataRowMaxHeight: 80,
                headingTextStyle: ShadTheme.of(
                  context,
                ).textTheme.lead.copyWith(fontWeight: FontWeight.w500),
                headingRowColor: WidgetStateProperty.all(
                  ShadTheme.of(context).colorScheme.secondary,
                ),
                columns: [
                  DataColumn(label: Text(Intls.to.orderId)),
                  DataColumn(label: Text(Intls.to.dateAndTime)),
                  DataColumn(label: Text(Intls.to.items)),
                  DataColumn(label: Text(Intls.to.total)),
                  DataColumn(label: Text(Intls.to.status)),
                  DataColumn(label: Text(Intls.to.actions)),
                ],
                rows: orders.map((order) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          'ID: #${order.refId.substring(0, 5)}',
                          style: ShadTheme.of(context).textTheme.large.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          Formatters.formatDate(order.createdAt.toDateTime()),
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
                                          .expand((c) => [c, const Text(', ')])
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
                          style: ShadTheme.of(context).textTheme.list.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      DataCell(_StatusCell(status: order.status)),
                      DataCell(_ActionsCell(order: order)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        status.label ?? '',
        style: theme.textTheme.muted.copyWith(
          color: AppColors.grey0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ActionsCell extends StatelessWidget {
  const _ActionsCell({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        ShadButton.ghost(
          child: Icon(LucideIcons.eye400, size: 15),
          // onPressed: () => _showOrderDialog(context, order),
        ),
        ShadButton.ghost(
          child: Icon(LucideIcons.receipt400, size: 15),
          // onPressed: () => _showInvoiceDialog(context, order),
        ),
      ],
    );
  }
}
