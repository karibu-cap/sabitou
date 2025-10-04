import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../cash_recipe_controller.dart';

/// Search and filter component for cash receipts
class CashRecipeSearchAndFilter extends StatelessWidget {
  /// Constructor for CashRecipeSearchAndFilter
  const CashRecipeSearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    final controller = context.watch<CashRecipeController>();

    return Row(
      children: [
        Expanded(
          child: ShadInput(
            controller: _searchController,
            placeholder: Text(Intls.to.searchCashReceipts),
            leading: const Icon(LucideIcons.search, size: 16),
            onChanged: controller.updateSearchQuery,
          ),
        ),

        const SizedBox(width: 16),

        ShadButton.outline(
          child: Row(
            children: [
              const Icon(Icons.filter_list, size: 16),
              const SizedBox(width: 8),
              Text(Intls.to.filter),
            ],
          ),
          onPressed: () {},
        ),

        const SizedBox(width: 8),
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
