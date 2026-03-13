import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/formatters.dart';
import '../../../../widgets/shad_data_grid.dart';

/// Transactions tab showing filtered transaction history.
class TransactionsTab extends StatelessWidget {
  /// The inventory item.
  final InventoryLevelWithProduct item;

  /// List of transactions for this item.
  final List<InventoryTransaction> transactions;

  /// Selected transaction filter.
  final Stream<TransactionType?> transactionFilterStream;

  /// Updates the transaction filter.
  final void Function(TransactionType) updateTransactionFilter;

  /// Constructs a new [TransactionsTab].
  const TransactionsTab({
    required this.item,
    required this.transactions,
    required this.transactionFilterStream,
    required this.updateTransactionFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<InventoryTransaction> _getFilteredTransactions(
      TransactionType? selectedFilter,
    ) {
      if (selectedFilter == null) {
        return transactions;
      }

      return transactions
          .where((t) => t.transactionType == selectedFilter)
          .toList();
    }

    return StreamBuilder<TransactionType?>(
      stream: transactionFilterStream,
      builder: (context, snapshot) {
        final selectedFilter = snapshot.data;
        final filteredTransactions = _getFilteredTransactions(selectedFilter);

        return LayoutBuilder(
          builder: (context, constraints) {
            final hasBoundedHeight = constraints.maxHeight.isFinite;
            final content = _TransactionTable(
              filteredTransactions: filteredTransactions,
              selectedFilter: selectedFilter,
            );

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Filter Buttons
                Row(
                  spacing: AppConstants.spacingS,
                  children: [
                    _FilterChip(
                      label: Intls.to.salesOrders,
                      isSelected:
                          selectedFilter == TransactionType.TXN_TYPE_SALE,
                      onTap: () => updateTransactionFilter(
                        TransactionType.TXN_TYPE_SALE,
                      ),
                    ),
                    _FilterChip(
                      label: Intls.to.purchaseOrders,
                      isSelected:
                          selectedFilter == TransactionType.TXN_TYPE_PURCHASE,
                      onTap: () => updateTransactionFilter(
                        TransactionType.TXN_TYPE_PURCHASE,
                      ),
                    ),
                    _FilterChip(
                      label: Intls.to.adjustments,
                      isSelected:
                          selectedFilter == TransactionType.TXN_TYPE_ADJUSTMENT,
                      onTap: () => updateTransactionFilter(
                        TransactionType.TXN_TYPE_ADJUSTMENT,
                      ),
                    ),
                  ],
                ),
                if (hasBoundedHeight)
                  Expanded(child: content)
                else
                  SingleChildScrollView(child: content),
              ],
            );
          },
        );
      },
    );
  }
}

class _TransactionTable extends StatelessWidget {
  const _TransactionTable({
    required this.filteredTransactions,
    required this.selectedFilter,
  });

  final List<InventoryTransaction> filteredTransactions;
  final TransactionType? selectedFilter;

