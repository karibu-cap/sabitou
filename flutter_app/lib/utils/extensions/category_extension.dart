import 'package:sabitou_rpc/models.dart';

import '../../services/internationalization/internationalization.dart';

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
