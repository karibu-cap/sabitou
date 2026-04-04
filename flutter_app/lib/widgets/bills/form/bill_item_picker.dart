import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../loading.dart';
import '../../shad_scaffold.dart';
import 'bill_form_controller.dart';

/// Opens the item picker in the correct presentation based on screen width.
///
/// On desktop (≥820 px) a dialog is shown; on mobile a full page is pushed.
/// Returns the configured [BillLineItemDraft] or `null` if the user cancelled.
Future<BillLineItemDraft?> showBillItemPicker(
  BuildContext context, {
  required Stream<List<CustomProduct>> productsStream,
}) {
  final isMobile = ResponsiveUtils.isMobile(context);

  if (isMobile) {
    return Navigator.push<BillLineItemDraft>(
      context,
      MaterialPageRoute(
        builder: (_) => BillItemPickerPage(productsStream: productsStream),
      ),
    );
  }

  return showShadDialog<BillLineItemDraft>(
    context: context,
    builder: (context) => BillItemPickerDialog(productsStream: productsStream),
  );
}

/// Standalone mobile page for picking and configuring a bill line item.
class BillItemPickerPage extends StatelessWidget {
  /// Constructs a [BillItemPickerPage].
  const BillItemPickerPage({super.key, required this.productsStream});

  /// Stream of store products to search within.
  final Stream<List<CustomProduct>> productsStream;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadScaffold(
      title: Text(
        Intls.to.selectProduct,
        style: theme.textTheme.p.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      body: _BillItemPickerBody(
        productsStream: productsStream,
        onConfirm: (draft) => Navigator.pop(context, draft),
        onCancel: () => Navigator.pop(context),
      ),
    );
  }
}

/// Desktop dialog for picking and configuring a bill line item.
class BillItemPickerDialog extends StatelessWidget {
  /// Constructs a [BillItemPickerDialog].
  const BillItemPickerDialog({super.key, required this.productsStream});

  /// Stream of store products to search within.
  final Stream<List<CustomProduct>> productsStream;

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      constraints: const BoxConstraints(maxWidth: 560, maxHeight: 680),
      title: Text(Intls.to.selectProduct),
      child: Material(
        color: Colors.transparent,
        child: _BillItemPickerBody(
          productsStream: productsStream,
          onConfirm: (draft) => Navigator.pop(context, draft),
          onCancel: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

/// Shared stateful body for product search + qty/price configuration.
class _BillItemPickerBody extends StatefulWidget {
  /// Constructs a [_BillItemPickerBody].
  const _BillItemPickerBody({
    required this.productsStream,
    required this.onConfirm,
    required this.onCancel,
  });

  final Stream<List<CustomProduct>> productsStream;
  final ValueChanged<BillLineItemDraft> onConfirm;
  final VoidCallback onCancel;

  @override
  State<_BillItemPickerBody> createState() => _BillItemPickerBodyState();
}

class _BillItemPickerBodyState extends State<_BillItemPickerBody> {
  final _searchCtrl = TextEditingController();
  final _qtyCtrl = TextEditingController(text: '1');
  final _priceCtrl = TextEditingController();

  String _search = '';
  CustomProduct? _selected;

  void _selectProduct(CustomProduct product) {
    setState(() {
      _selected = product;
      _priceCtrl.text = product.storeProduct.defaultPurchasePrice > 0
          ? product.storeProduct.defaultPurchasePrice.toStringAsFixed(0)
          : product.storeProduct.salePrice.toStringAsFixed(0);
    });
  }

  void _confirm() {
    if (_selected == null) {
      return;
    }
    final qty = int.tryParse(_qtyCtrl.text) ?? 1;
    final price = double.tryParse(_priceCtrl.text) ?? 0.0;
    final name = _selected?.globalProduct.label ?? '';

    widget.onConfirm(
      BillLineItemDraft(
        productId: _selected?.storeProduct.refId ?? '',
        description: name,
        quantity: qty,
        unitPrice: price,
      ),
    );
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _qtyCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final selected = _selected;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SearchInput(
          controller: _searchCtrl,
          onChanged: (v) => setState(() => _search = v),
          theme: theme,
          cs: cs,
        ),
        const SizedBox(height: 10),
        _ProductList(
          productsStream: widget.productsStream,
          search: _search,
          selected: _selected,
          onSelect: _selectProduct,
        ),
        if (selected != null) ...[
          const SizedBox(height: 14),
          _SelectedProductConfig(
            product: selected,
            qtyController: _qtyCtrl,
            priceController: _priceCtrl,
            theme: theme,
            cs: cs,
          ),
        ],
        const SizedBox(height: 18),
        _PickerActions(
          canConfirm: _selected != null,
          onConfirm: _confirm,
          onCancel: widget.onCancel,
          theme: theme,
        ),
      ],
    );
  }
}

/// Search input field at the top of the picker.
class _SearchInput extends StatelessWidget {
  const _SearchInput({
    required this.controller,
    required this.onChanged,
    required this.theme,
    required this.cs,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.background,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        border: Border.fromBorderSide(BorderSide(color: cs.border)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(LucideIcons.search, size: 14, color: cs.mutedForeground),
          const SizedBox(width: 9),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: theme.textTheme.p.copyWith(fontSize: 13),
              decoration: InputDecoration(
                hintText: Intls.to.searchProductHint,
                hintStyle: theme.textTheme.muted.copyWith(fontSize: 13),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

/// Scrollable list of store products filtered by [search].
class _ProductList extends StatelessWidget {
  const _ProductList({
    required this.productsStream,
    required this.search,
    required this.selected,
    required this.onSelect,
  });

  final Stream<List<CustomProduct>> productsStream;
  final String search;
  final CustomProduct? selected;
  final ValueChanged<CustomProduct> onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return StreamBuilder<List<CustomProduct>>(
      stream: productsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Loading());
        }

        final all = snapshot.data ?? [];
        final filtered = search.isEmpty
            ? all
            : all.where((p) {
                final q = search.toLowerCase();
                final name = p.globalProduct.label.toLowerCase();

                return name.contains(q) ||
                    p.storeProduct.refId.toLowerCase().contains(q);
              }).toList();

        if (filtered.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                Intls.to.noResults,
                style: theme.textTheme.muted.copyWith(fontSize: 13),
              ),
            ),
          );
        }

        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 260),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: filtered.length,
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (_, i) => _ProductRow(
              product: filtered[i],
              isSelected:
                  selected?.storeProduct.refId ==
                  filtered[i].storeProduct.refId,
              onTap: () => onSelect(filtered[i]),
              theme: theme,
              cs: cs,
            ),
          ),
        );
      },
    );
  }
}

