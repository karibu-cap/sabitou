import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';

/// Shared style config for a given BillStatus.
class BillStatusStyle {
  /// A label for the bill status.
  ///
  /// This label is used to display the status of a bill.
  final String label;

  /// The background color of the bill status.
  ///
  /// This color is used to represent the background of the bill status.
  final Color bg;

  /// The foreground color of the bill status.
  ///
  /// This color is used to represent the foreground of the bill status.
  final Color fg;

  /// The dot color of the bill status.
  ///
  /// This color is used to represent the dot of the bill status.
  final Color dot;

  /// The icon of the bill status.
  ///
  /// This icon is used to represent the bill status.
  final IconData icon;

  /// The top bar color of the bill status.
  ///
  /// This color is used to represent the top bar of the bill status.
  final Color topBarColor;

  /// Creates a new instance of [BillStatusStyle].
  ///
  /// The [label], [bg], [fg], [dot], [icon], and [topBarColor]
  /// arguments must not be null.
  const BillStatusStyle({
    required this.label,
    required this.bg,
    required this.fg,
    required this.dot,
    required this.icon,
    required this.topBarColor,
  });
}

/// The [BillStatusUtils].
abstract class BillStatusUtils {
  /// The styfor for bill.
  static BillStatusStyle styleFor(BillStatus status) {
    return switch (status) {
      BillStatus.BILL_STATUS_DRAFT => BillStatusStyle(
        label: Intls.to.draft,
        bg: SabitouColors.neutralSoft,
        fg: SabitouColors.neutralForeground,
        dot: SabitouColors.neutral,
        icon: LucideIcons.filePen,
        topBarColor: SabitouColors.neutral,
      ),
      BillStatus.BILL_STATUS_OPEN => BillStatusStyle(
        label: Intls.to.unpaid,
        bg: SabitouColors.accentSoft,
        fg: SabitouColors.accentForeground,
        dot: SabitouColors.accent,
        icon: LucideIcons.clock,
        topBarColor: SabitouColors.accent,
      ),
      BillStatus.BILL_STATUS_PAID => BillStatusStyle(
        label: Intls.to.paid,
        bg: SabitouColors.successSoft,
        fg: SabitouColors.successForeground,
        dot: SabitouColors.success,
        icon: LucideIcons.circleCheck,
        topBarColor: SabitouColors.success,
      ),
      BillStatus.BILL_STATUS_OVERDUE => BillStatusStyle(
        label: Intls.to.overdue,
        bg: SabitouColors.dangerSoft,
        fg: SabitouColors.dangerForeground,
        dot: SabitouColors.danger,
        icon: LucideIcons.circleAlert,
        topBarColor: SabitouColors.danger,
      ),
      BillStatus.BILL_STATUS_VOID => BillStatusStyle(
        label: Intls.to.cancelled,
        bg: SabitouColors.neutralSoft,
        fg: SabitouColors.neutralForeground,
        dot: SabitouColors.neutral,
        icon: LucideIcons.ban,
        topBarColor: SabitouColors.neutral,
      ),
      BillStatus.BILL_STATUS_PARTIALLY_PAID => BillStatusStyle(
        label: Intls.to.partiallyPaid,
        bg: SabitouColors.infoSoft,
        fg: SabitouColors.infoText,
        dot: SabitouColors.infoText,
        icon: LucideIcons.circleArrowOutUpRight400,
        topBarColor: SabitouColors.neutral,
      ),
      _ => BillStatusStyle(
        label: Intls.to.unknown,
        bg: SabitouColors.neutralSoft,
        fg: SabitouColors.neutralForeground,
        dot: SabitouColors.neutral,
        icon: LucideIcons.circleQuestionMark400,
        topBarColor: SabitouColors.neutral,
      ),
    };
  }

  /// Checks if a bill is overdue based on due_date.
  static bool isOverdue(Bill bill) {
    if (bill.status == BillStatus.BILL_STATUS_PAID ||
        bill.status == BillStatus.BILL_STATUS_VOID) {
      return false;
    }
    final due = bill.dueDate.toDateTime();

    return due.isBefore(DateTime.now());
  }

  /// Returns effective status (auto-upgrades OPEN → OVERDUE if past due).
  static BillStatus effectiveStatus(Bill bill) {
    if (bill.status == BillStatus.BILL_STATUS_OPEN && isOverdue(bill)) {
      return BillStatus.BILL_STATUS_OVERDUE;
    }

    return bill.status;
  }
}

/// The bill status.
class BillStatusPill extends StatelessWidget {
  /// Constructor of new [BillStatusPill].
  const BillStatusPill({super.key, required this.status, this.large = false});

  /// The status.
  final BillStatus status;

  /// Whether the is large.
  final bool large;

  @override
  Widget build(BuildContext context) {
    final s = BillStatusUtils.styleFor(status);

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
            s.label,
            style: TextStyle(
              color: s.fg,
              fontSize: large ? 12 : 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
