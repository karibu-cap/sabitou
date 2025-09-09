import 'package:sabitou_rpc/sabitou_rpc.dart';

/// Supplier fake transport.
final supplierFakeTransport = FakeTransportBuilder()
    .unary(SupplierService.getBusinessSuppliers, (req, _) async {
      return GetBusinessSuppliersResponse(
        suppliers: [
          (Supplier()
            ..refId = 'supplier_1'
            ..name = 'Fournisseur Alpha'
            ..contactEmail = 'alpha@example.com'
            ..contactPhone = '696123456'
            ..contactAddress = 'Yaoundé, Cameroun'
            ..isActive = true),
          Supplier()
            ..refId = 'supplier_2'
            ..name = 'Fournisseur Beta'
            ..contactEmail = 'beta@example.com'
            ..contactPhone = '696789012'
            ..contactAddress = 'Douala, Cameroun'
            ..isActive = true,
          Supplier()
            ..refId = 'supplier_3'
            ..name = 'Fournisseur Gamma'
            ..contactEmail = 'gamma@example.com'
            ..contactPhone = '696345678'
            ..contactAddress = 'Bafoussam, Cameroun'
            ..isActive = false,
        ],
      );
    })
    .unary(SupplierService.getSupplier, (req, _) async {
      return GetSupplierResponse()
        ..supplier.refId = 'supplier_2'
        ..supplier.name = 'Fournisseur Beta'
        ..supplier.contactEmail = 'beta@example.com'
        ..supplier.contactPhone = '696789012'
        ..supplier.contactAddress = 'Douala, Cameroun'
        ..supplier.isActive = true;
    })
    .unary(SupplierService.createSupplier, (req, _) async {
      return CreateSupplierResponse()
        ..supplierId = 'new_supplier_${DateTime.now().millisecondsSinceEpoch}';
    })
    .unary(SupplierService.updateSupplier, (req, _) async {
      final request = req;

      return UpdateSupplierResponse()..supplier = request.supplier;
    })
    .unary(SupplierService.deleteSupplier, (req, _) async {
      return DeleteSupplierResponse()..success = true;
    })
    .server(SupplierService.streamBusinessSuppliers, (req, _) async* {
      // Simulate initial data
      yield GetBusinessSuppliersResponse()
        ..suppliers.addAll([
          Supplier()
            ..refId = 'supplier_1'
            ..name = 'Fournisseur Alpha'
            ..contactEmail = 'alpha@example.com'
            ..contactPhone = '696123456'
            ..contactAddress = 'Yaoundé, Cameroun'
            ..isActive = true,
          Supplier()
            ..refId = 'supplier_2'
            ..name = 'Fournisseur Beta'
            ..contactEmail = 'beta@example.com'
            ..contactPhone = '696789012'
            ..contactAddress = 'Douala, Cameroun'
            ..isActive = true,
        ]);

      // Simulate periodic updates every 10 seconds
      await Future.delayed(const Duration(seconds: 10));

      yield GetBusinessSuppliersResponse()
        ..suppliers.addAll([
          Supplier()
            ..refId = 'supplier_1'
            ..name = 'Fournisseur Alpha (Mis à jour)'
            ..contactEmail = 'alpha@example.com'
            ..contactPhone = '696123456'
            ..contactAddress = 'Yaoundé, Cameroun'
            ..isActive = true,
          Supplier()
            ..refId = 'supplier_2'
            ..name = 'Fournisseur Beta'
            ..contactEmail = 'beta@example.com'
            ..contactPhone = '696789012'
            ..contactAddress = 'Douala, Cameroun'
            ..isActive = true,
          Supplier()
            ..refId = 'supplier_3'
            ..name = 'Nouveau Fournisseur'
            ..contactEmail = 'nouveau@example.com'
            ..contactPhone = '696999999'
            ..contactAddress = 'Bamenda, Cameroun'
            ..isActive = true,
        ]);
    })
    // Product Service fakes
    .unary(ProductService.findBusinessProducts, (req, _) async {
      final request = req;

      return FindBusinessProductsResponse(
        products: [
          BusinessProduct()
            ..refId = 'product_1'
            ..globalProductId = 'global_product_1'
            ..supplierId = 'supplier_1'
            ..businessId = request.businessId,
          BusinessProduct()
            ..refId = 'product_2'
            ..globalProductId = 'global_product_2'
            ..supplierId = 'supplier_1'
            ..businessId = request.businessId,
          BusinessProduct()
            ..refId = 'product_3'
            ..globalProductId = 'global_product_3'
            ..supplierId = 'supplier_2'
            ..businessId = request.businessId,
        ],
      );
    })
    .server(ProductService.streamBusinessProducts, (req, _) async* {
      final request = req;

      // Simulate initial products data
      yield StreamBusinessProductsResponse()
        ..products.addAll([
          BusinessProduct(
            refId: 'product_1',
            globalProductId: 'global_product_1',
            supplierId: 'supplier_1',
            businessId: request.businessId,
            minStockThreshold: 10,
            priceInXaf: 10000,
            stockQuantity: 20,
            imagesLinkIds: ['image_1', 'image_2'],
          ),
          BusinessProduct(
            refId: 'product_2',
            globalProductId: 'global_product_2',
            supplierId: 'supplier_1',
            businessId: request.businessId,
            minStockThreshold: 10,
            priceInXaf: 20000,
            stockQuantity: 50,
            imagesLinkIds: ['image_1', 'image_2'],
          ),
          BusinessProduct(
            refId: 'product_3',
            globalProductId: 'global_product_3',
            supplierId: 'supplier_2',
            businessId: request.businessId,
            minStockThreshold: 5,
            priceInXaf: 5000,
            stockQuantity: 5,
            imagesLinkIds: ['image_1', 'image_2'],
          ),
        ]);

      // Simulate periodic updates every 15 seconds
      await Future.delayed(const Duration(seconds: 15));

      yield StreamBusinessProductsResponse()
        ..products.addAll([
          BusinessProduct(
            refId: 'product_1',
            globalProductId: 'global_product_1',
            supplierId: 'supplier_1',
            businessId: request.businessId,
            minStockThreshold: 10,
            priceInXaf: 10000,
            stockQuantity: 20,
            imagesLinkIds: ['image_1', 'image_2'],
          ),
          BusinessProduct(
            refId: 'product_2',
            globalProductId: 'global_product_2',
            supplierId: 'supplier_1',
            businessId: request.businessId,
            minStockThreshold: 10,
            priceInXaf: 15000,
            stockQuantity: 10,
            imagesLinkIds: ['image_1', 'image_2'],
          ),
          BusinessProduct(
            refId: 'product_3',
            globalProductId: 'global_product_3',
            supplierId: 'supplier_2',
            businessId: request.businessId,
            minStockThreshold: 10,
            priceInXaf: 2000,
            stockQuantity: 200,
            imagesLinkIds: ['image_1', 'image_2'],
          ),
          BusinessProduct(
            refId: 'product_4',
            globalProductId: 'global_product_4',
            supplierId: 'supplier_3',
            businessId: request.businessId,
            minStockThreshold: 10,
            priceInXaf: 400,
            stockQuantity: 500,
            imagesLinkIds: ['image_1', 'image_2'],
          ),
        ]);
    })
    .build();
