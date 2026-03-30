import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../router/app_router.dart';
import '../../../router/page_routes.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/custom_grid.dart';
import '../components/receiving_note_status_utils.dart';

/// Full detail view for a single [ReceivingNote].
///
/// Completely read-only — displays summary, meta, line items and notes.
/// Reused as the right panel in the desktop split layout and as the body
/// of [ReceivingNoteDetailPage] on mobile.
class ReceivingNoteDetail extends StatelessWidget {
  /// Constructs a [ReceivingNoteDetail] for [note].
  const ReceivingNoteDetail({super.key, required this.note});

  /// The receiving note to display.
  final ReceivingNote note;

  @override
  Widget build(BuildContext context) {
    final totalReceived = RnStatusUtils.totalReceived(note);
    final totalRejected = RnStatusUtils.totalRejected(note);
    final progress = RnStatusUtils.receiveProgress(note);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DetailHeader(note: note),
          const SizedBox(height: 18),
          _SummaryHero(
            note: note,
            totalReceived: totalReceived,
            totalRejected: totalRejected,
            progress: progress,
          ),
          const SizedBox(height: 14),
          _MetaGrid(note: note),
          const SizedBox(height: 14),
          if (note.relatedPurchaseOrderId.isNotEmpty) ...[
            _LinkedPoCard(purchaseOrderId: note.relatedPurchaseOrderId),
            const SizedBox(height: 14),
          ],
          _SectionLabel(label: Intls.to.receivedItems),
          const SizedBox(height: 8),
          _LineItemsCard(note: note),
          if (note.notes.isNotEmpty) ...[
            const SizedBox(height: 14),
            _NotesCard(notes: note.notes),
          ],
        ],
      ),
    );
  }
}

/// Header row: ref, supplier name, and compliance badge.
class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.note});

  final ReceivingNote note;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isMobile ? 0 : 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.refId,
                style: theme.textTheme.h3.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                note.supplierId,
                style: theme.textTheme.muted.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        RnComplianceBadge(note: note, large: true),
      ],
    );
  }
}

/// Hero card: progress bar + received / rejected / line count stats.
class _SummaryHero extends StatelessWidget {
  const _SummaryHero({
    required this.note,
    required this.totalReceived,
    required this.totalRejected,
    required this.progress,
  });

  final ReceivingNote note;
  final double totalReceived;
  final double totalRejected;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final hasRejections = totalRejected > 0;
    final totalExpected = note.items.fold<double>(
      0,
      (s, i) => s + i.quantityExpected,
    );

    return ShadCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${(progress * 100).round()}% ${Intls.to.percentReceived}',
                style: theme.textTheme.p.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
              const Spacer(),
              Text(
                '${totalReceived.toInt()} / ${totalExpected.toInt()} '
                '${Intls.to.product}',
                style: theme.textTheme.muted.copyWith(fontSize: 12.5),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 7,
              backgroundColor: cs.border,
              color: hasRejections
                  ? SabitouColors.warning
                  : SabitouColors.success,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _HeroStat(
                icon: LucideIcons.packageCheck,
                label: Intls.to.receivedPlural,
                value: totalReceived.toInt().toString(),
                bg: SabitouColors.successSoft,
                fg: SabitouColors.successForeground,
                iconColor: SabitouColors.success,
              ),
              const SizedBox(width: 10),
              _HeroStat(
                icon: LucideIcons.packageX,
                label: Intls.to.rejectedPlural,
                value: totalRejected.toInt().toString(),
                bg: hasRejections ? SabitouColors.dangerSoft : cs.background,
                fg: hasRejections
                    ? SabitouColors.dangerForeground
                    : cs.mutedForeground,
                iconColor: hasRejections
                    ? SabitouColors.danger
                    : cs.mutedForeground,
              ),
              const SizedBox(width: 10),
              _HeroStat(
                icon: LucideIcons.boxes,
                label: Intls.to.lines,
                value: note.items.length.toString(),
                bg: SabitouColors.purpleSoft,
                fg: SabitouColors.purpleForeground,
                iconColor: SabitouColors.purpleForeground,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Single stat tile inside the hero card.
class _HeroStat extends StatelessWidget {
  const _HeroStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.bg,
    required this.fg,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color bg;
  final Color fg;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: fg,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: fg.withValues(alpha: .7),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 2-column grid of meta tiles: dates, supplier, received-by.
class _MetaGrid extends StatelessWidget {
  const _MetaGrid({required this.note});

  final ReceivingNote note;

  @override
  Widget build(BuildContext context) {
    return CustomGrid(
      minItemWidth: 200,
      mainAxisExtent: 100,
      mainAxisSpacing: 16,
      crossSpacing: 16,
      children: [
        _MetaTile(
          label: Intls.to.receptionDate,
          value: Formatters.fmtDate(note.receivedAt.toDateTime()),
        ),
        _MetaTile(
          label: Intls.to.creationDate,
          value: Formatters.fmtDate(note.createdAt.toDateTime()),
        ),
        _MetaTile(label: Intls.to.supplier, value: note.supplierId),
        _MetaTile(
          label: Intls.to.receivedBy,
          value: note.receivedByUserId.isNotEmpty ? note.receivedByUserId : '—',
        ),
      ],
    );
  }
}

/// Single meta tile card.
class _MetaTile extends StatelessWidget {
  const _MetaTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: theme.textTheme.muted.copyWith(
              fontSize: 11,
              letterSpacing: .4,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Card linking to the related purchase order.
class _LinkedPoCard extends StatelessWidget {
  const _LinkedPoCard({required this.purchaseOrderId});

  final String purchaseOrderId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: Intls.to.linkedPurchaseOrder),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => AppRouter.push(
            context,
            PagesRoutes.purchaseOrderDetail.create(
              PurchaseOrderDetailParameters(purchaseOrderId: purchaseOrderId),
            ),
          ),
          child: ShadCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: SabitouColors.accentSoft,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: const Icon(
                    LucideIcons.clipboardList,
                    size: 17,
                    color: SabitouColors.accentForeground,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    purchaseOrderId,
                    style: theme.textTheme.p.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                  ),
                ),
                Icon(
                  LucideIcons.chevronRight,
                  size: 16,
                  color: cs.mutedForeground,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Card listing all line items with progress bars and rejection reasons.
class _LineItemsCard extends StatelessWidget {
  const _LineItemsCard({required this.note});

  final ReceivingNote note;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    Intls.to.product,
                    style: theme.textTheme.muted.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _TableHeaderCell(label: Intls.to.expected),
                const SizedBox(width: 12),
                _TableHeaderCell(label: Intls.to.received),
                const SizedBox(width: 12),
                _TableHeaderCell(label: Intls.to.rejected),
              ],
            ),
          ),
          ...note.items.map((item) => _LineItemRow(item: item)),
        ],
      ),
    );
  }
}

