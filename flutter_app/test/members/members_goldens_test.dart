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
    .unary(ProductService.findStoreProducts, (req, _) async {
      final request = req;

      return FindStoreProductsResponse(
        products: [
          StoreProduct()
            ..refId = 'product_1'
            ..globalProductId = 'global_product_1'
            ..supplierId = 'supplier_1'
            ..storeId = request.storeId,
          StoreProduct()
            ..refId = 'product_2'
            ..globalProductId = 'global_product_2'
            ..supplierId = 'supplier_1'
            ..storeId = request.storeId,
          StoreProduct()
            ..refId = 'product_3'
            ..globalProductId = 'global_product_3'
            ..supplierId = 'supplier_2'
            ..storeId = request.storeId,
        ],
      );
    })
    .server(ProductService.streamStoreProducts, (req, _) async* {
      final request = req;
      yield StreamStoreProductsResponse()
        ..products.addAll([
          StoreProduct(
            refId: 'product_1',
            globalProductId: 'global_product_1',
            supplierId: 'supplier_1',
            storeId: request.storeId,
            minStockThreshold: 10,
            salePrice: 10000,
            stockQuantity: 20,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
          StoreProduct(
            refId: 'product_2',
            globalProductId: 'global_product_2',
            supplierId: 'supplier_1',
            storeId: request.storeId,
            minStockThreshold: 10,
            salePrice: 15000,
            stockQuantity: 10,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
          StoreProduct(
            refId: 'product_3',
            globalProductId: 'global_product_3',
            supplierId: 'supplier_2',
            storeId: request.storeId,
            minStockThreshold: 10,
            salePrice: 2000,
            stockQuantity: 200,
            imagesLinksIds: ['image_1', 'image_2'],
          ),
          StoreProduct(
            refId: 'product_4',
            globalProductId: 'global_product_4',
            supplierId: 'supplier_3',
            storeId: request.storeId,
            minStockThreshold: 10,
            salePrice: 400,
            stockQuantity: 500,
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
