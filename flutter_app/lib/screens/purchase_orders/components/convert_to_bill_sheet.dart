import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/bills/form/bill_form.dart';
import '../../../widgets/loading.dart';
import '../components/po_utils.dart';
import '../detail/purchase_order_detail_controller.dart';

/// Conversion mode chosen by the user inside the "Convert to Bill" sheet.
enum _BillConvertOption {
  /// Build a bill from items that have not yet been received.
  yetToReceive,

  /// Build a bill from one or more existing receiving notes.
  receives,
}

/// Opens the "Convert to Bill" flow for [po].
///
/// Decision tree:
/// * **No receiving notes** → skips the sheet entirely and opens the
///   standard [showBillForm] with the full PO (entire ordered quantities).
/// * **All items fully received** → shows only the "Receives" option;
///   the user must pick one or more receiving notes.
/// * **Partial receives** → shows both "Yet To Receive" and "Receives"
///   options (defaulting to "Yet To Receive").
/// Returns `true` on a successful bill creation, `false` / `null` otherwise.

/// Checks if all receiving notes have been used to create bills.
bool _areAllReceivingNotesBilled(
  List<ReceivingNote> receivingNotes,
  List<Bill> existingBills,
) {
  final unbilledNotes = _getUnbilledReceivingNotes(
    receivingNotes,
    existingBills,
  );

  return unbilledNotes.isEmpty;
}

/// Checks if a bill was created from a specific receiving note
/// by comparing the bill items with the receiving note items.
bool _isBillFromReceivingNote(Bill bill, ReceivingNote receivingNote) {
  // If the bill doesn't have the same PO, it can't be from this receiving note
  if (bill.relatedPurchaseOrderId != receivingNote.relatedPurchaseOrderId) {
    return false;
  }

  // If the number of items is different, it's not the same source
  if (bill.items.length != receivingNote.items.length) {
    return false;
  }

  // Check if all items match (same product, same quantity, same price)
  for (final billItem in bill.items) {
    final matchingReceivingItem = receivingNote.items
        .where((rnItem) => rnItem.productId == billItem.productId)
        .firstOrNull;

    if (matchingReceivingItem == null) {
      return false;
    }

    // Check if quantity and price match
    if (billItem.quantity != matchingReceivingItem.quantityReceived.toInt() ||
        billItem.unitPrice != matchingReceivingItem.purchasePrice) {
      return false;
    }
  }

  return true;
}

/// Returns the list of receiving notes that
///  haven't been used to create bills yet.
List<ReceivingNote> _getUnbilledReceivingNotes(
  List<ReceivingNote> receivingNotes,
  List<Bill> existingBills,
) {
  final billedNoteIds = <String>{};

  for (final bill in existingBills) {
    for (final receivingNote in receivingNotes) {
      if (_isBillFromReceivingNote(bill, receivingNote)) {
        billedNoteIds.add(receivingNote.refId);
      }
    }
  }

  return receivingNotes
      .where((note) => !billedNoteIds.contains(note.refId))
      .toList();
}

/// Shows the convert to bill sheet.
Future<bool?> showConvertToBillSheet(
  BuildContext context, {
  required PurchaseOrder po,
  required List<ReceivingNote> receivingNotes,
  required List<Bill> existingBills,
}) async {
  final allReceivingNotesBilled = _areAllReceivingNotesBilled(
    receivingNotes,
    existingBills,
  );

  if (receivingNotes.isEmpty) {
    return showBillForm(context, purchaseOrder: po);
  }

  if (allReceivingNotesBilled) {
    return showBillForm(context, purchaseOrder: po, yetToReceiveMode: true);
  }

  final isDesktop = !ResponsiveUtils.isMobile(context);

  if (isDesktop) {
    return showShadDialog<bool?>(
      context: context,
      builder: (_) => ChangeNotifierProvider.value(
        value: Provider.of<PurchaseOrderDetailController>(
          context,
          listen: false,
        ),
        child: _ConvertToBillDialog(
          po: po,
          receivingNotes: receivingNotes,
          existingBills: existingBills,
        ),
      ),
    );
  }

  return showModalBottomSheet<bool?>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => ChangeNotifierProvider.value(
      value: Provider.of<PurchaseOrderDetailController>(context, listen: false),
      child: _ConvertToBillSheet(
        po: po,
        receivingNotes: receivingNotes,
        existingBills: existingBills,
      ),
    ),
  );
}

/// Mobile bottom-sheet wrapper.
class _ConvertToBillSheet extends StatelessWidget {
  const _ConvertToBillSheet({
    required this.po,
    required this.receivingNotes,
    required this.existingBills,
  });

