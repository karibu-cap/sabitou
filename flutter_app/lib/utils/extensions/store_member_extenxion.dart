import 'package:flutter/widgets.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_theme.dart';

/// The extension for the [StockStatus] enum.
extension StoreMemberExtenxion on StoreMemberStatus {
  /// Gets the label for the stock status.
  String get label {
    switch (this) {
      case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
        return Intls.to.active;
      case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
        return Intls.to.pending;
      case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
        return Intls.to.inactive;
      case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
        return Intls.to.banned;
      default:
        return Intls.to.unspecified;
    }
  }

  /// Gets the color for the stock status.
  Color get color {
    switch (this) {
      case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
        return SabitouColors.success;
      case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
        return SabitouColors.accent;
      case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
        return SabitouColors.neutralForeground;
      case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
        return SabitouColors.danger;
      default:
        return SabitouColors.neutral;
    }
  }

  /// Gets the icon for the menber status.
  IconData get icon {
    switch (this) {
      case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
        return LucideIcons.circleCheckBig400;
      case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
        return LucideIcons.clock400;
      case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
        return LucideIcons.circlePause400;
      case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
        return LucideIcons.circleX400;
      default:
        return LucideIcons.circleQuestionMark400;
    }
  }
}
