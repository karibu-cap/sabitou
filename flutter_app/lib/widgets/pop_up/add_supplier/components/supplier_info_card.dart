import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Information card widget for supplier form.
class SupplierInfoCard extends StatelessWidget {
  /// Creates a new [SupplierInfoCard] widget.
  const SupplierInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;

    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(LucideIcons.info400, color: Colors.blue.shade600, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  intl.supplierInformation,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade800,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  intl.supplierInfoDescription,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue.shade700,
                    height: 1.3, // Line height for better readability
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
