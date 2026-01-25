import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import 'inventory_adjustment_controller.dart';

/// Form for adjusting inventory quantities.
class InventoryAdjustmentForm extends StatelessWidget {
  /// Constructs an [InventoryAdjustmentForm].
  const InventoryAdjustmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    // We assume InventoryAdjustmentController is provided by the parent
    final controller = context.watch<InventoryAdjustmentController>();
    final inventory = controller.inventoryItemStream;
    final theme = ShadTheme.of(context);
    final int currentStockValue = inventory?.level.quantityAvailable ?? 0;

    return ShadForm(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Intls.to.currentStock.trParams({
              'quantity': currentStockValue.toString(),
            }),
            style: theme.textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          ShadInputFormField(
            controller: controller.newQuantityOnHandController,
            label: Text(Intls.to.newQuantityOnHand),
            placeholder: Text(Intls.to.newQuantityOnHand),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
            ],
          ),
          const SizedBox(height: 12.0),
          ShadInputFormField(
            controller: controller.quantityAdjustedController,
            label: Text(Intls.to.quantityAdjusted),
            placeholder: Text(Intls.to.quantityAdjusted),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
            ],
          ),
          const SizedBox(height: 12.0),
          ShadSelectFormField<String>(
            label: Text(Intls.to.reason),
            placeholder: Text(Intls.to.selectAReason),
            options: [
              ...controller.predefinedReasons.map(
                (r) => ShadOption(value: r, child: Text(r)),
              ),
              ShadOption(
                value: controller.otherReasonValue,
                child: Text(Intls.to.otherReason),
              ),
            ],
            selectedOptionBuilder: (context, value) => Text(value),
            onChanged: controller.setReason,
          ),
          if (controller.selectedReason == controller.otherReasonValue) ...[
            const SizedBox(height: 12.0),
            ShadTextareaFormField(
              key: const Key('notes'),
              controller: controller.customReasonController,
              label: Text(Intls.to.customReason),
              placeholder: Text(Intls.to.customReason),
              onChanged: (_) => controller.notifier(),
            ),
          ],
          const SizedBox(height: 12.0),
          ShadTextareaFormField(
            controller: controller.notesController,
            label: Text(Intls.to.notes),
            placeholder: Text(Intls.to.notes),
            onChanged: (_) => controller.notifier(),
          ),
        ],
      ),
    );
  }
}
