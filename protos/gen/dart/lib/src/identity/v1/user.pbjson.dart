// This is a generated file - do not edit.
//
// Generated from identity/v1/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../link/v1/link.pbjson.dart' as $0;

@$core.Deprecated('Use accountStatusTypeDescriptor instead')
const AccountStatusType$json = {
  '1': 'AccountStatusType',
  '2': [
    {'1': 'ACCOUNT_STATUS_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'ACCOUNT_STATUS_TYPE_ACTIVE', '2': 1},
    {'1': 'ACCOUNT_STATUS_TYPE_DELETED', '2': 2},
  ],
};

/// Descriptor for `AccountStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List accountStatusTypeDescriptor = $convert.base64Decode(
    'ChFBY2NvdW50U3RhdHVzVHlwZRIjCh9BQ0NPVU5UX1NUQVRVU19UWVBFX1VOU1BFQ0lGSUVEEA'
    'ASHgoaQUNDT1VOVF9TVEFUVVNfVFlQRV9BQ1RJVkUQARIfChtBQ0NPVU5UX1NUQVRVU19UWVBF'
    'X0RFTEVURUQQAg==');

@$core.Deprecated('Use accountTypeDescriptor instead')
const AccountType$json = {
  '1': 'AccountType',
  '2': [
    {'1': 'ADMIN', '2': 0},
    {'1': 'USER', '2': 1},
  ],
};

/// Descriptor for `AccountType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List accountTypeDescriptor =
    $convert.base64Decode('CgtBY2NvdW50VHlwZRIJCgVBRE1JThAAEggKBFVTRVIQAQ==');

@$core.Deprecated('Use authActionTypeDescriptor instead')
const AuthActionType$json = {
  '1': 'AuthActionType',
  '2': [
    {'1': 'AUTH_ACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'AUTH_ACTION_TYPE_VERIFY_EMAIL', '2': 1},
    {'1': 'AUTH_ACTION_TYPE_VERIFY_PHONE_NUMBER', '2': 2},
    {'1': 'AUTH_ACTION_TYPE_INITIALIZE_PASSWORD', '2': 3},
    {'1': 'AUTH_ACTION_TYPE_RESET_PASSWORD', '2': 4},
  ],
};

/// Descriptor for `AuthActionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List authActionTypeDescriptor = $convert.base64Decode(
    'Cg5BdXRoQWN0aW9uVHlwZRIgChxBVVRIX0FDVElPTl9UWVBFX1VOU1BFQ0lGSUVEEAASIQodQV'
    'VUSF9BQ1RJT05fVFlQRV9WRVJJRllfRU1BSUwQARIoCiRBVVRIX0FDVElPTl9UWVBFX1ZFUklG'
    'WV9QSE9ORV9OVU1CRVIQAhIoCiRBVVRIX0FDVElPTl9UWVBFX0lOSVRJQUxJWkVfUEFTU1dPUk'
    'QQAxIjCh9BVVRIX0FDVElPTl9UWVBFX1JFU0VUX1BBU1NXT1JEEAQ=');

@$core.Deprecated('Use providerTypeDescriptor instead')
const ProviderType$json = {
  '1': 'ProviderType',
  '2': [
    {'1': 'PROVIDER_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'PROVIDER_TYPE_FIREBASE_EMAIL', '2': 1},
    {'1': 'PROVIDER_TYPE_GOOGLE', '2': 2},
    {'1': 'PROVIDER_TYPE_INTERNAL_BUSINESS_AUTH', '2': 3},
  ],
};

/// Descriptor for `ProviderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List providerTypeDescriptor = $convert.base64Decode(
    'CgxQcm92aWRlclR5cGUSHQoZUFJPVklERVJfVFlQRV9VTlNQRUNJRklFRBAAEiAKHFBST1ZJRE'
    'VSX1RZUEVfRklSRUJBU0VfRU1BSUwQARIYChRQUk9WSURFUl9UWVBFX0dPT0dMRRACEigKJFBS'
    'T1ZJREVSX1RZUEVfSU5URVJOQUxfQlVTSU5FU1NfQVVUSBAD');

@$core.Deprecated('Use connectedAccountDescriptor instead')
const ConnectedAccount$json = {
  '1': 'ConnectedAccount',
  '2': [
    {
      '1': 'provider',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ProviderType',
      '10': 'provider'
    },
    {'1': 'raw_data', '3': 3, '4': 1, '5': 9, '10': 'rawData'},
  ],
};

