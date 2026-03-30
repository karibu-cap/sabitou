import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../receiving_notes_view_model.dart';

/// Derived compliance state for a [ReceivingNote].
enum RnComplianceStatus {
  /// All items received with zero rejections.
  compliant,

  /// At least one item was rejected.
  withIssues,

  /// Some items have not yet been fully received.
  partial,
}

/// Style bundle returned by [RnStatusUtils.styleFor].
typedef RnStatusStyle = ({Color bg, Color fg, Color dot});

/// Style bundle returned by [RnStatusUtils.chipStyleFor].
typedef RnChipStyle = ({Color bg, Color border, Color fg});

/// Utility methods for [ReceivingNote] status display.
abstract class RnStatusUtils {
  /// Derives the [RnComplianceStatus] for [note] from its line items.
  static RnComplianceStatus complianceOf(ReceivingNote note) {
    if (note.items.isEmpty) return RnComplianceStatus.compliant;
    if (note.items.any((i) => i.quantityRejected > 0)) {
      return RnComplianceStatus.withIssues;
    }
    if (note.items.any((i) => i.quantityReceived < i.quantityExpected)) {
      return RnComplianceStatus.partial;
    }

    return RnComplianceStatus.compliant;
  }

  /// Returns the total quantity received across all line items of [note].
  static double totalReceived(ReceivingNote note) =>
      note.items.fold(0, (s, i) => s + i.quantityReceived);

  /// Returns the total quantity rejected across all line items of [note].
  static double totalRejected(ReceivingNote note) =>
      note.items.fold(0, (s, i) => s + i.quantityRejected);

  /// Returns the overall receipt progress from 0.0 to 1.0.
  static double receiveProgress(ReceivingNote note) {
    final expected = note.items.fold<double>(
      0,
      (s, i) => s + i.quantityExpected,
    );
    if (expected == 0) return 1.0;

    return (totalReceived(note) / expected).clamp(0.0, 1.0);
  }

  /// Returns the color style bundle for [status].
  static RnStatusStyle styleFor(RnComplianceStatus status) => switch (status) {
    RnComplianceStatus.compliant => (
      bg: SabitouColors.successSoft,
      fg: SabitouColors.successForeground,
      dot: SabitouColors.success,
    ),
    RnComplianceStatus.withIssues => (
      bg: SabitouColors.dangerSoft,
      fg: SabitouColors.dangerForeground,
      dot: SabitouColors.danger,
    ),
    RnComplianceStatus.partial => (
      bg: SabitouColors.warningSoft,
      fg: SabitouColors.warningForeground,
      dot: SabitouColors.warning,
    ),
  };

  /// Returns the chip color style for [filter] given whether it [isSelected].
  static RnChipStyle chipStyleFor(
    RnStatusFilter filter,
    bool isSelected,
    ShadColorScheme cs,
  ) {
    if (!isSelected) {
      return (bg: cs.card, border: cs.border, fg: cs.mutedForeground);
    }

    return switch (filter) {
      RnStatusFilter.all => (
        bg: SabitouColors.accentSoft,
        border: SabitouColors.accent.withValues(alpha: .4),
        fg: SabitouColors.accentForeground,
      ),
      RnStatusFilter.received => (
        bg: SabitouColors.successSoft,
        border: SabitouColors.success.withValues(alpha: .4),
        fg: SabitouColors.successForeground,
      ),
      RnStatusFilter.withIssues => (
        bg: SabitouColors.dangerSoft,
        border: SabitouColors.danger.withValues(alpha: .4),
        fg: SabitouColors.dangerForeground,
      ),
      RnStatusFilter.pending => (
        bg: SabitouColors.warningSoft,
        border: SabitouColors.warning.withValues(alpha: .4),
        fg: SabitouColors.warningForeground,
      ),
    };
  }
}

/// Badge widget that displays the compliance status of a [ReceivingNote].
class RnComplianceBadge extends StatelessWidget {
  /// Constructs a [RnComplianceBadge] for [note].
  const RnComplianceBadge({super.key, required this.note, this.large = false});

  /// The note whose compliance status is displayed.
  final ReceivingNote note;

  /// When `true`, uses larger padding and font size.
  final bool large;

  @override
  Widget build(BuildContext context) {
    final status = RnStatusUtils.complianceOf(note);
    final s = RnStatusUtils.styleFor(status);
    final label = switch (status) {
      RnComplianceStatus.compliant => Intls.to.compliant,
      RnComplianceStatus.withIssues => Intls.to.ecarts,
      RnComplianceStatus.partial => Intls.to.partial,
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: large ? 12 : 9,
        vertical: large ? 5 : 3,
      ),
      decoration: BoxDecoration(
        color: s.bg,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: large ? 7 : 5,
            height: large ? 7 : 5,
            decoration: BoxDecoration(color: s.dot, shape: BoxShape.circle),
          ),
          SizedBox(width: large ? 6 : 5),
          Text(
            label,
            style: TextStyle(
              fontSize: large ? 12 : 11,
              fontWeight: FontWeight.w500,
              color: s.fg,
            ),
          ),
        ],
      ),
    );
  }
}
