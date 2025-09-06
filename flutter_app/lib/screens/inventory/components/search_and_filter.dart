import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';
import '../inventory_controller.dart';

/// The search and filter view.
class SearchAndFilterCard extends StatelessWidget {
  /// Constructs of new [SearchAndFilterCard].
  const SearchAndFilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final controller = context.read<InventoryController>();
    final categories = controller.products
        .map((p) => p.globalProduct.categories)
        .expand((c) => c)
        .map((c) => c.name)
        .toSet()
        .toList();

    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Intls.to.searchAndFilter,
              style: ShadTheme.of(context).textTheme.h4,
            ),
            const SizedBox(height: 16),
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Flexible(flex: isMobile ? 0 : 3, child: const _SearchInput()),
                if (categories.isNotEmpty)
                  Flexible(
                    flex: isMobile ? 0 : 1,
                    child: _CategoryFilter(categories: categories),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<InventoryController>();

    return ShadInput(
      controller: controller.searchController,
      placeholder: Text(Intls.to.searchForProduct),
      leading: const Icon(LucideIcons.search, size: 16),
      onChanged: (value) => controller.updateSearchQuery(),
    );
  }
}

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<InventoryController>();

    return ShadSelect<String>(
      placeholder: Text(Intls.to.allCategories),
      options: [
        ...categories.map(
          (category) => ShadOption(value: category, child: Text(category)),
        ),
      ],
      selectedOptionBuilder: (context, value) => Text(value),
      allowDeselection: true,
      onChanged: (value) {
        controller.selectedCategory.value = value ?? '';
        controller.updateSearchQuery();
      },
    );
  }
}
