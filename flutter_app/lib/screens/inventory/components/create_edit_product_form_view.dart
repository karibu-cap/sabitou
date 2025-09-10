import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/input/auto_complete.dart';
import '../../../widgets/loading.dart';
import '../inventory_controller.dart';
import 'create_edit_product_form_controller.dart';

/// Product form dialog
class CreateEditProductFormView extends StatelessWidget {
  /// Constructs of new [CreateEditProductFormView].
  CreateEditProductFormView({
    super.key,
    this.product,
    required this.inventoryController,
  });

  /// The product to edit.
  final Product? product;

  /// The inventory controller.
  final InventoryController inventoryController;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return ShadDialog(
      title: Text(switch (product == null) {
        true => Intls.to.addProduct,
        false => Intls.to.editProduct,
      }),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dialogWidth = isDesktop ? 600.0 : constraints.maxWidth * 0.9;

          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: inventoryController),
              ChangeNotifierProvider(
                create: (context) =>
                    CreateEditProductFormController(product: product),
              ),
            ],
            child: Consumer<CreateEditProductFormController>(
              builder: (context, controller, child) {
                return SizedBox(
                  width: dialogWidth,
                  child: SingleChildScrollView(
                    child: ShadForm(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _ProductNameField(),
                          const SizedBox(height: 16),
                          _BarcodeField(),
                          const SizedBox(height: 16),
                          _CategoryDropdown(),
                          const SizedBox(height: 16),
                          _PriceQuantityFields(),
                          const SizedBox(height: 16),
                          const _ExpiryDateField(),
                          const SizedBox(height: 24),
                          const _FormActions(),
                        ],
                      ),
                    ),
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

class _ProductNameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateEditProductFormController>();

    return CustomAutoComplete<GlobalProduct>(
      label: Text(Intls.to.productName),
      enabled: !controller.onSaveProduct,
      initialValue: controller.nameController.text,
      placeholder: Intls.to.enterProductName,
      optionsBuilder: (textController) async {
        controller.product.globalProduct.name = textController.text;
        if (textController.text.isEmpty) {
          return [];
        }

        return controller.filterGlobalProduct(textController.text);
      },
      optionsViewBuilder:
          ({required context, required onSelected, required options}) {
            return ListView.builder(
              itemCount: options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final option = options.elementAt(index);

                return ListTile(
                  title: Text(option.name),
                  onTap: () => {
                    onSelected(option),
                    controller.setNewProduct(option),
                  },
                );
              },
            );
          },
      displayStringForOption: (option) => option.name,
      inputValidator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.replaceFirst(
            '@field',
            Intls.to.productName,
          );
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

    Future<void> _showBarcodeScanner(BuildContext context) async {
      final barcode = await showDialog(
        context: context,
        builder: (context) => const _BarcodeScannerDialog(),
      );

      if (barcode != null && context.mounted) {
        context
            .read<CreateEditProductFormController>()
            .product
            .globalProduct
            .barCodeValue = barcode
            .toString();
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ShadInputFormField(
            id: Intls.to.barcode,
            label: Text('${Intls.to.barcode} *'),
            controller: controller.barcodeController,
            enabled: !controller.onSaveProduct,
            placeholder: Text(Intls.to.scanOrEnterBarcode),
            trailing: kIsWeb
                ? null
                : IconButton(
                    icon: const Icon(LucideIcons.scan),
                    onPressed: () => _showBarcodeScanner(context),
                  ),
            validator: (value) {
              if (value.isEmpty) {
                return Intls.to.isRequiredField.replaceFirst(
                  '@field',
                  Intls.to.barcode,
                );
              }

              return null;
            },
            onChanged: (value) =>
                controller.product.globalProduct.barCodeValue = value,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

class _BarcodeScannerDialog extends StatelessWidget {
  const _BarcodeScannerDialog();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(Intls.to.scanBarcode),
      child: SizedBox(
        width: 300,
        height: 300,
        child: MobileScanner(
          onDetect: (capture) {
            final barcodes = capture.barcodes;
            if (barcodes.isNotEmpty) {
              final barcode = barcodes.first.rawValue ?? '';
              Navigator.of(context).pop(barcode);
            }
          },
        ),
      ),
    );
  }
}

class _CategoryDropdown extends StatelessWidget {
  _CategoryDropdown();

  final ValueNotifier<String?> searchValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<InventoryController>().businessCategories;
    final controller = context.watch<CreateEditProductFormController>();
    final isDesktop = ResponsiveUtils.isDesktop(context);
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Flex(
          direction: isDesktop ? Axis.horizontal : Axis.vertical,
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: isDesktop ? 1 : 0,
              child: Column(
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
                            final filteredCategories = categories.where((
                              category,
                            ) {
                              if (searchValue.value == null) {
                                return true;
                              }

                              return category.name.toLowerCase().contains(
                                searchValue.value?.toLowerCase() ?? '',
                              );
                            });

                            return ShadSelect<Category>.multipleWithSearch(
                              closeOnSelect: false,
                              placeholder: Text(Intls.to.selectCategory),
                              enabled: !controller.onSaveProduct,
                              selectedOptionsBuilder: (context, values) =>
                                  Text(values.map((v) => v.name).join(', ')),
                              options: [
                                if (filteredCategories.isEmpty)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 24,
                                    ),
                                    child: Text(Intls.to.noCategoryFound),
                                  ),
                                ...filteredCategories
                                    .map(
                                      (category) => Offstage(
                                        offstage: !category.name
                                            .toLowerCase()
                                            .contains(
                                              searchValue.value
                                                      ?.toLowerCase() ??
                                                  '',
                                            ),
                                        child: ShadOption<Category>(
                                          value: category,
                                          child: Text(category.name),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ],
                              onChanged: (value) {
                                controller.product.globalProduct.categories
                                  ..clear()
                                  ..addAll(
                                    value.map(
                                      (e) => ProductCategory(
                                        refId: e.refId,
                                        name: e.name,
                                      ),
                                    ),
                                  );
                                controller.errors.value = {
                                  ErrorType.category: null,
                                };
                              },
                              onSearchChanged: (value) =>
                                  searchValue.value = value,
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
              ),
            ),
            Flexible(
              flex: isDesktop ? 1 : 0,
              child: ShadInputFormField(
                id: Intls.to.price,
                label: Text('${Intls.to.price} (xaf) *'),
                controller: controller.priceController,
                placeholder: const Text('0.00'),
                keyboardType: TextInputType.number,
                enabled: !controller.onSaveProduct,
                validator: (value) {
                  if (value.isEmpty) {
                    return Intls.to.isRequiredField.replaceFirst(
                      '@field',
                      Intls.to.price,
                    );
                  }

                  return null;
                },
                onChanged: (value) =>
                    controller.product.storeProduct.priceInXaf =
                        int.tryParse(value) ?? 0,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PriceQuantityFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: isDesktop ? 1 : 0,
          child: ShadInputFormField(
            id: Intls.to.stockQuantity,
            enabled: !controller.onSaveProduct,
            label: Text('${Intls.to.stockQuantity} *'),
            controller: controller.quantityController,
            placeholder: const Text('0'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return Intls.to.isRequiredField.replaceFirst(
                  '@field',
                  Intls.to.stockQuantity,
                );
              }

              if (controller.minStockThresholdController.text.isNotEmpty &&
                  int.parse(value) <
                      int.parse(controller.minStockThresholdController.text)) {
                return Intls.to.quantityShouldBeGreaterThanMinStockThreshold;
              }

              return null;
            },
            onChanged: (p0) => controller.product.storeProduct.stockQuantity =
                int.tryParse(p0) ?? 0,
          ),
        ),
        Flexible(
          flex: isDesktop ? 1 : 0,
          child: ShadInputFormField(
            id: Intls.to.minStockThreshold,
            enabled: !controller.onSaveProduct,
            label: Text('${Intls.to.minStockThreshold} *'),
            controller: controller.minStockThresholdController,
            placeholder: const Text('0'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value.isEmpty) {
                return Intls.to.isRequiredField.replaceFirst(
                  '@field',
                  Intls.to.minStockThreshold,
                );
              }
              if (controller.quantityController.text.isNotEmpty &&
                  int.parse(value) >
                      int.parse(controller.quantityController.text)) {
                return Intls.to.minStockThresholdShouldBeLessThanStockQuantity;
              }

              return null;
            },
            onChanged: (p0) =>
                controller.product.storeProduct.minStockThreshold =
                    int.tryParse(p0) ?? 0,
          ),
        ),
      ],
    );
  }
}

class _ExpiryDateField extends StatelessWidget {
  const _ExpiryDateField();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadDatePickerFormField(
          id: Intls.to.expirationDate,
          width: constraints.maxWidth,
          label: Text('${Intls.to.expirationDate}'),
          initialMonth: clock.now(),
          closeOnSelection: true,
          enabled: !controller.onSaveProduct,
          showOutsideDays: false,
          fromMonth: clock.now(),
          toMonth: clock.now().add(const Duration(days: 3650)),
          initialValue: controller.expiryController.text.isNotEmpty
              ? DateTime.tryParse(controller.expiryController.text)
              : null,
          placeholder: const Text('YYYY-MM-DD'),
          allowDeselection: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            // In edition mode we potentially not want to update the expiration date. so we must skip the validation.
            if (controller.productFormType == ProductFormType.edit &&
                controller.product.storeProduct.expirationDate
                        .toDateTime()
                        .toIso8601String() ==
                    value?.toIso8601String()) {
              return null;
            }
            if (value != null && value.isBefore(clock.now())) {
              return Intls.to.expirationDateShouldBeAfterToday;
            }

            return null;
          },
          onChanged: (value) {
            if (value != null) {
              controller.product.storeProduct.expirationDate =
                  Timestamp.fromDateTime(value);

              return;
            }
            controller.product.storeProduct.clearExpirationDate();
          },
        );
      },
    );
  }
}

class _FormActions extends StatelessWidget {
  const _FormActions();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

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
          onPressed: controller.onSaveProduct
              ? null
              : () => controller.saveProduct(context),
          trailing: controller.onSaveProduct ? const Loading.button() : null,
          child: Text(switch (controller.productFormType) {
            ProductFormType.create => Intls.to.addProduct,
            ProductFormType.edit => Intls.to.editProduct,
          }),
        ),
      ],
    );
  }
}
