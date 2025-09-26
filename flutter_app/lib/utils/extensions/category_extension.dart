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
}
