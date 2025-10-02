import 'package:sabitou_rpc/sabitou_rpc.dart';

/// Fake transport for sync data.
final syncFakeTransport = FakeTransportBuilder()
    .server(StoreProductService.streamGlobalProducts, (req, _) async* {
      final globalProducts = [
        GlobalProduct()
          ..refId = 'global_product_1'
          ..name = Internationalized(
            en: 'Global Product Alpha',
            fr: 'Produit Global Alpha',
          )
          ..description = Internationalized(
            en: 'Description du produit Alpha',
            fr: 'Description du produit Alpha',
          )
          ..barCodeValue = '1234567890123'
          ..categories.addAll([
            Category()
              ..refId = 'category_1'
              ..name = Internationalized(en: 'Electronics', fr: 'Électronique'),
            Category()
              ..refId = 'category_2'
              ..name = Internationalized(en: 'Smartphones', fr: 'Smartphones'),
          ])
          ..imagesLinksIds.addAll(['image_1', 'image_2']),
        GlobalProduct()
          ..refId = 'global_product_2'
          ..name = Internationalized(
            en: 'Global Product Beta',
            fr: 'Produit Global Beta',
          )
          ..description = Internationalized(
            en: 'Description du produit Beta',
            fr: 'Description du produit Beta',
          )
          ..barCodeValue = '2345678901234'
          ..categories.addAll([
            Category()
              ..refId = 'category_3'
              ..name = Internationalized(
                en: 'Alimentation',
                fr: 'Alimentation',
              ),
          ])
          ..imagesLinksIds.addAll(['image_3']),
      ];

      // Simulate initial data load
      yield StreamGlobalProductsResponse()..products.addAll(globalProducts);

      // Simulate periodic updates every 30 seconds
      await Future.delayed(const Duration(seconds: 30));

      // Add a new product to simulate real-time updates
      final newProduct = GlobalProduct()
        ..refId = 'global_product_3'
        ..name = Internationalized(en: 'New Product', fr: 'Nouveau Produit')
        ..description = Internationalized(
          en: 'Description of the new product',
          fr: 'Description du nouveau produit',
        )
        ..barCodeValue = '3456789012345'
        ..categories.addAll([
          Category()
            ..refId = 'category_4'
            ..name = Internationalized(
              en: 'New Category',
              fr: 'Nouvelle Catégorie',
            ),
        ]);

      yield StreamGlobalProductsResponse()..products.addAll([newProduct]);
    })
    .server(StoreProductService.streamStoreProducts, (req, _) async* {
      final products = [
        StoreProduct()
          ..refId = 'product_1'
          ..globalProductId = 'global_product_1'
          ..storeId = req.storeId
          ..salePrice = 10000,
        StoreProduct()
          ..refId = 'product_2'
          ..globalProductId = 'global_product_2'
          ..storeId = req.storeId
          ..salePrice = 20000,
        StoreProduct()
          ..refId = 'product_3'
          ..globalProductId = 'global_product_3'
          ..storeId = req.storeId
          ..salePrice = 5000,
      ];
      yield StreamStoreProductsResponse()..products.addAll(products);
    })
    .unary(StoreProductService.findStoreProducts, (req, _) {
      return FindStoreProductsResponse()
        ..products.addAll([
          StoreProductWithGlobalProduct(
            storeProduct: StoreProduct()
              ..refId = 'product_1'
              ..globalProductId = 'global_product_1'
              ..storeId = req.storeId
              ..salePrice = 10000,
            globalProduct: GlobalProduct()
              ..refId = 'global_product_1'
              ..name = Internationalized()
              ..name.en = 'Product Alpha'
              ..name.fr = 'Produit Alpha',
          ),
          StoreProductWithGlobalProduct(
            storeProduct: StoreProduct()
              ..refId = 'product_2'
              ..globalProductId = 'global_product_2'
              ..storeId = req.storeId
              ..salePrice = 20000,
            globalProduct: GlobalProduct()
              ..refId = 'global_product_2'
              ..name = Internationalized()
              ..name.en = 'Product Beta'
              ..name.fr = 'Produit Beta',
          ),
          StoreProductWithGlobalProduct(
            storeProduct: StoreProduct()
              ..refId = 'product_3'
              ..globalProductId = 'global_product_3'
              ..storeId = req.storeId
              ..salePrice = 5000,
            globalProduct: GlobalProduct()
              ..refId = 'global_product_3'
              ..name = Internationalized()
              ..name.en = 'Product Gamma'
              ..name.fr = 'Produit Gamma',
          ),
        ]);
    })
    .unary(SyncService.submitSyncOperations, (req, _) {
      return SubmitSyncOperationsResponse()
        ..operationResults.addAll([
          SyncOperationResult()
            ..operationId = req.operations.first.refId
            ..status = SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS,
        ]);
    })
    .build();
