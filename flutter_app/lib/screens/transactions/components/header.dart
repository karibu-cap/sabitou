import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';
import '../transactions_controller.dart';

/// The transactions header
class TransactionsHeader extends StatelessWidget {
  /// Constructs of new [TransactionsHeader].
  const TransactionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final theme = ShadTheme.of(context);

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isDesktop ? 1 : 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Intls.to.transactions, style: theme.textTheme.h4),
              const SizedBox(height: 4),
              Text(
                Intls.to.transactionsDescription,
                style: theme.textTheme.muted,
              ),
            ],
          ),
        ),
        if (!isDesktop) const SizedBox(height: 16),
        Expanded(
          flex: isDesktop ? 1 : 0,
          child: Row(
            spacing: 8,
            children: [
              Flexible(
                child: ShadButton(
                  onPressed: () {},
                  leading: const Icon(LucideIcons.plus, size: 16),
                  child: Flexible(
                    child: AutoSizeText(
                      Intls.to.addTransaction,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 8,
                    ),
                  ),
                ),
              ),
              const Flexible(child: _DateRangeFilter()),
              const Flexible(child: _ExportData()),
            ],
          ),
        ),
      ],
    );
  }
}

class _DateRangeFilter extends StatelessWidget {
  const _DateRangeFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TransactionsController>();

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

class _ExportData extends StatelessWidget {
  const _ExportData();

  @override
  Widget build(BuildContext context) {
    return ShadButton.ghost(
      onPressed: () {},
      leading: const Icon(LucideIcons.download, size: 16),
      child: Text(Intls.to.export),
    );
  }
}
