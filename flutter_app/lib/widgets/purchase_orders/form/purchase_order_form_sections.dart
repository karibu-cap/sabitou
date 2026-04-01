import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../../input/auto_complete.dart';
import 'purchase_order_form_controller.dart';
import 'purchase_order_item_picker.dart';

/// The header section containing supplier info, address, and delivery date.
class PurchaseOrderFormHeaderSection extends StatelessWidget {
  /// Create a new header section.
  PurchaseOrderFormHeaderSection({super.key});

  final TextEditingController searchController = TextEditingController(
    text: '',
  );

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PurchaseOrderFormController>();

    return _FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FormSectionLabel(label: Intls.to.generalInfo),
          const SizedBox(height: 14),

          _FormField(
            label: Intls.to.supplier,
            isRequired: true,
            child: AutoComplete<Supplier>(
              placeholder: Intls.to.selectSupplier,
              searchPlaceholder: Intls.to.searchAndFilter,
              initialValue: ctrl.supplierNameController.value.text,
              canReturnDataWhenEmpty: true,
              optionsBuilder: (text) async {
                return await ctrl.searchSuppliers(text);
              },
              displayStringForOption: (option) => option.name,
              validator: (value) {
                if (value == null) {
                  return Intls.to.isRequiredField.trParams({
                    'field': Intls.to.supplier,
                  });
                }

                return null;
              },
              onSelected: (supplier) {
                ctrl.supplierIdController.text = supplier.refId;
                ctrl.supplierNameController.text = supplier.name;
              },
            ),
          ),

          const SizedBox(height: 12),

          _FormField(
            label: Intls.to.deliveryAddress,
            child: ShadInput(
              controller: ctrl.destinationAddressController,
              placeholder: Text(Intls.to.deliveryAddress),
              leading: const Icon(LucideIcons.mapPin, size: 14),
            ),
          ),

          const SizedBox(height: 12),

          _FormField(
            label: Intls.to.expectedDeliveryDate,
            child: ShadDatePickerFormField(
              width: double.infinity,
              initialValue: ctrl.expectedDeliveryDate,
              onChanged: (value) {
                if (value != null) {
                  ctrl.setDeliveryDate(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// The items section showing a list of drafted items with an add button.
class PurchaseOrderFormItemsSection extends StatelessWidget {
  /// Create a new items section.
  const PurchaseOrderFormItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PurchaseOrderFormController>();
    final cs = ShadTheme.of(context).colorScheme;

    return _FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _FormSectionLabel(label: Intls.to.items),
              const Spacer(),
              ShadButton(
                size: ShadButtonSize.sm,
                onPressed: () async {
                  final draft = await showPurchaseOrderItemPicker(
                    context,
                    controller: ctrl,
                  );
                  if (draft != null) {
                    ctrl.addItem(draft);
                  }
                },
                leading: const Icon(LucideIcons.plus, size: 14),
                child: Text(Intls.to.addItem),
              ),
            ],
          ),
          const SizedBox(height: 12),

          if (ctrl.items.isEmpty)
            _EmptyItemsPlaceholder()
          else ...[
            _ItemsTableHeader(),
            Divider(color: cs.border, height: 1),
            ...ctrl.items.asMap().entries.map(
              (entry) =>
                  PurchaseOrderLineItemRow(index: entry.key, item: entry.value),
            ),
          ],
        ],
      ),
    );
  }
}

/// The additional notes section of the form.
class PurchaseOrderFormNotesSection extends StatelessWidget {
  /// Create a new notes section.
  const PurchaseOrderFormNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PurchaseOrderFormController>();

    return _FormCard(
      child: _FormField(
        label: Intls.to.notes,
        child: ShadInput(
          controller: ctrl.notesController,
          placeholder: Text(Intls.to.notesHint),
          maxLines: 3,
        ),
      ),
    );
  }
}

/// A summary view to display the total amount for the drafted items.
class PurchaseOrderFormTotalsSection extends StatelessWidget {
  /// Create a new totals section.
  const PurchaseOrderFormTotalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PurchaseOrderFormController>();
    final theme = ShadTheme.of(context);

