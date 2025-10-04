import 'dart:collection';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/form/validation.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/custom_shad_button.dart';
import '../purchase_orders_controller.dart';
import 'purchase_order_form_controller.dart';

/// Purchase order form dialog
class PurchaseOrderForm extends StatelessWidget {
  /// Constructs a new [PurchaseOrderForm].
  const PurchaseOrderForm({super.key, required this.purchaseOrdersController});

  /// The purchase orders controller.
  final PurchaseOrdersController purchaseOrdersController;

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(Intls.to.createPurchaseOrder),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: purchaseOrdersController),
          ChangeNotifierProvider(
            create: (context) => PurchaseOrderFormController(),
          ),
        ],
        child: Consumer<PurchaseOrderFormController>(
          builder: (context, formController, child) {
            return ShadForm(
              key: formController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    _SupplierField(
                      purchaseOrdersController: purchaseOrdersController,
                    ),
                    const _DeliveryDateField(),
                    const _LineItemsSection(),
                    const _NotesField(),
                    const SizedBox(height: 16),
                    const _TotalSection(),
                    const SizedBox(height: 16),
                    const _FormActions(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Supplier selection field
class _SupplierField extends StatelessWidget {
  const _SupplierField({required this.purchaseOrdersController});

  final PurchaseOrdersController purchaseOrdersController;

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<PurchaseOrderFormController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<UnmodifiableListView<Supplier>>(
              stream: purchaseOrdersController.suppliersSubject,
              builder: (context, snapshot) {
                final suppliers = snapshot.data ?? UnmodifiableListView([]);

                return ShadSelectFormField<String>(
                  id: Intls.to.supplier,
                  label: Text(
                    '${Intls.to.supplier} *',
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                  minWidth: constraints.maxWidth,
                  placeholder: Text(Intls.to.selectSupplier),
                  enabled: !formController.isSubmitting,
                  options: suppliers.map((supplier) {
                    return ShadOption(
                      value: supplier.refId,
                      child: Text(supplier.name),
                    );
                  }).toList(),
                  selectedOptionBuilder: (context, value) =>
                      Text(suppliers.firstWhere((s) => s.refId == value).name),
                  validator: (value) => ValidationFormUtils.validateString(
                    value,
                    Intls.to.supplier,
                  ),
                  onChanged: formController.setSupplier,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

/// Expected delivery date field
class _DeliveryDateField extends StatelessWidget {
  const _DeliveryDateField();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<PurchaseOrderFormController>();

    return ShadDatePickerFormField(
      id: 'expectedDeliveryDate',
      label: Text('${Intls.to.expectedDeliveryDate} *'),
      fromMonth: clock.now(),
      width: double.infinity,
      initialMonth: clock.now(),
      closeOnSelection: true,
      toMonth: clock.now().add(const Duration(days: 365)),
      validator: (v) {
        if (v == null) {
          return Intls.to.requiredField;
        }

        if (v.isBefore(clock.now())) {
          return Intls.to.invalidDate;
        }

        return null;
      },
      onChanged: formController.setExpectedDeliveryDate,
    );
  }
}

/// Line items section
class _LineItemsSection extends StatelessWidget {
  const _LineItemsSection();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<PurchaseOrderFormController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${Intls.to.items} *',
              style: ShadTheme.of(context).textTheme.p,
            ),
            ShadButton(
              size: ShadButtonSize.sm,
              onPressed: formController.isSubmitting
                  ? null
                  : formController.addLineItem,
              child: Text(Intls.to.addProduct),
              leading: const Icon(LucideIcons.plus),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ShadCard(
          padding: const EdgeInsets.all(16),
          child: formController.lineItems.isEmpty
              ? const _EmptyLineItemsState()
              : ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 400),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      for (
                        var i = 0;
                        i < formController.lineItems.length;
                        i++
                      ) ...[
                        SliverToBoxAdapter(
                          child: _LineItemCard(
                            item: formController.lineItems[i],
                            index: i,
                          ),
                        ),
                        if (i < formController.lineItems.length - 1)
                          const SliverToBoxAdapter(child: Divider(height: 24)),
                      ],
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

/// Empty state for line items
class _EmptyLineItemsState extends StatelessWidget {
  const _EmptyLineItemsState();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const Icon(
                LucideIcons.clipboardList,
                size: 48,
                color: Colors.grey,
              ),
              const SizedBox(height: 8),
              Text(
                Intls.to.noProductsAddedYet,
                style: ShadTheme.of(
                  context,
                ).textTheme.small.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                Intls.to.clickAddProduct,
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Individual line item card
class _LineItemCard extends StatelessWidget {
  const _LineItemCard({required this.item, required this.index});

  final OrderLineItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final purchaseOrdersController = context.read<PurchaseOrdersController>();
    final formController = context.read<PurchaseOrderFormController>();

    /// Displays only the product that not in the line items.
    final products = purchaseOrdersController.storeProducts
        .where(
          (p) => !formController.lineItems.any(
            (i) => i.productId == p.storeProduct.refId,
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ShadSelect<StoreProductWithGlobalProduct>(
                placeholder: Text(Intls.to.selectProduct),
                enabled: !formController.isSubmitting,
                options: products.map((product) {
                  return ShadOption(
                    value: product,
                    child: Text(product.globalProduct.label),
                  );
                }).toList(),
                selectedOptionBuilder: (context, value) =>
                    Text(value.globalProduct.label),
                onChanged: (value) {
                  if (value != null) {
                    formController.setOrderItem(index, value);
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            ShadButton.ghost(
              size: ShadButtonSize.sm,
              onPressed: formController.isSubmitting
                  ? null
                  : () => formController.removeLineItem(index),
              child: const Icon(
                LucideIcons.trash2,
                color: AppColors.red,
                size: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ShadInputFormField(
                id: 'quantity_$index',
                label: Text(Intls.to.quantity),
                enabled: !formController.isSubmitting,
                keyboardType: TextInputType.number,
                initialValue: item.quantity.toString(),
                onChanged: (value) {
                  final quantity = int.tryParse(value) ?? 0;
                  final unitPrice =
                      double.tryParse(item.unitPrice.toString()) ?? 0.0;

                  formController.updateLineItem(
                    index,
                    item
                      ..quantity = quantity
                      ..total = quantity * unitPrice,
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ShadInputFormField(
                id: 'unitPrice_$index',
                enabled: !formController.isSubmitting,
                keyboardType: TextInputType.number,
                initialValue: item.unitPrice.toString(),
                label: Text(Intls.to.unitPurchasePrice),
                onChanged: (value) {
                  final unitPrice = double.tryParse(value) ?? 0.0;
                  final quantity = int.tryParse(item.quantity.toString()) ?? 0;
                  formController.updateLineItem(
                    index,
                    item
                      ..unitPrice = unitPrice
                      ..total = quantity * unitPrice,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.grey400.withValues(alpha: 0.05),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Intls.to.total,
                style: ShadTheme.of(context).textTheme.small,
              ),
              Text(
                Formatters.formatCurrency(item.total),
                style: ShadTheme.of(context).textTheme.small,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Notes field
class _NotesField extends StatelessWidget {
  const _NotesField();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<PurchaseOrderFormController>();

    return ShadTextareaFormField(
      id: 'notes',
      enabled: !formController.isSubmitting,
      controller: formController.notesController,
      label: Text('${Intls.to.notes} (${Intls.to.optional})'),
      placeholder: Text(Intls.to.addSpecialInstructionsOrNotes),
    );
  }
}

/// Total amount section
class _TotalSection extends StatelessWidget {
  const _TotalSection();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<PurchaseOrderFormController>();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cobalt.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Intls.to.totalAmount,
              style: ShadTheme.of(context).textTheme.h4,
            ),
            Text(
              Formatters.formatCurrency(formController.totalAmount),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.cobalt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Form action buttons
class _FormActions extends StatelessWidget {
  const _FormActions();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<PurchaseOrderFormController>();
    final purchaseOrdersController = context.read<PurchaseOrdersController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          onPressed: formController.isSubmitting
              ? null
              : () => Navigator.of(context).pop(),
          child: Text(Intls.to.cancel),
        ),
        const SizedBox(width: 12),
        CustomShadButton(
          leading: const Icon(LucideIcons.package400),
          onPressed: () async {
            final success = await formController.submitForm(
              context,
              purchaseOrdersController,
            );
            if (success && context.mounted) {
              Navigator.of(context).pop();
            }
          },
          enabled: !formController.isSubmitting,
          text: Intls.to.createPurchaseOrder,
        ),
      ],
    );
  }
}