  final PurchaseOrder po;
  final List<ReceivingNote> receivingNotes;
  final List<Bill> existingBills;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: cs.card,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
            padding: const EdgeInsets.only(top: 10, bottom: 4),
            
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: cs.border,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
            Expanded(
              child: _ConvertToBillBody(
                po: po,
                receivingNotes: receivingNotes,
                existingBills: existingBills,
                scrollController: controller,
                onClose: () => Navigator.pop(context),
                onDone: (result) => Navigator.pop(context, result),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Desktop dialog wrapper.
class _ConvertToBillDialog extends StatelessWidget {
  const _ConvertToBillDialog({
    required this.po,
    required this.receivingNotes,
    required this.existingBills,
  });

  final PurchaseOrder po;
  final List<ReceivingNote> receivingNotes;
  final List<Bill> existingBills;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadDialog(
      constraints: const BoxConstraints(maxWidth: 520),
      title: Text(
        Intls.to.convertToBill,
        style: theme.textTheme.h4.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      child: SizedBox(
        height: 480,
        child: _ConvertToBillBody(
          po: po,
          receivingNotes: receivingNotes,
          existingBills: existingBills,
          onClose: () => Navigator.pop(context),
          onDone: (result) => Navigator.pop(context, result),
        ),
      ),
    );
  }
}

class _ConvertToBillBody extends StatefulWidget {
  const _ConvertToBillBody({
    required this.po,
    required this.receivingNotes,
    required this.existingBills,
    required this.onClose,
    required this.onDone,
    this.scrollController,
  });

  final PurchaseOrder po;
  final List<ReceivingNote> receivingNotes;
  final List<Bill> existingBills;
  final VoidCallback onClose;
  final ValueChanged<bool?> onDone;
  final ScrollController? scrollController;

  @override
  State<_ConvertToBillBody> createState() => _ConvertToBillBodyState();
}

class _ConvertToBillBodyState extends State<_ConvertToBillBody> {
  late _BillConvertOption _selected;
  final Set<String> _selectedNoteIds = {};
  bool _isSubmitting = false;
  String? _error;

  bool get _allFullyReceived => PoStatusUtils.receiveProgress(widget.po) >= 1.0;

  /// Returns the list of receiving notes that haven't been used to create bills yet.
  List<ReceivingNote> get _unbilledReceivingNotes {
    return _getUnbilledReceivingNotes(
      widget.receivingNotes,
      widget.existingBills,
    );
  }

  @override
  void initState() {
    super.initState();
    final unbilledNotes = _unbilledReceivingNotes;
    if (_allFullyReceived) {
      _selected = _BillConvertOption.receives;
      _selectedNoteIds.addAll(unbilledNotes.map((n) => n.refId));
    } else {
      _selected = _BillConvertOption.yetToReceive;
    }
  }

  void _toggleNote(String refId) {
    setState(() {
      if (_selectedNoteIds.contains(refId)) {
        _selectedNoteIds.remove(refId);
      } else {
        _selectedNoteIds.add(refId);
      }
      _error = null;
    });
  }

  void _selectAll() => setState(
    () => _selectedNoteIds.addAll(_unbilledReceivingNotes.map((n) => n.refId)),
  );

  void _unselectAll() => setState(_selectedNoteIds.clear);

  Future<void> _submit() async {
    if (_selected == _BillConvertOption.receives && _selectedNoteIds.isEmpty) {
      setState(() => _error = Intls.to.pleaseSelectAtLeastOneReceive);

      return;
    }

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    widget.onClose();

    bool? result;
    if (_selected == _BillConvertOption.yetToReceive) {
      result = await showBillForm(
        context,
        purchaseOrder: widget.po,
        yetToReceiveMode: true,
      );
    } else {
      final unbilledNotes = _unbilledReceivingNotes;
      final selected = unbilledNotes
          .where((n) => _selectedNoteIds.contains(n.refId))
          .toList();
      result = await showBillForm(
        context,
        purchaseOrder: widget.po,
        receivingNotes: selected,
      );
    }

    widget.onDone(result);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            controller: widget.scrollController,
            padding: const EdgeInsets.only(left: 20, top: 12, right: 20),
            children: [
              Text(
                _allFullyReceived
                    ? Intls.to.allItemsReceivedChooseReceives
                    : Intls.to.partialItemsReceivedChooseBillType,
                style: theme.textTheme.p.copyWith(
                  fontSize: 14,
                  color: cs.mutedForeground,
                ),
              ),
              const SizedBox(height: 16),

              // Option: Yet To Receive (hidden when all items received)
              if (!_allFullyReceived) ...[
                _OptionCard(
                  isSelected: _selected == _BillConvertOption.yetToReceive,
                  title: Intls.to.yetToReceive,
                  description: Intls.to.yetToReceiveDescription,
                  onTap: () => setState(() {
                    _selected = _BillConvertOption.yetToReceive;
                    _error = null;
                  }),
                ),
                const SizedBox(height: 10),
              ],

              // Option: Receives
              _OptionCard(
                isSelected: _selected == _BillConvertOption.receives,
                title: Intls.to.receives,
                description: Intls.to.receivesDescription,
                onTap: () => setState(() {
                  _selected = _BillConvertOption.receives;
                  _error = null;
                }),
              ),

              if (_selected == _BillConvertOption.receives) ...[
                const SizedBox(height: 16),
                _ReceivingNotesList(
                  notes: _unbilledReceivingNotes,
                  selectedIds: _selectedNoteIds,
                  onToggle: _toggleNote,
                  onSelectAll: _selectAll,
                  onUnselectAll: _unselectAll,
                ),
              ],

              if (_error != null) ...[
                const SizedBox(height: 12),
                _ErrorBanner(message: _error ?? '', theme: theme),
              ],

              const SizedBox(height: 24),
            ],
          ),
        ),

        _Footer(
          isSubmitting: _isSubmitting,
          onSubmit: _submit,
          theme: theme,
          cs: cs,
        ),
      ],
    );
  }
}

