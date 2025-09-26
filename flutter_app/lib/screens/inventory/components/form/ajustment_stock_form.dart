import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/extends_models.dart';
import '../../../../utils/extensions/global_product_extension.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../../widgets/loading.dart';
import '../../inventory_controller.dart';
import '../ajust_flex_display.dart';
import 'ajustment_stock_form_controller.dart';

/// Product form dialog
class AdjustmentStockForm extends StatelessWidget {
  /// Constructs of new [AdjustmentStockForm].
  AdjustmentStockForm({
    super.key,
    required this.inventoryController,
    required this.product,
  });

  /// The inventory controller.
  final InventoryController inventoryController;

  /// The product to adjust.
  final Product? product;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return ShadDialog(
      title: Text(Intls.to.adjustmentStock),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dialogWidth = isDesktop ? 600.0 : constraints.maxWidth * 0.9;

          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: inventoryController),
              ChangeNotifierProvider(
                create: (context) =>
                    AdjustmentStockFormController(product: product),
              ),
            ],
            child: Consumer<AdjustmentStockFormController>(
              builder: (context, controller, child) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: dialogWidth,
                    maxHeight: MediaQuery.sizeOf(context).height * 0.8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 16,
                    children: [
                      SingleChildScrollView(
                        child: ShadForm(
                          key: controller.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 16,
                            children: [
                              _ProductDropdown(),
                              _QuantityField(),
                              const AdjustFlexDisplay(
                                children: [
                                  _CustomerReturn(),
                                  _AutoCreateRefund(),
                                ],
                              ),
                              const _ReasonField(),
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

class _AutoCreateRefund extends StatelessWidget {
  const _AutoCreateRefund();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AdjustmentStockFormController>();

    return ValueListenableBuilder(
      valueListenable: controller.isCustomerReturn,
      builder: (context, value, child) {
        if (!value) {
          return const SizedBox.shrink();
        }

        return ValueListenableBuilder(
          valueListenable: controller.isRefund,
          builder: (context, value, child) {
            return ShadSwitchFormField(
              id: Intls.to.autoCreateRefund,
              label: Text(Intls.to.autoCreateRefund),
              initialValue: value,
              onChanged: (value) => controller.isRefund.value = value,
            );
          },
        );
      },
    );
  }
}

class _ReasonField extends StatelessWidget {
  const _ReasonField();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AdjustmentStockFormController>();

    return ShadInputFormField(
      id: Intls.to.reason,
      label: Text('${Intls.to.reason} (${Intls.to.optional})'),
      controller: controller.reasonController,
      maxLines: 2,
    );
  }
}

class _CustomerReturn extends StatelessWidget {
  const _CustomerReturn();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AdjustmentStockFormController>();

    return ValueListenableBuilder(
      valueListenable: controller.isCustomerReturn,
      builder: (context, value, child) {
        return ShadSwitchFormField(
          id: Intls.to.isCustomerReturn,
          label: Text(Intls.to.isCustomerReturn),
          initialValue: value,
          onChanged: (value) {
            controller.isCustomerReturn.value = value;
            if (!value) {
              controller.isRefund.value = false;
            }
          },
        );
      },
    );
  }
}

class _ProductDropdown extends StatelessWidget {
  final ValueNotifier<String?> searchValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    Timer? _debounce;
    final controller = context.watch<AdjustmentStockFormController>();
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
                  initialValue: controller.product?.globalProduct,
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
                    controller.product?.globalProduct = value;
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
    final controller = context.watch<AdjustmentStockFormController>();

    return ShadInputFormField(
      id: Intls.to.adjustmentAmount,
      description: Text(Intls.to.adjustmentAmountDescription),
      enabled: !controller.onSaveProduct,
      label: Text('${Intls.to.stockQuantity} *'),
      controller: controller.adjustmentQuantityController,
      placeholder: const Text('0'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          return Intls.to.isRequiredField.trParams({
            'field': Intls.to.stockQuantity,
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
    final controller = context.watch<AdjustmentStockFormController>();

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
