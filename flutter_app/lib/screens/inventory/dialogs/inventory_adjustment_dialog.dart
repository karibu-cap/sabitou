import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../inventory_controller.dart';

class InventoryAdjustmentDialog extends StatefulWidget {
  final InventoryLevelWithProduct inventory;
  final InventoryController inventoryController;

  const InventoryAdjustmentDialog({
    super.key,
    required this.inventory,
    required this.inventoryController,
  });

  @override
  State<InventoryAdjustmentDialog> createState() =>
      _InventoryAdjustmentDialogState();
}

class _InventoryAdjustmentDialogState extends State<InventoryAdjustmentDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  final _quantityController = TextEditingController();
  final _reasonController = TextEditingController();
  final _notesController = TextEditingController();
  bool _isReducing = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _quantityController.dispose();
    _reasonController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final quantity = int.tryParse(_quantityController.text) ?? 0;
    if (quantity == 0) return;

    final quantityChange = _isReducing ? -quantity : quantity;
    final reason = _reasonController.text;
    final notes = _notesController.text;

    setState(() => _isLoading = true);

    final success = await widget.inventoryController.adjustInventory(
      widget.inventory.level.storeId,
      widget.inventory.level.storeProductId,
      quantityChange,
      reason,
      notes,
    );

    if (!context.mounted) return;
    setState(() => _isLoading = false);

    if (success) {
      Navigator.of(context).pop();
      ShadToaster.of(context).show(
        ShadToast(
          title: Text(Intls.to.success),
          description: const Text(
            'Inventory adjusted successfully',
          ), // TODO: Localize
        ),
      );
    } else {
      ShadToaster.of(context).show(
        ShadToast.destructive(
          title: Text(Intls.to.error),
          description: const Text(
            'Failed to adjust inventory',
          ), // TODO: Localize
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final currentStock = widget.inventory.level.quantityAvailable;

    return ShadDialog(
      title: const Text('Adjust Inventory'), // TODO: Localize
      description: Text(widget.inventory.globalProduct.label),
      actions: [
        ShadButton.outline(
          enabled: !_isLoading,
          child: Text(Intls.to.cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ShadButton(
          enabled: !_isLoading,
          onPressed: _isLoading ? null : _submit,
          child: _isLoading
              ? const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(Intls.to.save),
        ),
      ],
      child: Container(
        width: 400,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ShadForm(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Current Stock: $currentStock',
                style: theme.textTheme.p.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ShadSelect<bool>(
                initialValue: _isReducing,
                options: const [
                  ShadOption(value: false, child: Text('Add Stock')),
                  ShadOption(value: true, child: Text('Reduce Stock')),
                ],
                onChanged: (value) {
                  setState(() {
                    _isReducing = value ?? false;
                  });
                },
                selectedOptionBuilder: (context, value) {
                  return Text(value ? 'Reduce Stock' : 'Add Stock');
                },
                placeholder: const Text('Select type'),
              ),
              const SizedBox(height: 12),
              ShadInputFormField(
                controller: _quantityController,
                label: Text(Intls.to.quantity),
                placeholder: const Text('Enter quantity'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v.isEmpty) return 'Required';
                  final val = int.tryParse(v);
                  if (val == null || val <= 0) return 'Invalid quantity';
                  if (_isReducing && val > currentStock) {
                    return 'Cannot reduce more than current stock';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 12),
              ShadInputFormField(
                controller: _reasonController,
                label: const Text('Reason'),
                placeholder: const Text('Reason for adjustment'),
              ),
              const SizedBox(height: 12),
              ShadInputFormField(
                controller: _notesController,
                label: const Text('Notes'),
                placeholder: const Text('Additional notes (optional)'),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
