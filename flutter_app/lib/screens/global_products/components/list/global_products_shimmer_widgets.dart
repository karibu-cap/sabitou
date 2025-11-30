import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../themes/app_colors.dart';

/// Collection of shimmer loading widgets for the global products module.
///
/// Provides consistent shimmer animations for different loading states
/// throughout the global products interface.
class GlobalProductsShimmerWidgets {
  /// Creates a shimmer effect for the global products data table.
  static Widget buildTableShimmer() {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(milliseconds: 500),
      color: AppColors.primary100,
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

  /// Creates a shimmer effect for the global products statistics grid.
  static Widget buildStatsShimmer() {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(milliseconds: 500),
      color: AppColors.primary100,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
        children: List.generate(4, (index) => _buildStatCardShimmer()),
      ),
    );
  }

  /// Creates a shimmer effect for individual global product cards.
  static Widget buildGlobalProductCardShimmer() {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(milliseconds: 500),
      color: AppColors.primary100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 16,
                width: 150,
                decoration: const BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 16,
                width: 100,
                decoration: const BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Creates a shimmer effect for the global products list header.
  static Widget buildHeaderShimmer(bool isMobile) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(milliseconds: 500),
      color: AppColors.primary100,
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24,
            width: 200,
            decoration: const BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          Container(
            height: 36,
            width: 120,
            decoration: const BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a shimmer effect for the table header.
  static Widget _buildTableHeaderShimmer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 16,
              decoration: const BoxDecoration(
                color: AppColors.primary100,
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
                color: AppColors.primary100,
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
                color: AppColors.primary100,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 16,
            decoration: const BoxDecoration(
              color: AppColors.primary100,
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
        color: Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.primary50)),
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
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 12,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: AppColors.primary100,
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
                color: AppColors.primary100,
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
                color: AppColors.primary100,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a shimmer effect for stat cards.
  static Widget _buildStatCardShimmer() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 24,
              width: 60,
              decoration: const BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 16,
              width: 100,
              decoration: const BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
