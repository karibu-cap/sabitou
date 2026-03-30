import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/user_preference.dart';
import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../themes/app_theme.dart';
import '../../widgets/no_business_view.dart';
import 'components/receiving_note_status_utils.dart';
import 'detail/receiving_note_detail.dart';
import 'detail/receiving_note_detail_screen.dart';
import 'receiving_note_card.dart';
import 'receiving_notes_controller.dart';
import 'receiving_notes_view_model.dart';

const double _kDesktopBreakpoint = 820;

/// The Purchase Receives dashboard screen.
///
/// Accessible via Dashboard → Purchases → Purchase Receives.
/// Read-only: receiving notes are created from inside a purchase order detail.
/// Provides [ReceivingNotesController] to the subtree.
class PurchaseReceivesView extends StatelessWidget {
  /// Constructs a new [PurchaseReceivesView].
  const PurchaseReceivesView({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<UserPreferences>();
    final store = prefs.store;

    if (store == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    return ChangeNotifierProvider<ReceivingNotesController>(
      create: (_) => ReceivingNotesController(
        ReceivingNotesViewModel(storeId: store.refId),
      ),
      child: const _ReceivesAdaptiveLayout(),
    );
  }
}

/// Switches between the desktop split view and the mobile list view
/// based on available width.
class _ReceivesAdaptiveLayout extends StatelessWidget {
  const _ReceivesAdaptiveLayout();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          constraints.maxWidth >= _kDesktopBreakpoint
          ? const _DesktopSplitView()
          : const _MobileListView(),
    );
  }
}

/// Desktop layout: fixed 380px list panel on the left,
/// expanding detail panel on the right.
class _DesktopSplitView extends StatelessWidget {
  const _DesktopSplitView();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ReceivingNotesController>(context);
    final cs = ShadTheme.of(context).colorScheme;

    final selectedNote = controller.selectedNote;

    return Row(
      children: [
        Container(
          width: 380,
          decoration: BoxDecoration(
            color: cs.card,
            border: Border(right: BorderSide(color: cs.border)),
          ),
          child: const Column(
            children: [
              _ListHeader(),
              _StatsRow(),
              _SearchBar(),
              _StatusChips(),
              Expanded(child: _NotesList(isDesktop: true)),
            ],
          ),
        ),
        Expanded(
          child: selectedNote != null
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: ReceivingNoteDetailScreen(
                        receivingNoteId: selectedNote.refId,
                        key: Key(selectedNote.refId),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(LucideIcons.x400),
                        onPressed: controller.clearSelection,
                      ),
                    ),
                  ],
                )
              : const _EmptyDetailState(),
        ),
      ],
    );
  }
}

/// Mobile layout: full-width list; tapping a card navigates to the detail page.
class _MobileListView extends StatelessWidget {
  const _MobileListView();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ListHeader(),
        _StatsRow(),
        _SearchBar(),
        _StatusChips(),
        Expanded(child: _NotesList(isDesktop: false)),
      ],
    );
  }
}

