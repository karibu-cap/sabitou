import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/global_products/global_products_view.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../goldens.dart';

/// Fake transport for global product data.
final globalProductFakeTransport = FakeTransportBuilder()
    .unary(ProductService.findGlobalProducts, (req, _) async {
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
    .unary(ProductService.createGlobalProduct, (req, _) async {
      return CreateGlobalProductResponse()..success = true;
    })
    .unary(ProductService.updateGlobalProduct, (req, _) async {
      return UpdateGlobalProductResponse()..success = true;
    })
    .unary(ProductService.deleteGlobalProduct, (req, _) async {
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

void main() {
  group('Goldens', () {
    setUp(() {
      GetIt.I.registerSingletonIfAbsent<ConnectRPCService>(
        () => ConnectRPCService.new(clientChannel: globalProductFakeTransport),
      );
    });
    testGoldens('Global products view', (tester) async {
      return await multiScreenMultiLocaleGolden(
        tester,
        const GlobalProductsView(),
        'global_products_view',
      );
    });
  });
}
