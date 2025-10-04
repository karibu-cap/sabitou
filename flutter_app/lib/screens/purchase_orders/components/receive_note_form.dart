import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
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
import 'receive_note_form_controller.dart';

/// Purchase order form dialog
class ReceiveNoteForm extends StatelessWidget {
  /// Constructs a new [ReceiveNoteForm].
  const ReceiveNoteForm({
    super.key,
    required this.purchaseOrdersController,
    required this.purchaseOrder,
  });

  /// The purchase orders controller.
  final PurchaseOrdersController purchaseOrdersController;

  /// The purchase order to receive.
  final PurchaseOrder purchaseOrder;

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(Intls.to.createReceiveNote),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: purchaseOrdersController),
          ChangeNotifierProvider(
            create: (context) =>
                ReceiveNoteFormController(purchaseOrder: purchaseOrder),
          ),
        ],
        child: Consumer<ReceiveNoteFormController>(
          builder: (context, formController, child) {
            return ShadForm(
              key: formController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    _PurchaseOrderField(
                      purchaseOrdersController: purchaseOrdersController,
                    ),
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

/// Purchase order selection field
class _PurchaseOrderField extends StatelessWidget {
  const _PurchaseOrderField({required this.purchaseOrdersController});

  final PurchaseOrdersController purchaseOrdersController;

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<ReceiveNoteFormController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final purchaseOrders =
            (purchaseOrdersController.purchaseOrdersSubject.valueOrNull ??
                    <PurchaseOrder>[])
                .where(
                  (po) =>
                      po.status ==
                          PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED ||
                      po.status == PurchaseOrderStatus.PO_STATUS_PENDING,
                )
                .toList();

        return ShadSelectFormField<String>(
          id: 'purchaseOrder',
          label: Text('${Intls.to.purchaseOrders} *'),
          minWidth: constraints.maxWidth,
          initialValue: formController.relatedPurchaseOrderId,
          placeholder: Text(Intls.to.selectPurchaseOrder),
          enabled: !formController.isSubmitting,
          options: purchaseOrders.map((po) {
            return ShadOption(
              value: po.documentId,
              child: Text('${po.documentId} - ${po.supplierId}'),
            );
          }).toList(),
          selectedOptionBuilder: (context, value) {
            final po = purchaseOrders.firstWhere(
              (p) => p.documentId == value,
              orElse: PurchaseOrder.new,
            );

            return Text(
              po.documentId.isNotEmpty
                  ? '${po.documentId} - ${po.supplierId}'
                  : value,
            );
          },
          validator: (value) => ValidationFormUtils.validateString(
            value,
            Intls.to.purchaseOrders,
          ),
          onChanged: (value) {
            formController.relatedPurchaseOrderId = value;
            if (value != null && value.isNotEmpty) {
              final po = purchaseOrders.firstWhere(
                (p) => p.documentId == value,
                orElse: PurchaseOrder.new,
              );
              if (po.supplierId.isNotEmpty) {
                formController.selectedSupplierId = po.supplierId;
              }
            }
          },
        );
      },
    );
  }
}

/// Supplier selection field
class _SupplierField extends StatelessWidget {
  const _SupplierField({required this.purchaseOrdersController});

  final PurchaseOrdersController purchaseOrdersController;

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<ReceiveNoteFormController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final suppliers =
            purchaseOrdersController.suppliersSubject.valueOrNull ??
            <Supplier>[];

        return ShadSelectFormField<String>(
          id: Intls.to.supplier,
          label: Text('${Intls.to.supplier} *'),
          minWidth: constraints.maxWidth,
          placeholder: Text(Intls.to.selectSupplier),
          enabled: !formController.isSubmitting,
          initialValue: formController.selectedSupplierId,
          options: suppliers.map((supplier) {
            return ShadOption(
              value: supplier.refId,
              child: Text(supplier.name),
            );
          }).toList(),
          selectedOptionBuilder: (context, value) =>
              Text(suppliers.firstWhere((s) => s.refId == value).name),
          validator: (value) =>
              ValidationFormUtils.validateString(value, Intls.to.supplier),
          onChanged: formController.setSupplier,
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
    final formController = context.watch<ReceiveNoteFormController>();

    return ShadDatePickerFormField(
      id: 'receivedDate',
      label: Text('${Intls.to.receiveDate} *'),
      fromMonth: clock.now().subtract(const Duration(days: 30)),
      width: double.infinity,
      initialMonth: clock.now(),
      closeOnSelection: true,
      toMonth: clock.now().add(const Duration(days: 7)),
      initialValue: formController.receivedAt,
      validator: (v) {
        if (v == null) {
          return Intls.to.requiredField;
        }

        return null;
      },
      onChanged: formController.setReceivedDate,
    );
  }
}

/// Line items section
class _LineItemsSection extends StatelessWidget {
  const _LineItemsSection();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<ReceiveNoteFormController>();

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

class _LineItemCard extends StatelessWidget {
  const _LineItemCard({required this.item, required this.index});

  final ReceivingLineItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final purchaseOrdersController = context.read<PurchaseOrdersController>();
    final formController = context.read<ReceiveNoteFormController>();

