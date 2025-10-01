import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/users/users_view.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../goldens.dart';

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
    .unary(StoreProductService.findProducts, (req, _) async {
      final request = req;

      return FindProductsResponse(
        products: [
          StoreProductWithGlobalProduct(
            storeProduct: StoreProduct()
              ..refId = 'sp_1'
              ..storeId = request.storeId
              ..globalProductId = 'gp_1'
              ..salePrice = 10000
              ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
            globalProduct: GlobalProduct()
              ..refId = 'gp_1'
              ..name = (Internationalized()
                ..en = 'Product One'
                ..fr = 'Produit Un')
              ..description = (Internationalized()
                ..en = 'Description One'
                ..fr = 'Description Un')
              ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
          ),
          StoreProductWithGlobalProduct(
            storeProduct: StoreProduct()
              ..refId = 'sp_2'
              ..storeId = request.storeId
              ..globalProductId = 'gp_2'
              ..salePrice = 15000
              ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
            globalProduct: GlobalProduct()
              ..refId = 'gp_2'
              ..name = (Internationalized()
                ..en = 'Product Two'
                ..fr = 'Produit Deux')
              ..description = (Internationalized()
                ..en = 'Description Two'
                ..fr = 'Description Deux')
              ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
          ),
          StoreProductWithGlobalProduct(
            storeProduct: StoreProduct()
              ..refId = 'sp_3'
              ..storeId = request.storeId
              ..globalProductId = 'gp_3'
              ..salePrice = 20000
              ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
            globalProduct: GlobalProduct()
              ..refId = 'gp_3'
              ..name = (Internationalized()
                ..en = 'Product Three'
                ..fr = 'Produit Trois')
              ..description = (Internationalized()
                ..en = 'Description Three'
                ..fr = 'Description Trois')
              ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
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

void main() {
  group('Goldens', () {
    setUp(() {
      GetIt.I.registerSingletonIfAbsent<ConnectRPCService>(
        () => ConnectRPCService.new(clientChannel: supplierFakeTransport),
      );
    });
    testGoldens('Members view', (tester) async {
      return await multiScreenMultiLocaleGolden(
        tester,
        const UsersView(),
        'members_view',
      );
    });
  });
}
