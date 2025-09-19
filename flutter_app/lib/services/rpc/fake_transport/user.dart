import 'package:sabitou_rpc/sabitou_rpc.dart';

/// User fake transport.
final userFakeTransport = FakeTransportBuilder()
    .unary(UserService.getUser, (req, _) async {
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
    .unary(UserService.updateMe, (req, _) async {
      return UpdateMeResponse()..user = req.user;
    })
    .unary(UserService.changePassword, (req, _) async {
      return ChangePasswordResponse()..success = true;
    })
    .unary(UserService.update, (req, _) async {
      return UpdateResponse(user: req.user);
    })
    // Streaming endpoints
    .server(UserService.streamUser, (req, _) async* {
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
    .unary(StoreService.removeUserFromStore, (req, _) async {
      return RemoveUserFromStoreResponse();
    })
    .unary(StoreService.updateStoreMember, (req, _) async {
      // Mock updating store member permissions
      return UpdateStoreMemberResponse()..success = true;
    })
    .unary(StoreService.setStoreMemberStatus, (req, _) async {
      // Mock setting store member status
      return SetStoreMemberStatusResponse()..success = true;
    })
    .unary(StoreService.addUserToStore, (req, _) async {
      // Mock adding user to store (invitation)
      return AddUserToStoreResponse()..success = true;
    })
    // Streaming store members
    .server(StoreService.streamStoreMembers, (req, _) async* {
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
    })
    .build();
