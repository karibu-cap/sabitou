import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../widgets/loading.dart';
import '../detail/purchase_order_detail_controller.dart';

/// Opens the receive form in the right way depending on screen size.
/// On desktop: shows a dialog. On mobile: pushes a full page.
Future<String?> showReceiveForm(
  BuildContext context, {
  required PurchaseOrder po,
  required String storeId,
  required String userId,
}) async {
  final controller = Provider.of<PurchaseOrderDetailController>(
    context,
    listen: false,
  );
  final isMobile = MediaQuery.of(context).size.width < 800;

  return isMobile
      ? Navigator.push<String?>(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: controller,
              child: _ReceiveFormPage(po: po, storeId: storeId, userId: userId),
            ),
          ),
        )
      : showShadDialog<String?>(
          context: context,
          builder: (context) => ChangeNotifierProvider.value(
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
  final Future<void> Function(
    List<ReceivingNoteLineItem> items,
    DateTime receivedAt,
    String notes,
  )
  onSubmit;
  final VoidCallback onCancel;

  @override
  State<_ReceiveFormBody> createState() => _ReceiveFormBodyState();
}

class _ReceiveFormBodyState extends State<_ReceiveFormBody> {
  late List<_LineState> _lines;
  final _notesController = TextEditingController();
  DateTime _receivedAt = DateTime.now();
  bool _isSubmitting = false;

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);
    bool invalidRecieveValue = false;
    bool invalidRejectedValue = false;
    final List<ReceivingNoteLineItem> items = [];
    for (var l in _lines) {
      final remaining = l.item.quantityOrdered - l.item.quantityReceived;
      final rawReceived = double.tryParse(l.receivedController.text) ?? 0;
      final rawRejected = double.tryParse(l.rejectedController.text) ?? 0;

      if (rawReceived > remaining || rawReceived < 0) {
        invalidRecieveValue = true;
        continue;
      }
      if (rawRejected > remaining) {
        invalidRejectedValue = true;
        continue;
      }

      final received = rawReceived.clamp(0.0, remaining);
      final rejected = rawRejected.clamp(0.0, remaining - received);

      items.add(
        ReceivingNoteLineItem(
          productId: l.item.productId,
          storeId: widget.storeId,
          quantityExpected: l.item.quantityOrdered.toDouble(),
          quantityReceived: received.toDouble(),
          quantityRejected: rejected.toDouble(),
          rejectionReason: l.rejectionReasonController.text,
          purchasePrice: l.item.unitPrice,
          expirationDate: Timestamp.fromDateTime(
            DateTime.now().add(const Duration(days: 365)),
          ),
        ),
      );
    }

    if (invalidRecieveValue) {
      showErrorToast(
        context: context,
        message: Intls.to.received_quantity_must_be_less_than_remaining,
      );
      setState(() => _isSubmitting = false);

      return null;
    }
    if (invalidRejectedValue) {
      showErrorToast(
        context: context,
        message: Intls.to.rejected_quantity_must_be_less_than_remaining,
      );
      setState(() => _isSubmitting = false);

      return null;
    }
    await widget.onSubmit(items, _receivedAt, _notesController.text);
    setState(() => _isSubmitting = false);
  }

  @override
  void initState() {
    super.initState();
    _lines = widget.po.items
        .where((item) => item.quantityOrdered > item.quantityReceived)
        .map((item) {
          final remaining = item.quantityOrdered - item.quantityReceived;

          return _LineState(
            item: item,
            receivedController: TextEditingController(
              text: remaining > 0 ? remaining.toString() : '0',
            ),
            rejectedController: TextEditingController(text: '0'),
            rejectionReasonController: TextEditingController(),
          );
        })
        .toList();
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
    final isPoWithCompleteBill =
        widget.po.status == PurchaseOrderStatus.PO_STATUS_CLOSED;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShadDatePickerFormField(
          label: Text(Intls.to.receivedDate),
          initialValue: _receivedAt,
          onChanged: (v) {
            if (v != null) {
              setState(() => _receivedAt = v);
            }
          },
        ),
        const SizedBox(height: 14),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  Intls.to.items,
                  style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                ),
              ),
              SizedBox(
                width: 70,
                child: Text(
                  Intls.to.received,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                ),
              ),
              const SizedBox(width: 8),
              if (!isPoWithCompleteBill)
                SizedBox(
                  width: 70,
                  child: Text(
                    Intls.to.rejected,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                  ),
                ),
            ],
          ),
        ),
        Divider(color: cs.border, height: 1),

        ..._lines.map(
          (l) => _LineRow(
            state: l,
            isPoWithCompleteBill:
                widget.po.status == PurchaseOrderStatus.PO_STATUS_CLOSED,
          ),
        ),

        const SizedBox(height: 14),

        ShadInputFormField(
          label: Text(Intls.to.notes),
          controller: _notesController,
          maxLines: 2,
        ),
        const SizedBox(height: 18),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShadButton.outline(
              onPressed: widget.onCancel,
              child: Text(Intls.to.cancel),
            ),
            const SizedBox(width: 10),
            ShadButton(
              onPressed: _isSubmitting ? null : _submit,
              leading: _isSubmitting
                  ? const Loading.button()
                  : const Icon(LucideIcons.packageCheck, size: 14),
              child: Text(Intls.to.validate),
            ),
          ],
        ),
      ],
    );
  }
}

class _LineRow extends StatelessWidget {
  const _LineRow({required this.state, this.isPoWithCompleteBill = false});

  final _LineState state;

  final bool isPoWithCompleteBill;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final item = state.item;
    final received = item.quantityReceived;
    final name = item.productName.fr.isNotEmpty
        ? item.productName.fr
        : item.productName.en.isNotEmpty
        ? item.productName.en
        : item.productId;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: cs.border.withValues(alpha: 0.5)),
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
                if (!isPoWithCompleteBill)
                  Text(
                    '${Intls.to.ordered}: ${item.quantityOrdered} · ${Intls.to.received}: $received',
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
              enabled: !isPoWithCompleteBill,
            ),
          ),
          const SizedBox(width: 8),
          if (!isPoWithCompleteBill)
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
    final controller = Provider.of<PurchaseOrderDetailController>(
      context,
      listen: false,
    );

    return ShadDialog(
      constraints: const BoxConstraints(maxWidth: 520),
      title: Text(Intls.to.saveTheReceiption),
      description: Text('${po.refId} · ${po.supplierName}'),
      child: _ReceiveFormBody(
        po: po,
        storeId: storeId,
        userId: userId,
        onCancel: () => Navigator.pop(context),
        onSubmit: (items, receivedAt, notes) async {
          final response = await controller.createReceivingNote(
            po: po,
            storeId: storeId,
            receivedByUserId: userId,
            items: items,
            receivedAt: receivedAt,
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
    final controller = Provider.of<PurchaseOrderDetailController>(
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
              Intls.to.receptions,
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
          onSubmit: (items, receivedAt, notes) async {
            final response = await controller.createReceivingNote(
              po: po,
              storeId: storeId,
              receivedByUserId: userId,
              items: items,
              receivedAt: receivedAt,
              notes: notes,
            );
            if (context.mounted) Navigator.pop(context, response);
          },
        ),
      ),
    );
  }
}
