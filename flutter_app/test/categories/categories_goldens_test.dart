import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/categories/categories_view.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../goldens.dart';

/// Fake transport for category data.
final categoryFakeTransport = FakeTransportBuilder()
    .unary(CategoryService.findCategories, (req, _) async {
      return FindCategoriesResponse()
        ..categories.addAll([
          Category()
            ..refId = 'category_1'
            ..name.en = 'New Category'
            ..name.fr = 'Nouvelle Catégorie'
            ..type = CategoryType.CATEGORY_TYPE_PRODUCT
            ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
          Category()
            ..refId = 'category_2'
            ..name.en = 'New Category 2'
            ..name.fr = 'Nouvelle Catégorie 2'
            ..type = CategoryType.CATEGORY_TYPE_PRODUCT
            ..status = CategoryStatus.CATEGORY_STATUS_INACTIVE,
          Category()
            ..refId = 'category_3'
            ..name.en = 'New Category 3'
            ..name.fr = 'Nouvelle Catégorie 3'
            ..type = CategoryType.CATEGORY_TYPE_PRODUCT
            ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE,
        ]);
    })
    .unary(CategoryService.createCategory, (req, _) async {
      return CreateCategoryResponse();
    })
    .unary(CategoryService.updateCategory, (req, _) async {
      return UpdateCategoryResponse();
    })
    .unary(CategoryService.deleteCategory, (req, _) async {
      return DeleteCategoryResponse();
    })
    .build();

void main() {
  group('Goldens', () {
    setUp(() {
      GetIt.I.registerSingletonIfAbsent<ConnectRPCService>(
        () => ConnectRPCService.new(clientChannel: categoryFakeTransport),
      );
    });
    testGoldens('Categories view', (tester) async {
      return await multiScreenMultiLocaleGolden(
        tester,
        const CategoriesView(),
        'categories_view',
      );
    });
  });
}
