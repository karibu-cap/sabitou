import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/utils.dart';
import '../../../core/files/sabitou_file_manager.dart';
import '../../../repositories/resource_link_repository.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/form/validation.dart';
import '../../../utils/user_preference.dart';
import '../../input/auto_complete.dart';
import '../../input/form_fields.dart';
import '../../loading.dart';
import '../../ressource_link_image.dart';
import 'add_global_product_controller.dart';
import 'add_global_product_view_model.dart';

/// Show global product dialog for adding or editing
Future<bool?> showGlobalProductDialog(
  BuildContext context, {
  GlobalProduct? globalProduct,
}) async {
  return showShadDialog<bool?>(
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
        product: globalProduct,
      ),
      child: _GlobalProductFormDialogContent(globalProduct: globalProduct),
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
  Future<void> _saveProduct(
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

  void _pickProductImages(
    BuildContext context,
    ValueNotifier<GlobalProduct> productViewModel,
  ) {
    SabitouFilePicker.show(
      context: context,
      category: FileCategory.product,
      allowMultiple: true,
      limit: 4,
      onComplete: (filesItems) async {
        for (final item in filesItems) {
          await ResourceLinkRepository.instance.updateTargetUri(
            item.resourceLinkId,
            item.futureRemoteUrl,
          );
        }

        productViewModel.value = productViewModel.value.deepCopy()
          ..imagesLinksIds.addAll(filesItems.map((e) => e.resourceLinkId));

        return true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddGlobalProductController>(context);
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    final prefs = context.watch<UserPreferences>();
    final business = prefs.business;

    if (business == null) {
      return const SizedBox.shrink();
    }

    return Material(
      color: theme.colorScheme.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ValueListenableBuilder<GlobalProduct>(
            valueListenable: controller.updatingProduct,
            builder: (context, product, _) {
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

                      Wrap(
                        spacing: 8,
                        children: [
                          for (final id in product.imagesLinksIds)
                            // Use the resource link widget — it resolves the URL from the DB.
                            ResourceLinkImage(
                              resourceLinkId: id,
                              size: 80,
                              onRemove: (id, url) async {
                                controller.updatingProduct.value =
                                    product.deepCopy()
                                      ..imagesLinksIds.removeWhere(
                                        (e) => e == id,
                                      );
                                await ResourceLinkRepository.instance
                                    .deleteRessource(id);
                              },
                            ),
                          // Add button.
                          GestureDetector(
                            onTap: () => _pickProductImages(
                              context,
                              controller.updatingProduct,
                            ),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                border: Border.fromBorderSide(
                                  BorderSide(color: SabitouColors.neutral),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: const Icon(
                                Icons.add_photo_alternate_rounded,
                              ),
                            ),
                          ),
                        ],
                      ),

                      InputField(
                        id: intl.productNameEnglishVersion,
                        label: '${intl.productNameEnglishVersion} *',
                        initialValue: product.name.en,
                        onChanged: (value) => controller.updatingProduct.value =
                            product.deepCopy()..name.en = value,
                        placeholder: intl.productNameEnglishVersion,
                        validator: ValidationFormUtils
                            .validateProductNameEnglishVersion,
                      ),

                      const SizedBox(height: 16),

                      InputField(
                        id: intl.productNameFrenchVersion,
                        label: '${intl.productNameFrenchVersion} *',
                        initialValue: product.name.fr,
                        onChanged: (value) => controller.updatingProduct.value =
                            product.deepCopy()..name.fr = value,
                        placeholder: intl.productNameFrenchVersion,
                        validator: ValidationFormUtils
                            .validateProductNameFrenchVersion,
                      ),

                      const SizedBox(height: 16),

                      InputField(
                        id: intl.productDescriptionEnglishVersion,
                        label: '${intl.productDescriptionEnglishVersion} *',
                        initialValue: product.description.en,
                        onChanged: (value) => controller.updatingProduct.value =
                            product.deepCopy()..description.en = value,
                        placeholder: intl.productDescriptionEnglishVersion,
                        validator: ValidationFormUtils
                            .validateProductDescriptionEnglishVersion,
                      ),
                      const SizedBox(height: 16),

                      InputField(
                        id: intl.productDescriptionFrenchVersion,
                        label: '${intl.productDescriptionFrenchVersion} *',
                        initialValue: product.description.fr,
                        onChanged: (value) =>
                            product.deepCopy()..description.fr = value,
                        placeholder: intl.productDescriptionFrenchVersion,
                        validator: ValidationFormUtils
                            .validateProductDescriptionFrenchVersion,
                      ),

                      const SizedBox(height: 16),

                      ShadCard(
                        child: Row(
                          children: [
                            Icon(
                              controller.isActive
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              size: 20,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                intl.selectStatus,
                                style: theme.textTheme.p.copyWith(fontSize: 12),
                              ),
                            ),
                            ShadSwitch(
                              value:
                                  product.status ==
                                  GlobalProductStatus
                                      .GLOBAL_PRODUCT_STATUS_ACTIVE,
                              onChanged: (value) =>
                                  controller
                                      .updatingProduct
                                      .value = product.deepCopy()
                                    ..status = value
                                        ? GlobalProductStatus
                                              .GLOBAL_PRODUCT_STATUS_ACTIVE
                                        : GlobalProductStatus
                                              .GLOBAL_PRODUCT_STATUS_INACTIVE,
                            ),
                          ],
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

                      AutoComplete<Category>(
                        multiSelect: true,
                        selectedValues: controller.selectedCategories.toList(),
                        onMultiSelectChanged: controller.setSelectedCategories,
                        optionsBuilder: (search) async {
                          return await controller.findCategories(
                            search,
                            business.refId,
                          );
                        },
                        canReturnDataWhenEmpty: true,
                        displayStringForOption: (category) => category.label,
                        optionViewBuilder: (category) {
                          return Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(category.label),
                                    if (category.name.en != category.name.fr)
                                      Text(
                                        '${category.name.en} / ${category.name.fr}',
                                        style: theme.textTheme.muted.copyWith(
                                          fontSize: 11,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        placeholder: intl.searchCategory,
                        searchPlaceholder: intl.typeToSearch,
                        onNotFound: (searchText, onAdded) async {
                          final newCategory = Category(
                            refId: AppUtils.generateSmartDatabaseId('CTG'),
                            name: Internationalized(
                              en: searchText,
                              fr: searchText,
                            ),
                            status: CategoryStatus.CATEGORY_STATUS_ACTIVE,
                            type: CategoryType.CATEGORY_TYPE_PRODUCT,
                            createdAt: Timestamp.fromDateTime(DateTime.now()),
                            businessId: business.refId,
                          );

                          final success = await controller.createCategory(
                            newCategory,
                          );
                          if (success) {
                            // Auto-select the newly created category
                            controller.toggleCategory(newCategory);
                            onAdded();
                          }
                        },
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
                            onPressed: () => _saveProduct(context, controller),
                            enabled: controller.canSubmit,
                            trailing: controller.isLoading
                                ? const Loading.button()
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
          );
        },
      ),
    );
  }
}
