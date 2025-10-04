import 'dart:ui';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';

/// The extension for the [StoreCostingMethod] enum.
extension StoreCostingMethodExtension on StoreCostingMethod {
  /// Gets the label for the store costing method.
  String get label {
    switch (this) {
      case StoreCostingMethod.STORE_COSTING_METHOD_AVERAGE:
        return Intls.to.average;
      case StoreCostingMethod.STORE_COSTING_METHOD_FIFO:
        return Intls.to.fifo;
      default:
        return Intls.to.costingMethod;
    }
  }
}

/// The extension for the [ProductStatus] enum.
extension ProductStatusExtension on ProductStatus {
  /// Gets the label for the product status.
  String get label {
    switch (this) {
      case ProductStatus.PRODUCT_STATUS_ACTIVE:
        return Intls.to.active;
      case ProductStatus.PRODUCT_STATUS_INACTIVE:
        return Intls.to.inactive;
      default:
        return Intls.to.status;
    }
  }

  /// Gets the color for the product status.
  Color get color {
    switch (this) {
      case ProductStatus.PRODUCT_STATUS_ACTIVE:
        return AppColors.dartGreen;
      case ProductStatus.PRODUCT_STATUS_INACTIVE:
        return AppColors.error500;
      default:
        return AppColors.grey400;
    }
  }
}
