import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import '../../input/auto_complete.dart';
import 'bill_form_controller.dart';
import 'bill_item_picker.dart';

const _kCurrencies = ['XAF'];

/// Form section containing supplier, PO ref, dates, and currency fields.
class BillFormHeaderSection extends StatelessWidget {
  /// Constructs a [BillFormHeaderSection].
  const BillFormHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<BillFormController>();
    final theme = ShadTheme.of(context);

    return _FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FormSectionLabel(label: Intls.to.generalInfo),
          const SizedBox(height: 14),

          _FormField(
            label: Intls.to.purchaseOrderRef,
            child: ShadInput(
              controller: ctrl.poRefController,
              placeholder: Text(Intls.to.purchaseOrderRefHint),
              leading: const Icon(LucideIcons.clipboardList, size: 14),
              enabled: !ctrl.poLocked,
            ),
          ),
          const SizedBox(height: 12),

          _FormField(
            label: Intls.to.supplier,
            isRequired: true,
            child: Row(
              children: [
                Expanded(
                  child: switch (ctrl.supplierLocked) {
                    true => ShadInput(
                      controller: ctrl.supplierNameController,
                      placeholder: Text(Intls.to.supplierIdHint),
                      leading: const Icon(LucideIcons.building2, size: 14),
                      enabled: false,
                    ),
                    false => AutoComplete<Supplier>(
                      placeholder: Intls.to.selectSupplier,
                      searchPlaceholder: Intls.to.name,
                      initialValue: ctrl.supplierIdController.text,
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
                  },
                ),
                if (ctrl.supplierLocked) ...[
                  const SizedBox(width: 8),
                  _LockedBadge(),
                ],
              ],
            ),
          ),

          if (ctrl.supplierNameController.text.isNotEmpty &&
              ctrl.supplierNameController.text !=
                  ctrl.supplierIdController.text) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                ctrl.supplierNameController.text,
                style: theme.textTheme.muted.copyWith(fontSize: 12),
              ),
            ),
          ],
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _DatePickerField(
                  label: Intls.to.billDate,
                  value: ctrl.billDate,
                  onChanged: ctrl.setBillDate,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _DatePickerField(
                  label: Intls.to.dueDate,
                  value: ctrl.dueDate,
                  onChanged: ctrl.setDueDate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          _FormField(
            label: Intls.to.currency,
            child: _CurrencySelector(controller: ctrl.currencyController),
          ),
        ],
      ),
    );
  }
}

/// Locked badge shown next to the supplier field when pre-filled from a PO.
class _LockedBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: const BoxDecoration(
        color: SabitouColors.warningSoft,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            LucideIcons.lock,
            size: 11,
            color: SabitouColors.warningForeground,
          ),
          const SizedBox(width: 5),
          Text(
            Intls.to.lockedFromPO,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: SabitouColors.warningForeground,
            ),
          ),
        ],
      ),
    );
  }
}

/// Date picker field that opens a [showDatePicker] on tap.
class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return ShadDatePickerFormField(
      label: Text(label),
      initialValue: value,
      onChanged: (value) => value != null ? onChanged(value) : null,
    );
  }
}

/// Dropdown to select from [_kCurrencies].
class _CurrencySelector extends StatelessWidget {
  const _CurrencySelector({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadSelect<String>(
      initialValue: controller.text.isNotEmpty ? controller.text : 'XAF',
      onChanged: (v) {
        if (v != null) controller.text = v;
      },
      options: _kCurrencies
          .map(
            (c) => ShadOption(
              value: c,
              child: Row(
                children: [
                  Text(c, style: theme.textTheme.p.copyWith(fontSize: 13)),
                ],
              ),
            ),
          )
          .toList(),
      selectedOptionBuilder: (context, value) => Text(value),
    );
  }
}

/// Form section listing all current bill line items with an add button.
class BillFormItemsSection extends StatelessWidget {
  /// Constructs a [BillFormItemsSection].
  const BillFormItemsSection({super.key, required this.productsStream});

  /// Stream of store products passed to [showBillItemPicker].
  final Stream<List<StoreProductWithGlobalProduct>> productsStream;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<BillFormController>();
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return _FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _FormSectionLabel(label: Intls.to.items),
              const Spacer(),
              // Show a locked badge instead of the Add button when quantities
              // are locked (form was pre-filled from receiving notes).
              if (ctrl.quantityLocked)
                _QuantityLockedBadge()
              else
                ShadButton(
                  size: ShadButtonSize.sm,
                  onPressed: () async {
                    final draft = await showBillItemPicker(
                      context,
                      productsStream: productsStream,
                    );
                    if (draft != null) ctrl.addItem(draft);
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
                  BillFormLineItemRow(index: entry.key, item: entry.value),
            ),
          ],
        ],
      ),
    );
  }
}

/// Placeholder shown when no items have been added yet.
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

/// Column headers for the items table.
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
          _HeaderCell(label: Intls.to.taxAbbr, width: 52),
          const SizedBox(width: 8),
          _HeaderCell(label: Intls.to.total, width: 90),
          const SizedBox(width: 36), // delete button space
        ],
      ),
    );
  }
}

