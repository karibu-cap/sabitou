import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/responsive_utils.dart';
import '../../input/auto_complete_v2.dart';
import 'purchase_order_form_controller.dart';

/// Opens the item picker in the correct presentation based on screen width.
Future<PurchaseOrderLineItemDraft?> showPurchaseOrderItemPicker(
  BuildContext context, {
  required PurchaseOrderFormController controller,
}) {
  final isMobile = ResponsiveUtils.isMobile(context);

  if (isMobile) {
    return Navigator.push<PurchaseOrderLineItemDraft>(
      context,
      MaterialPageRoute(
        builder: (_) => PurchaseOrderItemPickerPage(controller: controller),
      ),
    );
  }

  return showShadDialog<PurchaseOrderLineItemDraft>(
    context: context,
    builder: (_) => PurchaseOrderItemPickerDialog(controller: controller),
  );
}

/// Standalone mobile page for picking and configuring a bill line item.
class PurchaseOrderItemPickerPage extends StatelessWidget {
  /// Create a new mobile page.
  const PurchaseOrderItemPickerPage({super.key, required this.controller});

  /// The form controller to fetch store products.
  final PurchaseOrderFormController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.background,
      appBar: AppBar(
        backgroundColor: cs.card,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(LucideIcons.arrowLeft, size: 20, color: cs.foreground),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          Intls.to.selectProduct,
          style: theme.textTheme.p.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(color: cs.border, height: 1),
        ),
      ),
      body: _PurchaseOrderItemPickerBody(
        controller: controller,
        onConfirm: (draft) => Navigator.pop(context, draft),
        onCancel: () => Navigator.pop(context),
      ),
    );
  }
}

/// Desktop dialog for picking and configuring a bill line item.
class PurchaseOrderItemPickerDialog extends StatelessWidget {
  /// Create a new dialog.
  const PurchaseOrderItemPickerDialog({super.key, required this.controller});

  /// The form controller to fetch store products.
  final PurchaseOrderFormController controller;

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      constraints: const BoxConstraints(maxWidth: 560, maxHeight: 680),
      title: Text(Intls.to.selectProduct),
      child: Material(
        color: Colors.transparent,
        child: _PurchaseOrderItemPickerBody(
          controller: controller,
          onConfirm: (draft) => Navigator.pop(context, draft),
          onCancel: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

class _PurchaseOrderItemPickerBody extends StatefulWidget {
  const _PurchaseOrderItemPickerBody({
    required this.controller,
    required this.onConfirm,
    required this.onCancel,
  });

  final PurchaseOrderFormController controller;
  final ValueChanged<PurchaseOrderLineItemDraft> onConfirm;
  final VoidCallback onCancel;

  @override
  State<_PurchaseOrderItemPickerBody> createState() =>
      _PurchaseOrderItemPickerBodyState();
}

class _PurchaseOrderItemPickerBodyState
    extends State<_PurchaseOrderItemPickerBody> {
  final _qtyCtrl = TextEditingController(text: '1');
  final _priceCtrl = TextEditingController();

  StoreProductWithGlobalProduct? _selected;

  @override
  void dispose() {
    _qtyCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  void _selectProduct(StoreProductWithGlobalProduct product) {
    setState(() {
      _selected = product;
      _priceCtrl.text = product.storeProduct.defaultPurchasePrice > 0
          ? product.storeProduct.defaultPurchasePrice.toStringAsFixed(0)
          : product.storeProduct.salePrice.toStringAsFixed(0);
    });
  }

  void _confirm() {
    if (_selected == null) return;
    final qty = int.tryParse(_qtyCtrl.text) ?? 1;
    final price = double.tryParse(_priceCtrl.text) ?? 0.0;

    widget.onConfirm(
      PurchaseOrderLineItemDraft(
        productId: _selected?.storeProduct.refId ?? '',
        globalProduct: _selected?.globalProduct ?? GlobalProduct(),
        quantity: qty,
        unitPrice: price,
      ),
    );
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
        CustomAutoCompleteV2<StoreProductWithGlobalProduct>(
          placeholder: Intls.to.product,
          searchPlaceholder: Intls.to.searchProductHint,
          initialValue: _selected?.globalProduct.label,
          optionsBuilder: (text) async {
            if (text.isEmpty) {
              return [];
            }

            return await widget.controller.searchProducts(name: text);
          },
          displayStringForOption: (option) => option.globalProduct.label,
          validator: (value) {
            if (value == null) {
              return Intls.to.isRequiredField.trParams({
                'field': Intls.to.supplier,
              });
            }

            return null;
          },
          onSelected: _selectProduct,
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

class _SelectedProductConfig extends StatelessWidget {
  const _SelectedProductConfig({
    required this.product,
    required this.qtyController,
    required this.priceController,
    required this.theme,
    required this.cs,
  });

  final StoreProductWithGlobalProduct product;
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
