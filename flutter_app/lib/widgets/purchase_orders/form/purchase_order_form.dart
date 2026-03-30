import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../utils/user_preference.dart';
import '../../../screens/purchase_orders/purchase_orders_controller.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/responsive_utils.dart';
import '../../loading.dart';
import '../../shad_scaffold.dart';
import 'purchase_order_form_controller.dart';
import 'purchase_order_form_sections.dart';

/// Opens the purchase order form in the appropriate presentation.
/// On mobile, pushes a full page. On desktop, shows a dialog.
Future<bool?> showPurchaseOrderForm(
  BuildContext context, {
  required PurchaseOrdersController purchaseOrdersController,
}) {
  final prefs = context.read<UserPreferences>();
  final storeId = prefs.store?.refId ?? '';
  final userId = prefs.user?.refId ?? '';

  final isMobile = ResponsiveUtils.isMobile(context);

  if (isMobile) {
    return Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => PurchaseOrderFormPage(
          storeId: storeId,
          userId: userId,
          purchaseOrdersController: purchaseOrdersController,
        ),
      ),
    );
  }

  return showShadDialog<bool>(
    context: context,
    builder: (context) => PurchaseOrderFormDialog(
      storeId: storeId,
      userId: userId,
      purchaseOrdersController: purchaseOrdersController,
    ),
  );
}

/// A full-page representation of the purchase order form.
class PurchaseOrderFormPage extends StatelessWidget {
  /// Create a new mobile form page.
  const PurchaseOrderFormPage({
    super.key,
    required this.storeId,
    required this.userId,
    required this.purchaseOrdersController,
  });

  /// The store ID for this scope.
  final String storeId;

  /// The local user interacting.
  final String userId;

  /// The business logics controller.
  final PurchaseOrdersController purchaseOrdersController;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ChangeNotifierProvider<PurchaseOrderFormController>(
      create: (_) => PurchaseOrderFormController(storeId: storeId),
      child: Builder(
        builder: (context) => ShadScaffold(
          backgroundColor: cs.background,
          title: Text(
            Intls.to.newPurchaseOrder,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          body: PurchaseOrderFormBody(
            userId: userId,
            purchaseOrdersController: purchaseOrdersController,
            onSaved: (isSuccess) => Navigator.pop(context, isSuccess),
            onCancelled: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}

/// A dialog representation of the purchase order form for desktop.
class PurchaseOrderFormDialog extends StatelessWidget {
  /// Create a new form dialog.
  const PurchaseOrderFormDialog({
    super.key,
    required this.storeId,
    required this.userId,
    required this.purchaseOrdersController,
  });

  /// The store ID.
  final String storeId;

  /// The ID of the authenticated user.
  final String userId;

  /// The main functional components controller.
  final PurchaseOrdersController purchaseOrdersController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PurchaseOrderFormController>(
      create: (_) => PurchaseOrderFormController(storeId: storeId),
      child: ShadDialog(
        constraints: const BoxConstraints(maxWidth: 700, maxHeight: 860),
        title: Text(Intls.to.newPurchaseOrder),
        scrollable: false,
        child: PurchaseOrderFormBody(
          userId: userId,
          purchaseOrdersController: purchaseOrdersController,
          onSaved: (isSuccess) => Navigator.pop(context, isSuccess),
          onCancelled: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

/// Form content wrapper laying out sub-sections.
class PurchaseOrderFormBody extends StatelessWidget {
  /// Create a new form body widget.
  const PurchaseOrderFormBody({
    super.key,
    required this.userId,
    required this.purchaseOrdersController,
    required this.onSaved,
    required this.onCancelled,
  });

  /// The locally authorized User ID.
  final String userId;

  /// The parent functional controller containing actions.
  final PurchaseOrdersController purchaseOrdersController;

  /// Required action called when success completes.
  final ValueChanged<bool> onSaved;

  /// Action called to exit.
  final VoidCallback onCancelled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                PurchaseOrderFormHeaderSection(),
                const PurchaseOrderFormItemsSection(),
                const PurchaseOrderFormTotalsSection(),
                const PurchaseOrderFormNotesSection(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        _PurchaseOrderFormFooter(
          userId: userId,
          purchaseOrdersController: purchaseOrdersController,
          onSaved: onSaved,
          onCancelled: onCancelled,
        ),
      ],
    );
  }
}

class _PurchaseOrderFormFooter extends StatelessWidget {
  const _PurchaseOrderFormFooter({
    required this.userId,
    required this.purchaseOrdersController,
    required this.onSaved,
    required this.onCancelled,
  });

  final String userId;
  final PurchaseOrdersController purchaseOrdersController;
  final ValueChanged<bool> onSaved;
  final VoidCallback onCancelled;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PurchaseOrderFormController>();
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final isLoading = ctrl.isLoading;

    return Container(
      decoration: BoxDecoration(
        color: cs.card,
        border: Border(top: BorderSide(color: cs.border)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (ctrl.errorMessage.isNotEmpty) ...[
            _ValidationBanner(message: ctrl.errorMessage, theme: theme),
            const SizedBox(height: 10),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadButton.outline(
                onPressed: isLoading ? null : onCancelled,
                child: Text(Intls.to.cancel),
              ),
              const SizedBox(width: 10),
              ShadButton(
                onPressed: isLoading ? null : () => _save(context, ctrl),
                leading: isLoading
                    ? const Loading.button()
                    : const Icon(LucideIcons.fileText, size: 14),
                child: Text(Intls.to.createPurchaseOrder),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _save(
    BuildContext context,
    PurchaseOrderFormController ctrl,
  ) async {
    if (!ctrl.validate()) return;

    final prefs = context.read<UserPreferences>();

    final success = await ctrl.createPurchaseOrder(
      supplierId: ctrl.supplierIdController.text,
      storeId: ctrl.storeId,
      createdByUserId: userId,
      items: ctrl.buildProtoItems(),
      expectedDeliveryDate: ctrl.expectedDeliveryDate,
      notes: ctrl.notesController.text,
      destinationAddress: ctrl.destinationAddressController.text,
      supplierName: ctrl.supplierNameController.text,
      storeName: prefs.store?.name ?? '',
    );

    if (success != null && context.mounted) {
      onSaved(true);
    }
  }
}

class _ValidationBanner extends StatelessWidget {
  const _ValidationBanner({required this.message, required this.theme});

  final String message;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: SabitouColors.dangerSoft,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(BorderSide(color: SabitouColors.danger)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            LucideIcons.circleAlert,
            size: 14,
            color: SabitouColors.danger,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.p.copyWith(
                fontSize: 12.5,
                color: SabitouColors.dangerForeground,
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                context.read<PurchaseOrderFormController>().clearError(),
            child: const Icon(
              LucideIcons.x,
              size: 13,
              color: SabitouColors.dangerForeground,
            ),
          ),
        ],
      ),
    );
  }
}
