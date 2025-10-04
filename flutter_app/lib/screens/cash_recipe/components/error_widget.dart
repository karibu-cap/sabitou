import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../cash_recipe_controller.dart';

/// Error cash receipt widget.
class ErrorWidget extends StatelessWidget {
  /// The error message.
  final String error;

  /// Constructs of new [ErrorWidget].
  const ErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CashRecipeController>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            LucideIcons.circleAlert400,
            size: 64,
            color: AppColors.error500,
          ),
          const SizedBox(height: 16),
          Text(
            Intls.to.errorLoadingCashReceipts,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: ShadTheme.of(context).textTheme.muted,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ShadButton(
            onPressed: controller.loadCashReceipts,
            child: Text(Intls.to.retry),
          ),
        ],
      ),
    );
  }
}