    /// Displays only the product that not in the line items.
    final products = purchaseOrdersController.storeProducts
        .where(
          (p) => !formController.lineItems.any(
            (i) => i.hasProductId() && i.productId == p.storeProduct.refId,
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: ShadSelect<StoreProductWithGlobalProduct>(
                placeholder: Text(Intls.to.selectProduct),
                enabled: !formController.isSubmitting,
                initialValue: item.hasProductId()
                    ? purchaseOrdersController.storeProducts.firstWhereOrNull(
                        (p) => p.storeProduct.refId == item.productId,
                      )
                    : null,
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
        // Expected Quantity Row
        Row(
          children: [
            Expanded(
              child: ShadInputFormField(
                id: 'expected_quantity_$index',
                label: Text(Intls.to.expectedQuantity),
                enabled: !formController.isSubmitting,
                keyboardType: TextInputType.number,
                initialValue: item.hasQuantityExpected()
                    ? item.quantityExpected.toString()
                    : '0',
                onChanged: (value) {
                  final quantityExpected = double.tryParse(value) ?? 0.0;
                  formController.updateLineItem(
                    index,
                    item..quantityExpected = quantityExpected,
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ShadInputFormField(
                id: 'purchase_price_$index',
                enabled: !formController.isSubmitting,
                label: Text(Intls.to.purchasePrice),
                keyboardType: TextInputType.number,
                initialValue: item.hasPurchasePrice()
                    ? item.purchasePrice.toString()
                    : '0',
                onChanged: (value) {
                  final purchasePrice = int.tryParse(value) ?? 0;
                  formController.updateLineItem(
                    index,
                    item..purchasePrice = purchasePrice,
                  );
                },
              ),
            ),
          ],
        ),
        // Received Quantity Row
        Row(
          children: [
            Expanded(
              child: ShadInputFormField(
                id: 'received_quantity_$index',
                enabled: !formController.isSubmitting,
                label: Text(Intls.to.receivedQuantity),
                keyboardType: TextInputType.number,
                initialValue: item.hasQuantityReceived()
                    ? item.quantityReceived.toString()
                    : '0',
                onChanged: (value) {
                  final quantityReceived = double.tryParse(value) ?? 0.0;
                  formController.updateLineItem(
                    index,
                    item..quantityReceived = quantityReceived,
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ShadInputFormField(
                id: 'rejected_quantity_$index',
                label: Text(Intls.to.rejectedQuantity),
                enabled: !formController.isSubmitting,
                keyboardType: TextInputType.number,
                initialValue: item.hasQuantityRejected()
                    ? item.quantityRejected.toString()
                    : '0',
                onChanged: (value) {
                  final quantityRejected = double.tryParse(value) ?? 0.0;
                  formController.updateLineItem(
                    index,
                    item..quantityRejected = quantityRejected,
                  );
                },
              ),
            ),
          ],
        ),
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
                '${Intls.to.totalValue} :',
                style: ShadTheme.of(context).textTheme.small,
              ),
              Text(
                Formatters.formatCurrency(
                  item.purchasePrice.toDouble() * item.quantityReceived,
                ),
                style: ShadTheme.of(context).textTheme.small,
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ShadInputFormField(
                id: 'batch_id_$index',
                enabled: !formController.isSubmitting,
                placeholder: const Text('Batch: 14527'),
                label: Text(Intls.to.batch),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  formController.updateLineItem(index, item..batchId = value);
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ShadDatePickerFormField(
                id: 'expiration_date_$index',
                label: Text(
                  '${Intls.to.expirationDate} (${Intls.to.optional})',
                ),
                fromMonth: clock.now().subtract(const Duration(days: 30)),
                width: double.infinity,
                initialMonth: clock.now(),
                toMonth: clock.now().add(const Duration(days: 7)),
                validator: (v) {
                  if (v != null && v.isBefore(clock.now())) {
                    return Intls.to.invalidDate;
                  }

                  return null;
                },
                onChanged: (value) {
                  if (value == null) return;
                  formController.updateLineItem(
                    index,
                    item..expirationDate = Timestamp.fromDateTime(value),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NotesField extends StatelessWidget {
  const _NotesField();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<ReceiveNoteFormController>();

    return ShadTextareaFormField(
      id: 'notes',
      enabled: !formController.isSubmitting,
      controller: formController.notesController,
      label: Text('${Intls.to.notes} (${Intls.to.optional})'),
      placeholder: Text(Intls.to.addNotesAboutTheDeliveryConditionDamagesEtc),
    );
  }
}

class _TotalSection extends StatelessWidget {
  const _TotalSection();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<ReceiveNoteFormController>();

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
              '${Intls.to.totalValue} :',
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

class _FormActions extends StatelessWidget {
  const _FormActions();

  @override
  Widget build(BuildContext context) {
    final formController = context.watch<ReceiveNoteFormController>();
    final purchaseOrdersController = context.read<PurchaseOrdersController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          onPressed: formController.isSubmitting
              ? null
              : () => Navigator.of(context).pop(),
          child: Text('${Intls.to.cancel}'),
        ),
        const SizedBox(width: 12),
        CustomShadButton(
          leading: const Icon(LucideIcons.receipt400),
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
          text: Intls.to.createReceivingNote,
        ),
      ],
    );
  }
}