/// Single column header cell.
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

/// A single editable line item row in the bill form items table.
class BillFormLineItemRow extends StatefulWidget {
  /// Constructs a [BillFormLineItemRow] for the item at [index].
  const BillFormLineItemRow({
    super.key,
    required this.index,
    required this.item,
  });

  /// Index of this item in [BillFormController.items].
  final int index;

  /// The current draft for this line.
  final BillLineItemDraft item;

  @override
  State<BillFormLineItemRow> createState() => _BillFormLineItemRowState();
}

class _BillFormLineItemRowState extends State<BillFormLineItemRow> {
  late final TextEditingController _qtyCtrl;
  late final TextEditingController _priceCtrl;
  late final TextEditingController _taxCtrl;

  @override
  void initState() {
    super.initState();
    _qtyCtrl = TextEditingController(text: widget.item.quantity.toString());
    _priceCtrl = TextEditingController(
      text: widget.item.unitPrice.toStringAsFixed(0),
    );
    _taxCtrl = TextEditingController(
      text: widget.item.taxRate.toStringAsFixed(2),
    );
  }

  @override
  void dispose() {
    _qtyCtrl.dispose();
    _priceCtrl.dispose();
    _taxCtrl.dispose();
    super.dispose();
  }

  void _notify() {
    final ctrl = context.read<BillFormController>();
    ctrl.updateItem(
      widget.index,
      BillLineItemDraft(
        productId: widget.item.productId,
        description: widget.item.description,
        quantity: int.tryParse(_qtyCtrl.text) ?? widget.item.quantity,
        unitPrice: double.tryParse(_priceCtrl.text) ?? widget.item.unitPrice,
        taxRate: double.tryParse(_taxCtrl.text) ?? widget.item.taxRate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<BillFormController>();
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
          // Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.description.isNotEmpty
                      ? item.description
                      : item.productId,
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

          // Qty — read-only when quantities are locked (from receiving notes).
          SizedBox(
            width: 52,
            child: ctrl.quantityLocked
                ? _ReadOnlyCell(
                    text: widget.item.quantity.toString(),
                    theme: theme,
                  )
                : _InlineInput(
                    controller: _qtyCtrl,
                    onChanged: (_) => _notify(),
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
          ),
          const SizedBox(width: 8),

          // Unit price
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

          // Tax %
          SizedBox(
            width: 52,
            child: _InlineInput(
              controller: _taxCtrl,
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

          // Remove button
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

/// Compact inline text input for use in table cells.
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

/// Read-only cell displayed instead of [_InlineInput] when
/// [BillFormController.quantityLocked] is `true`.
class _ReadOnlyCell extends StatelessWidget {
  const _ReadOnlyCell({required this.text, required this.theme});

  final String text;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;

    return Container(
      height: 36,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: cs.secondary,
        border: Border.fromBorderSide(BorderSide(color: cs.border)),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Text(
        text,
        style: theme.textTheme.p.copyWith(
          fontSize: 13,
          color: cs.mutedForeground,
        ),
      ),
    );
  }
}

/// Badge shown in the items section header when quantities are locked.
class _QuantityLockedBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: const BoxDecoration(
        color: SabitouColors.infoSoft,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(LucideIcons.lock, size: 11, color: SabitouColors.infoText),
          const SizedBox(width: 5),
          Text(
            Intls.to.quantityFromReceive,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: SabitouColors.infoText,
            ),
          ),
        ],
      ),
    );
  }
}

/// Read-only totals summary: sub-total, tax, total.
class BillFormTotalsSection extends StatelessWidget {
  /// Constructs a [BillFormTotalsSection].
  const BillFormTotalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<BillFormController>();
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final currency = ctrl.currencyController.text.isNotEmpty
        ? ctrl.currencyController.text
        : 'XAF';

    return _FormCard(
      child: Column(
        children: [
          _TotalRow(
            label: Intls.to.subTotal,
            value: '$currency ${Formatters.formatCurrency(ctrl.subTotal)}',
            theme: theme,
          ),
          const SizedBox(height: 6),
          _TotalRow(
            label: Intls.to.taxTotal,
            value: '$currency ${Formatters.formatCurrency(ctrl.taxTotal)}',
            theme: theme,
          ),
          Divider(color: cs.border, height: 20),
          _TotalRow(
            label: Intls.to.totalAmount,
            value: '$currency ${Formatters.formatCurrency(ctrl.totalAmount)}',
            theme: theme,
            bold: true,
          ),
        ],
      ),
    );
  }
}

/// A single row inside [BillFormTotalsSection].
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

/// Optional notes textarea at the bottom of the form.
class BillFormNotesSection extends StatelessWidget {
  /// Constructs a [BillFormNotesSection].
  const BillFormNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<BillFormController>();

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

/// Card wrapper used by every form section.
class _FormCard extends StatelessWidget {
  const _FormCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadCard(padding: const EdgeInsets.all(16), child: child);
  }
}

/// Uppercase section label with optional required asterisk.
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

/// A labeled wrapper for any input widget.
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