/// Column header cell in the line items table.
class _TableHeaderCell extends StatelessWidget {
  const _TableHeaderCell({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SizedBox(
      width: 52,
      child: AutoSizeText(
        label,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.muted.copyWith(
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Single line item row inside [_LineItemsCard].
class _LineItemRow extends StatelessWidget {
  const _LineItemRow({required this.item});

  final ReceivingNoteLineItem item;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final pct = item.quantityExpected > 0
        ? (item.quantityReceived / item.quantityExpected).clamp(0.0, 1.0)
        : 0.0;
    final hasRejection = item.quantityRejected > 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: cs.border.withValues(alpha: .5)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productId,
                      style: theme.textTheme.p.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    if ((item.batchId).isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        '${Intls.to.batchAbbr}: ${item.batchId}',
                        style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                      ),
                    ],
                  ],
                ),
              ),
              _QtyCell(
                value: item.quantityExpected.toInt(),
                color: cs.mutedForeground,
              ),
              const SizedBox(width: 12),
              _QtyCell(
                value: item.quantityReceived.toInt(),
                color: SabitouColors.successForeground,
                bold: true,
              ),
              const SizedBox(width: 12),
              _QtyCell(
                value: item.quantityRejected.toInt(),
                color: hasRejection
                    ? SabitouColors.dangerForeground
                    : cs.mutedForeground.withValues(alpha: .4),
                bold: hasRejection,
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 3,
              backgroundColor: cs.border,
              color: hasRejection
                  ? SabitouColors.warning
                  : SabitouColors.success,
            ),
          ),
          if (hasRejection && item.rejectionReason.isNotEmpty) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: SabitouColors.dangerSoft,
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                border: Border.fromBorderSide(
                  BorderSide(color: SabitouColors.danger.withValues(alpha: .3)),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    LucideIcons.triangleAlert400,
                    size: 12,
                    color: SabitouColors.dangerForeground,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      item.rejectionReason,
                      style: theme.textTheme.muted.copyWith(
                        fontSize: 12,
                        color: SabitouColors.dangerForeground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              _InfoPill(
                icon: LucideIcons.calendarDays,
                label:
                    '${Intls.to.expirationAbbr} ${Formatters.fmtDate(item.expirationDate.toDateTime())}',
              ),
              if (item.purchasePrice > 0)
                _InfoPill(
                  icon: LucideIcons.tag,
                  label: Formatters.formatCurrency(item.purchasePrice),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Quantity value cell used in the line items table.
class _QtyCell extends StatelessWidget {
  const _QtyCell({required this.value, required this.color, this.bold = false});

  final int value;
  final Color color;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SizedBox(
      width: 52,
      child: Text(
        value.toString(),
        textAlign: TextAlign.center,
        style: theme.textTheme.p.copyWith(
          fontSize: 13,
          fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
          color: color,
        ),
      ),
    );
  }
}

/// Small pill chip showing a metadata value with an icon.
class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

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
          Icon(icon, size: 11, color: cs.mutedForeground),
          const SizedBox(width: 4),
          Text(label, style: theme.textTheme.muted.copyWith(fontSize: 11)),
        ],
      ),
    );
  }
}

/// Notes section card.
class _NotesCard extends StatelessWidget {
  const _NotesCard({required this.notes});

  final String notes;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(LucideIcons.messageSquare, size: 14, color: cs.mutedForeground),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              notes,
              style: theme.textTheme.muted.copyWith(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

/// Uppercased section heading label.
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: ShadTheme.of(context).textTheme.muted.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: .5,
      ),
    );
  }
}

/// Standalone mobile page for viewing a [ReceivingNote] in detail.
class ReceivingNoteDetailPage extends StatelessWidget {
  /// Constructs a [ReceivingNoteDetailPage] for [note].
  const ReceivingNoteDetailPage({super.key, required this.note});

  /// The receiving note to display.
  final ReceivingNote note;

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.refId,
              style: theme.textTheme.p.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Text(
              note.supplierId,
              style: theme.textTheme.muted.copyWith(fontSize: 11.5),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(color: cs.border, height: 1),
        ),
      ),
      body: ReceivingNoteDetail(note: note),
    );
  }
}
