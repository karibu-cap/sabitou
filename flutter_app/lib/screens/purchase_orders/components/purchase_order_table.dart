import 'dart:collection';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/extensions/inventory_extenxions.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/shad_data_grid.dart';
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
    final theme = ShadTheme.of(context);

    return ShadDataGrid<PurchaseOrder>(
      data: orders,
      rowsPerPage: 2,
      footerFrozenColumnsCount: 1,
      columns: [
        ShadDataGridColumn(label: Intls.to.orderId, width: 180),
        ShadDataGridColumn(label: Intls.to.supplier, width: 150),
        ShadDataGridColumn(label: Intls.to.status, width: 120),
        ShadDataGridColumn(label: Intls.to.total, width: 120),
        ShadDataGridColumn(label: Intls.to.expectedDeliveryDate, width: 180),
        ShadDataGridColumn(label: Intls.to.createAt, width: 160),
        ShadDataGridColumn(label: Intls.to.actions, width: 180),
      ],
      rowBuilder: (order) {
        return [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              order.documentId,
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _SupplierCell(order: order),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _StatusCell(order: order),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerRight,
            child: Text(
              Formatters.formatCurrency(order.totalAmount),
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              order.hasExpectedDeliveryDate()
                  ? Formatters.formatDate(
                      order.expectedDeliveryDate.toDateTime(),
                    )
                  : 'N/A',
              style: theme.textTheme.small.copyWith(
                color: theme.colorScheme.mutedForeground,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              Formatters.formatDate(order.createdAt.toDateTime()),
              style: theme.textTheme.small,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _ActionsCell(
              order: order,
              controller: context.read<PurchaseOrdersController>(),
            ),
          ),
        ];
      },
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
              style: ShadTheme.of(context).textTheme.small,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
    final theme = ShadTheme.of(context);

    return ShadBadge(
      backgroundColor: order.status.color.withValues(alpha: 0.1),
      hoverBackgroundColor: order.status.color.withValues(alpha: 0.15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      shape: const StadiumBorder(),
      child: Text(
        order.status.label ?? '',
        style: theme.textTheme.small.copyWith(
          color: order.status.color,
          fontWeight: FontWeight.w600,
          fontSize: 11,
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
      spacing: 12,
      children: [
        if ([
          PurchaseOrderStatus.PO_STATUS_PENDING,
          PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED,
        ].contains(order.status))
          Flexible(
            child: ShadButton(
              padding: const EdgeInsets.all(2),
              onPressed: () => _showReceiveDialog(context),
              child: Expanded(
                child: AutoSizeText(Intls.to.save, maxLines: 1, minFontSize: 8),
              ),
            ),
          ),

        if (order.status != PurchaseOrderStatus.PO_STATUS_CANCELLED)
          Flexible(
            child: ShadButton.destructive(
              padding: const EdgeInsets.all(2),
              onPressed: () => _showCancelDialog(context),
              child: Expanded(
                child: AutoSizeText(
                  Intls.to.cancel,
                  maxLines: 1,
                  minFontSize: 8,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
