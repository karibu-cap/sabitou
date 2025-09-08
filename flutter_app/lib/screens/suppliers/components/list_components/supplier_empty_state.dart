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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: const Border.fromBorderSide(BorderSide(color: Colors.grey)),
      ),
      child: Column(
        children: [
          const Icon(LucideIcons.box, size: 48, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            intl.noSuppliersYet,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            intl.addFirstSupplier,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
