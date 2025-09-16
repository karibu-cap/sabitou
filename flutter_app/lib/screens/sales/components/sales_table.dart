import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extensions.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/loading.dart';
import '../sales_controller.dart';
import 'search_and_filter.dart';

/// The products table view.
class SalesTable extends StatelessWidget {
  /// Constructs of new [SalesTable].
  const SalesTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SalesController>();

    return ShadCard(
      child: Column(
        children: [
          const SearchAndFilterCard(),
          StreamBuilder<List<Order>>(
            stream: controller.filteredOrdersStream,
            builder: (context, snapshot) {
              final orders = snapshot.data;
              if (!snapshot.hasData || orders == null) {
                return const Loading();
              }

              return Padding(
                padding: const EdgeInsets.all(20),
                child: orders.isEmpty
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
                      ),
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
        return ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: Scrollbar(
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
                  DataColumn(label: Text(Intls.to.orderId)),
                  DataColumn(label: Text(Intls.to.dateAndTime)),
                  DataColumn(label: Text(Intls.to.items)),
                  DataColumn(label: Text(Intls.to.total)),
                  DataColumn(label: Text(Intls.to.status)),
                  DataColumn(label: Text(Intls.to.actions)),
                ],
                rows: orders.map((order) {
                  return DataRow(
                    color: WidgetStatePropertyAll(
                      order.status == OrderStatus.ORDER_STATUS_COMPLETED
                          ? order.status.color.withValues(alpha: 0.05)
                          : AppColors.grey0,
                    ),

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
                            order.totalPrice.toDouble(),
                          ),
                          style: ShadTheme.of(context).textTheme.large.copyWith(
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        const ShadButton.ghost(
          child: Icon(LucideIcons.eye400, size: 15),
          // onPressed: () => _showOrderDialog(context, order),
        ),
        FutureBuilder(
          future: hasStorePermission(
            StoreResourceType.STORE_RESOURCE_TYPE_INVOICE,
            ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
          builder: (context, snapshot) {
            final canDelete = snapshot.data ?? false;
            if (!canDelete) {
              return const SizedBox.shrink();
            }

            return const ShadButton.ghost(
              child: Icon(LucideIcons.receipt400, size: 15),
              // onPressed: () => _showInvoiceDialog(context, order),
            );
          },
        ),
      ],
    );
  }
}
