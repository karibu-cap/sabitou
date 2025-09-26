import 'package:sabitou_rpc/sabitou_rpc.dart';

/// Auth fake transport.
final authFakeTransport = FakeTransportBuilder()
    .unary(BusinessService.getBusinessMember, (req, __) async {
      return GetBusinessMemberResponse()
        ..businessMember = BusinessMember()
        ..businessMember.user = User()
        ..businessMember.user.refId = 'user_1'
        ..businessMember.user.firstName = 'Marie'
        ..businessMember.user.lastName = 'Martin'
        ..businessMember.user.email = 'marie.martin@sabitou.com'
        ..businessMember.user.phoneNumber = '696234567'
        ..businessMember.user.userName = 'marie.martin'
        ..businessMember.user.accountStatus =
            AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
        ..businessMember.businessId = req.businessId
        ..businessMember.memberSince = Timestamp.fromDateTime(
          DateTime(2023, 3, 15),
        )
        ..businessMember.status =
            BusinessMemberStatus.BUSINESS_MEMBER_STATUS_ACTIVE
        ..businessMember.permissions.addAll([
          BusinessPermission(
            resourceType: BusinessResourceType.BUSINESS_RESOURCE_TYPE_BUSINESS,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
          BusinessPermission(
            resourceType: BusinessResourceType.BUSINESS_RESOURCE_TYPE_MEMBER,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
          BusinessPermission(
            resourceType: BusinessResourceType.BUSINESS_RESOURCE_TYPE_SUPPLIER,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
          BusinessPermission(
            resourceType: BusinessResourceType.BUSINESS_RESOURCE_TYPE_BUSINESS,
            actionType: ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
        ]);
    })
    .unary(AuthService.register, (req, _) async {
      return RegisterResponse()
        ..token = 'mock_token'
        ..refreshToken = 'mock_refresh_token';
    })
    .unary(AuthService.login, (req, _) async {
      return LoginResponse()
        ..token = 'mock_token'
        ..refreshToken = 'mock_refresh_token';
    })
    .unary(UserService.getCurrentUser, (req, _) async {
      return GetCurrentUserResponse()
        ..me = User()
        ..me.accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
        ..me.refId = 'mock_id'
        ..me.firstName = 'mock_first_name'
        ..me.lastName = 'mock_last_name'
        ..me.email = 'mock_email@gmail.com'
        ..me.phoneNumber = '696526541'
        ..me.profileLink = ResourceLink()
        ..me.profileLink.targetUri = 'src/poror.jpg'
        ..me.profileLink.iconUri = 'src/icon_uri.jpg'
        ..me.profileLink.label = 'mock_label'
        ..me.profileLink.info = 'mock_info'
        ..me.profileLink.refId = 'mock_id'
        ..me.userName = 'mock_user_name';
    })
    .unary(BusinessService.getMyBusinesses, (req, __) async {
      return GetMyBusinessesResponse(
        businesses: [
          Business()
            ..refId = 'business_1'
            ..name = 'Business 1'
            ..description = 'Description 1',
        ],
      );
    })
    .unary(StoreService.getBusinessStores, (req, __) async {
      return GetBusinessStoresResponse(
        stores: [
          Store()
            ..refId = 'store_1'
            ..name = 'Store 1'
            ..description = 'Description 1',
        ],
      );
    })
    .unary(StoreService.getStoreMember, (req, __) async {
      return GetStoreMemberResponse()
        ..storeMember = StoreMember()
        ..storeMember.user = User()
        ..storeMember.user.refId = 'user_1'
        ..storeMember.user.firstName = 'Marie'
        ..storeMember.user.lastName = 'Martin'
        ..storeMember.user.email = 'marie.martin@sabitou.com'
        ..storeMember.user.phoneNumber = '696234567'
        ..storeMember.user.userName = 'marie.martin'
        ..storeMember.user.accountStatus =
            AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
        ..storeMember.storeId = req.storeId
        ..storeMember.memberSince = Timestamp.fromDateTime(
          DateTime(2023, 3, 15),
        )
        ..storeMember.status = StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE
        ..storeMember.permissions.addAll([
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
        ]);
    })
    .build();
