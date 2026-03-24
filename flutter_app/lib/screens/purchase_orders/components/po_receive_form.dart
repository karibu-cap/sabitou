import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../purchase_orders_controller.dart';

/// Opens the receive form in the right way depending on screen size.
/// On desktop: shows a dialog. On mobile: pushes a full page.
Future<CreateReceivingNoteResponse?> showReceiveForm(
  BuildContext context, {
  required PurchaseOrder po,
  required String storeId,
  required String userId,
}) async {
  final controller = Provider.of<PurchaseOrdersController>(
    context,
    listen: false,
  );
  final isMobile = MediaQuery.of(context).size.width < 800;

  return isMobile
      ? Navigator.push<CreateReceivingNoteResponse>(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: controller,
              child: _ReceiveFormPage(po: po, storeId: storeId, userId: userId),
            ),
          ),
        )
      : showShadDialog<CreateReceivingNoteResponse>(
          context: context,
          builder: (_) => ChangeNotifierProvider.value(
            value: controller,
            child: _ReceiveFormDialog(po: po, storeId: storeId, userId: userId),
          ),
        );
}

class _ReceiveFormBody extends StatefulWidget {
  const _ReceiveFormBody({
    required this.po,
    required this.storeId,
    required this.userId,
    required this.onSubmit,
    required this.onCancel,
  });

  final PurchaseOrder po;
  final String storeId;
  final String userId;
  final Future<void> Function(List<ReceivingNoteLineItem> items, String notes)
  onSubmit;
  final VoidCallback onCancel;

  @override
  State<_ReceiveFormBody> createState() => _ReceiveFormBodyState();
}

class _ReceiveFormBodyState extends State<_ReceiveFormBody> {
  late List<_LineState> _lines;
  final _notesController = TextEditingController();
  bool _isSubmitting = false;

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);

    final items = _lines.map((l) {
      final received = int.tryParse(l.receivedController.text) ?? 0;
      final rejected = int.tryParse(l.rejectedController.text) ?? 0;

      return ReceivingNoteLineItem(
        productId: l.item.productId,
        storeId: widget.storeId,
        lineIndex: l.item.lineIndex,
        quantityExpected: l.item.quantityOrdered.toDouble(),
        quantityReceived: received.toDouble(),
        quantityRejected: rejected.toDouble(),
        rejectionReason: l.rejectionReasonController.text,
        purchasePrice: l.item.unitPrice,
        expirationDate: Timestamp.fromDateTime(
          DateTime.now().add(const Duration(days: 365)),
        ),
      );
    }).toList();

    await widget.onSubmit(items, _notesController.text);
    setState(() => _isSubmitting = false);
  }

  @override
  void initState() {
    super.initState();
    _lines = widget.po.items.map((item) {
      final remaining = item.quantityOrdered - item.quantityReceived;

      return _LineState(
        item: item,
        receivedController: TextEditingController(
          text: remaining > 0 ? remaining.toString() : '0',
        ),
        rejectedController: TextEditingController(text: '0'),
        rejectionReasonController: TextEditingController(),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (final l in _lines) {
      l.receivedController.dispose();
      l.rejectedController.dispose();
      l.rejectionReasonController.dispose();
    }
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Column headers ──
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Article',
                  style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                ),
              ),
              SizedBox(
                width: 70,
                child: Text(
                  'Reçu',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 70,
                child: Text(
                  'Rejeté',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                ),
              ),
            ],
          ),
        ),
        Divider(color: cs.border, height: 1),

        // ── Line items ──
        ..._lines.map((l) => _LineRow(state: l, theme: theme, cs: cs)),

        const SizedBox(height: 14),

        // ── Notes ──
        Text(
          'Notes de réception',
          style: theme.textTheme.muted.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 6),
        ShadInput(
          controller: _notesController,
          placeholder: const Text('Conditions, dommages éventuels…'),
          maxLines: 2,
        ),
        const SizedBox(height: 18),

        // ── Actions ──
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShadButton.outline(
              onPressed: widget.onCancel,
              child: const Text('Annuler'),
            ),
            const SizedBox(width: 10),
            ShadButton(
              onPressed: _isSubmitting ? null : _submit,
              leading: _isSubmitting
                  ? const SizedBox(
                      width: 13,
                      height: 13,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(LucideIcons.packageCheck, size: 14),
              child: const Text('Confirmer la réception'),
            ),
          ],
        ),
      ],
    );
  }
}

class _LineRow extends StatelessWidget {
  const _LineRow({required this.state, required this.theme, required this.cs});

  final _LineState state;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final item = state.item;
    final remaining = item.quantityOrdered - item.quantityReceived;
    final name = item.productName.fr.isNotEmpty
        ? item.productName.fr
        : item.productName.en.isNotEmpty
        ? item.productName.en
        : item.productId;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: cs.border.withOpacity(.5))),
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
                  'Commandé: ${item.quantityOrdered} · Restant: $remaining',
                  style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 70,
            child: ShadInput(
              controller: state.receivedController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 70,
            child: ShadInput(
              controller: state.rejectedController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _LineState {
  const _LineState({
    required this.item,
    required this.receivedController,
    required this.rejectedController,
    required this.rejectionReasonController,
  });

  final PurchaseOrderLineItems item;
  final TextEditingController receivedController;
  final TextEditingController rejectedController;
  final TextEditingController rejectionReasonController;
}

// ─────────────────────────────────────────────
// Desktop dialog wrapper
// ─────────────────────────────────────────────

class _ReceiveFormDialog extends StatelessWidget {
  const _ReceiveFormDialog({
    required this.po,
    required this.storeId,
    required this.userId,
  });

  final PurchaseOrder po;
  final String storeId;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PurchaseOrdersController>(
      context,
      listen: false,
    );

    return ShadDialog(
      constraints: const BoxConstraints(maxWidth: 520),
      title: const Text('Enregistrer une réception'),
      description: Text('${po.refId} · ${po.supplierName}'),
      child: _ReceiveFormBody(
        po: po,
        storeId: storeId,
        userId: userId,
        onCancel: () => Navigator.pop(context),
        onSubmit: (items, notes) async {
          final response = await controller.createReceivingNote(
            po: po,
            storeId: storeId,
            receivedByUserId: userId,
            items: items,
            notes: notes,
          );
          if (context.mounted) Navigator.pop(context, response);
        },
      ),
    );
  }
}

class _ReceiveFormPage extends StatelessWidget {
  const _ReceiveFormPage({
    required this.po,
    required this.storeId,
    required this.userId,
  });

  final PurchaseOrder po;
  final String storeId;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = Provider.of<PurchaseOrdersController>(
      context,
      listen: false,
    );

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.card,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            LucideIcons.arrowLeft,
            size: 20,
            color: theme.colorScheme.foreground,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Réception',
              style: theme.textTheme.p.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Text(
              po.refId,
              style: theme.textTheme.muted.copyWith(fontSize: 11.5),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(color: theme.colorScheme.border, height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _ReceiveFormBody(
          po: po,
          storeId: storeId,
          userId: userId,
          onCancel: () => Navigator.pop(context),
          onSubmit: (items, notes) async {
            final response = await controller.createReceivingNote(
              po: po,
              storeId: storeId,
              receivedByUserId: userId,
              items: items,
              notes: notes,
            );
            if (context.mounted) Navigator.pop(context, response);
          },
        ),
      ),
    );
  }
}