/// Selectable option card (Yet To Receive / Receives).
class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.isSelected,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? SabitouColors.infoSoft.withValues(alpha: 0.5)
              : cs.card,
          border: Border.all(
            color: isSelected ? SabitouColors.accentBorder : cs.border,
            width: isSelected ? 1.5 : 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: cs.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 13, color: cs.mutedForeground),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            AnimatedContainer(
              duration: const Duration(milliseconds: 140),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isSelected ? SabitouColors.accent : Colors.transparent,
                border: Border.all(
                  color: isSelected ? SabitouColors.accentBorder : cs.border,
                  width: 1.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: isSelected
                  ? const Icon(
                      LucideIcons.check,
                      size: 13,
                      color: SabitouColors.accentForeground,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

/// List of receiving notes with checkboxes for the "Receives" option.
class _ReceivingNotesList extends StatelessWidget {
  const _ReceivingNotesList({
    required this.notes,
    required this.selectedIds,
    required this.onToggle,
    required this.onSelectAll,
    required this.onUnselectAll,
  });

  final List<ReceivingNote> notes;
  final Set<String> selectedIds;
  final ValueChanged<String> onToggle;
  final VoidCallback onSelectAll;
  final VoidCallback onUnselectAll;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final allSelected = selectedIds.length == notes.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          children: [
            Text(
              Intls.to.purchaseReceives,
              style: theme.textTheme.p.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: allSelected ? onUnselectAll : onSelectAll,
              child: Text(
                allSelected ? Intls.to.unselectAll : Intls.to.selectAll,
                style: TextStyle(
                  fontSize: 13,
                  color: cs.mutedForeground,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        Divider(color: cs.border, height: 16),

        // Note rows
        ...notes.map(
          (note) => _NoteRow(
            note: note,
            isSelected: selectedIds.contains(note.refId),
            onToggle: () => onToggle(note.refId),
            cs: cs,
            theme: theme,
          ),
        ),
      ],
    );
  }
}

/// Single receiving note row with checkbox.
class _NoteRow extends StatelessWidget {
  const _NoteRow({
    required this.note,
    required this.isSelected,
    required this.onToggle,
    required this.cs,
    required this.theme,
  });

  final ReceivingNote note;
  final bool isSelected;
  final VoidCallback onToggle;
  final ShadColorScheme cs;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onToggle,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: cs.border.withValues(alpha: 0.5)),
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? SabitouColors.accent : Colors.transparent,
                border: Border.all(
                  color: isSelected ? SabitouColors.accentBorder : cs.border,
                  width: 1.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: isSelected
                  ? const Icon(
                      LucideIcons.check,
                      size: 12,
                      color: SabitouColors.accentForeground,
                    )
                  : null,
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.refId,
                    style: theme.textTheme.p.copyWith(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    Formatters.fmtDate(note.receivedAt.toDateTime()),
                    style: theme.textTheme.muted.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
              decoration: const BoxDecoration(
                color: SabitouColors.successSoft,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                Intls.to.received,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: SabitouColors.successForeground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Error banner shown at the bottom of the sheet body.
class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message, required this.theme});

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
        ],
      ),
    );
  }
}

/// Sticky footer containing the "Convert to Bill" primary button.
class _Footer extends StatelessWidget {
  const _Footer({
    required this.isSubmitting,
    required this.onSubmit,
    required this.theme,
    required this.cs,
  });

  final bool isSubmitting;
  final VoidCallback onSubmit;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: cs.card,
        border: Border(top: BorderSide(color: cs.border)),
      ),
      child: ShadButton(
        width: double.infinity,
        onPressed: isSubmitting ? null : onSubmit,
        leading: isSubmitting
            ? const Loading.button()
            : const Icon(LucideIcons.fileText, size: 14),
        child: Text(Intls.to.convertToBill),
      ),
    );
  }
}
