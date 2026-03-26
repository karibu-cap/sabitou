import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../utils/user_preference.dart';
import '../../../repositories/store_products_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/responsive_utils.dart';
import '../../loading.dart';
import '../../shad_scaffold.dart';
import 'bill_form_controller.dart';
import 'bill_form_sections.dart';

/// Opens the bill form in the appropriate presentation for the screen size.
/// * [purchaseOrder] — pre-fills from a PO (standard path).
/// * [existingBill] — opens in edit mode.
/// * [receivingNotes] — when set, the form is pre-filled with the aggregated
///   quantities from the selected receiving notes and [quantityLocked] is
///   forced to `true`.
/// * [yetToReceiveMode] — when `true` and [purchaseOrder] is supplied, only
///   items with `quantityOrdered > quantityReceived` are included and the
///   quantity is set to `quantityOrdered − quantityReceived`.
///
/// Returns `true` on a successful save, or `false`/`null` if cancelled.
Future<bool?> showBillForm(
  BuildContext context, {
  PurchaseOrder? purchaseOrder,
  Bill? existingBill,
  List<ReceivingNote>? receivingNotes,
  bool yetToReceiveMode = false,
}) {
  final prefs = context.read<UserPreferences>();
  final storeId = prefs.store?.refId ?? '';
  final productsStream = prefs.store != null
      ? StoreProductsRepository.instance.streamStoreProducts(
          StreamStoreProductsRequest(storeId: storeId),
        )
      : const Stream<List<StoreProductWithGlobalProduct>>.empty();

  final isMobile = ResponsiveUtils.isMobile(context);

  if (isMobile) {
    return Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => BillFormPage(
          storeId: storeId,
          productsStream: productsStream,
          purchaseOrder: purchaseOrder,
          existingBill: existingBill,
          receivingNotes: receivingNotes,
          yetToReceiveMode: yetToReceiveMode,
        ),
      ),
    );
  }

  return showShadDialog<bool>(
    context: context,
    builder: (_) => BillFormDialog(
      storeId: storeId,
      productsStream: productsStream,
      purchaseOrder: purchaseOrder,
      existingBill: existingBill,
      receivingNotes: receivingNotes,
      yetToReceiveMode: yetToReceiveMode,
    ),
  );
}

/// Mobile full-page wrapper for the bill form.
class BillFormPage extends StatelessWidget {
  /// Constructs a [BillFormPage].
  const BillFormPage({
    super.key,
    required this.storeId,
    required this.productsStream,
    this.purchaseOrder,
    this.existingBill,
    this.receivingNotes,
    this.yetToReceiveMode = false,
  });

  /// The store this bill belongs to.
  final String storeId;

  /// Stream of store products for the item picker.
  final Stream<List<StoreProductWithGlobalProduct>> productsStream;

  /// Optional purchase order to pre-fill from.
  final PurchaseOrder? purchaseOrder;

  /// Optional existing bill to edit.
  final Bill? existingBill;

  /// Optional receiving notes to pre-fill items from (quantities locked).
  final List<ReceivingNote>? receivingNotes;

  /// When `true`, only unreceived items are included with remaining quantities.
  final bool yetToReceiveMode;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final isEdit = existingBill != null;

