import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../../repositories/store_products_repository.dart';
import '../../../../../../router/app_router.dart';
import '../../../../../../services/internationalization/internationalization.dart';
import '../../../../../../utils/extensions/category_extension.dart';
import '../../../../../../utils/extensions/global_product_extension.dart';
import '../../../../../../widgets/adjust_flex_display.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../../widgets/mobile_scanner_view.dart';
import '../../../../../../widgets/shad_scaffold.dart';
import '../../../../../utils/user_preference.dart';
import '../../../../../widgets/input/auto_complete.dart';
import '../../../products_list_controller.dart';
import '../../../products_list_view_model.dart';
import '../create_edit_product_form_controller.dart';

/// Screen for creating or editing a product.
class CreateEditProductScreen extends StatefulWidget {
  /// The product ID.
  final String? productId;

  /// Constructs a new [CreateEditProductScreen].
  const CreateEditProductScreen({this.productId, super.key});

  @override
  State<CreateEditProductScreen> createState() =>
      _CreateEditProductScreenState();
}

class _CreateEditProductScreenState extends State<CreateEditProductScreen> {
  late Future<GlobalProduct?> _productFuture;

  @override
  void initState() {
    super.initState();

    _productFuture = _loadProduct();
  }

  Future<GlobalProduct?> _loadProduct() async {
    if (widget.productId == null) return null;

    try {
      final response = await StoreProductsRepository.instance.getStoreProduct(
        GetStoreProductRequest(storeProductId: widget.productId),
      );

      return response?.globalProduct;
    } on Exception {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final currentStore = userPreferences.store;
    final business = userPreferences.business;
    if (currentStore == null || business == null) {
      return const SizedBox.shrink();
    }
    final _viewModel = ProductsListViewModel(
      buisiness: business,
      store: currentStore,
    );

    return FutureBuilder<GlobalProduct?>(
      future: _productFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShadScaffold(
            title: Text(
              widget.productId == null
                  ? Intls.to.addProduct
                  : Intls.to.editProduct,
            ),
            body: const Center(child: Loading()),
          );
        }

        return ChangeNotifierProvider(
          create: (_) => ProductsListController(_viewModel),
          child: Consumer<ProductsListController>(
            builder: (context, productsController, _) {
              return ShadScaffold(
                title: Text(
                  widget.productId == null
                      ? Intls.to.addProduct
                      : Intls.to.editProduct,
                ),
                body: ChangeNotifierProvider(
                  create: (_) => CreateEditProductFormController(
                    product: snapshot.data,
                    businessId: business.refId,
                    storeId: currentStore.refId,
                  ),
                  child: Consumer<CreateEditProductFormController>(
                    builder: (context, controller, child) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: _CreateEditProductFormContent(),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 16),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: ShadTheme.of(
                                      context,
                                    ).colorScheme.border,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: ShadButton.outline(
                                      enabled: !controller.onSaveProduct,
                                      onPressed: () => AppRouter.onPop(context),
                                      child: Text(Intls.to.cancel),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: ShadButton(
                                      enabled: !controller.onSaveProduct,
                                      onPressed: controller.onSaveProduct
                                          ? null
                                          : () async {
                                              final result = await controller
                                                  .saveProduct(context);
                                              if (result) {
                                                if (context.mounted) {
                                                  AppRouter.onPop(context);
                                                  unawaited(
                                                    context
                                                        .read<
                                                          ProductsListController
                                                        >()
                                                        .refreshProducts(),
                                                  );
                                                }
                                              }
                                            },
                                      trailing: controller.onSaveProduct
                                          ? const Loading.button()
                                          : null,
                                      child: Text(Intls.to.save),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _CreateEditProductFormContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadForm(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          _ProductNameField(),
          _ProductDescriptionField(),
          AdjustFlexDisplay(children: [_BarcodeField(), _CategoryDropdown()]),
          const _StoreProductFields(),
          const _StockFields(),
        ],
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

        if (openingStock > 0 &&
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

class _ReorderPointField extends StatelessWidget {
  const _ReorderPointField();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return ShadInputFormField(
      id: 'reorder_point',
      label: Text(Intls.to.reorderPoint),
      controller: controller.reorderPointController,
      enabled: !controller.onSaveProduct,
      placeholder: const Text('0'),
      keyboardType: TextInputType.number,
    );
  }
}

class _ProductDescriptionField extends StatelessWidget {
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
      initialValue: controller.nameController.text,
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
      trailing: MobileScannerView(
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

                      return ShadSelect<Category?>.multipleWithSearch(
                        closeOnSelect: false,
                        placeholder: Text(Intls.to.selectCategory),
                        enabled: !controller.onSaveProduct,
                        selectedOptionsBuilder: (context, values) => Text(
                          values
                              .map(
                                (v) => categories
                                    .firstWhere((e) => e.refId == v?.refId)
                                    .label,
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
                                    en: categories
                                        .firstWhere((c) => c.refId == e?.refId)
                                        .label,
                                    fr: categories
                                        .firstWhere((c) => c.refId == e?.refId)
                                        .label,
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
      label: Text('${Intls.to.sku} (${Intls.to.optional})'),
      controller: controller.skuController,
      enabled: !controller.onSaveProduct,
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
      label: Text(Intls.to.defaultPurchasePrice),
      controller: controller.defaultPurchasePriceController,
      enabled: !controller.onSaveProduct,
      placeholder: const Text('0.0'),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