/// Page header showing the screen title, total count badge, and a read-only
/// indicator. No creation button — notes are created from PO detail.
class _ListHeader extends StatelessWidget {
  const _ListHeader();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ReceivingNotesController>(
      context,
      listen: false,
    );
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
      child: FutureBuilder<List<ReceivingNote>>(
        future: controller.rawFuture,
        builder: (context, snapshot) {
          final count = snapshot.data?.length ?? 0;

          return Row(
            children: [
              Container(
                width: 3,
                height: 28,
                decoration: const BoxDecoration(
                  color: SabitouColors.infoText,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      Intls.to.receptions,
                      style: theme.textTheme.h4.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    if (count > 0) ...[
                      const SizedBox(width: 8),
                      _CountBadge(count: count),
                    ],
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: cs.background,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.fromBorderSide(BorderSide(color: cs.border)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(LucideIcons.eye, size: 12, color: cs.mutedForeground),
                    const SizedBox(width: 5),
                    Text(
                      Intls.to.readOnly,
                      style: theme.textTheme.muted.copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Three-tile summary row: total / conformes / écarts.
class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ReceivingNotesController>(
      context,
      listen: false,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: FutureBuilder<List<ReceivingNote>>(
        future: controller.rawFuture,
        builder: (context, snapshot) {
          final notes = snapshot.data ?? [];
          final total = notes.length;
          final conformes = notes
              .where(
                (n) =>
                    RnStatusUtils.complianceOf(n) ==
                    RnComplianceStatus.compliant,
              )
              .length;
          final issues = notes
              .where(
                (n) =>
                    RnStatusUtils.complianceOf(n) ==
                    RnComplianceStatus.withIssues,
              )
              .length;

          return Row(
            children: [
              _MiniStatTile(
                label: Intls.to.total,
                value: '$total',
                iconBg: SabitouColors.infoSoft,
                iconColor: SabitouColors.infoText,
                icon: LucideIcons.package,
              ),
              const SizedBox(width: 8),
              _MiniStatTile(
                label: Intls.to.conformes,
                value: '$conformes',
                iconBg: SabitouColors.successSoft,
                iconColor: SabitouColors.successForeground,
                icon: LucideIcons.packageCheck,
              ),
              const SizedBox(width: 8),
              _MiniStatTile(
                label: Intls.to.ecarts,
                value: '$issues',
                iconBg: issues > 0
                    ? SabitouColors.dangerSoft
                    : SabitouColors.infoSoft,
                iconColor: issues > 0
                    ? SabitouColors.dangerForeground
                    : SabitouColors.infoText,
                icon: LucideIcons.packageX,
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Single mini stat tile used in [_StatsRow].
class _MiniStatTile extends StatelessWidget {
  const _MiniStatTile({
    required this.label,
    required this.value,
    required this.iconBg,
    required this.iconColor,
    required this.icon,
  });

  final String label;
  final String value;
  final Color iconBg;
  final Color iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
        decoration: BoxDecoration(
          color: cs.card,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(BorderSide(color: cs.border)),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Icon(icon, size: 14, color: iconColor),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.p.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 1.1,
                    ),
                  ),
                  AutoSizeText(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.muted.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final controller = Provider.of<ReceivingNotesController>(
      context,
      listen: false,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShadInput(
        controller: controller.searchController,
        placeholder: Text(Intls.to.searchReceivingNoteHint),
        leading: const Icon(LucideIcons.search, size: 16),
        onChanged: (v) => controller.searchQuery.add(v),
        trailing: StreamBuilder<String>(
          stream: controller.searchQuery.stream,
          builder: (context, snapshot) {
            if ((snapshot.data ?? '').isEmpty) {
              return const SizedBox(width: 12);
            }

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  controller.searchController.clear();
                  controller.searchQuery.add('');
                },
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: cs.mutedForeground.withValues(alpha: .15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    LucideIcons.x,
                    size: 11,
                    color: cs.mutedForeground,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Horizontally scrollable status filter chips.
class _StatusChips extends StatelessWidget {
  const _StatusChips();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ReceivingNotesController>(
      context,
      listen: false,
    );
    final cs = ShadTheme.of(context).colorScheme;

    return StreamBuilder<RnStatusFilter>(
      stream: controller.statusFilter.stream,
      builder: (context, snapshot) {
        final selected = snapshot.data ?? RnStatusFilter.all;

        final chips = [
          (
            filter: RnStatusFilter.all,
            label: Intls.to.all,
            icon: LucideIcons.layoutList,
          ),
          (
            filter: RnStatusFilter.received,
            label: Intls.to.conformes,
            icon: LucideIcons.packageCheck,
          ),
          (
            filter: RnStatusFilter.withIssues,
            label: Intls.to.ecarts,
            icon: LucideIcons.packageX,
          ),
          (
            filter: RnStatusFilter.pending,
            label: Intls.to.partial,
            icon: LucideIcons.packageSearch,
          ),
        ];

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
          child: Row(
            children: chips.asMap().entries.map((entry) {
              final chip = entry.value;
              final isSelected = selected == chip.filter;
              final style = RnStatusUtils.chipStyleFor(
                chip.filter,
                isSelected,
                cs,
              );

              return Padding(
                padding: EdgeInsets.only(
                  right: entry.key < chips.length - 1 ? 6 : 0,
                ),
                child: GestureDetector(
                  onTap: () => controller.statusFilter.add(chip.filter),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 130),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: style.bg,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.fromBorderSide(
                        BorderSide(color: style.border),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(chip.icon, size: 12, color: style.fg),
                        const SizedBox(width: 5),
                        Text(
                          chip.label,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: style.fg,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

/// Reactive list of [ReceivingNoteCard]s.
///
/// On desktop, tapping selects the note for the right panel.
/// On mobile, tapping navigates to [ReceivingNoteDetailPage].
class _NotesList extends StatelessWidget {
  const _NotesList({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ReceivingNotesController>(context);

    return StreamBuilder<List<ReceivingNote>>(
      stream: controller.filteredStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _NotesShimmer();
        }

        final notes = snapshot.data ?? [];

        if (notes.isEmpty) {
          return _EmptyListState(hasFilters: controller.isFiltered);
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
          itemCount: notes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final note = notes[i];
            final isSelected =
                isDesktop && controller.selectedNote?.refId == note.refId;

            return ReceivingNoteCard(
              note: note,
              isSelected: isSelected,
              onTap: () {
                if (isDesktop) {
                  controller.selectNote(note);
                } else {
                  AppRouter.push(
                    context,
                    PagesRoutes.receivingNoteDetail.create(
                      ReceivingNoteDetailParameters(
                        receivingNoteId: note.refId,
                      ),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}

/// Desktop right panel shown when no note is selected.
class _EmptyDetailState extends StatelessWidget {
  const _EmptyDetailState();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: SabitouColors.infoSoft,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: const Icon(
              LucideIcons.packageSearch,
              size: 26,
              color: SabitouColors.infoText,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            Intls.to.selectAReceivingNote,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            Intls.to.clickOnReceivingNoteForDetails,
            style: theme.textTheme.muted.copyWith(fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Empty state shown when the filtered list returns no results.
class _EmptyListState extends StatelessWidget {
  const _EmptyListState({required this.hasFilters});

  final bool hasFilters;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: SabitouColors.infoSoft,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: const Icon(
                LucideIcons.packageSearch,
                size: 24,
                color: SabitouColors.infoText,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              hasFilters ? Intls.to.noResults : Intls.to.noReceivingNotesFound,
              style: theme.textTheme.p.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              hasFilters
                  ? Intls.to.modifyFiltersForMoreResults
                  : Intls.to.receivingNotesCreatedFromPos,
              style: theme.textTheme.muted.copyWith(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Skeleton loading state while the stream has not yet emitted.
class _NotesShimmer extends StatelessWidget {
  const _NotesShimmer();

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, __) => Container(
        height: 100,
        decoration: BoxDecoration(
          color: cs.card,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(BorderSide(color: cs.border)),
        ),
      ),
    );
  }
}

/// Small pill badge showing the total count.
class _CountBadge extends StatelessWidget {
  /// Constructs a [_CountBadge] for [count].
  const _CountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: SabitouColors.infoSoft,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.fromBorderSide(
          BorderSide(color: SabitouColors.infoText.withValues(alpha: .3)),
        ),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: SabitouColors.infoText,
        ),
      ),
    );
  }
}
