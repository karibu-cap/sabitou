import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/extensions/category_extension.dart';
import '../../../../utils/extensions/global_product_extension.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../../widgets/adjust_flex_display.dart';
import '../../../../widgets/input/auto_complete.dart';
import '../../../../widgets/loading.dart';
import '../../../../widgets/mobile_scanner_view.dart';
import '../../products_list_controller.dart';
import 'create_edit_product_form_controller.dart';

/// Product form dialog
class CreateEditProductFormView extends StatelessWidget {
  /// Constructs of new [CreateEditProductFormView].
  CreateEditProductFormView({
    super.key,
    this.product,
    required this.productsListController,
  });

  /// The product to edit.
  final GlobalProduct? product;

  /// The products list controller.
  final ProductsListController productsListController;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return ShadDialog(
      title: Text(Intls.to.addProduct),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dialogWidth = isDesktop ? 600.0 : constraints.maxWidth * 0.9;

          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: productsListController),
              ChangeNotifierProvider(
                create: (context) =>
                    CreateEditProductFormController(product: product),
              ),
            ],
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
                      SingleChildScrollView(
                        child: ShadForm(
                          key: controller.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 16,
                            children: [
                              _ProductNameField(),
                              _ProductDescription(),
                              AdjustFlexDisplay(
                                children: [
                                  _BarcodeField(),
                                  _CategoryDropdown(),
                                ],
                              ),
                              const _StoreProductFields(),
                            ],
                          ),
                        ),
                      ),
                      const _FormActions(),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
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

    return CustomAutoComplete<GlobalProduct>(
      label: Text('${Intls.to.productName}'),
      enabled: !controller.onSaveProduct,
      initialValue: controller.nameController.text,
      placeholder: Intls.to.enterProductName,
      optionsBuilder: (textController) async {
        controller.product.name = Internationalized(
          en: textController.text,
          fr: textController.text,
        );
        if (textController.text.isEmpty) {
          return [];
        }

        final result = await controller.filterGlobalProduct(
          name: textController.text,
        );

        return result;
      },
      optionsViewBuilder:
          ({required context, required onSelected, required options}) {
            return ListView.builder(
              itemCount: options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final option = options.elementAt(index);

                return ListTile(
                  title: Text(option.label),
                  onTap: () => {
                    onSelected(option),
                    controller.setNewProduct(option),
                  },
                );
              },
            );
          },
      displayStringForOption: (option) => option.label,
      inputValidator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.productName,
          });
        }

        return null;
      },
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
    final categories = context
        .read<ProductsListController>()
        .businessCategories;
    final controller = context.watch<CreateEditProductFormController>();
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

                      return ShadSelect<String?>.multipleWithSearch(
                        closeOnSelect: false,
                        placeholder: Text(Intls.to.selectCategory),
                        enabled: !controller.onSaveProduct,
                        selectedOptionsBuilder: (context, values) => Text(
                          values
                              .map(
                                (v) => categories
                                    .firstWhereOrNull((e) => e.refId == v)
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
                                  child: ShadOption<String?>(
                                    value: category.refId,
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
                                  refId: e,
                                  name: categories
                                      .firstWhereOrNull((c) => c.refId == e)
                                      ?.name,
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

class _FormActions extends StatelessWidget {
  const _FormActions();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    void _saveProduct() async {
      final result = await controller.saveProduct(context);
      if (result) {
        Navigator.of(context).pop();
        context.read<ProductsListController>().refreshProducts();
      }
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
          child: Text(Intls.to.addProduct),
        ),
      ],
    );
  }
}
