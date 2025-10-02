import 'package:clock/clock.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

/// Supplier fake transport.
final supplierFakeTransport = FakeTransportBuilder()
    .unary(SupplierService.getStoreSuppliers, (req, _) async {
      return GetStoreSuppliersResponse(
        suppliers: [
          (Supplier()
            ..refId = 'supplier_1'
            ..name = 'Fournisseur Alpha'
            ..contactEmail = 'alpha@example.com'
            ..contactPhone = '696123456'
            ..contactAddress = 'Yaoundé, Cameroun'
            ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE),
          Supplier()
            ..refId = 'supplier_2'
            ..name = 'Fournisseur Beta'
            ..contactEmail = 'beta@example.com'
            ..contactPhone = '696789012'
            ..contactAddress = 'Douala, Cameroun'
            ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
          Supplier()
            ..refId = 'supplier_3'
            ..name = 'Fournisseur Gamma'
            ..contactEmail = 'gamma@example.com'
            ..contactPhone = '696345678'
            ..contactAddress = 'Bafoussam, Cameroun'
            ..status = SupplierStatus.SUPPLIER_STATUS_INACTIVE,
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
        ..supplier.status = SupplierStatus.SUPPLIER_STATUS_ACTIVE;
    })
    .unary(SupplierService.createSupplier, (req, _) async {
      return CreateSupplierResponse()
        ..supplierId = 'new_supplier_${clock.now().millisecondsSinceEpoch}';
    })
    .unary(SupplierService.updateSupplier, (req, _) async {
      final request = req;

      return UpdateSupplierResponse()..supplier = request.supplier;
    })
    .unary(SupplierService.deleteSupplier, (req, _) async {
      return DeleteSupplierResponse()..success = true;
    })
    .server(SupplierService.streamStoreSuppliers, (req, _) async* {
      yield StreamStoreSuppliersResponse()
        ..suppliers.addAll([
          Supplier()
            ..refId = 'supplier_1'
            ..name = 'Fournisseur Alpha (Mis à jour)'
            ..contactEmail = 'alpha@example.com'
            ..contactPhone = '696123456'
            ..contactAddress = 'Yaoundé, Cameroun'
            ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
          Supplier()
            ..refId = 'supplier_2'
            ..name = 'Fournisseur Beta'
            ..contactEmail = 'beta@example.com'
            ..contactPhone = '696789012'
            ..contactAddress = 'Douala, Cameroun'
            ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
          Supplier()
            ..refId = 'supplier_3'
            ..name = 'Nouveau Fournisseur'
            ..contactEmail = 'nouveau@example.com'
            ..contactPhone = '696999999'
            ..contactAddress = 'Bamenda, Cameroun'
            ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
        ]);
    })
    // Product Service fakes
    .unary(StoreProductService.findStoreProducts, (req, _) async {
      final request = req;

      return FindStoreProductsResponse(
        products: [
          StoreProductWithGlobalProduct(
            storeProduct: StoreProduct()
              ..refId = 'product_1'
              ..globalProductId = 'global_product_1'
              ..supplierId = 'supplier_1'
              ..storeId = request.storeId,
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
              ..supplierId = 'supplier_1'
              ..storeId = request.storeId,
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
              ..supplierId = 'supplier_2'
              ..storeId = request.storeId,
            globalProduct: GlobalProduct()
              ..refId = 'global_product_3'
              ..name = Internationalized()
              ..name.en = 'Product Gamma'
              ..name.fr = 'Produit Gamma',
          ),
        ],
      );
    })
    .server(StoreProductService.streamStoreProducts, (req, _) async* {
      final request = req;
      yield StreamStoreProductsResponse()
        ..products.addAll([
          StoreProduct(
            refId: 'product_1',
            globalProductId: 'global_product_1',
            supplierId: 'supplier_1',
            storeId: request.storeId,
            salePrice: 10000,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
          StoreProduct(
            refId: 'product_2',
            globalProductId: 'global_product_2',
            supplierId: 'supplier_1',
            storeId: request.storeId,
            salePrice: 15000,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
          StoreProduct(
            refId: 'product_3',
            globalProductId: 'global_product_3',
            supplierId: 'supplier_2',
            storeId: request.storeId,
            salePrice: 2000,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
          StoreProduct(
            refId: 'product_4',
            globalProductId: 'global_product_4',
            supplierId: 'supplier_3',
            storeId: request.storeId,
            salePrice: 400,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
        ]);
    })
    .build();
