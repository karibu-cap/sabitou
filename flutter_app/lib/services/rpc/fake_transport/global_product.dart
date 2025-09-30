import 'package:sabitou_rpc/sabitou_rpc.dart';

/// Fake transport for global product data.
final globalProductFakeTransport = FakeTransportBuilder()
    .unary(StoreProductService.findGlobalProducts, (req, _) async {
      return FindGlobalProductsResponse()
        ..products.addAll([
          GlobalProduct()
            ..refId = 'category_1'
            ..name = Internationalized()
            ..name.en = 'New Category'
            ..name.fr = 'Nouvelle Catégorie'
            ..description = Internationalized()
            ..description.en = 'New Category description'
            ..description.fr = 'Nouvelle Catégorie description'
            ..categories.addAll([
              Category()
                ..refId = 'category_1'
                ..name = Internationalized()
                ..name.en = 'New Category'
                ..name.fr = 'Nouvelle Catégorie'
                ..type = CategoryType.CATEGORY_TYPE_PRODUCT
                ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
              Category()
                ..refId = 'category_2'
                ..name = Internationalized()
                ..name.en = 'New Category 2'
                ..name.fr = 'Nouvelle Catégorie 2'
                ..type = CategoryType.CATEGORY_TYPE_PRODUCT
                ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
              Category()
                ..refId = 'category_3'
                ..name = Internationalized()
                ..name.en = 'New Category 3'
                ..name.fr = 'Nouvelle Catégorie 3'
                ..type = CategoryType.CATEGORY_TYPE_PRODUCT
                ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
            ])
            ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
          GlobalProduct()
            ..refId = 'category_2'
            ..name = Internationalized()
            ..name.en = 'New Category 2'
            ..name.fr = 'Nouvelle Catégorie 2'
            ..description = Internationalized()
            ..description.en = 'New Category description 2'
            ..description.fr = 'Nouvelle Catégorie description 2'
            ..categories.addAll([
              Category()
                ..refId = 'category_2'
                ..name = Internationalized()
                ..name.en = 'New Category 2'
                ..name.fr = 'Nouvelle Catégorie 2'
                ..type = CategoryType.CATEGORY_TYPE_PRODUCT
                ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
            ])
            ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_INACTIVE,
          GlobalProduct()
            ..refId = 'category_3'
            ..name = Internationalized()
            ..name.en = 'New Category 3'
            ..name.fr = 'Nouvelle Catégorie 3'
            ..description = Internationalized()
            ..description.en = 'New Category description 3'
            ..description.fr = 'Nouvelle Catégorie description 3'
            ..categories.addAll([
              Category()
                ..refId = 'category_3'
                ..name = Internationalized()
                ..name.en = 'New Category 3'
                ..name.fr = 'Nouvelle Catégorie 3'
                ..type = CategoryType.CATEGORY_TYPE_PRODUCT
                ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
            ])
            ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        ]);
    })
    .unary(StoreProductService.createGlobalProduct, (req, _) async {
      return CreateGlobalProductResponse()..success = true;
    })
    .unary(StoreProductService.updateGlobalProduct, (req, _) async {
      return UpdateGlobalProductResponse()..success = true;
    })
    .unary(StoreProductService.deleteGlobalProduct, (req, _) async {
      return DeleteGlobalProductResponse()..success = true;
    })
    .unary(CategoryService.findCategories, (req, _) async {
      return FindCategoriesResponse()
        ..categories.addAll([
          Category()
            ..refId = 'category_1'
            ..name = Internationalized()
            ..name.en = 'New Category'
            ..name.fr = 'Nouvelle Catégorie'
            ..type = CategoryType.CATEGORY_TYPE_PRODUCT
            ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
          Category()
            ..refId = 'category_2'
            ..name = Internationalized()
            ..name.en = 'New Category 2'
            ..name.fr = 'Nouvelle Catégorie 2'
            ..type = CategoryType.CATEGORY_TYPE_PRODUCT
            ..status = CategoryStatus.CATEGORY_STATUS_INACTIVE,
          Category()
            ..refId = 'category_3'
            ..name = Internationalized()
            ..name.en = 'New Category 3'
            ..name.fr = 'Nouvelle Catégorie 3'
            ..type = CategoryType.CATEGORY_TYPE_PRODUCT
            ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
          Category()
            ..refId = 'category_4'
            ..name = Internationalized()
            ..name.en = 'New Category 4'
            ..name.fr = 'Nouvelle Catégorie 4'
            ..type = CategoryType.CATEGORY_TYPE_PRODUCT
            ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
        ]);
    })
    .build();
