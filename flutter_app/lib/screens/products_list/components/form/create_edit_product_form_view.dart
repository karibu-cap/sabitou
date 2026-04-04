import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/files/sabitou_file_manager.dart';
import '../../../../repositories/resource_link_repository.dart';
import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_theme.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/extensions/category_extension.dart';
import '../../../../utils/extensions/global_product_extension.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../../utils/user_preference.dart';
import '../../../../widgets/adjust_flex_display.dart';
import '../../../../widgets/input/auto_complete.dart';
import '../../../../widgets/loading.dart';
import '../../../../widgets/mobile_scanner_view.dart';
import '../../../../widgets/ressource_link_image.dart';
import 'create_edit_product_form_controller.dart';

/// Product form dialog
class CreateEditProductFormView extends StatelessWidget {
  /// Constructs of new [CreateEditProductFormView].
  CreateEditProductFormView({super.key, this.product, this.onProductSaved});

  /// The product to edit.
  final CustomProduct? product;

  /// Callback when a product is saved successfully.
  final VoidCallback? onProductSaved;

  void _pickProductImages(
    BuildContext context,
    CreateEditProductFormController controller,
  ) {
    SabitouFilePicker.show(
      context: context,
      category: FileCategory.product,
      allowMultiple: true,
      limit: 2,
      onComplete: (filesItems) async {
        for (final item in filesItems) {
          await ResourceLinkRepository.instance.updateTargetUri(
            item.resourceLinkId,
            item.futureRemoteUrl,
          );
        }

        controller.storeProduct.imagesLinksIds.addAll(
          filesItems.map((e) => e.resourceLinkId),
        );
        controller.forceReload();

        return true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final userPreferences = context.watch<UserPreferences>();
    final business = userPreferences.business;
    final store = userPreferences.store;
    if (business == null || store == null) {
      return const SizedBox.shrink();
    }

    return ShadDialog(
      title: Text(product == null ? Intls.to.addProduct : Intls.to.editProduct),
      child: Material(
        color: Colors.transparent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final dialogWidth = isDesktop ? 600.0 : constraints.maxWidth * 0.9;

            return ChangeNotifierProvider(
              create: (context) => CreateEditProductFormController(
                product: product?.globalProduct,
                storeProduct: product?.storeProduct,
                businessId: business.refId,
                storeId: store.refId,
              ),
              child: Consumer<CreateEditProductFormController>(
                builder: (context, controller, child) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: dialogWidth,
                      maxHeight: MediaQuery.sizeOf(context).height * 0.8,
                    ),
                    child: Column(
                      spacing: 16,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ShadForm(
                            key: controller.formKey,
                            child: ListView(
                              children:
                                  [
                                        _ProductNameField(),
                                        _ProductImages(),
                                        _ProductDescription(),
                                        AdjustFlexDisplay(
                                          children: [
                                            _BarcodeField(),
                                            _CategoryDropdown(),
                                          ],
                                        ),
                                        const _StoreProductFields(),
                                        const _StockFields(),
                                      ]
                                      .expand(
                                        (e) => [e, const SizedBox(height: 16)],
                                      )
                                      .toList(),
                            ),
                          ),
                        ),
                        _FormActions(onProductSaved: onProductSaved),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _StockFields extends StatelessWidget {
  const _StockFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Intls.to.stock, style: ShadTheme.of(context).textTheme.large),
        const AdjustFlexDisplay(
          children: [_OpeningStockField(), _OpeningStockPerUnitField()],
        ),
        const AdjustFlexDisplay(children: [_ReorderPointField()]),
      ],
    );
  }
}

class _OpeningStockField extends StatelessWidget {
  const _OpeningStockField();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadInputFormField(
      id: 'opening_stock',
      label: Text(Intls.to.openingStock),
      controller: controller.openingStockController,
      enabled: !controller.onSaveProduct,
      placeholder: const Text('0'),
      keyboardType: TextInputType.number,
      validator: (value) {
        final openingStockPerUnitStr =
            controller.openingStockPerUnitController.text;
        final openingStockPerUnit =
            double.tryParse(openingStockPerUnitStr) ?? 0;

        if (openingStockPerUnit > 0 &&
            (value.isEmpty || (double.tryParse(value) ?? 0) == 0)) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.openingStockPerUnit,
          });
        }

        return null;
      },
    );
  }
}