/// Descriptor for `ConnectedAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectedAccountDescriptor = $convert.base64Decode(
    'ChBDb25uZWN0ZWRBY2NvdW50EjUKCHByb3ZpZGVyGAEgASgOMhkuaWRlbnRpdHkudjEuUHJvdm'
    'lkZXJUeXBlUghwcm92aWRlchIZCghyYXdfZGF0YRgDIAEoCVIHcmF3RGF0YQ==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    {
      '1': 'connected_accounts',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.ConnectedAccount',
      '10': 'connectedAccounts'
    },
    {
      '1': 'email',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'email',
      '17': true
    },
    {
      '1': 'phone_number',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'phoneNumber',
      '17': true
    },
    {
      '1': 'first_name',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'firstName',
      '17': true
    },
    {
      '1': 'last_name',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'lastName',
      '17': true
    },
    {
      '1': 'profile_link',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.link.v1.ResourceLink',
      '9': 5,
      '10': 'profileLink',
      '17': true
    },
    {
      '1': 'account_status',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.AccountStatusType',
      '9': 6,
      '10': 'accountStatus',
      '17': true
    },
    {
      '1': 'account_type',
      '3': 10,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.AccountType',
      '10': 'accountType'
    },
    {
      '1': 'required_actions',
      '3': 11,
      '4': 3,
      '5': 14,
      '6': '.identity.v1.AuthActionType',
      '10': 'requiredActions'
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_email'},
    {'1': '_phone_number'},
    {'1': '_first_name'},
    {'1': '_last_name'},
    {'1': '_profile_link'},
    {'1': '_account_status'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhoKBnJlZl9pZBgBIAEoCUgAUgVyZWZJZIgBARIbCgl1c2VyX25hbWUYAiABKAlSCH'
    'VzZXJOYW1lEkwKEmNvbm5lY3RlZF9hY2NvdW50cxgDIAMoCzIdLmlkZW50aXR5LnYxLkNvbm5l'
    'Y3RlZEFjY291bnRSEWNvbm5lY3RlZEFjY291bnRzEiUKBWVtYWlsGAQgASgJQgq6SAfYAQFyAm'
    'ABSAFSBWVtYWlsiAEBEiYKDHBob25lX251bWJlchgFIAEoCUgCUgtwaG9uZU51bWJlcogBARIi'
    'CgpmaXJzdF9uYW1lGAYgASgJSANSCWZpcnN0TmFtZYgBARIgCglsYXN0X25hbWUYByABKAlIBF'
    'IIbGFzdE5hbWWIAQESPQoMcHJvZmlsZV9saW5rGAggASgLMhUubGluay52MS5SZXNvdXJjZUxp'
    'bmtIBVILcHJvZmlsZUxpbmuIAQESSgoOYWNjb3VudF9zdGF0dXMYCSABKA4yHi5pZGVudGl0eS'
    '52MS5BY2NvdW50U3RhdHVzVHlwZUgGUg1hY2NvdW50U3RhdHVziAEBEjsKDGFjY291bnRfdHlw'
    'ZRgKIAEoDjIYLmlkZW50aXR5LnYxLkFjY291bnRUeXBlUgthY2NvdW50VHlwZRJGChByZXF1aX'
    'JlZF9hY3Rpb25zGAsgAygOMhsuaWRlbnRpdHkudjEuQXV0aEFjdGlvblR5cGVSD3JlcXVpcmVk'
    'QWN0aW9uc0IJCgdfcmVmX2lkQggKBl9lbWFpbEIPCg1fcGhvbmVfbnVtYmVyQg0KC19maXJzdF'
    '9uYW1lQgwKCl9sYXN0X25hbWVCDwoNX3Byb2ZpbGVfbGlua0IRCg9fYWNjb3VudF9zdGF0dXM=');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIjCgd1c2VyX2lkGAEgASgJQgq6SAfIAQFyAhADUgZ1c2VySWQ=');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.User',
      '10': 'user'
    },
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USJQoEdXNlchgBIAEoCzIRLmlkZW50aXR5LnYxLlVzZXJSBHVzZX'
    'I=');

