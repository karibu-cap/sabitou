import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/extensions/inventory_extenxions.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/app_table.dart';
import '../purchase_orders_controller.dart';
import 'cancel_order_form.dart';
import 'receive_note_form.dart';

/// The purchase orders table view.
class PurchaseOrderTable extends StatelessWidget {
  /// Constructs a new [PurchaseOrderTable].
  const PurchaseOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PurchaseOrdersController>();

    return ShadCard(
      padding: EdgeInsets.zero,
      radius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: StreamBuilder<List<PurchaseOrder>>(
        stream: controller.filteredPurchaseOrdersStream,
        builder: (context, snapshot) {
          final purchaseOrders = snapshot.data;
          if (!snapshot.hasData || purchaseOrders == null) {
            return Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          return purchaseOrders.isEmpty
              ? Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: [
                            const Icon(
                              LucideIcons.shoppingCart400,
                              size: 48,
                              color: AppColors.darkMutedForeground,
                            ),
                            Text(
                              Intls.to.purchaseOrdersNotFound,
                              style: ShadTheme.of(context).textTheme.muted,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : _PurchaseOrderDataTable(orders: purchaseOrders);
        },
      ),
    );
  }
}

class _PurchaseOrderDataTable extends StatelessWidget {
  const _PurchaseOrderDataTable({required this.orders});

  final List<PurchaseOrder> orders;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PurchaseOrdersController>();

    return AppTable(
      child: DataTable(
        columns: [
          DataColumn(label: Text(Intls.to.orderId)),
          DataColumn(label: Text(Intls.to.supplier)),
          DataColumn(label: Text(Intls.to.status)),
          DataColumn(label: Text(Intls.to.total)),
          DataColumn(label: Text(Intls.to.expectedDeliveryDate)),
          DataColumn(label: Text(Intls.to.createAt)),
          DataColumn(label: Text(Intls.to.actions)),
        ],
        rows: orders.map((order) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  order.documentId,
                  style: ShadTheme.of(
                    context,
                  ).textTheme.list.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              DataCell(_SupplierCell(order: order)),
              DataCell(_StatusCell(order: order)),
              DataCell(
                Text(
                  Formatters.formatCurrency(order.totalAmount),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataCell(
                Text(
                  order.hasExpectedDeliveryDate()
                      ? Formatters.formatDate(
                          order.expectedDeliveryDate.toDateTime(),
                        )
                      : 'N/A',
                ),
              ),
              DataCell(
                Text(Formatters.formatDate(order.createdAt.toDateTime())),
              ),
              DataCell(_ActionsCell(order: order, controller: controller)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _SupplierCell extends StatelessWidget {
  const _SupplierCell({required this.order});

  final PurchaseOrder order;

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseOrdersController>(
      builder: (context, controller, child) {
        return StreamBuilder<UnmodifiableListView<Supplier>>(
          stream: controller.suppliersSubject,
          builder: (context, snapshot) {
            final suppliers = snapshot.data ?? UnmodifiableListView([]);
            final supplier = suppliers.firstWhere(
              (s) => s.refId == order.supplierId,
              orElse: Supplier.new,
            );

            return Text(
              supplier.name.isNotEmpty ? supplier.name : 'Unknown Supplier',
              style: const TextStyle(fontSize: 14),
            );
          },
        );
      },
    );
  }
}

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.order});

  final PurchaseOrder order;

  @override
  Widget build(BuildContext context) {
    return ShadBadge(
      backgroundColor: order.status.color.withValues(alpha: 0.05),
      hoverBackgroundColor: order.status.color.withValues(alpha: 0.1),
      child: Text(
        order.status.label ?? '',
        style: ShadTheme.of(context).textTheme.list.copyWith(
          color: order.status.color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ActionsCell extends StatelessWidget {
  const _ActionsCell({required this.order, required this.controller});

  final PurchaseOrder order;
  final PurchaseOrdersController controller;

  @override
  Widget build(BuildContext context) {
    void _showCancelDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) =>
            CancelOrderForm(order: order, controller: controller),
      );
    }

    void _showReceiveDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => ReceiveNoteForm(
          purchaseOrdersController: controller,
          purchaseOrder: order,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        if ([
          PurchaseOrderStatus.PO_STATUS_PENDING,
          PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED,
        ].contains(order.status))
          Tooltip(
            message: Intls.to.receivePurchaseOrder,
            child: IconButton(
              onPressed: () => _showReceiveDialog(context),
              icon: const Icon(Icons.local_shipping, color: AppColors.cobalt),
            ),
          ),
        if (order.status != PurchaseOrderStatus.PO_STATUS_CANCELLED)
          Tooltip(
            message: Intls.to.cancelPurchaseOrder,
            child: IconButton(
              onPressed: () => _showCancelDialog(context),
              icon: const Icon(LucideIcons.x400, color: AppColors.red),
            ),
          ),
      ],
    );
  }
}
