import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';

/// The [EmptyDetailState].
class EmptyDetailState extends StatelessWidget {
  /// Constructor of [EmptyDetailState].
  const EmptyDetailState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: SabitouColors.accentSoft,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: const Icon(
              LucideIcons.receipt,
              size: 26,
              color: SabitouColors.accentForeground,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            Intls.to.selectBill,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            Intls.to.clickBillToSeeDetails,
            style: theme.textTheme.muted.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
