import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../themes/app_colors.dart';

/// The extension for the [StockStatus] enum.
extension StockStatusExtension on StockStatus {
  /// Gets the label for the stock status.
  String? get label {
    switch (this) {
      case StockStatus.STOCK_STATUS_OK:
        return 'OK';
      case StockStatus.STOCK_STATUS_OUT_OF_STOCK:
        return 'Out of Stock';
      case StockStatus.STOCK_STATUS_LOW:
        return 'Low';
      default:
        return null;
    }
  }

  /// Gets the color for the stock status.
  Color get color {
    switch (this) {
      case StockStatus.STOCK_STATUS_OK:
        return AppColors.lightGreen;
      case StockStatus.STOCK_STATUS_OUT_OF_STOCK:
        return AppColors.error500;
      case StockStatus.STOCK_STATUS_LOW:
        return AppColors.orange500;
      default:
        return AppColors.grey0;
    }
  }
}