    return ChangeNotifierProvider<BillFormController>(
      create: (_) => BillFormController(
        storeId: storeId,
        purchaseOrder: purchaseOrder,
        existingBill: existingBill,
        receivingNotes: receivingNotes,
        yetToReceiveMode: yetToReceiveMode,
      ),
      child: Builder(
        builder: (context) => ShadScaffold(
          backgroundColor: cs.background,
          title: Text(
            isEdit ? Intls.to.editBill : Intls.to.newBill,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          body: BillFormBody(
            productsStream: productsStream,
            onSaved: (isSuccess) => Navigator.pop(context, isSuccess),
            onCancelled: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}

/// Desktop dialog wrapper for the bill form.
class BillFormDialog extends StatelessWidget {
  /// Constructs a [BillFormDialog].
  const BillFormDialog({
    super.key,
    required this.storeId,
    required this.productsStream,
    this.purchaseOrder,
    this.existingBill,
    this.receivingNotes,
    this.yetToReceiveMode = false,
  });

  /// The store this bill belongs to.
  final String storeId;

  /// Stream of store products for the item picker.
  final Stream<List<StoreProductWithGlobalProduct>> productsStream;

  /// Optional purchase order to pre-fill from.
  final PurchaseOrder? purchaseOrder;

  /// Optional existing bill to edit.
  final Bill? existingBill;

  /// Optional receiving notes to pre-fill items from (quantities locked).
  final List<ReceivingNote>? receivingNotes;

  /// When `true`, only unreceived items are included with remaining quantities.
  final bool yetToReceiveMode;

  @override
  Widget build(BuildContext context) {
    final isEdit = existingBill != null;

    return ChangeNotifierProvider<BillFormController>(
      create: (_) => BillFormController(
        storeId: storeId,
        purchaseOrder: purchaseOrder,
        existingBill: existingBill,
        receivingNotes: receivingNotes,
        yetToReceiveMode: yetToReceiveMode,
      ),
      child: ShadDialog(
        constraints: const BoxConstraints(maxWidth: 700, maxHeight: 860),
        title: Text(isEdit ? Intls.to.editBill : Intls.to.newBill),
        scrollable: false,
        description: switch (isEdit) {
          true => null,
          false =>
            receivingNotes != null && receivingNotes?.isNotEmpty == true
                ? Text(
                    Intls.to.fromReveice.trParams({
                      'nbr': '${receivingNotes?.length ?? 0}',
                    }),
                  )
                : purchaseOrder != null
                ? Text('${Intls.to.fromPurchaseOrder}: ${purchaseOrder?.refId}')
                : null,
        },
        child: BillFormBody(
          productsStream: productsStream,
          onSaved: (isSuccess) => Navigator.pop(context, isSuccess),
          onCancelled: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

/// The scrollable form content shared between [BillFormPage] and [BillFormDialog].
class BillFormBody extends StatelessWidget {
  /// Constructs a [BillFormBody].
  const BillFormBody({
    super.key,
    required this.productsStream,
    required this.onSaved,
    required this.onCancelled,
  });

  /// Stream of store products for the item picker.
  final Stream<List<StoreProductWithGlobalProduct>> productsStream;

  /// Called with `true` after a successful save.
  final ValueChanged<bool> onSaved;

  /// Called when the user taps Cancel.
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
                const BillFormHeaderSection(),
                BillFormItemsSection(productsStream: productsStream),
                const BillFormTotalsSection(),
                const BillFormNotesSection(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        _BillFormFooter(onSaved: onSaved, onCancelled: onCancelled),
      ],
    );
  }
}

/// Sticky footer containing the validation error banner and action buttons.
class _BillFormFooter extends StatelessWidget {
  const _BillFormFooter({required this.onSaved, required this.onCancelled});

  final ValueChanged<bool> onSaved;
  final VoidCallback onCancelled;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<BillFormController>();
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

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
                onPressed: ctrl.isLoading ? null : onCancelled,
                child: Text(Intls.to.cancel),
              ),
              const SizedBox(width: 10),
              ShadButton(
                onPressed: ctrl.isLoading ? null : () => _save(context),
                leading: ctrl.isLoading
                    ? const Loading.button()
                    : Icon(
                        ctrl.isEditMode
                            ? LucideIcons.save
                            : LucideIcons.fileText,
                        size: 14,
                      ),
                child: Text(
                  ctrl.isEditMode ? Intls.to.saveChanges : Intls.to.createBill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _save(BuildContext context) async {
    final ctrl = context.read<BillFormController>();
    final isSuccess = await ctrl.save();
    if (isSuccess != null && context.mounted) {
      onSaved(isSuccess);
    }
  }
}

/// Red banner displaying a validation or save error.
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
            onTap: () => context.read<BillFormController>().clearError(),
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
