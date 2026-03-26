import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';

/// The extension for the [StockStatus] enum.
extension StockStatusExtension on StockStatus {
  /// Gets the label for the stock status.
  String? get label {
    switch (this) {
      case StockStatus.STOCK_STATUS_OK:
        return Intls.to.ok;
      case StockStatus.STOCK_STATUS_OUT_OF_STOCK:
        return Intls.to.outOfStock;
      case StockStatus.STOCK_STATUS_LOW:
        return Intls.to.low;
      default:
        return null;
    }
  }

  /// Gets the color for the stock status.
  Color get color {
    switch (this) {
      case StockStatus.STOCK_STATUS_OK:
        return AppColors.success500;
      case StockStatus.STOCK_STATUS_OUT_OF_STOCK:
        return AppColors.error500;
      case StockStatus.STOCK_STATUS_LOW:
        return AppColors.orange500;
      default:
        return AppColors.grey0;
    }
  }
}

/// The extension for the [PurchaseOrderStatus] enum.
extension PurchaseOrderStatusExtension on PurchaseOrderStatus {
  /// Gets the label for the stock status.
  String? get label {
    switch (this) {
      case PurchaseOrderStatus.PO_STATUS_DRAFT:
        return Intls.to.draft;
      case PurchaseOrderStatus.PO_STATUS_PENDING:
        return Intls.to.pending;
      case PurchaseOrderStatus.PO_STATUS_ISSUED:
        return Intls.to.issued;
      case PurchaseOrderStatus.PO_STATUS_CLOSED:
        return Intls.to.closed;
      case PurchaseOrderStatus.PO_STATUS_CANCELLED:
        return Intls.to.cancelled;
      default:
        return null;
    }
  }

  /// Gets the color for the stock status.
  Color get color {
    switch (this) {
      case PurchaseOrderStatus.PO_STATUS_DRAFT:
        return AppColors.grey400;
      case PurchaseOrderStatus.PO_STATUS_PENDING:
        return AppColors.orange500;
      case PurchaseOrderStatus.PO_STATUS_ISSUED:
        return AppColors.cobalt;
      case PurchaseOrderStatus.PO_STATUS_CLOSED:
        return AppColors.dartGreen;
      case PurchaseOrderStatus.PO_STATUS_CANCELLED:
        return AppColors.error500;
      default:
        return AppColors.grey0;
    }
  }
}
