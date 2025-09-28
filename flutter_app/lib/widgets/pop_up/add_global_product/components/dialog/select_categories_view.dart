import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../utils/extensions/category_extension.dart';
import '../../../add_category/add_category_view.dart';
import '../../add_global_product_controller.dart';
import 'select_categories_controller.dart';

/// Opens the modal bottom sheet responsible for displaying the category selector.
Future<void> showSelectCategoriesSheet(
  BuildContext context,
  AddGlobalProductController controller,
) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    builder: (sheetContext) {
      return ChangeNotifierProvider<SelectCategoriesController>(
        create: (_) =>
            SelectCategoriesController(addGlobalProductController: controller),
        child: const SelectCategoriesSheet(),
      );
    },
  );
}

/// Stateless widget representing the body of the category selection sheet.
class SelectCategoriesSheet extends StatelessWidget {
  /// Constructs a new SelectCategoriesSheet.
  const SelectCategoriesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);
    final controller = context.watch<SelectCategoriesController>();
    final categories = controller.filteredCategories;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: FractionallySizedBox(
        heightFactor: 0.75,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
            ),
            const SizedBox(height: 12),
            _SheetHeader(intl: intl),
            const SizedBox(height: 12),
            Expanded(
              child: categories.isEmpty
                  ? Center(
                      child: Text(
                        intl.noCategoriesMatchFilters,
                        style: theme.textTheme.p,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (_, index) {
                        final category = categories[index];
                        final isSelected = controller.isCategorySelected(
                          category,
                        );

                        return CheckboxListTile(
                          value: isSelected,
                          onChanged: (_) => controller.toggleCategory(category),
                          title: Text(category.label),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: ShadButton.outline(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(intl.cancel),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ShadButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(intl.selectCategory),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  const _SheetHeader({required this.intl});

  final AppInternationalizationService intl;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = context.watch<SelectCategoriesController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  intl.selectCategory,
                  style: theme.textTheme.h1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close, color: theme.colorScheme.primary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: intl.searchCategory,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.secondary.withValues(
                      alpha: 0.04,
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                  onChanged: controller.updateSearchQuery,
                ),
              ),
              const SizedBox(width: 12),
              ShadButton(
                onPressed: () => showAddCategoryDialog(
                  context,
                  category: Category()
                    ..type = CategoryType.CATEGORY_TYPE_BUSINESS,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add, size: 16),
                    const SizedBox(width: 8),
                    Text(AppInternationalizationService.to.addCategory),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
