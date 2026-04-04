import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_theme.dart';
import '../../../../utils/extensions/category_extension.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_grid.dart';
import '../../../../widgets/error/loading_failed.dart';
import '../../../../widgets/pop_up/add_category/add_category_view.dart';
import '../categories_controller.dart';
import 'dialogs/delete_category/delete_category_view.dart';
import 'list/categories_empty_state.dart';
import 'list/categories_shimmer_widgets.dart';

/// Widget for displaying the list of categories.
class CategoriesList extends StatelessWidget {
  /// Creates a new [CategoriesList].
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CategoriesController>(context);
    final theme = ShadTheme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search and filters
        ShadCard(
          child: Row(
            spacing: 16,
            children: [
              Flexible(
                child: ShadInput(
                  controller: controller.searchController,
                  placeholder: Text(Intls.to.searchCategories),
                  trailing: const Icon(LucideIcons.search, size: 16),
                  onChanged: (value) => controller.searchQuery.add(value),
                ),
              ),
              ShadSelect<CategoryStatus>(
                controller: controller.statusFilterController,
                placeholder: Text(
                  Intls.to.allStatus,
                  style: theme.textTheme.muted.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                options: [
                  ShadOption(
                    value: CategoryStatus.CATEGORY_STATUS_ACTIVE,
                    child: Text(
                      Intls.to.active,
                      style: theme.textTheme.muted.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ShadOption(
                    value: CategoryStatus.CATEGORY_STATUS_INACTIVE,
                    child: Text(
                      Intls.to.inactive,
                      style: theme.textTheme.muted.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
                selectedOptionBuilder: (context, value) => Text(
                  _statusLabel(value),
                  style: theme.textTheme.muted.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                allowDeselection: true,
                onChanged: (value) => controller.selectedStatus.add(value),
              ),
              if (!isMobile)
                ShadSelect<CategoryType>(
                  controller: controller.typeFilterController,
                  placeholder: Text(
                    Intls.to.allTypes,
                    style: theme.textTheme.muted.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  options: [
                    ShadOption(
                      value: CategoryType.CATEGORY_TYPE_PRODUCT,
                      child: Text(
                        Intls.to.product,
                        style: theme.textTheme.muted.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ShadOption(
                      value: CategoryType.CATEGORY_TYPE_BUSINESS,
                      child: Text(
                        Intls.to.business,
                        style: theme.textTheme.muted.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ShadOption(
                      value: CategoryType.CATEGORY_TYPE_STORE,
                      child: Text(
                        Intls.to.store,
                        style: theme.textTheme.muted.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                  selectedOptionBuilder: (context, value) => Text(
                    _typeLabel(value),
                    style: theme.textTheme.muted.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  allowDeselection: true,
                  onChanged: (value) => controller.selectedType.add(value),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Grid
        StreamBuilder<List<Category>>(
          stream: controller.filteredCategoriesStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CategorieShimmerWidgets.buildTableShimmer();
            }
            if (snapshot.hasError) {
              return LoadingFailedWidget(error: snapshot.error ?? '');
            }
            final categories = snapshot.data ?? [];
            if (categories.isEmpty) {
              return const CategoriesEmptyState();
            }

            return CustomGrid(
              minItemWidth: 300,
              mainAxisExtent: 180,
              children: categories
                  .map((c) => _CategoryCard(category: c))
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  String _statusLabel(CategoryStatus status) {
    return switch (status) {
      CategoryStatus.CATEGORY_STATUS_ACTIVE => Intls.to.active,
      CategoryStatus.CATEGORY_STATUS_INACTIVE => Intls.to.inactive,
      _ => Intls.to.allStatus,
    };
  }

  String _typeLabel(CategoryType type) {
    return switch (type) {
      CategoryType.CATEGORY_TYPE_BUSINESS => Intls.to.business,
      CategoryType.CATEGORY_TYPE_PRODUCT => Intls.to.product,
      CategoryType.CATEGORY_TYPE_STORE => Intls.to.store,
      _ => Intls.to.allTypes,
    };
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;
  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = context.read<CategoriesController>();
    final popoverController = ShadPopoverController();
    final initials = category.label.isNotEmpty
        ? category.label.substring(0, 2).toUpperCase()
        : '';
    final shortId = category.refId.substring(
      0,
      category.refId.length < 8 ? category.refId.length : 8,
    );

    void edit() {
      popoverController.hide();
      showDialog<bool>(
        context: context,
        builder: (_) =>
            ShadDialog(child: CategoryFormDialog(category: category)),
      ).then((result) {
        if (result == true) {
          controller.refreshCategories();
        }
      });
    }

    void delete() {
      popoverController.hide();
      showDialog(
        context: context,
        builder: (_) => ShadDialog(
          child: DeleteCategoryDialog(
            category: category,
            categoriesController: controller,
          ),
        ),
      );
    }

    return ShadCard(
      child: InkWell(
        onTap: edit,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppTheme.radiusSm),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppUtils.stringToColor(initials),
                    ),
                    child: Center(
                      child: Text(
                        initials,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.label,
                          style: theme.textTheme.small.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          shortId,
                          style: theme.textTheme.muted,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  ShadPopover(
                    controller: popoverController,
                    child: ShadButton.ghost(
                      child: const Icon(LucideIcons.ellipsisVertical, size: 16),
                      onPressed: popoverController.toggle,
                    ),
                    popover: (_) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShadButton.ghost(
                          child: Text(Intls.to.edit),
                          leading: const Icon(LucideIcons.pencil, size: 16),
                          onPressed: edit,
                        ),
                        ShadButton.ghost(
                          child: Text(
                            Intls.to.delete,
                            style: const TextStyle(color: SabitouColors.danger),
                          ),
                          leading: const Icon(
                            LucideIcons.trash2,
                            size: 16,
                            color: SabitouColors.danger,
                          ),
                          onPressed: delete,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 16),
              // Info rows
              _InfoRow(label: Intls.to.type, value: category.typeLabel),
              const SizedBox(height: 8),
              _InfoRow(
                label: Intls.to.statusText,
                child: _StatusBadge(status: category.status),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? child;
  const _InfoRow({required this.label, this.value, this.child});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: theme.textTheme.muted.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: value != null
              ? Text(value ?? '', style: theme.textTheme.small)
              : child ?? const SizedBox(),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final CategoryStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: status.backgroundColor.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        status.label.toUpperCase(),
        style: theme.textTheme.small.copyWith(
          color: status.color,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
    );
  }
}
