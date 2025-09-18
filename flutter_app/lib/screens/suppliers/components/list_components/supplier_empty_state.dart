import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Empty state widget for when no suppliers exist.
class SupplierEmptyState extends StatelessWidget {
  /// Creates a new [SupplierEmptyState].
  const SupplierEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: theme.textTheme.muted.color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.fromBorderSide(
          BorderSide(color: theme.textTheme.muted.color ?? Colors.grey),
        ),
      ),
      child: Column(
        children: [
          Icon(LucideIcons.box, size: 48, color: theme.textTheme.muted.color),
          const SizedBox(height: 16),
          Text(
            intl.noSuppliersYet,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: theme.textTheme.muted.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            intl.addFirstSupplier,
            style: TextStyle(color: theme.textTheme.muted.color),
          ),
        ],
      ),
    );
  }
}
