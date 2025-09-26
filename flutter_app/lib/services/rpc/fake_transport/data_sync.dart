import 'package:sabitou_rpc/sabitou_rpc.dart';

/// Fake transport for sync data.
final syncFakeTransport = FakeTransportBuilder()
    .server(ProductService.streamGlobalProducts, (req, _) async* {
      final globalProducts = {
        GlobalProduct()
          ..refId = 'global_product_1'
          ..name.en = 'Global Product Alpha'
          ..name.fr = 'Produit Global Alpha'
          ..description.en = 'Description du produit Alpha'
          ..description.fr = 'Description du produit Alpha'
          ..barCodeValue = '1234567890123'
          ..categories.addAll([
            Category()
              ..refId = 'category_1'
              ..name.en = 'Electronics'
              ..name.fr = 'Électronique',
            Category()
              ..refId = 'category_2'
              ..name.en = 'Smartphones'
              ..name.fr = 'Smartphones',
          ])
          ..imagesLinksIds.addAll(['image_1', 'image_2']),
        GlobalProduct()
          ..refId = 'global_product_2'
          ..name.en = 'Global Product Beta'
          ..name.fr = 'Produit Global Beta'
          ..description.en = 'Description du produit Beta'
          ..description.fr = 'Description du produit Beta'
          ..barCodeValue = '2345678901234'
          ..categories.addAll([
            Category()
              ..refId = 'category_3'
              ..name.en = 'Alimentation'
              ..name.fr = 'Alimentation',
          ])
          ..imagesLinksIds.addAll(['image_3']),
      };

      // Simulate initial data load
      yield StreamGlobalProductsResponse()..products.addAll(globalProducts);

      // Simulate periodic updates every 30 seconds
      await Future.delayed(const Duration(seconds: 30));

      // Add a new product to simulate real-time updates
      final newProduct = GlobalProduct()
        ..refId = 'global_product_3'
        ..name.en = 'New Product'
        ..name.fr = 'Nouveau Produit'
        ..description.en = 'Description of the new product'
        ..description.fr = 'Description du nouveau produit'
        ..barCodeValue = '3456789012345'
        ..categories.addAll([
          Category()
            ..refId = 'category_4'
            ..name.en = 'New Category'
            ..name.fr = 'Nouvelle Catégorie',
        ]);

      yield StreamGlobalProductsResponse()..products.addAll([newProduct]);
    })
    .server(ProductService.streamStoreProducts, (req, _) async* {
      final products = {
        StoreProduct(
          refId: 'product_1',
          globalProductId: 'global_product_1',
          storeId: req.storeId,
          minStockThreshold: 10,
          salePrice: 10000,
          stockQuantity: 20,
          imagesLinksIds: ['image_1', 'image_2'],
        ),
        StoreProduct(
          refId: 'product_2',
          globalProductId: 'global_product_2',
          storeId: req.storeId,
          minStockThreshold: 10,
          salePrice: 20000,
          stockQuantity: 50,
          imagesLinksIds: ['image_1', 'image_2'],
        ),
        StoreProduct(
          refId: 'product_3',
          globalProductId: 'global_product_3',
          storeId: req.storeId,
          minStockThreshold: 5,
          salePrice: 5000,
          stockQuantity: 5,
          imagesLinksIds: ['image_1', 'image_2'],
        ),
      };
      yield StreamStoreProductsResponse()..products.addAll(products);
    })
    .unary(ProductService.findStoreProducts, (req, _) {
      return FindStoreProductsResponse()
        ..products.addAll([
          StoreProduct(
            refId: 'product_1',
            globalProductId: 'global_product_1',
            storeId: req.storeId,
            minStockThreshold: 10,
            salePrice: 10000,
            stockQuantity: 20,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
          StoreProduct(
            refId: 'product_2',
            globalProductId: 'global_product_2',
            storeId: req.storeId,
            minStockThreshold: 10,
            salePrice: 20000,
            stockQuantity: 50,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
          StoreProduct(
            refId: 'product_3',
            globalProductId: 'global_product_3',
            storeId: req.storeId,
            minStockThreshold: 5,
            salePrice: 5000,
            stockQuantity: 5,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
        ]);
    })
    .unary(OrderService.createOrder, (req, _) {
      return CreateOrderResponse()..orderId = req.order.refId;
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
