import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions/global_product_extension.dart';
import 'detail_tabs/history_tab.dart';
import 'detail_tabs/overview_tab.dart';
import 'detail_tabs/transactions_tab.dart';

/// Detail view for an inventory item showing overview, transactions, and history.
class InventoryDetailView extends StatelessWidget {
  /// The inventory item to display details for.
  final InventoryLevelWithProduct item;

  /// Callback when adjust stock button is pressed.
  final VoidCallback? onAdjustStock;

  /// Callback when close button is pressed.
  final VoidCallback? onClose;

  /// List of transactions for this item.
  final List<InventoryTransaction> transactions;

  /// Stream of selected transaction filter.
  final Stream<TransactionType?> transactionFilterStream;

  /// Updates the transaction filter.
  final void Function(TransactionType) updateTransactionFilter;

  /// Constructs a new [InventoryDetailView].
  const InventoryDetailView({
    required this.item,
    required this.transactions,
    required this.transactionFilterStream,
    required this.updateTransactionFilter,
    this.onAdjustStock,
    this.onClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppConstants.spacingM),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.globalProduct.label,
                      style: theme.textTheme.table.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (onAdjustStock != null)
                    ShadButton(
                      onPressed: onAdjustStock,
                      child: Text(Intls.to.adjustStock),
                    ),
                  const SizedBox(width: AppConstants.spacingS),
                  if (onClose != null)
                    IconButton(
                      icon: const Icon(LucideIcons.x400),
                      onPressed: onClose,
                      tooltip: Intls.to.close,
                    ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: ShadTabs<String>(
            value: Intls.to.overview,
            tabs: [
              ShadTab(
                value: Intls.to.overview,
                expandContent: true,
                content: ShadCard(child: OverviewTab(item: item)),
                child: Text(Intls.to.overview),
              ),
              ShadTab(
                value: Intls.to.transactions,
                expandContent: true,
                content: ShadCard(
                  child: TransactionsTab(
                    item: item,
                    transactions: transactions,
                    transactionFilterStream: transactionFilterStream,
                    updateTransactionFilter: updateTransactionFilter,
                  ),
                ),
                child: Text(Intls.to.transactions),
              ),
              ShadTab(
                value: Intls.to.history,
                expandContent: true,
                content: ShadCard(child: HistoryTab(item: item)),
                child: Text(Intls.to.history),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