    return _FormCard(
      child: Column(
        children: [
          _TotalRow(
            label: Intls.to.totalAmount,
            value: Formatters.formatCurrency(ctrl.totalAmount),
            theme: theme,
            bold: true,
          ),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.value,
    required this.theme,
    this.bold = false,
  });

  final String label;
  final String value;
  final ShadThemeData theme;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: theme.textTheme.p.copyWith(
            fontSize: bold ? 14 : 13,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
            color: bold
                ? null
                : ShadTheme.of(context).colorScheme.mutedForeground,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: theme.textTheme.p.copyWith(
            fontSize: bold ? 14 : 13,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _FormCard extends StatelessWidget {
  const _FormCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadCard(padding: const EdgeInsets.all(16), child: child);
  }
}

class _FormSectionLabel extends StatelessWidget {
  const _FormSectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: ShadTheme.of(context).textTheme.muted.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: .5,
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.label,
    required this.child,
    this.isRequired = false,
  });

  final String label;
  final Widget child;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: theme.textTheme.muted.copyWith(fontSize: 12)),
            if (isRequired) ...[
              const SizedBox(width: 3),
              const Text(
                '*',
                style: TextStyle(
                  fontSize: 12,
                  color: SabitouColors.danger,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }
}

class _EmptyItemsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: cs.background,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(BorderSide(color: cs.border)),
      ),
      child: Column(
        children: [
          Icon(LucideIcons.packageSearch, size: 28, color: cs.mutedForeground),
          const SizedBox(height: 10),
          Text(
            Intls.to.noItemsAdded,
            style: theme.textTheme.muted.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _ItemsTableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              Intls.to.product,
              style: theme.textTheme.muted.copyWith(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _HeaderCell(label: Intls.to.qty, width: 52),
          const SizedBox(width: 8),
          _HeaderCell(label: Intls.to.unitPrice, width: 90),
          const SizedBox(width: 8),
          _HeaderCell(label: Intls.to.total, width: 90),
          const SizedBox(width: 36),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell({required this.label, required this.width});

  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        label,
        textAlign: TextAlign.right,
        style: ShadTheme.of(
          context,
        ).textTheme.muted.copyWith(fontSize: 11.5, fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// A list item representing a parsed product in the purchase order.
class PurchaseOrderLineItemRow extends StatefulWidget {
  /// Create a new row.
  const PurchaseOrderLineItemRow({
    super.key,
    required this.index,
    required this.item,
  });

  /// The position index in the items list.
  final int index;

  /// The current state of this draft.
  final PurchaseOrderLineItemDraft item;

  @override
  State<PurchaseOrderLineItemRow> createState() =>
      _PurchaseOrderLineItemRowState();
}

class _PurchaseOrderLineItemRowState extends State<PurchaseOrderLineItemRow> {
  late final TextEditingController _qtyCtrl;
  late final TextEditingController _priceCtrl;

  @override
  void initState() {
    super.initState();
    _qtyCtrl = TextEditingController(text: widget.item.quantity.toString());
    _priceCtrl = TextEditingController(
      text: widget.item.unitPrice.toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _qtyCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  void _notify() {
    final newItem = PurchaseOrderLineItemDraft(
      productId: widget.item.productId,
      globalProduct: widget.item.globalProduct,
      quantity: int.tryParse(_qtyCtrl.text) ?? widget.item.quantity,
      unitPrice: double.tryParse(_priceCtrl.text) ?? widget.item.unitPrice,
    );
    context.read<PurchaseOrderFormController>().updateItem(
      widget.index,
      newItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PurchaseOrderFormController>();
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final item = widget.item;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: cs.border.withValues(alpha: .5)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.globalProduct.label,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.productId,
                  style: theme.textTheme.muted.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 52,
            child: _InlineInput(
              controller: _qtyCtrl,
              onChanged: (_) => _notify(),
              formatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 90,
            child: _InlineInput(
              controller: _priceCtrl,
              onChanged: (_) => _notify(),
              formatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 90,
            child: Text(
              Formatters.formatCurrency(item.total),
              textAlign: TextAlign.right,
              style: theme.textTheme.p.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ShadButton.ghost(
            size: ShadButtonSize.sm,
            onPressed: () => ctrl.removeItem(widget.index),
            padding: const EdgeInsets.all(6),
            decoration: ShadDecoration(
              border: ShadBorder.all(
                color: cs.border,
                radius: const BorderRadius.all(Radius.circular(7)),
              ),
            ),
            child: Icon(LucideIcons.trash2, size: 13, color: cs.destructive),
          ),
        ],
      ),
    );
  }
}

class _InlineInput extends StatelessWidget {
  const _InlineInput({
    required this.controller,
    required this.onChanged,
    required this.formatters,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter> formatters;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadInput(
      decoration: ShadDecoration(
        color: cs.background,
        border: ShadBorder.fromBorderSide(ShadBorderSide(color: cs.border)),
      ),
      controller: controller,
      onChanged: onChanged,
      textAlign: TextAlign.right,
      keyboardType: TextInputType.number,
      inputFormatters: formatters,
      style: theme.textTheme.p.copyWith(fontSize: 13),
    );
  }
}
