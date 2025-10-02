import 'package:sabitou_rpc/models.dart';

import '../../services/internationalization/internationalization.dart';

/// The extension for the [ProductCategory] enum.
extension GlobalProductExtension on GlobalProduct {
  /// Get the label for the global product.
  String get label {
    if (Intls.to.locale.languageCode == 'en') {
      return name.en;
    }

    if (Intls.to.locale.languageCode == 'fr') {
      return name.fr;
    }

    return name.en;
  }

  /// Get the label for the global product.
  String get descriptionIntl {
    if (Intls.to.locale.languageCode == 'en') {
      return description.en;
    }

    if (Intls.to.locale.languageCode == 'fr') {
      return description.fr;
    }

    return description.en;
  }

  /// Get the description for the global product.
  String get about {
    if (Intls.to.locale.languageCode == 'en') {
      return description.en;
    }

    if (Intls.to.locale.languageCode == 'fr') {
      return description.fr;
    }

    return description.en;
  }
}

/// The extension for the [InvoiceLineItem] class.
extension InvoiceLineItemExtension on InvoiceLineItem {
  /// Get the label for the global product.
  String get label {
    if (Intls.to.locale.languageCode == 'en') {
      return productName.en;
    }

    if (Intls.to.locale.languageCode == 'fr') {
      return productName.fr;
    }

    return productName.en;
  }
}
