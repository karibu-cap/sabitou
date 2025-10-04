import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../cash_recipe_controller.dart';

/// Search and filter component for cash receipts
class CashRecipeSearchAndFilter extends StatefulWidget {
  /// Constructor for CashRecipeSearchAndFilter
  const CashRecipeSearchAndFilter({super.key});

  @override
  State<CashRecipeSearchAndFilter> createState() =>
      _CashRecipeSearchAndFilterState();
}

class _CashRecipeSearchAndFilterState extends State<CashRecipeSearchAndFilter> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = CashRecipeController.watch(context);

    return Row(
      children: [
        // Search field
        Expanded(
          child: ShadInput(
            controller: _searchController,
            placeholder: const Text('Search cash receipts...'),
            leading: const Icon(LucideIcons.search, size: 16),
            onChanged: controller.updateSearchQuery,
          ),
        ),

        const SizedBox(width: 16),

        // Filter dropdown (placeholder for future implementation)
        ShadButton.outline(
          child: const Row(
            children: [
              Icon(Icons.filter_list, size: 16),
              SizedBox(width: 8),
              Text('Filter'),
            ],
          ),
          onPressed: () {
            // TODO: Show filter options
          },
        ),

        const SizedBox(width: 8),

        // Clear search button
        StreamBuilder<String>(
          stream: controller.viewModel.searchQueryStream,
          builder: (context, snapshot) {
            final hasSearchQuery = (snapshot.data?.isNotEmpty ?? false);

            if (!hasSearchQuery) {
              return const SizedBox.shrink();
            }

            return ShadButton.outline(
              onPressed: () {
                _searchController.clear();
                controller.clearSearch();
              },
              child: const Icon(LucideIcons.x, size: 16),
            );
          },
        ),
      ],
    );
  }
}
