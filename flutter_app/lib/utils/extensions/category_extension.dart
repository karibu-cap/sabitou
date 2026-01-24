import 'dart:ui';

import 'package:sabitou_rpc/models.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';

/// The extension for the [ProductCategory] enum.
extension CategoryExtension on Category {
  /// Get the label for the product category.
  String get label {
    if (Intls.to.locale.languageCode == 'en') {
      return name.en;
    }

    if (Intls.to.locale.languageCode == 'fr') {
      return name.fr;
    }

    return name.en;
  }

  /// Get the type for the product category.
  String get typeLabel {
    if (type == CategoryType.CATEGORY_TYPE_BUSINESS) {
      return Intls.to.business;
    }
    if (type == CategoryType.CATEGORY_TYPE_STORE) {
      return Intls.to.store;
    }
    if (type == CategoryType.CATEGORY_TYPE_PRODUCT) {
      return Intls.to.product;
    }

    return '';
  }
}

/// The extension for the [CategoryStatus] enum.
extension CategoryStatusExtension on CategoryStatus {
  /// Gets the label for the product status.
  String get label {
    switch (this) {
      case CategoryStatus.CATEGORY_STATUS_ACTIVE:
        return Intls.to.active;
      case CategoryStatus.CATEGORY_STATUS_INACTIVE:
        return Intls.to.inactive;
      default:
        return Intls.to.status;
    }
  }

  /// Gets the color for the product status.
  Color get color {
    switch (this) {
      case CategoryStatus.CATEGORY_STATUS_ACTIVE:
        return AppColors.success500;
      case CategoryStatus.CATEGORY_STATUS_INACTIVE:
        return AppColors.error500;
      default:
        return AppColors.grey400;
    }
  }

  /// Gets the color for the product status.
  Color get backgroundColor {
    switch (this) {
      case CategoryStatus.CATEGORY_STATUS_ACTIVE:
        return AppColors.success100;
      case CategoryStatus.CATEGORY_STATUS_INACTIVE:
        return AppColors.error100;
      default:
        return AppColors.grey100;
    }
  }
}
