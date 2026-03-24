import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/error/loading_failed.dart';
import '../../../widgets/pop_up/add_supplier/add_supplier_view.dart';
import '../suppliers_controller.dart';
import 'list_components/supplier_delete_dialog.dart';
import 'list_components/supplier_empty_state.dart';
import 'list_components/supplier_shimmer_widgets.dart';

/// Widget for displaying the list of suppliers.
///
/// This is the main suppliers list widget that orchestrates the display
/// of suppliers using modular components for better maintainability.
class SuppliersList extends StatelessWidget {
  /// Creates a new [SuppliersList].
  const SuppliersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context, listen: false);
    final theme = ShadTheme.of(context);

    void _showDeleteDialog(BuildContext context, Supplier supplier) {
      final controller = Provider.of<SuppliersController>(
        context,
        listen: false,
      );
      showDialog(
        context: context,
        builder: (dialogContext) => ChangeNotifierProvider.value(
          value: controller,
          child: SupplierDeleteDialog(supplier: supplier),
        ),
      );
    }

    return StreamBuilder<List<Supplier>>(
      stream: controller.filteredSuppliersStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SupplierShimmerWidgets.buildTableShimmer();
        }
        final error = snapshot.error;
        if (snapshot.hasError && error != null) {
          return LoadingFailedWidget(error: error);
        }
        final suppliers = snapshot.data ?? [];
        if (suppliers.isEmpty) {
          return const SuppliersEmptyState();
        }

        return Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Intls.to.allSuppliersText,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  '${suppliers.length} ${Intls.to.result}',
                  style: theme.textTheme.muted,
                ),
              ],
            ),

            CustomGrid(
              children: suppliers
                  .map(
                    (e) => _SupplierCard(
                      supplier: e,
                      onEdit: () => showAddSupplierDialog(context, supplier: e),
                      onDelete: () => _showDeleteDialog(context, e),
                    ),
                  )
                  .toList(),
              minItemWidth: 300,
              mainAxisExtent: 200,
              crossSpacing: 20,
            ),
          ],
        );
      },
    );
  }
}

class _SupplierCard extends StatelessWidget {
  const _SupplierCard({
    required this.supplier,
    required this.onEdit,
    required this.onDelete,
  });

  final Supplier supplier;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _SupplierAvatar(name: supplier.name),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      supplier.name,
                      style: theme.textTheme.p.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (supplier.description.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        supplier.description,
                        style: theme.textTheme.muted.copyWith(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Status + actions stacked
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _StatusPill(status: supplier.status),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _CardIconButton(
                        icon: LucideIcons.pencil,
                        onPressed: onEdit,
                      ),
                      const SizedBox(width: 5),
                      _CardIconButton(
                        icon: LucideIcons.trash2,
                        onPressed: onDelete,
                        isDanger: true,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ShadSeparator.horizontal(),
          ),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (supplier.contactEmail.isNotEmpty)
                _InfoChip(icon: LucideIcons.mail, label: supplier.contactEmail),
              if (supplier.contactPhone.isNotEmpty)
                _InfoChip(
                  icon: LucideIcons.phone,
                  label: supplier.contactPhone,
                ),
              if (supplier.contactAddress.isNotEmpty)
                _InfoChip(
                  icon: LucideIcons.locate400,
                  label: supplier.contactAddress,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SupplierAvatar extends StatelessWidget {
  const _SupplierAvatar({required this.name});

  static const _palettes = [
    (_bgP, _fgP), // purple
    (_bgA, _fgA), // amber
    (_bgG, _fgG), // green
    (_bgR, _fgR), // red
    (_bgB, _fgB), // blue
  ];

  static const _bgP = SabitouColors.purpleSoft;
  static const _fgP = SabitouColors.purpleForeground;
  static const _bgA = SabitouColors.accentSoft;
  static const _fgA = SabitouColors.accent;
  static const _bgG = SabitouColors.successSoft;
  static const _fgG = SabitouColors.success;
  static const _bgR = SabitouColors.dangerSoft;
  static const _fgR = SabitouColors.danger;
  static const _bgB = SabitouColors.infoSoft;
  static const _fgB = SabitouColors.infoText;

  final String name;

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    }

    return name.substring(0, name.length.clamp(1, 2)).toUpperCase();
  }

  (Color, Color) get _palette =>
      _palettes[name.codeUnits.first % _palettes.length];

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = _palette;

    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(11)),
      ),
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: TextStyle(color: fg, fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});
  final SupplierStatus status;

  bool get _isActive => status == SupplierStatus.SUPPLIER_STATUS_ACTIVE;

  @override
  Widget build(BuildContext context) {
    const successSoft = SabitouColors.infoSoft;
    const successText = SabitouColors.successForeground;
    const successDot = SabitouColors.success;
    const inactiveBg = SabitouColors.accentSoft;
    const inactiveText = SabitouColors.accentForeground;
    const inactiveDot = SabitouColors.accentSoft;

    final bg = _isActive ? successSoft : inactiveBg;
    final fg = _isActive ? successText : inactiveText;
    final dot = _isActive ? successDot : inactiveDot;
    final label = _isActive ? Intls.to.active : Intls.to.inactive;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: fg,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardIconButton extends StatelessWidget {
  const _CardIconButton({
    required this.icon,
    required this.onPressed,
    this.isDanger = false,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadButton.ghost(
      width: 30,
      height: 30,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          color: cs.border,
          width: 1,
          radius: const BorderRadius.all(Radius.circular(7)),
        ),
      ),
      child: Icon(
        icon,
        size: 13,
        color: isDanger ? cs.destructive : cs.mutedForeground,
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: cs.background,
        border: Border.fromBorderSide(BorderSide(color: cs.border)),
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13,
            color: cs.mutedForeground.withValues(alpha: 0.55),
          ),
          const SizedBox(width: 6),
          Text(label, style: theme.textTheme.muted.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}