@$core.Deprecated('Use updateMeRequestDescriptor instead')
const UpdateMeRequest$json = {
  '1': 'UpdateMeRequest',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.User',
      '10': 'user'
    },
  ],
};

/// Descriptor for `UpdateMeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMeRequestDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVNZVJlcXVlc3QSJQoEdXNlchgBIAEoCzIRLmlkZW50aXR5LnYxLlVzZXJSBHVzZX'
    'I=');

@$core.Deprecated('Use updateMeResponseDescriptor instead')
const UpdateMeResponse$json = {
  '1': 'UpdateMeResponse',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.User',
      '10': 'user'
    },
  ],
};

/// Descriptor for `UpdateMeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMeResponseDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVNZVJlc3BvbnNlEiUKBHVzZXIYASABKAsyES5pZGVudGl0eS52MS5Vc2VyUgR1c2'
    'Vy');

@$core.Deprecated('Use requestDeleteUserRequestDescriptor instead')
const RequestDeleteUserRequest$json = {
  '1': 'RequestDeleteUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RequestDeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeleteUserRequestDescriptor =
    $convert.base64Decode(
        'ChhSZXF1ZXN0RGVsZXRlVXNlclJlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyAEBcgIQA1'
        'IGdXNlcklkEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use requestDeleteUserResponseDescriptor instead')
const RequestDeleteUserResponse$json = {
  '1': 'RequestDeleteUserResponse',
  '2': [
    {'1': 'request_token', '3': 1, '4': 1, '5': 9, '10': 'requestToken'},
  ],
};

/// Descriptor for `RequestDeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeleteUserResponseDescriptor =
    $convert.base64Decode(
        'ChlSZXF1ZXN0RGVsZXRlVXNlclJlc3BvbnNlEiMKDXJlcXVlc3RfdG9rZW4YASABKAlSDHJlcX'
        'Vlc3RUb2tlbg==');

@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = {
  '1': 'DeleteUserRequest',
  '2': [
    {'1': 'request_token', '3': 1, '4': 1, '5': 9, '10': 'requestToken'},
    {
      '1': 'verification_code',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'verificationCode'
    },
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVc2VyUmVxdWVzdBIjCg1yZXF1ZXN0X3Rva2VuGAEgASgJUgxyZXF1ZXN0VG9rZW'
    '4SKwoRdmVyaWZpY2F0aW9uX2NvZGUYAiABKAlSEHZlcmlmaWNhdGlvbkNvZGU=');

@$core.Deprecated('Use deleteUserResponseDescriptor instead')
const DeleteUserResponse$json = {
  '1': 'DeleteUserResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserResponseDescriptor =
    $convert.base64Decode(
        'ChJEZWxldGVVc2VyUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use changePasswordRequestDescriptor instead')
const ChangePasswordRequest$json = {
  '1': 'ChangePasswordRequest',
  '2': [
    {'1': 'old_password', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'oldPassword'},
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'newPassword'},
  ],
};

/// Descriptor for `ChangePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordRequestDescriptor = $convert.base64Decode(
    'ChVDaGFuZ2VQYXNzd29yZFJlcXVlc3QSLAoMb2xkX3Bhc3N3b3JkGAEgASgJQgm6SAZyBBAIGC'
    'BSC29sZFBhc3N3b3JkEiwKDG5ld19wYXNzd29yZBgCIAEoCUIJukgGcgQQCBggUgtuZXdQYXNz'
    'd29yZA==');

@$core.Deprecated('Use changePasswordResponseDescriptor instead')
const ChangePasswordResponse$json = {
  '1': 'ChangePasswordResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ChangePasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordResponseDescriptor =
    $convert.base64Decode(
        'ChZDaGFuZ2VQYXNzd29yZFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use getMeRequestDescriptor instead')
const GetMeRequest$json = {
  '1': 'GetMeRequest',
};

/// Descriptor for `GetMeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeRequestDescriptor =
    $convert.base64Decode('CgxHZXRNZVJlcXVlc3Q=');

@$core.Deprecated('Use getMeResponseDescriptor instead')
const GetMeResponse$json = {
  '1': 'GetMeResponse',
  '2': [
    {'1': 'me', '3': 1, '4': 1, '5': 11, '6': '.identity.v1.User', '10': 'me'},
  ],
};

/// Descriptor for `GetMeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeResponseDescriptor = $convert.base64Decode(
    'Cg1HZXRNZVJlc3BvbnNlEiEKAm1lGAEgASgLMhEuaWRlbnRpdHkudjEuVXNlclICbWU=');

const $core.Map<$core.String, $core.dynamic> UserServiceBase$json = {
  '1': 'UserService',
  '2': [
    {
      '1': 'GetMe',
      '2': '.identity.v1.GetMeRequest',
      '3': '.identity.v1.GetMeResponse',
      '4': {}
    },
    {
      '1': 'GetUser',
      '2': '.identity.v1.GetUserRequest',
      '3': '.identity.v1.GetUserResponse',
      '4': {}
    },
    {
      '1': 'UpdateMe',
      '2': '.identity.v1.UpdateMeRequest',
      '3': '.identity.v1.UpdateMeResponse',
      '4': {}
    },
    {
      '1': 'RequestDeleteUser',
      '2': '.identity.v1.RequestDeleteUserRequest',
      '3': '.identity.v1.RequestDeleteUserResponse',
      '4': {}
    },
    {
      '1': 'DeleteUser',
      '2': '.identity.v1.DeleteUserRequest',
      '3': '.identity.v1.DeleteUserResponse',
      '4': {}
    },
    {
      '1': 'ChangePassword',
      '2': '.identity.v1.ChangePasswordRequest',
      '3': '.identity.v1.ChangePasswordResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use userServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    UserServiceBase$messageJson = {
  '.identity.v1.GetMeRequest': GetMeRequest$json,
  '.identity.v1.GetMeResponse': GetMeResponse$json,
  '.identity.v1.User': User$json,
  '.identity.v1.ConnectedAccount': ConnectedAccount$json,
  '.link.v1.ResourceLink': $0.ResourceLink$json,
  '.identity.v1.GetUserRequest': GetUserRequest$json,
  '.identity.v1.GetUserResponse': GetUserResponse$json,
  '.identity.v1.UpdateMeRequest': UpdateMeRequest$json,
  '.identity.v1.UpdateMeResponse': UpdateMeResponse$json,
  '.identity.v1.RequestDeleteUserRequest': RequestDeleteUserRequest$json,
  '.identity.v1.RequestDeleteUserResponse': RequestDeleteUserResponse$json,
  '.identity.v1.DeleteUserRequest': DeleteUserRequest$json,
  '.identity.v1.DeleteUserResponse': DeleteUserResponse$json,
  '.identity.v1.ChangePasswordRequest': ChangePasswordRequest$json,
  '.identity.v1.ChangePasswordResponse': ChangePasswordResponse$json,
};

/// Descriptor for `UserService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List userServiceDescriptor = $convert.base64Decode(
    'CgtVc2VyU2VydmljZRJACgVHZXRNZRIZLmlkZW50aXR5LnYxLkdldE1lUmVxdWVzdBoaLmlkZW'
    '50aXR5LnYxLkdldE1lUmVzcG9uc2UiABJGCgdHZXRVc2VyEhsuaWRlbnRpdHkudjEuR2V0VXNl'
    'clJlcXVlc3QaHC5pZGVudGl0eS52MS5HZXRVc2VyUmVzcG9uc2UiABJJCghVcGRhdGVNZRIcLm'
    'lkZW50aXR5LnYxLlVwZGF0ZU1lUmVxdWVzdBodLmlkZW50aXR5LnYxLlVwZGF0ZU1lUmVzcG9u'
    'c2UiABJkChFSZXF1ZXN0RGVsZXRlVXNlchIlLmlkZW50aXR5LnYxLlJlcXVlc3REZWxldGVVc2'
    'VyUmVxdWVzdBomLmlkZW50aXR5LnYxLlJlcXVlc3REZWxldGVVc2VyUmVzcG9uc2UiABJPCgpE'
    'ZWxldGVVc2VyEh4uaWRlbnRpdHkudjEuRGVsZXRlVXNlclJlcXVlc3QaHy5pZGVudGl0eS52MS'
    '5EZWxldGVVc2VyUmVzcG9uc2UiABJbCg5DaGFuZ2VQYXNzd29yZBIiLmlkZW50aXR5LnYxLkNo'
    'YW5nZVBhc3N3b3JkUmVxdWVzdBojLmlkZW50aXR5LnYxLkNoYW5nZVBhc3N3b3JkUmVzcG9uc2'
    'UiAA==');