class _OpeningStockPerUnitField extends StatelessWidget {
  const _OpeningStockPerUnitField();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadInputFormField(
      id: 'opening_stock_per_unit',
      label: Text(Intls.to.openingStockPerUnit),
      controller: controller.openingStockPerUnitController,
      enabled: !controller.onSaveProduct,
      placeholder: const Text('0.0'),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        final openingStockStr = controller.openingStockController.text;
        final openingStock = double.tryParse(openingStockStr) ?? 0;

        if (openingStock > 0 && value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.openingStockPerUnit,
          });
        }

        return null;
      },
    );
  }
}

class _ReorderPointField extends StatelessWidget {
  const _ReorderPointField();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadInputFormField(
      id: 'reorder_point',
      label: Text('${Intls.to.reorderPoint} (${Intls.to.optional})'),
      controller: controller.reorderPointController,
      enabled: !controller.onSaveProduct,
      placeholder: const Text('0'),
      keyboardType: TextInputType.number,
    );
  }
}

class _ProductDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateEditProductFormController>();

    return ShadTextareaFormField(
      id: Intls.to.productDescription,
      label: Text('${Intls.to.productDescription} (${Intls.to.optional})'),
      controller: controller.descriptionController,
      enabled: !controller.onSaveProduct,
      placeholder: Text(Intls.to.enterProductDescription),
      validator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.productDescription,
          });
        }

        return null;
      },
      onChanged: (value) => controller.product.description = Internationalized(
        en: value,
        fr: value,
      ),
    );
  }
}

class _ProductNameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateEditProductFormController>();

    return AutoComplete<GlobalProduct>(
      label: Text('${Intls.to.productName}'),
      enabled: !controller.onSaveProduct,
      initialValue: controller.product,
      placeholder: Intls.to.enterProductName,
      optionsBuilder: (text) async {
        controller.product.name = Internationalized(en: text, fr: text);
        if (text.isEmpty) {
          return [];
        }

        final result = await controller.filterGlobalProduct(name: text);

        return result;
      },
      displayStringForOption: (option) => option.label,
      validator: (value) {
        if (value == null) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.productName,
          });
        }

        return null;
      },
      onSelected: controller.setNewProduct,
    );
  }
}

class _ProductImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Intls.to.productImages,
          style: theme.textTheme.p.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final id in controller.storeProduct.imagesLinksIds)
              ResourceLinkImage(
                resourceLinkId: id,
                size: 80,
                onRemove: (id, url) async {
                  controller.storeProduct.imagesLinksIds.removeWhere(
                    (e) => e == id,
                  );
                  controller.forceReload();

                  await ResourceLinkRepository.instance.deleteRessource(id);
                  controller.forceReload();
                },
              ),
            // Add button
            if (controller.product.imagesLinksIds.length < 4)
              GestureDetector(
                onTap: () {
                  final parent = context
                      .findAncestorWidgetOfExactType<
                        CreateEditProductFormView
                      >();
                  parent?._pickProductImages(context, controller);
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(color: SabitouColors.neutral),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Icon(Icons.add_photo_alternate_rounded),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _BarcodeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadInputFormField(
      id: Intls.to.barcode,
      label: Text('${Intls.to.barcode} *'),
      controller: controller.barcodeController,
      enabled: !controller.onSaveProduct,
      placeholder: Text(Intls.to.scanOrEnterBarcode),
      trailing: kIsWeb
          ? null
          : MobileScannerView(
              onResult: (result) {
                controller.barcodeController.text = result;
              },
            ),
      validator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({'field': Intls.to.barcode});
        }

        return null;
      },
      onChanged: (value) => controller.product.barCodeValue = value,
    );
  }
}

class _CategoryDropdown extends StatelessWidget {
  _CategoryDropdown();

