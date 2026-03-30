import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../themes/app_theme.dart';

/// Collection of shimmer loading widgets for the suppliers module.
///
/// Provides consistent shimmer animations for different loading states
/// throughout the suppliers interface.
class SupplierShimmerWidgets {
  /// Creates a shimmer effect for the suppliers data table.
  static Widget buildTableShimmer() {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(milliseconds: 500),
      color: SabitouColors.shimmerBase,
      child: Column(
        children: [
          // Table header shimmer
          _buildTableHeaderShimmer(),
          const SizedBox(height: 8),

          // Table rows shimmer
          ...List.generate(5, (index) => _buildTableRowShimmer()),
        ],
      ),
    );
  }

  /// Builds a shimmer effect for the table header.
  static Widget _buildTableHeaderShimmer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: SabitouColors.shimmerBase,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 16,
              decoration: const BoxDecoration(
                color: SabitouColors.shimmerBase,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Container(
              height: 16,
              decoration: const BoxDecoration(
                color: SabitouColors.shimmerBase,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Container(
              height: 16,
              decoration: const BoxDecoration(
                color: SabitouColors.shimmerBase,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 16,
            decoration: const BoxDecoration(
              color: SabitouColors.shimmerBase,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a shimmer effect for table rows.
  static Widget _buildTableRowShimmer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 1),
      decoration: const BoxDecoration(
        color: SabitouColors.shimmerHighlight,
        border: Border(bottom: BorderSide(color: SabitouColors.neutral)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: SabitouColors.shimmerBase,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 12,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: SabitouColors.shimmerBase,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Container(
              height: 16,
              decoration: const BoxDecoration(
                color: SabitouColors.shimmerBase,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Container(
              height: 16,
              decoration: const BoxDecoration(
                color: SabitouColors.shimmerBase,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 32,
            decoration: const BoxDecoration(
              color: SabitouColors.shimmerBase,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
