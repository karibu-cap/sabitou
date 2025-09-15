import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions.dart';
import '../../../utils/responsive_utils.dart';
import '../sales_controller.dart';

/// The search and filter view.
class SearchAndFilterCard extends StatelessWidget {
  /// Constructs of new [SearchAndFilterCard].
  const SearchAndFilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Padding(
      padding: const EdgeInsets.all(20),
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
          const SizedBox(height: 16),
          Flex(
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
                    Expanded(child: _DateRangeFilter()),
                  ],
                ),
              ),
            ],
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
    final controller = context.read<SalesController>();

    return ShadInput(
      placeholder: Text(Intls.to.searchForOrder),
      leading: const Icon(LucideIcons.search, size: 16),
      onChanged: (value) => controller.searchQuery.add(value),
    );
  }
}

class _StatusFilter extends StatelessWidget {
  const _StatusFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SalesController>();

    return ShadSelect<OrderStatus?>(
      placeholder: AutoSizeText(
        Intls.to.status,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 8,
      ),
      initialValue: controller.selectedStatus.valueOrNull,
      options: [
        ...[
          OrderStatus.ORDER_STATUS_PENDING,
          OrderStatus.ORDER_STATUS_COMPLETED,
          OrderStatus.ORDER_STATUS_CANCELLED,
          OrderStatus.ORDER_STATUS_PROCESSING,
        ].map(
          (status) => ShadOption<OrderStatus?>(
            value: status,
            child: Text(
              status.label ?? Intls.to.status,
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
      onChanged: (value) {
        controller.selectedStatus.add(value);
      },
    );
  }
}

class _DateRangeFilter extends StatelessWidget {
  const _DateRangeFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SalesController>();

    return ShadDatePicker.range(
      height: 32,
      expands: true,
      placeholder: AutoSizeText(
        Intls.to.dateRange,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 8,
      ),
      allowDeselection: true,
      closeOnSelection: false,
      closeOnTapOutside: false,
      onRangeChanged: controller.selectedDateRange.add,
    );
  }
}