  final ValueNotifier<String?> searchValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();
    final categories = controller.businessCategories;

    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${Intls.to.category} *'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ListenableBuilder(
                    listenable: searchValue,
                    builder: (context, value) {
                      final filteredCategories = categories.where((category) {
                        if (searchValue.value == null) {
                          return true;
                        }

                        return category.label.toLowerCase().contains(
                          searchValue.value?.toLowerCase() ?? '',
                        );
                      });

                      return ShadSelect<Category?>.multipleWithSearch(
                        closeOnSelect: false,
                        placeholder: Text(Intls.to.selectCategory),
                        enabled: !controller.onSaveProduct,
                        selectedOptionsBuilder: (context, values) => Text(
                          values
                              .map(
                                (v) => categories
                                    .firstWhereOrNull(
                                      (e) => e.refId == v?.refId,
                                    )
                                    ?.label,
                              )
                              .join(', '),
                        ),
                        options: [
                          if (filteredCategories.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Text(Intls.to.noCategoryFound),
                            ),
                          ...filteredCategories
                              .map(
                                (category) => Offstage(
                                  offstage: !category.label
                                      .toLowerCase()
                                      .contains(
                                        searchValue.value?.toLowerCase() ?? '',
                                      ),
                                  child: ShadOption<Category?>(
                                    value: category,
                                    child: Text(category.label),
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                        onChanged: (value) {
                          controller.product.categories
                            ..clear()
                            ..addAll(
                              value.map(
                                (e) => Category(
                                  refId: e?.refId ?? '',
                                  name: Internationalized(
                                    en:
                                        categories
                                            .firstWhereOrNull(
                                              (c) => c.refId == e?.refId,
                                            )
                                            ?.label ??
                                        '',
                                    fr:
                                        categories
                                            .firstWhereOrNull(
                                              (c) => c.refId == e?.refId,
                                            )
                                            ?.label ??
                                        '',
                                  ),
                                ),
                              ),
                            );
                          controller.errors.value = {ErrorType.category: null};
                        },
                        onSearchChanged: (value) => searchValue.value = value,
                        searchPlaceholder: Text(Intls.to.searchCategory),
                        controller: controller.categoryController,
                      );
                    },
                  ),
                ),
              ],
            ),
            ListenableBuilder(
              listenable: controller.errors,
              builder: (context, value) {
                if (controller.errors.value != null) {
                  return Text(
                    controller.errors.value?[ErrorType.category] ?? '',
                    style: const TextStyle(color: Colors.red),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        );
      },
    );
  }
}

class _StoreProductFields extends StatelessWidget {
  const _StoreProductFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        AdjustFlexDisplay(children: [_SkuField(), _SalePriceField()]),
        const AdjustFlexDisplay(children: [_DefaultPurchasePriceField()]),
      ],
    );
  }
}

class _SkuField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadInputFormField(
      id: 'sku',
      label: const Text('SKU (Optional)'),
      controller: controller.skuController,
      enabled: !controller.onSaveProduct,
      placeholder: const Text('Enter SKU'),
      onChanged: (value) => controller.storeProduct.sku = value,
    );
  }
}

class _SalePriceField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadInputFormField(
      id: 'sale_price',
      label: Text('${Intls.to.salePrice} *'),
      controller: controller.salePriceController,
      enabled: !controller.onSaveProduct,
      placeholder: const Text('0'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.salePrice,
          });
        }

        return null;
      },
    );
  }
}

class _DefaultPurchasePriceField extends StatelessWidget {
  const _DefaultPurchasePriceField();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadInputFormField(
      id: 'default_purchase_price',
      label: Text('${Intls.to.defaultPurchasePrice} (${Intls.to.optional})'),
      controller: controller.defaultPurchasePriceController,
      enabled: !controller.onSaveProduct,
      placeholder: const Text('0.0'),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}

class _FormActions extends StatelessWidget {
  const _FormActions({this.onProductSaved});

  final VoidCallback? onProductSaved;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    void _saveProduct() async {
      final result = await controller.saveProduct(context);
      if (result) {
        if (!context.mounted) return;
        Navigator.of(context).pop();
        onProductSaved?.call();

        return;
      }

      showErrorToast(context: context, message: Intls.to.invalidFormFields);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          enabled: !controller.onSaveProduct,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(Intls.to.cancel),
        ),
        const SizedBox(width: 12),
        ShadButton(
          enabled: !controller.onSaveProduct,
          onPressed: controller.onSaveProduct ? null : _saveProduct,
          trailing: controller.onSaveProduct ? const Loading.button() : null,
          child: Text(
            controller.isCreatingNewProduct
                ? Intls.to.addProduct
                : Intls.to.editProduct,
          ),
        ),
      ],
    );
  }
}
