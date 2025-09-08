import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/input/auto_complete.dart';
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
                          const _CategoryAndSupplierFields(),
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
      placeholder: Intls.to.enterProductName,
      optionsBuilder: (textController) async {
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
                    print('option: ${option.name}'),
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
    final barcodeController = context
        .select<CreateEditProductFormController, TextEditingController>(
          (controller) => controller.barcodeController,
        );

    Future<void> _showBarcodeScanner(BuildContext context) async {
      final barcode = await showDialog(
        context: context,
        builder: (context) => const _BarcodeScannerDialog(),
      );

      if (barcode != null) {
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
            controller: barcodeController,
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

class _CategoryAndSupplierFields extends StatelessWidget {
  const _CategoryAndSupplierFields();

  @override
  Widget build(BuildContext context) {
    return const _CategoryDropdown();
  }
}

class _CategoryDropdown extends StatelessWidget {
  const _CategoryDropdown();

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<InventoryController>().businessCategories;
    final controller = context.watch<CreateEditProductFormController>();

    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${Intls.to.category} *',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        ShadSelectMultipleFormField<String>(
          id: Intls.to.category,
          closeOnSelect: false,
          placeholder: Text(Intls.to.selectCategory),
          minWidth: double.infinity,
          selectedOptionsBuilder: (context, values) =>
              Text(values.map((v) => v).join(', ')),
          initialValue: controller.selectedCategoryId?.toSet(),
          options: categories
              .map(
                (category) => ShadOption(
                  value: category.refId,
                  child: Text(category.name),
                ),
              )
              .toList(),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return Intls.to.isRequiredField.replaceFirst(
                '@field',
                Intls.to.category,
              );
            }

            return null;
          },
          onChanged: (value) => controller.product.globalProduct.categories
            ..clear()
            ..addAll(
              value?.map(
                    (e) => ProductCategory(
                      refId: e,
                      name: categories.firstWhere((c) => c.refId == e).name,
                    ),
                  ) ??
                  [],
            ),
        ),
      ],
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
      children: [
        Flexible(
          flex: isDesktop ? 1 : 0,
          child: ShadInputFormField(
            id: Intls.to.price,
            label: Text('${Intls.to.price} (xaf) *'),
            controller: controller.priceController,
            placeholder: const Text('0.00'),
            keyboardType: TextInputType.number,
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
                controller.product.businessProduct.priceInXaf =
                    int.tryParse(value) ?? 0,
          ),
        ),
        Flexible(
          flex: isDesktop ? 1 : 0,
          child: ShadInputFormField(
            id: Intls.to.stockQuantity,
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

              return null;
            },
            onChanged: (p0) =>
                controller.product.businessProduct.stockQuantity =
                    int.tryParse(p0) ?? 0,
          ),
        ),
        Flexible(
          flex: isDesktop ? 1 : 0,
          child: ShadInputFormField(
            id: Intls.to.minStockThreshold,
            label: Text('${Intls.to.minStockThreshold} *'),
            controller: controller.minStockThresholdController,
            placeholder: const Text('0'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return Intls.to.isRequiredField.replaceFirst(
                  '@field',
                  Intls.to.minStockThreshold,
                );
              }

              return null;
            },
            onChanged: (p0) =>
                controller.product.businessProduct.minStockThreshold =
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

    Future<void> _showDatePicker(
      BuildContext context,
      CreateEditProductFormController controller,
    ) async {
      final date = await showDatePicker(
        context: context,
        initialDate: controller.expiryController.text.isNotEmpty
            ? DateTime.tryParse(controller.expiryController.text) ?? clock.now()
            : clock.now(),
        firstDate: clock.now(),
        lastDate: clock.now().add(const Duration(days: 3650)),
      );

      if (date != null) {
        controller.expiryController.text = date.toIso8601String();
      }
    }

    return ShadInputFormField(
      id: Intls.to.expirationDate,
      label: Text('${Intls.to.expirationDate}'),
      controller: controller.expiryController,
      placeholder: const Text('YYYY-MM-DD'),
      keyboardType: TextInputType.datetime,
      onPressed: () => _showDatePicker(context, controller),
    );
  }
}

class _FormActions extends StatelessWidget {
  const _FormActions();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateEditProductFormController>();

    Future<void> _saveProduct(BuildContext context) async {
      if (!controller.validateForm()) {
        return;
      }

      try {
        // final product = formProvider.createProduct();

        // Uncomment and implement based on your AppProvider methods
        // if (this.product == null) {
        //   await context.read<AppProvider>().addProduct(product);
        // } else {
        //   await context.read<AppProvider>().updateProduct(product);
        // }
      } catch (e) {}
    }

    return ValueListenableBuilder(
      valueListenable: controller.isSaving,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShadButton.outline(
              enabled: !controller.isSaving.value,
              onPressed: () => Navigator.of(context).pop(),
              child: Text(Intls.to.cancel),
            ),
            const SizedBox(width: 12),
            ShadButton(
              onPressed: controller.isSaving.value
                  ? null
                  : () => _saveProduct(context),
              child: controller.isSaving.value
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(switch (controller.productFormType) {
                      ProductFormType.create => Intls.to.addProduct,
                      ProductFormType.edit => Intls.to.editProduct,
                    }),
            ),
          ],
        );
      },
    );
  }
}
