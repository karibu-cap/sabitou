import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/suppliers/suppliers_view.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../goldens.dart';

/// User fake transport.
final userFakeTransport = FakeTransportBuilder()
  ..unary(UserService.getUser, (req, _) async {
    // Simulate getting different users based on request
    final userId = req.userId;
    final users = {
      'user_1': User()
        ..refId = 'user_1'
        ..firstName = 'Marie'
        ..lastName = 'Martin'
        ..email = 'marie.martin@sabitou.com'
        ..phoneNumber = '696234567'
        ..userName = 'marie.martin'
        ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE,
      'user_2': User()
        ..refId = 'user_2'
        ..firstName = 'Pierre'
        ..lastName = 'Dupont'
        ..email = 'pierre.dupont@sabitou.com'
        ..phoneNumber = '655432109'
        ..userName = 'pierre.dupont'
        ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE,
      'user_3': User()
        ..refId = 'user_3'
        ..firstName = 'Sophie'
        ..lastName = 'Bernard'
        ..email = 'sophie.bernard@sabitou.com'
        ..phoneNumber = '696456789'
        ..userName = 'sophie.bernard'
        ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE,
    };

    // Store member data is managed separately in store_service.dart mocks
    return GetUserResponse()..user = users[userId] ?? users['user_1']!;
  })
  ..unary(UserService.updateMe, (req, _) async {
    return UpdateMeResponse()..user = req.user;
  })
  ..unary(UserService.changePassword, (req, _) async {
    return ChangePasswordResponse()..success = true;
  })
  ..unary(UserService.update, (req, _) async {
    return UpdateResponse(user: req.user);
  })
  // Streaming endpoints
  ..server(UserService.streamUser, (req, _) async* {
    // Simulate streaming user updates
    final userId = req.userId;
    final users = {
      'user_1': User()
        ..refId = 'user_1'
        ..firstName = 'Marie'
        ..lastName = 'Martin'
        ..email = 'marie.martin@sabitou.com'
        ..phoneNumber = '696234567'
        ..userName = 'marie.martin'
        ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE,
      'user_2': User()
        ..refId = 'user_2'
        ..firstName = 'Pierre'
        ..lastName = 'Dupont'
        ..email = 'pierre.dupont@sabitou.com'
        ..phoneNumber = '655432109'
        ..userName = 'pierre.dupont'
        ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE,
      'user_3': User()
        ..refId = 'user_3'
        ..firstName = 'Sophie'
        ..lastName = 'Bernard'
        ..email = 'sophie.bernard@sabitou.com'
        ..phoneNumber = '696456789'
        ..userName = 'sophie.bernard'
        ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE,
      'user_4': User()
        ..refId = 'user_4'
        ..firstName = 'Jean'
        ..lastName = 'Dupont'
        ..email = 'jean.dupont@sabitou.com'
        ..phoneNumber = '696567890'
        ..userName = 'jean.dupont'
        ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE,
    };

    final user = users[userId];
    if (user != null) {
      yield StreamUserResponse()..user = user;
    }
  })
  ..unary(StoreService.removeUserFromStore, (req, _) async {
    return RemoveUserFromStoreResponse();
  })
  ..unary(StoreService.updateStoreMember, (req, _) async {
    // Mock updating store member permissions
    return UpdateStoreMemberResponse()..success = true;
  })
  ..unary(StoreService.setStoreMemberStatus, (req, _) async {
    // Mock setting store member status
    return SetStoreMemberStatusResponse()..success = true;
  })
  ..unary(StoreService.addUserToStore, (req, _) async {
    // Mock adding user to store (invitation)
    return AddUserToStoreResponse()..success = true;
  })
  ..unary(StoreProductService.findGlobalProducts, (req, _) async {
    return FindGlobalProductsResponse(
      products: [
        GlobalProduct()
          ..refId = 'gp_1'
          ..name = (Internationalized()
            ..en = 'Product One'
            ..fr = 'Produit Un')
          ..description = (Internationalized()
            ..en = 'Description One'
            ..fr = 'Description Un')
          ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        GlobalProduct()
          ..refId = 'gp_2'
          ..name = (Internationalized()
            ..en = 'Product Two'
            ..fr = 'Produit Deux')
          ..description = (Internationalized()
            ..en = 'Description Two'
            ..fr = 'Description Deux')
          ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        GlobalProduct()
          ..refId = 'gp_3'
          ..name = (Internationalized()
            ..en = 'Product Three'
            ..fr = 'Produit Trois')
          ..description = (Internationalized()
            ..en = 'Description Three'
            ..fr = 'Description Trois')
          ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
      ],
    );
  })
  ..unary(InventoryService.getResourceInventory, (req, _) async {
    final request = req;

    return GetResourceInventoryResponse(
      items: [
        InventoryLevel()
          ..storeProductId = 'sp_3'
          ..storeId = request.storeId
          ..quantityAvailable = 20.0
          ..quantityReserved = 0.0
          ..batches.add(
            Batch()
              ..documentId = 'batch_1'
              ..productId = 'sp_3'
              ..warehouseId = request.storeId
              ..quantity = 20.0
              ..expirationDate = Timestamp.fromDateTime(
                clock.now().add(const Duration(days: 45)),
              )
              ..receivedAt = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 30)),
              ),
          )
          ..batches.add(
            Batch()
              ..documentId = 'batch_2'
              ..productId = 'sp_3'
              ..warehouseId = request.storeId
              ..quantity = 0.0
              ..expirationDate = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 1)),
              )
              ..status = BatchStatus.BATCH_STATUS_EXPIRED,
          )
          ..lastUpdated = Timestamp.fromDateTime(clock.now()),
      ],
      totalQuantity: 20.0,
      snapshotDate: Timestamp.fromDateTime(clock.now()),
    );
  })
  ..unary(StoreProductService.getProduct, (req, _) async {
    final request = req;

    return GetStoreProductResponse(
      storeProduct: StoreProduct()
        ..refId = request.storeProductId
        ..storeId = 'store_1'
        ..supplierId = 'supplier_1'
        ..globalProductId = 'gp_${request.storeProductId.substring(3)}'
        ..salePrice =
            10000 + int.parse(request.storeProductId.substring(3)) * 5000
        ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
    );
  })
  // Streaming store members
  ..server(StoreService.streamStoreMembers, (req, _) async* {
    final storeMembers = [
      StoreMember()
        ..user = User()
        ..user.refId = 'user_1'
        ..user.firstName = 'Marie'
        ..user.lastName = 'Martin'
        ..user.email = 'marie.martin@sabitou.com'
        ..user.phoneNumber = '696234567'
        ..user.userName = 'marie.martin'
        ..user.accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
        ..storeId = req.storeId
        ..memberSince = Timestamp.fromDateTime(DateTime(2023, 3, 15))
        ..status = StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE
        ..permissions.addAll([
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_INVOICE,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_PRODUCT,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_ORDER,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_PRODUCT,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
        ]),
      StoreMember()
        ..user = User()
        ..user.refId = 'user_2'
        ..user.firstName = 'Pierre'
        ..user.lastName = 'Dupont'
        ..user.email = 'pierre.dupont@sabitou.com'
        ..user.phoneNumber = '655432109'
        ..user.userName = 'pierre.dupont'
        ..user.accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
        ..storeId = req.storeId
        ..memberSince = Timestamp.fromDateTime(DateTime(2023, 5, 20))
        ..status = StoreMemberStatus.STORE_MEMBER_STATUS_PENDING
        ..permissions.addAll([
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_INVOICE,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_PRODUCT,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
          ),
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_ORDER,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_ORDER,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
          ),
        ]),
      StoreMember()
        ..user = User()
        ..user.refId = 'user_3'
        ..user.firstName = 'Sophie'
        ..user.lastName = 'Bernard'
        ..user.email = 'sophie.bernard@sabitou.com'
        ..user.phoneNumber = '696456789'
        ..user.userName = 'sophie.bernard'
        ..user.accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
        ..storeId = req.storeId
        ..memberSince = Timestamp.fromDateTime(DateTime(2023, 8, 10))
        ..status = StoreMemberStatus.STORE_MEMBER_STATUS_BANNED
        ..permissions.addAll([
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_INVOICE,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_STORE,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
        ]),
      StoreMember()
        ..user = User()
        ..user.refId = 'user_4'
        ..user.firstName = 'Jean'
        ..user.lastName = 'Dupont'
        ..user.email = 'jean.dupont@sabitou.com'
        ..user.phoneNumber = '696567890'
        ..user.userName = 'jean.dupont'
        ..user.accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
        ..storeId = req.storeId
        ..memberSince = Timestamp.fromDateTime(DateTime(2023, 10, 5))
        ..status = StoreMemberStatus.STORE_MEMBER_STATUS_BANNED
        ..permissions.addAll([
          StorePermission(
            resourceType: StoreResourceType.STORE_RESOURCE_TYPE_INVOICE,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
        ]),
    ];

    yield StreamStoreMembersResponse()..storeMembers.addAll(storeMembers);
  }).build();

void main() {
  group('Goldens', () {
    setUp(() {
      GetIt.I.registerSingletonIfAbsent<ConnectRPCService>(
        () => ConnectRPCService.new(clientChannel: userFakeTransport.build()),
      );
    });
    testGoldens('Suppliers view', (tester) async {
      return await multiScreenMultiLocaleGolden(
        tester,
        const SuppliersView(),
        'suppliers_view',
      );
    });
  });
}
