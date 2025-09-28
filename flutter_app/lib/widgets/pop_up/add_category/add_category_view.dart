import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/form/validation.dart';
import '../../input/form_fields.dart';
import 'add_category_controller.dart';
import 'add_category_view_model.dart';

/// Shows the add/edit category dialog.
void showAddCategoryDialog(BuildContext context, {Category? category}) {
  showDialog(
    context: context,
    builder: (dialogContext) =>
        ShadDialog(child: CategoryFormDialog(category: category)),
  );
}

/// Modal for viewing and modifying user permissions.
class CategoryFormDialog extends StatelessWidget {
  /// The category.
  final Category? category;

  /// Constructs a new CategoryFormDialog.
  CategoryFormDialog({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryAddController(
        intl: AppInternationalizationService.to,
        viewModel: AddCategoryViewModel(),
        category: category,
      ),
      child: _CategoryFormDialogContent(category: category),
    );
  }
}

/// Supplier form dialog widget.ee
class _CategoryFormDialogContent extends StatelessWidget {
  /// The supplier.
  final Category? category;

  /// Creates a new [SupplierFormDialog].
  const _CategoryFormDialogContent({this.category});

  /// Handles the save operation for the category form.
  Future<void> _saveCategory(
    BuildContext context,
    CategoryAddController controller,
  ) async {
    final validation = controller.validateForm();

    if (!validation) {
      return;
    }

    final saveSuccess = await controller.submit();
    final _intl = AppInternationalizationService.to;

    // Handle successful save operation
    if (saveSuccess && context.mounted) {
      Navigator.of(context).pop(true);
      if (category == null) {
        showSuccessToast(
          context: context,
          title: _intl.successText,
          message: _intl.categoryAddedSuccessfully,
        );
      } else {
        showSuccessToast(
          context: context,
          title: _intl.successText,
          message: _intl.categoryUpdatedSuccessfully,
        );
      }
    }
    // Handle failed save operation
    else if (!saveSuccess && context.mounted) {
      showErrorToast(
        context: context,
        title: _intl.errorText,
        message: controller.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CategoryAddController>(context);
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    final communStyle = theme.textTheme.muted.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String getTypeLabel(CategoryType type) {
      switch (type) {
        case CategoryType.CATEGORY_TYPE_BUSINESS:
          return AppInternationalizationService.to.business;
        case CategoryType.CATEGORY_TYPE_PRODUCT:
          return AppInternationalizationService.to.product;
        case CategoryType.CATEGORY_TYPE_STORE:
          return AppInternationalizationService.to.store;
        default:
          return AppInternationalizationService.to.allTypes;
      }
    }

    return Material(
      color: theme.colorScheme.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: 500,

            child: ShadForm(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    category == null
                        ? intl.enterDetailsNewCategory
                        : intl.updateCategory,
                    style: theme.textTheme.p.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  InputField(
                    id: intl.categoryNameEnglishVersion,
                    label: '${intl.categoryNameEnglishVersion} *',
                    controller: controller.enController,
                    placeholder: intl.categoryNameEnglishVersion,
                    validator:
                        ValidationFormUtils.validateCategoryNameEnglishVersion,
                  ),
                  const SizedBox(height: 16),

                  InputField(
                    id: intl.categoryNameFrenchVersion,
                    label: '${intl.categoryNameFrenchVersion} *',
                    controller: controller.frController,
                    placeholder: intl.categoryNameFrenchVersion,
                    validator:
                        ValidationFormUtils.validateCategoryNameFrenchVersion,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    intl.selectCategory,
                    style: theme.textTheme.p.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  InkWell(
                    onTap: controller.setIsActive,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary.withValues(
                          alpha: 0.1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            controller.isActive
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            size: 20,
                            color: controller.isActive
                                ? theme.colorScheme.accent
                                : theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              intl.selectStatus,
                              style: theme.textTheme.p.copyWith(fontSize: 12),
                            ),
                          ),
                          Switch(
                            value: controller.isActive,
                            onChanged: (_) => controller.setIsActive(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    intl.selectType,
                    style: theme.textTheme.p.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  ShadSelect<CategoryType>(
                    controller: controller.typeController,
                    placeholder: Text(
                      AppInternationalizationService.to.selectType,
                      style: communStyle,
                    ),
                    options: [
                      ShadOption(
                        value: CategoryType.CATEGORY_TYPE_PRODUCT,
                        child: Text(
                          AppInternationalizationService.to.product,
                          style: communStyle,
                        ),
                      ),
                      ShadOption(
                        value: CategoryType.CATEGORY_TYPE_BUSINESS,
                        child: Text(
                          AppInternationalizationService.to.business,
                          style: communStyle,
                        ),
                      ),
                      ShadOption(
                        value: CategoryType.CATEGORY_TYPE_STORE,
                        child: Text(
                          AppInternationalizationService.to.store,
                          style: communStyle,
                        ),
                      ),
                    ],
                    selectedOptionBuilder: (context, value) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text(getTypeLabel(value), style: communStyle)],
                    ),
                    allowDeselection: true,
                    onChanged: controller.setType,
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShadButton.outline(
                        onPressed: () => Navigator.pop(context),
                        child: Text(intl.cancel),
                      ),

                      const SizedBox(width: 12),
                      ShadButton(
                        onPressed: () => _saveCategory(context, controller),
                        enabled: controller.canSubmit,
                        trailing: controller.isLoading
                            ? SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    theme.colorScheme.secondary,
                                  ),
                                ),
                              )
                            : null,
                        child: Text(
                          category == null
                              ? intl.addNewCategory
                              : intl.updateCategory,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
