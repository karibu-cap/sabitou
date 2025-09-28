import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/form/validation.dart';
import '../../input/form_fields.dart';
import 'add_global_product_controller.dart';
import 'add_global_product_view_model.dart';
import 'components/dialog/select_categories_view.dart';

/// Show global product dialog for adding or editing
void showGlobalProductDialog(
  BuildContext context, {
  GlobalProduct? globalProduct,
}) {
  showDialog(
    context: context,
    builder: (dialogContext) => ShadDialog(
      child: GlobalProductFormDialog(globalProduct: globalProduct),
    ),
  );
}

/// Modal for viewing and modifying user permissions.
class GlobalProductFormDialog extends StatelessWidget {
  /// The global product.
  final GlobalProduct? globalProduct;

  /// Constructs a new CategoryFormDialog.
  GlobalProductFormDialog({super.key, this.globalProduct});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddGlobalProductController(
        intl: AppInternationalizationService.to,
        viewModel: AddGlobalProductViewModel(),
        globalProduct: globalProduct,
      ),
      child: Consumer<AddGlobalProductController>(
        builder: (context, controller, _) {
          return FutureBuilder<void>(
            future: controller.getCategories(),
            builder: (context, snapshot) {
              return _GlobalProductFormDialogContent(
                globalProduct: globalProduct,
              );
            },
          );
        },
      ),
    );
  }
}

/// Supplier form dialog widget.ee
class _GlobalProductFormDialogContent extends StatelessWidget {
  /// The supplier.
  final GlobalProduct? globalProduct;

  /// Creates a new [_GlobalProductFormDialogContent].
  const _GlobalProductFormDialogContent({this.globalProduct});

  /// Handles the save operation for the category form.
  Future<void> _saveCategory(
    BuildContext context,
    AddGlobalProductController controller,
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
      if (globalProduct == null) {
        showSuccessToast(
          context: context,
          title: _intl.successText,
          message: _intl.productAddedSuccessfully,
        );
      } else {
        showSuccessToast(
          context: context,
          title: _intl.successText,
          message: _intl.productUpdatedSuccessfully,
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
    final controller = Provider.of<AddGlobalProductController>(context);
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

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
                    globalProduct == null
                        ? intl.enterDetailsNewProduct
                        : intl.updateProduct,
                    style: theme.textTheme.p.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  InputField(
                    id: intl.productNameEnglishVersion,
                    label: '${intl.productNameEnglishVersion} *',
                    controller: controller.enNameController,
                    placeholder: intl.productNameEnglishVersion,
                    validator:
                        ValidationFormUtils.validateProductNameEnglishVersion,
                  ),
                  const SizedBox(height: 16),

                  InputField(
                    id: intl.productNameFrenchVersion,
                    label: '${intl.productNameFrenchVersion} *',
                    controller: controller.frNameController,
                    placeholder: intl.productNameFrenchVersion,
                    validator:
                        ValidationFormUtils.validateProductNameFrenchVersion,
                  ),

                  const SizedBox(height: 16),

                  InputField(
                    id: intl.productDescriptionEnglishVersion,
                    label: '${intl.productDescriptionEnglishVersion} *',
                    controller: controller.enDescriptionController,
                    placeholder: intl.productDescriptionEnglishVersion,
                    validator: ValidationFormUtils
                        .validateProductDescriptionEnglishVersion,
                  ),
                  const SizedBox(height: 16),

                  InputField(
                    id: intl.productDescriptionFrenchVersion,
                    label: '${intl.productDescriptionFrenchVersion} *',
                    controller: controller.frDescriptionController,
                    placeholder: intl.productDescriptionFrenchVersion,
                    validator: ValidationFormUtils
                        .validateProductDescriptionFrenchVersion,
                  ),

                  const SizedBox(height: 16),

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
                    intl.selectCategory,
                    style: theme.textTheme.p.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  if (controller.selectedCategories.isEmpty)
                    Text(
                      intl.noCategoriesYet,
                      style: theme.textTheme.p.copyWith(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: theme.colorScheme.primary.withValues(alpha: 0.6),
                      ),
                    )
                  else
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: controller.selectedCategories
                          .map(
                            (category) => Chip(
                              label: Text(
                                category.label,
                                style: theme.textTheme.p.copyWith(fontSize: 12),
                              ),
                              deleteIcon: const Icon(Icons.close, size: 16),
                              onDeleted: () =>
                                  controller.removeSelectedCategory(category),
                            ),
                          )
                          .toList(),
                    ),

                  const SizedBox(height: 12),

                  ShadButton.outline(
                    onPressed: () =>
                        showSelectCategoriesSheet(context, controller),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.category_outlined, size: 16),
                        const SizedBox(width: 8),
                        Text(intl.selectCategory),
                      ],
                    ),
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
                          globalProduct == null
                              ? intl.addProduct
                              : intl.updateProduct,
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
