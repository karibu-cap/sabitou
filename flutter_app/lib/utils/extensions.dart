import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../services/internationalization/internationalization.dart';
import '../themes/app_colors.dart';

/// The extension for the [TransactionType] enum.
extension TransactionTypeExtension on TransactionType {
  /// Get the label for the transaction type.
  String get label {
    switch (this) {
      case TransactionType.TRANSACTION_TYPE_PURCHASE:
        return Intls.to.purchase;
      case TransactionType.TRANSACTION_TYPE_SALE:
        return Intls.to.sale;
      case TransactionType.TRANSACTION_TYPE_ADJUSTMENT:
        return Intls.to.adjustment;
      case TransactionType.TRANSACTION_TYPE_REFUND:
        return Intls.to.refund;
      case TransactionType.TRANSACTION_TYPE_TRANSFER:
        return Intls.to.transfer;
      default:
        return Intls.to.transaction;
    }
  }

  /// Get the color for the transaction type.
  Color get color {
    switch (this) {
      case TransactionType.TRANSACTION_TYPE_PURCHASE:
        return AppColors.cobalt;
      case TransactionType.TRANSACTION_TYPE_SALE:
        return AppColors.dartGreen;
      case TransactionType.TRANSACTION_TYPE_ADJUSTMENT:
        return AppColors.orange500;
      case TransactionType.TRANSACTION_TYPE_REFUND:
        return AppColors.red;
      case TransactionType.TRANSACTION_TYPE_TRANSFER:
        return AppColors.purple;
      default:
        return AppColors.grey500;
    }
  }

  /// Get the icon for the transaction type.
  IconData get icon {
    switch (this) {
      case TransactionType.TRANSACTION_TYPE_PURCHASE:
        return LucideIcons.shoppingCart;
      case TransactionType.TRANSACTION_TYPE_SALE:
        return LucideIcons.trendingUp;
      case TransactionType.TRANSACTION_TYPE_ADJUSTMENT:
        return LucideIcons.refreshCw;
      case TransactionType.TRANSACTION_TYPE_REFUND:
        return LucideIcons.undo2;
      case TransactionType.TRANSACTION_TYPE_TRANSFER:
        return LucideIcons.arrowRightLeft;
      default:
        return LucideIcons.package;
    }
  }
}
