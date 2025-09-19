import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions.dart';
import '../../../utils/responsive_utils.dart';
import '../transactions_controller.dart';

/// The search and filter view.
class SearchAndFilterCard extends StatelessWidget {
  /// Constructs of new [SearchAndFilterCard].
  const SearchAndFilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return ShadCard(
      padding: const EdgeInsets.all(24),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Expanded(flex: isMobile ? 0 : 2, child: const _SearchInput()),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: const Row(
              spacing: 12,
              children: [
                Expanded(child: _StatusFilter()),
                Expanded(child: _TypeFilter()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TransactionsController>();

    return ShadInput(
      placeholder: Text(Intls.to.searchForTransaction),
      leading: const Icon(LucideIcons.search, size: 16),
      onChanged: controller.searchQuery.add,
    );
  }
}

class _StatusFilter extends StatelessWidget {
  const _StatusFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TransactionsController>();

    return ShadSelect<TransactionStatus?>(
      placeholder: AutoSizeText(
        Intls.to.status,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 8,
      ),
      initialValue: controller.selectedStatus.valueOrNull,
      options: [
        ...[
          TransactionStatus.TRANSACTION_STATUS_PENDING,
          TransactionStatus.TRANSACTION_STATUS_COMPLETED,
          TransactionStatus.TRANSACTION_STATUS_CANCELLED,
          TransactionStatus.TRANSACTION_STATUS_FAILED,
        ].map(
          (status) => ShadOption<TransactionStatus?>(
            value: status,
            child: Text(
              status.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
      selectedOptionBuilder: (context, value) => AutoSizeText(
        value?.label ?? Intls.to.status,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 8,
      ),
      allowDeselection: true,
      onChanged: controller.selectedStatus.add,
    );
  }
}

class _TypeFilter extends StatelessWidget {
  const _TypeFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TransactionsController>();

    return ShadSelect<TransactionType?>(
      placeholder: AutoSizeText(
        Intls.to.type,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 8,
      ),
      initialValue: controller.selectedType.valueOrNull,
      options: [
        ...[
          TransactionType.TRANSACTION_TYPE_SALE,
          TransactionType.TRANSACTION_TYPE_REFUND,
          TransactionType.TRANSACTION_TYPE_PURCHASE,
          TransactionType.TRANSACTION_TYPE_ADJUSTMENT,
        ].map(
          (type) => ShadOption<TransactionType?>(
            value: type,
            child: Text(
              type.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
      selectedOptionBuilder: (context, value) => AutoSizeText(
        value?.label ?? Intls.to.type,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 8,
      ),
      allowDeselection: true,
      onChanged: controller.selectedType.add,
    );
  }
}
