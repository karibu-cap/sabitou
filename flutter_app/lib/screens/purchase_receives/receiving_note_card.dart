import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_theme.dart';
import '../../utils/formatters.dart';
import 'components/receiving_note_status_utils.dart';

/// Card widget representing a single [ReceivingNote] in the dashboard list.
class ReceivingNoteCard extends StatelessWidget {
  /// Constructs a [ReceivingNoteCard] for [note].
  const ReceivingNoteCard({
    super.key,
    required this.note,
    required this.isSelected,
    required this.onTap,
  });

  /// The receiving note to display.
  final ReceivingNote note;

  /// Whether this card is currently selected in the desktop split view.
  final bool isSelected;

  /// Called when the card is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    final theme = ShadTheme.of(context);
    final progress = RnStatusUtils.receiveProgress(note);
    final totalReceived = RnStatusUtils.totalReceived(note);
    final totalRejected = RnStatusUtils.totalRejected(note);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? SabitouColors.accentSoft : cs.card,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(
            BorderSide(
              color: isSelected ? SabitouColors.accent : cs.border,
              width: isSelected ? 1.5 : 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _SupplierAvatar(supplierId: note.supplierId),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.supplierId,
                        style: theme.textTheme.p.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 1),
                      _MetaRow(note: note),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                RnComplianceBadge(note: note),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 3,
                backgroundColor: cs.border,
                color: totalRejected > 0
                    ? SabitouColors.warning
                    : SabitouColors.success,
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                _StatChip(
                  icon: LucideIcons.packageCheck,
                  label: '${totalReceived.toInt()} ${Intls.to.receivedPlural}',
                  iconColor: SabitouColors.successForeground,
                  bg: SabitouColors.successSoft,
                ),
                if (totalRejected > 0) ...[
                  const SizedBox(width: 6),
                  _StatChip(
                    icon: LucideIcons.packageX,
                    label:
                        '${totalRejected.toInt()} ${Intls.to.rejectedPlural}',
                    iconColor: SabitouColors.dangerForeground,
                    bg: SabitouColors.dangerSoft,
                  ),
                ],
                const Spacer(),
                if (note.relatedPurchaseOrderId.isNotEmpty)
                  _PoLinkChip(refId: note.relatedPurchaseOrderId),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Initials avatar for a supplier, using a deterministic color palette.
class _SupplierAvatar extends StatelessWidget {
  const _SupplierAvatar({required this.supplierId});

  final String supplierId;

  static const _palettes = [
    (bg: Color(0xFFEDE9FF), fg: Color(0xFF5946D2)),
    (bg: SabitouColors.accentSoft, fg: SabitouColors.accentForeground),
    (bg: SabitouColors.successSoft, fg: SabitouColors.successForeground),
    (bg: SabitouColors.infoSoft, fg: SabitouColors.infoText),
    (bg: SabitouColors.dangerSoft, fg: SabitouColors.dangerForeground),
  ];

  @override
  Widget build(BuildContext context) {
    final idx = supplierId.isNotEmpty
        ? supplierId.codeUnits.first % _palettes.length
        : 0;
    final p = _palettes[idx];
    final initials = supplierId.trim().isNotEmpty
        ? supplierId.trim()[0].toUpperCase()
        : '?';

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: p.bg,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: p.fg,
        ),
      ),
    );
  }
}

/// Displays date and ref for a [ReceivingNote] in a compact inline row.
class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.note});

  final ReceivingNote note;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 5,
      children: [
        Text(
          Formatters.fmtDate(note.receivedAt.toDateTime()),
          style: theme.textTheme.muted.copyWith(fontSize: 11.5),
        ),
        Container(
          width: 3,
          height: 3,
          decoration: BoxDecoration(
            color: cs.mutedForeground.withValues(alpha: .4),
            shape: BoxShape.circle,
          ),
        ),
        Text(note.refId, style: theme.textTheme.muted.copyWith(fontSize: 11.5)),
      ],
    );
  }
}

/// Small pill chip showing a quantity stat with icon.
class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.bg,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: iconColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.muted.copyWith(
              fontSize: 11,
              color: iconColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Small chip linking to the related purchase order ref.
class _PoLinkChip extends StatelessWidget {
  const _PoLinkChip({required this.refId});

  final String refId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: cs.background,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.fromBorderSide(BorderSide(color: cs.border)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.clipboardList, size: 11, color: cs.mutedForeground),
          const SizedBox(width: 4),
          Text(refId, style: theme.textTheme.muted.copyWith(fontSize: 11)),
        ],
      ),
    );
  }
}
