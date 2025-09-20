import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/extensions.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/loading.dart';
import '../transactions_controller.dart';

/// The transactions table.
class TransactionsTable extends StatelessWidget {
  /// Constructs of new [TransactionsTable].
  const TransactionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TransactionsController>();

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
                  Intls.to.transactionsHistory,
                  style: ShadTheme.of(context).textTheme.h4,
                ),
                Text(
                  Intls.to.transactionsHistoryDescription,
                  style: ShadTheme.of(context).textTheme.muted,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          StreamBuilder<List<Transaction>>(
            stream: controller.filteredTransactionsStream,
            builder: (context, snapshot) {
              final transactions = snapshot.data;
              if (!snapshot.hasData || transactions == null) {
                return const Loading();
              }

              return transactions.isEmpty
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
                      children: [
                        _TransactionsDataTable(transactions: transactions),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}

class _TransactionsDataTable extends StatelessWidget {
  const _TransactionsDataTable({required this.transactions});

  final List<Transaction> transactions;

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
                  DataColumn(label: Text(Intls.to.transaction)),
                  DataColumn(label: Text(Intls.to.type)),
                  DataColumn(label: Text(Intls.to.amount)),
                  DataColumn(label: Text(Intls.to.status)),
                  DataColumn(label: Text(Intls.to.description)),
                  DataColumn(label: Text(Intls.to.initiatedBy)),
                  DataColumn(label: Text(Intls.to.order)),
                  DataColumn(label: Text(Intls.to.date)),
                ],
                rows: transactions.map((transaction) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          'ID: #${transaction.refId.substring(0, 5)}',
                          style: ShadTheme.of(context).textTheme.large.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      DataCell(_TypeCell(type: transaction.type)),

                      DataCell(
                        transaction.hasAmount() && transaction.amount > 0
                            ? Text(
                                Formatters.formatCurrency(transaction.amount),
                                style: ShadTheme.of(context).textTheme.list
                                    .copyWith(
                                      color:
                                          transaction.type ==
                                              TransactionType
                                                  .TRANSACTION_TYPE_REFUND
                                          ? AppColors.red
                                          : AppColors.dartGreen,
                                    ),
                              )
                            : const Text('N/A'),
                      ),
                      DataCell(_StatusCell(status: transaction.status)),

                      DataCell(
                        Container(
                          constraints: const BoxConstraints(maxWidth: 200),
                          child: Text(
                            transaction.description,
                            style: ShadTheme.of(context).textTheme.muted,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      DataCell(
                        FutureProvider<User?>(
                          create: (context) => context
                              .read<TransactionsController>()
                              .getCurrentUser(transaction.initiatedBy),
                          initialData: null,
                          child: Consumer<User?>(
                            builder: (context, user, child) {
                              if (user == null) {
                                return const SizedBox.shrink();
                              }

                              return Text(user.firstName);
                            },
                          ),
                        ),
                      ),
                      DataCell(
                        transaction.hasOrderId()
                            ? Text(
                                'ID: #${transaction.orderId.substring(0, 5)}',
                                style: ShadTheme.of(context).textTheme.large,
                              )
                            : const Text('N/A'),
                      ),
                      DataCell(
                        Text(
                          Formatters.formatDate(
                            transaction.createdAt.toDateTime(),
                          ),
                          style: ShadTheme.of(context).textTheme.muted,
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
    );
  }
}

class _TypeCell extends StatelessWidget {
  const _TypeCell({required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        switch (type) {
          TransactionType.TRANSACTION_TYPE_SALE => const Icon(
            LucideIcons.arrowUpRight400,
            color: AppColors.dartGreen,
            size: 15,
          ),
          TransactionType.TRANSACTION_TYPE_PURCHASE => const Icon(
            LucideIcons.arrowDownRight400,
            color: AppColors.purple,
            size: 15,
          ),
          TransactionType.TRANSACTION_TYPE_REFUND => const Icon(
            LucideIcons.refreshCcw400,
            color: AppColors.red,
            size: 15,
          ),
          TransactionType.TRANSACTION_TYPE_ADJUSTMENT => const Icon(
            LucideIcons.arrowUpDown400,
            color: AppColors.warning500,
            size: 15,
          ),
          _ => const SizedBox.shrink(),
        },
        switch (type) {
          TransactionType.TRANSACTION_TYPE_SALE => ShadBadge(
            backgroundColor: AppColors.dartGreen,
            child: Text(type.label.toUpperCase()),
          ),
          TransactionType.TRANSACTION_TYPE_PURCHASE => ShadBadge.secondary(
            child: Text(type.label.toUpperCase()),
          ),
          TransactionType.TRANSACTION_TYPE_REFUND => ShadBadge.destructive(
            child: Text(type.label.toUpperCase()),
          ),
          TransactionType.TRANSACTION_TYPE_ADJUSTMENT => ShadBadge(
            backgroundColor: AppColors.warning500,
            child: Text(type.label.toUpperCase()),
          ),
          _ => const SizedBox.shrink(),
        },
      ],
    );
  }
}

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.status});

  final TransactionStatus status;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      TransactionStatus.TRANSACTION_STATUS_COMPLETED => ShadBadge(
        backgroundColor: AppColors.dartGreen,
        child: Text(status.label.toUpperCase()),
      ),
      TransactionStatus.TRANSACTION_STATUS_FAILED => ShadBadge.destructive(
        child: Text(status.label.toUpperCase()),
      ),
      TransactionStatus.TRANSACTION_STATUS_CANCELLED => ShadBadge.destructive(
        child: Text(status.label.toUpperCase()),
      ),
      TransactionStatus.TRANSACTION_STATUS_PENDING => ShadBadge(
        backgroundColor: AppColors.warning500,
        child: Text(status.label.toUpperCase()),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}
