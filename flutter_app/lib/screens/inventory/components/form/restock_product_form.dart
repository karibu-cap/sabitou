import 'dart:async';

import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../repositories/suppliers_repository.dart';
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/extensions/global_product_extension.dart';
import '../../../../utils/form/validation.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../../utils/user_preference.dart';
import '../../../../widgets/loading.dart';
import '../../inventory_controller.dart';
import '../ajust_flex_display.dart';
import 'restock_product_form_controller.dart';

/// Product form dialog
class RestockProductForm extends StatelessWidget {
  /// Constructs of new [RestockProductForm].
  RestockProductForm({super.key, required this.inventoryController});

  /// The inventory controller.
  final InventoryController inventoryController;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return ShadDialog(
      title: Text(Intls.to.restock),
      description: Text(
        Intls.to.restockProductDescription,
        style: ShadTheme.of(context).textTheme.muted,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dialogWidth = isDesktop ? 600.0 : constraints.maxWidth * 0.9;

          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: inventoryController),
              ChangeNotifierProvider(
                create: (context) => RestockProductFormController(),
              ),
            ],
            child: Consumer<RestockProductFormController>(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 14,
                            children: [
                              _ProductDropdown(),
                              AdjustFlexDisplay(
                                children: [_SalePriceField(), _UnitCostField()],
                              ),
                              AdjustFlexDisplay(
                                children: [
                                  _QuantityField(),
                                  _SupplierDropdown(),
                                ],
                              ),
                              AdjustFlexDisplay(
                                children: [
                                  _MinStockThreshold(),
                                  const _ExpiryDateField(),
                                ],
                              ),
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

class _SalePriceField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RestockProductFormController>();

    return ShadInputFormField(
      id: Intls.to.salePrice,
      label: Text('${Intls.to.salePrice} *'),
      controller: controller.salePriceController,
      placeholder: const Text('0.00'),
      keyboardType: TextInputType.number,
      enabled: !controller.onSaveProduct,
      validator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.salePrice,
          });
        }

        return null;
      },
      onChanged: (value) => controller.tmpProduct.storeProduct.salePrice =
          int.tryParse(value) ?? 0,
    );
  }
}

class _UnitCostField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RestockProductFormController>();

    return ShadInputFormField(
      id: Intls.to.unitCost,
      label: Text('${Intls.to.unitCost} *'),
      controller: controller.unitCostController,
      placeholder: const Text('0.00'),
      keyboardType: TextInputType.number,
      enabled: !controller.onSaveProduct,
      validator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.unitCost,
          });
        }

        return null;
      },
      onChanged: (value) => controller.tmpProduct.storeProduct.costPrice =
          int.tryParse(value) ?? 0,
    );
  }
}

class _ProductDropdown extends StatelessWidget {
  final ValueNotifier<String?> searchValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    Timer? _debounce;
    final controller = context.watch<RestockProductFormController>();
    List<GlobalProduct> globalProducts = <GlobalProduct>[];

    return LayoutBuilder(
      builder: (context, constraints) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ListenableBuilder(
              listenable: searchValue,
              builder: (context, value) {
                return ShadSelectFormField<GlobalProduct?>.withSearch(
                  id: Intls.to.searchForProduct,
                  label: Text('${Intls.to.selectProduct} *'),
                  minWidth: constraints.maxWidth,
                  placeholder: Text(Intls.to.selectProduct),
                  enabled: !controller.onSaveProduct,
                  selectedOptionBuilder: (context, option) => option != null
                      ? Text(option.label)
                      : const SizedBox.shrink(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    controller.tmpProduct.globalProduct = value;
                  },
                  onSearchChanged: (value) {
                    _debounce?.cancel();
                    _debounce = Timer(
                      const Duration(milliseconds: 300),
                      () async {
                        final result = await controller.filterGlobalProduct(
                          value,
                        );
                        setState(() {
                          globalProducts = result;
                        });
                      },
                    );
                  },
                  controller: controller.globalProductController,
                  options: [
                    if (globalProducts.isEmpty && searchValue.value != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(Intls.to.productNotFound),
                      ),
                    ...globalProducts.map((framework) {
                      return Offstage(
                        offstage: !globalProducts.contains(framework),
                        child: ShadOption<GlobalProduct?>(
                          value: framework,
                          child: Text(framework.label),
                        ),
                      );
                    }),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

class _QuantityField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RestockProductFormController>();

    return ShadInputFormField(
      id: Intls.to.stockQuantity,
      enabled: !controller.onSaveProduct,
      label: Text('${Intls.to.stockQuantity} *'),
      controller: controller.quantityController,
      placeholder: const Text('0'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.stockQuantity,
          });
        }

        if (controller.minStockThresholdController.text.isNotEmpty &&
            int.parse(value) <
                int.parse(controller.minStockThresholdController.text)) {
          return Intls.to.quantityShouldBeGreaterThanMinStockThreshold;
        }

        return null;
      },
      onChanged: (p0) => controller.tmpProduct.storeProduct.stockQuantity =
          int.tryParse(p0) ?? 0,
    );
  }
}

class _MinStockThreshold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RestockProductFormController>();

    return ShadInputFormField(
      id: Intls.to.minStockThreshold,
      enabled: !controller.onSaveProduct,
      label: Text('${Intls.to.minStockThreshold} *'),
      controller: controller.minStockThresholdController,
      placeholder: const Text('0'),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.minStockThreshold,
          });
        }
        if (controller.quantityController.text.isNotEmpty &&
            int.parse(value) > int.parse(controller.quantityController.text)) {
          return Intls.to.minStockThresholdShouldBeLessThanStockQuantity;
        }

        return null;
      },
      onChanged: (p0) => controller.tmpProduct.storeProduct.minStockThreshold =
          int.tryParse(p0) ?? 0,
    );
  }
}

