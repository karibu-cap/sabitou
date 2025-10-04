import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../audits_controller.dart';

/// Header widget for the transactions screen
class TransactionHeader extends StatelessWidget {
  /// Constructs a new [TransactionHeader]
  const TransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppInternationalizationService.to.transactions,
                style: ShadTheme.of(context).textTheme.h3,
              ),
              const SizedBox(height: 4),
              Text(
                AppInternationalizationService
                    .to
                    .viewAndManageInventoryAndVoucherTransactions,
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ShadButton.outline(
          onPressed: () {
            context.read<AuditsController>().exportTransactions(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.download, size: 16),
              const SizedBox(width: 8),
              Text(AppInternationalizationService.to.export),
            ],
          ),
        ),
        const SizedBox(width: 8),
        ShadButton(
          onPressed: () {
            context.read<AuditsController>().refreshTransactions();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.refresh, size: 16),
              const SizedBox(width: 8),
              Text(AppInternationalizationService.to.refresh),
            ],
          ),
        ),
      ],
    );
  }
}
