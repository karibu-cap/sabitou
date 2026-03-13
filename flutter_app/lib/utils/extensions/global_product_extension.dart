import 'package:sabitou_rpc/models.dart';

import '../../repositories/resource_link_repository.dart';
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

  /// Get the primary image URL for the global product.
  Future<String?> getPrimaryImageUrl() async {
    if (imagesLinksIds.isEmpty) {
      return null;
    }

    try {
      final repository = ResourceLinkRepository.instance;
      final imageUrl = await repository.getPrimaryImageUrl(
        imagesLinksIds.first,
      );

      return imageUrl;
    } catch (e) {
      return null;
    }
  }

  /// Get all image URLs for the global product.
  Future<List<String>> getAllImageUrls() async {
    if (imagesLinksIds.isEmpty) {
      return [];
    }

    try {
      final repository = ResourceLinkRepository.instance;
      final imageUrls = await repository.getImageUrls(imagesLinksIds);

      return imageUrls;
    } catch (e) {
      return [];
    }
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
