import 'package:flutter/widgets.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';

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
        return AppColors.success500;
      case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
        return AppColors.warning500;
      case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
        return AppColors.grey500;
      case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
        return AppColors.error500;
      default:
        return AppColors.grey300;
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