  String _getTransactionTypeLabel(TransactionType type) {
    switch (type) {
      case TransactionType.TXN_TYPE_SALE:
        return Intls.to.salesOrders;
      case TransactionType.TXN_TYPE_PURCHASE:
        return Intls.to.purchaseOrders;
      case TransactionType.TXN_TYPE_ADJUSTMENT:
        return Intls.to.adjustments;
      case TransactionType.TXN_TYPE_UNSPECIFIED:
      default:
        return Intls.to.unspecified;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    // Common columns
    final dateColumn = ShadDataGridColumn(label: Intls.to.date);

    // Build columns based on filter
    List<ShadDataGridColumn> columns;
    if (selectedFilter == TransactionType.TXN_TYPE_SALE) {
      columns = [
        dateColumn,
        ShadDataGridColumn(label: Intls.to.salesOrder),
        ShadDataGridColumn(label: Intls.to.quantitySold),
        ShadDataGridColumn(label: Intls.to.price),
        ShadDataGridColumn(label: Intls.to.total),
      ];
    } else if (selectedFilter == TransactionType.TXN_TYPE_PURCHASE) {
      columns = [
        dateColumn,
        ShadDataGridColumn(label: Intls.to.purchaseOrder),
        ShadDataGridColumn(label: Intls.to.supplier),
        ShadDataGridColumn(label: Intls.to.quantityReceived),
        ShadDataGridColumn(label: Intls.to.costPrice),
        ShadDataGridColumn(label: Intls.to.total),
      ];
    } else if (selectedFilter == TransactionType.TXN_TYPE_ADJUSTMENT) {
      columns = [
        dateColumn,
        ShadDataGridColumn(label: Intls.to.adjustmentId),
        ShadDataGridColumn(label: Intls.to.quantityChange),
        ShadDataGridColumn(label: Intls.to.reason),
      ];
    } else {
      // All transactions
      columns = [
        dateColumn,
        ShadDataGridColumn(label: Intls.to.type),
        ShadDataGridColumn(label: Intls.to.documentId),
        ShadDataGridColumn(label: Intls.to.quantityChange),
        ShadDataGridColumn(label: Intls.to.notes),
      ];
    }

    if (filteredTransactions.isEmpty) {
      return Center(
        child: Text(
          Intls.to.noTransactionsFound,
          style: theme.textTheme.p.copyWith(
            color: theme.colorScheme.ring.withValues(alpha: 0.5),
          ),
        ),
      );
    }

    return ShadDataGrid<InventoryTransaction>(
      expanded: true,
      columns: columns,
      data: filteredTransactions,
      rowBuilder: (transaction) {
        if (selectedFilter == TransactionType.TXN_TYPE_SALE) {
          return [
            _TransactionCell(
              Formatters.formatDate(transaction.transactionTime.toDateTime()),
              style: theme.textTheme.small,
            ),
            _TransactionCell(
              transaction.relatedDocumentId,
              style: theme.textTheme.small,
            ),

            _TransactionCell(
              transaction.quantityChange.abs().toString(),
              style: theme.textTheme.small,
            ),
            _TransactionCell(
              Formatters.formatCurrency(transaction.unitPrice),
              style: theme.textTheme.small,
            ),
            _TransactionCell(
              Formatters.formatCurrency(transaction.totalAmount),
              style: theme.textTheme.small,
            ),
          ];
        }
        if (selectedFilter == TransactionType.TXN_TYPE_PURCHASE) {
          return [
            _TransactionCell(
              Formatters.formatDate(transaction.transactionTime.toDateTime()),
              style: theme.textTheme.small,
            ),
            _TransactionCell(
              transaction.relatedDocumentId,
              style: theme.textTheme.small,
            ),
            _TransactionCell(transaction.notes, style: theme.textTheme.small),
            _TransactionCell(
              transaction.quantityChange.toString(),
              style: theme.textTheme.small,
            ),
            _TransactionCell(
              Formatters.formatCurrency(transaction.unitPrice),
              style: theme.textTheme.small,
            ),
            _TransactionCell(
              Formatters.formatCurrency(transaction.totalAmount),
              style: theme.textTheme.small,
            ),
          ];
        }
        if (selectedFilter == TransactionType.TXN_TYPE_ADJUSTMENT) {
          return [
            _TransactionCell(
              Formatters.formatDate(transaction.transactionTime.toDateTime()),
              style: theme.textTheme.small,
            ),
            _TransactionCell(
              transaction.documentId,
              style: theme.textTheme.small,
            ),
            _TransactionCell(
              transaction.quantityChange.toString(),
              style: theme.textTheme.small.copyWith(
                color: transaction.quantityChange > 0
                    ? AppColors.dartGreen
                    : AppColors.red,
              ),
            ),
            _TransactionCell(transaction.notes, style: theme.textTheme.small),
          ];
        }

        // Default case for "All transactions" view
        return [
          _TransactionCell(
            Formatters.formatDate(transaction.transactionTime.toDateTime()),
            style: theme.textTheme.small,
          ),
          _TransactionCell(
            _getTransactionTypeLabel(transaction.transactionType),
            style: theme.textTheme.small,
          ),
          _TransactionCell(
            transaction.documentId,
            style: theme.textTheme.small,
          ),
          _TransactionCell(
            transaction.quantityChange.toString(),
            style: theme.textTheme.small.copyWith(
              color: transaction.quantityChange > 0
                  ? AppColors.dartGreen
                  : AppColors.red,
            ),
          ),
          _TransactionCell(transaction.notes, style: theme.textTheme.small),
        ];
      },
    );
  }
}

class _TransactionCell extends StatelessWidget {
  const _TransactionCell(this.value, {required this.style});

  final String value;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(value, style: style),
      ),
    );
  }
}

/// Builds a filter chip button.
class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return FilterChip(
      label: Text(label),
      labelStyle: theme.textTheme.muted.copyWith(
        color: isSelected
            ? theme.colorScheme.primaryForeground
            : theme.colorScheme.primary,
      ),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: theme.colorScheme.primaryForeground,
      selectedColor: theme.colorScheme.primary,
      checkmarkColor: theme.colorScheme.primaryForeground,
    );
  }
}
