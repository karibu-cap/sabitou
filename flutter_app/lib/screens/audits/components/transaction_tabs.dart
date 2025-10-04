import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../audits_controller.dart';

/// Tab widget for switching between inventory and voucher transactions
class TransactionTabs extends StatelessWidget {
  /// Constructs a new [TransactionTabs]
  const TransactionTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuditsController>();
    final activeTab = controller.activeTab;

    return const Expanded(child: ShadCard(child: _TransactionList()));
  }
}

/// List widget for transactions
class _TransactionList<T> extends StatelessWidget {
  const _TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuditsController>();

    final transactions = [
      ...controller.filteredInventoryTransactions,
      ...controller.filteredVoucherTransactions,
    ];
    if (transactions.isEmpty) {
      return const _EmptyTransactionState();
    }

    return ListView.separated(
      itemCount: transactions.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final transaction = transactions[index];

        return switch (transaction) {
          InventoryTransaction() => _TransactionCard<InventoryTransaction>(
            transaction: transaction,
            onTap: () => controller.onTransactionTap(context, transaction),
          ),
          VoucherTransaction() => _TransactionCard<VoucherTransaction>(
            transaction: transaction,
            onTap: () => controller.onTransactionTap(context, transaction),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

/// Card widget for individual transaction
class _TransactionCard<T> extends StatelessWidget {
  final T transaction;
  final VoidCallback onTap;

  const _TransactionCard({required this.transaction, required this.onTap});

  @override
  Widget build(BuildContext context) {
    String _getTransactionDocumentId() {
      if (transaction is InventoryTransaction) {
        return (transaction as InventoryTransaction).documentId;
      } else if (transaction is VoucherTransaction) {
        return (transaction as VoucherTransaction).documentId;
      }

      return 'N/A';
    }

    String _getTransactionTypeLabel() {
      if (transaction is InventoryTransaction) {
        return _getInventoryTransactionTypeString(
          (transaction as InventoryTransaction).transactionType,
        );
      } else if (transaction is VoucherTransaction) {
        return Intls.to.voucher;
      }

      return Intls.to.unspecified;
    }

    String _getTransactionAmount() {
      if (transaction is InventoryTransaction) {
        final inventoryTransaction = transaction as InventoryTransaction;

        return inventoryTransaction.quantityChange.toString();
      } else if (transaction is VoucherTransaction) {
        final voucherTransaction = transaction as VoucherTransaction;

        return voucherTransaction.amountUsed.toString();
      }

      return '0';
    }

    String _getTransactionDate() {
      if (transaction is InventoryTransaction) {
        final inventoryTransaction = transaction as InventoryTransaction;

        return inventoryTransaction.transactionTime.toString().split(' ')[0];
      } else if (transaction is VoucherTransaction) {
        final voucherTransaction = transaction as VoucherTransaction;

        return voucherTransaction.usedAt.toString().split(' ')[0];
      }

      return 'N/A';
    }

    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('sabitou'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  style: ShadTheme.of(context).textTheme.large,
                  '${Intls.to.transactionId}: ${_getTransactionDocumentId()}',
                ),
                Text(
                  '${Intls.to.type}: ${_getTransactionTypeLabel()}',
                  style: ShadTheme.of(context).textTheme.muted,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${Intls.to.amount}: ${_getTransactionAmount()}',
              style: ShadTheme.of(context).textTheme.p,
            ),
            const SizedBox(height: 4),
            Text(
              '${Intls.to.date}: ${_getTransactionDate()}',
              style: ShadTheme.of(context).textTheme.muted,
            ),
            const SizedBox(height: 8),
            _TransactionSpecificInfo<T>(transaction: transaction),
          ],
        ),
      ),
    );
  }

  String _getInventoryTransactionTypeString(TransactionType type) {
    switch (type) {
      case TransactionType.TXN_TYPE_PURCHASE:
        return Intls.to.purchase;
      case TransactionType.TXN_TYPE_SALE:
        return Intls.to.sale;
      case TransactionType.TXN_TYPE_RETURN_IN:
        return 'Return In';
      case TransactionType.TXN_TYPE_RETURN_OUT:
        return 'Return Out';
      case TransactionType.TXN_TYPE_TRANSFER_OUT:
        return Intls.to.transfer;
      case TransactionType.TXN_TYPE_TRANSFER_IN:
        return 'Transfer In';
      case TransactionType.TXN_TYPE_ADJUSTMENT:
        return Intls.to.adjustment;
      case TransactionType.TXN_TYPE_DAMAGE:
        return 'Damage';
      case TransactionType.TXN_TYPE_THEFT:
        return 'Theft';
      case TransactionType.TXN_TYPE_INITIAL:
        return 'Initial';
      case TransactionType.TXN_TYPE_EXPIRATION:
        return 'Expiration';
      case TransactionType.TXN_TYPE_UNSPECIFIED:
      default:
        return Intls.to.unspecified;
    }
  }
}

/// Empty state widget when no transactions are found
class _EmptyTransactionState extends StatelessWidget {
  const _EmptyTransactionState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long,
            size: 64,
            color: ShadTheme.of(context).colorScheme.mutedForeground,
          ),
          const SizedBox(height: 16),
          Text(
            'No transactions found',
            style: ShadTheme.of(context).textTheme.h4,
          ),
          const SizedBox(height: 8),
          Text(
            'No transactions match your current filters.',
            style: ShadTheme.of(context).textTheme.muted,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _TransactionSpecificInfo<T> extends StatelessWidget {
  final T transaction;

  const _TransactionSpecificInfo({required this.transaction});

  @override
  Widget build(BuildContext context) {
    if (transaction is InventoryTransaction) {
      final inventoryTransaction = transaction as InventoryTransaction;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${Intls.to.productId}: ${inventoryTransaction.productId}'),
          Text('${Intls.to.quantity}: ${inventoryTransaction.quantityChange}'),
        ],
      );
    } else if (transaction is VoucherTransaction) {
      final voucherTransaction = transaction as VoucherTransaction;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${Intls.to.voucherId}: ${voucherTransaction.voucherId}'),
          Text('${Intls.to.usedBy}: ${voucherTransaction.usedByUserId}'),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
