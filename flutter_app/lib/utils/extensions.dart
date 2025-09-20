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
      default:
        return LucideIcons.package;
    }
  }
}

/// The extension for the [OrderStatus] enum.
extension OrderStatusExtension on OrderStatus {
  /// Get the label for the order status.
  String? get label {
    switch (this) {
      case OrderStatus.ORDER_STATUS_PENDING:
        return Intls.to.pending;
      case OrderStatus.ORDER_STATUS_COMPLETED:
        return Intls.to.completed;
      case OrderStatus.ORDER_STATUS_CANCELLED:
        return Intls.to.cancelled;
      case OrderStatus.ORDER_STATUS_PROCESSING:
        return Intls.to.processing;
      default:
        return null;
    }
  }

  /// Get the color for the order status.
  Color get color {
    switch (this) {
      case OrderStatus.ORDER_STATUS_PENDING:
        return AppColors.warningColor;
      case OrderStatus.ORDER_STATUS_COMPLETED:
        return AppColors.dartGreen;
      case OrderStatus.ORDER_STATUS_CANCELLED:
        return AppColors.red;
      case OrderStatus.ORDER_STATUS_PROCESSING:
        return AppColors.orange500;
      default:
        return AppColors.grey500;
    }
  }
}

/// The extension for the [TransactionStatus] enum.
extension TransactionStatusExtension on TransactionStatus {
  /// Get the label for the transaction status.
  String get label {
    switch (this) {
      case TransactionStatus.TRANSACTION_STATUS_PENDING:
        return Intls.to.pending;
      case TransactionStatus.TRANSACTION_STATUS_COMPLETED:
        return Intls.to.completed;
      case TransactionStatus.TRANSACTION_STATUS_CANCELLED:
        return Intls.to.cancelled;
      case TransactionStatus.TRANSACTION_STATUS_FAILED:
        return Intls.to.failed;
      default:
        return Intls.to.transaction;
    }
  }
}
