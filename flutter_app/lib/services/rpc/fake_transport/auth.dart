import 'package:sabitou_rpc/sabitou_rpc.dart';

/// Auth fake transport.
final authFakeTransport = FakeTransportBuilder()
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
    .build();