class _ExpiryDateField extends StatelessWidget {
  const _ExpiryDateField();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RestockProductFormController>();

    return ShadDatePickerFormField(
      id: Intls.to.expirationDate,
      label: Text('${Intls.to.expirationDate}'),
      initialMonth: clock.now(),
      closeOnSelection: true,
      enabled: !controller.onSaveProduct,
      showOutsideDays: false,
      height: 32,
      fromMonth: clock.now(),
      toMonth: clock.now().add(const Duration(days: 3650)),
      initialValue: controller.expiryController.text.isNotEmpty
          ? DateTime.tryParse(controller.expiryController.text)
          : null,
      placeholder: const Text('YYYY-MM-DD'),
      allowDeselection: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isBefore(clock.now())) {
          return Intls.to.expirationDateShouldBeAfterToday;
        }

        return null;
      },
      onChanged: (value) {
        if (value != null) {
          controller.tmpProduct.storeProduct.expirationDate =
              Timestamp.fromDateTime(value);

          return;
        }
        controller.tmpProduct.storeProduct.clearExpirationDate();
      },
    );
  }
}

class _FormActions extends StatelessWidget {
  const _FormActions();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RestockProductFormController>();

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
          child: Text(Intls.to.restock),
        ),
      ],
    );
  }
}

class _SupplierDropdown extends StatelessWidget {
  final addSupplierPopoverController = ShadPopoverController();
  final ValueNotifier<int> reloadTheSupplierList = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RestockProductFormController>();

    final storeId = UserPreferences.instance.store?.refId;

    if (storeId == null) {
      return const SizedBox.shrink();
    }

    void showSupplierSheet(BuildContext context) {
      final supplierFormKey = GlobalKey<ShadFormState>();
      showShadSheet(
        side: ShadSheetSide.bottom,
        context: context,
        backgroundColor: ShadTheme.of(context).colorScheme.background,
        builder: (context) => ShadSheet(
          closeIcon: const SizedBox.shrink(),
          radius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Material(
            color: ShadTheme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: _SupplierForm(
              supplierFormKey: supplierFormKey,
              storeId: storeId,
            ),
          ),
          actions: [
            ShadButton.outline(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(Intls.to.cancel),
            ),
            ShadButton(
              onPressed: () async {
                if (supplierFormKey.currentState?.saveAndValidate() == true) {
                  final supplier = Supplier(
                    name:
                        supplierFormKey.currentState?.value[Intls.to.name]
                            as String,
                    contactPhone:
                        supplierFormKey.currentState?.value[Intls
                                .to
                                .phoneNumber]
                            as String,
                    storeIds: [storeId],
                    status: SupplierStatus.SUPPLIER_STATUS_ACTIVE,
                  );
                  final supplierId = await SuppliersRepository.instance
                      .createSupplier(
                        CreateSupplierRequest(supplier: supplier),
                      );

                  if (supplierId != null) {
                    Navigator.of(context).pop();
                    reloadTheSupplierList.value++;

                    return;
                  }
                  showErrorToast(context: context, message: Intls.to.error);
                }
              },
              child: Text(Intls.to.addSupplier),
            ),
          ],
        ),
      );
    }

    return ValueListenableBuilder(
      valueListenable: reloadTheSupplierList,
      builder: (context, value, child) {
        return FutureBuilder<List<Supplier>?>(
          key: ValueKey(value),
          future: SuppliersRepository.instance.getSuppliersByStore(storeId),
          builder: (context, asyncSnapshot) {
            final suppliers = asyncSnapshot.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  Intls.to.supplier,
                  style: ShadTheme.of(
                    context,
                  ).textTheme.small.copyWith(fontWeight: FontWeight.w400),
                ),
                if (suppliers == null)
                  SpinKitCircle(
                    size: 40,
                    color: ShadTheme.of(context).colorScheme.primary,
                  )
                else if (suppliers.isEmpty)
                  ShadButton(
                    onPressed: () => showSupplierSheet(context),
                    child: Text(Intls.to.addSupplier),
                  )
                else
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return ShadSelectFormField(
                        minWidth: constraints.maxWidth,
                        controller: controller.supplierController,
                        placeholder: Text(Intls.to.selectSupplier),
                        options: suppliers
                            .map(
                              (e) => ShadOption<String?>(
                                value: e.refId,
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                        selectedOptionBuilder: (context, option) =>
                            option != null
                            ? Text(
                                suppliers
                                        .firstWhereOrNull(
                                          (e) => e.refId == option,
                                        )
                                        ?.name ??
                                    '',
                              )
                            : const SizedBox.shrink(),
                        validator: (value) {
                          if (value == null) {
                            return Intls.to.isRequiredField.trParams({
                              'field': Intls.to.supplier,
                            });
                          }

                          return null;
                        },
                      );
                    },
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

final class _SupplierForm extends StatelessWidget {
  final GlobalKey<ShadFormState> supplierFormKey;
  final String storeId;

  _SupplierForm({required this.supplierFormKey, required this.storeId});

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: supplierFormKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            ShadInputFormField(
              id: Intls.to.name,
              label: Text(Intls.to.name),
              validator: ValidationFormUtils.validateCompanyName,
            ),
            ShadInputFormField(
              id: Intls.to.phoneNumber,
              label: Text(Intls.to.phoneNumber),
              validator: ValidationFormUtils.validatePhoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}