/// Single product row in the picker list.
class _ProductRow extends StatelessWidget {
  const _ProductRow({
    required this.product,
    required this.isSelected,
    required this.onTap,
    required this.theme,
    required this.cs,
  });

  final CustomProduct product;
  final bool isSelected;
  final VoidCallback onTap;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final name = product.globalProduct.label;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? SabitouColors.accentSoft : cs.card,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.fromBorderSide(
            BorderSide(
              color: isSelected ? SabitouColors.accent : cs.border,
              width: isSelected ? 1.5 : 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.p.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    product.storeProduct.refId,
                    style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                  ),
                ],
              ),
            ),
            if (product.storeProduct.defaultPurchasePrice > 0)
              Text(
                Formatters.formatCurrency(
                  product.storeProduct.defaultPurchasePrice,
                ),
                style: theme.textTheme.muted.copyWith(fontSize: 12),
              ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              const Icon(
                LucideIcons.circleCheck,
                size: 16,
                color: SabitouColors.accent,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Quantity and price inputs shown once a product is selected.
class _SelectedProductConfig extends StatelessWidget {
  const _SelectedProductConfig({
    required this.product,
    required this.qtyController,
    required this.priceController,
    required this.theme,
    required this.cs,
  });

  final CustomProduct product;
  final TextEditingController qtyController;
  final TextEditingController priceController;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final name = product.globalProduct.label;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: SabitouColors.accentSoft,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.fromBorderSide(
          BorderSide(color: SabitouColors.accent.withValues(alpha: .35)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.packageCheck,
                size: 14,
                color: SabitouColors.accentForeground,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: SabitouColors.accentForeground,
                  ),
                ),
              ),
              // if (product.taxRate > 0)
              //   _TaxBadge(taxRate: product.taxRate),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _LabeledInput(
                  label: Intls.to.quantity,
                  controller: qtyController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  theme: theme,
                  cs: cs,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: _LabeledInput(
                  label: '${Intls.to.unitPrice} (${Intls.to.purchasePrice})',
                  controller: priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  theme: theme,
                  cs: cs,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Small TVA badge shown next to the selected product name.
class _TaxBadge extends StatelessWidget {
  const _TaxBadge({required this.taxRate});

  final double taxRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: const BoxDecoration(
        color: SabitouColors.warningSoft,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        'TVA ${taxRate.toStringAsFixed(1)}%',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: SabitouColors.warningForeground,
        ),
      ),
    );
  }
}

/// A labeled text input used in [_SelectedProductConfig].
class _LabeledInput extends StatelessWidget {
  const _LabeledInput({
    required this.label,
    required this.controller,
    required this.keyboardType,
    required this.inputFormatters,
    required this.theme,
    required this.cs,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.muted.copyWith(fontSize: 11.5)),
        const SizedBox(height: 5),
        ShadInput(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}

/// Confirm / Cancel action row at the bottom of the picker.
class _PickerActions extends StatelessWidget {
  const _PickerActions({
    required this.canConfirm,
    required this.onConfirm,
    required this.onCancel,
    required this.theme,
  });

  final bool canConfirm;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(onPressed: onCancel, child: Text(Intls.to.cancel)),
        const SizedBox(width: 10),
        ShadButton(
          onPressed: canConfirm ? onConfirm : null,
          leading: const Icon(LucideIcons.plus, size: 14),
          child: Text(Intls.to.addItem),
        ),
      ],
    );
  }
}
