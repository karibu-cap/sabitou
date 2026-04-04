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

import '../../google/protobuf/timestamp.pbjson.dart' as $1;
import '../../link/v1/link.pbjson.dart' as $0;
import 'permission.pbjson.dart' as $2;

@$core.Deprecated('Use accountStatusTypeDescriptor instead')
const AccountStatusType$json = {
  '1': 'AccountStatusType',
  '2': [
    {'1': 'ACCOUNT_STATUS_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'ACCOUNT_STATUS_TYPE_ACTIVE', '2': 1},
    {'1': 'ACCOUNT_STATUS_TYPE_DELETED', '2': 2},
    {'1': 'ACCOUNT_STATUS_TYPE_PENDING', '2': 3},
  ],
};

/// Descriptor for `AccountStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List accountStatusTypeDescriptor = $convert.base64Decode(
    'ChFBY2NvdW50U3RhdHVzVHlwZRIjCh9BQ0NPVU5UX1NUQVRVU19UWVBFX1VOU1BFQ0lGSUVEEA'
    'ASHgoaQUNDT1VOVF9TVEFUVVNfVFlQRV9BQ1RJVkUQARIfChtBQ0NPVU5UX1NUQVRVU19UWVBF'
    'X0RFTEVURUQQAhIfChtBQ0NPVU5UX1NUQVRVU19UWVBFX1BFTkRJTkcQAw==');

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

@$core.Deprecated('Use invitationStatusDescriptor instead')
const InvitationStatus$json = {
  '1': 'InvitationStatus',
  '2': [
    {'1': 'INVITATION_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'INVITATION_STATUS_PENDING', '2': 1},
    {'1': 'INVITATION_STATUS_ACCEPTED', '2': 2},
    {'1': 'INVITATION_STATUS_REJECTED', '2': 3},
    {'1': 'INVITATION_STATUS_EXPIRED', '2': 4},
    {'1': 'INVITATION_STATUS_CANCELLED', '2': 5},
  ],
};

/// Descriptor for `InvitationStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List invitationStatusDescriptor = $convert.base64Decode(
    'ChBJbnZpdGF0aW9uU3RhdHVzEiEKHUlOVklUQVRJT05fU1RBVFVTX1VOU1BFQ0lGSUVEEAASHQ'
    'oZSU5WSVRBVElPTl9TVEFUVVNfUEVORElORxABEh4KGklOVklUQVRJT05fU1RBVFVTX0FDQ0VQ'
    'VEVEEAISHgoaSU5WSVRBVElPTl9TVEFUVVNfUkVKRUNURUQQAxIdChlJTlZJVEFUSU9OX1NUQV'
    'RVU19FWFBJUkVEEAQSHwobSU5WSVRBVElPTl9TVEFUVVNfQ0FOQ0VMTEVEEAU=');

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
      '1': 'required_actions',
      '3': 10,
      '4': 3,
      '5': 14,
      '6': '.identity.v1.AuthActionType',
      '10': 'requiredActions'
    },
    {
      '1': 'active_business_id',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 7,
      '10': 'activeBusinessId',
      '17': true
    },
    {
      '1': 'active_store_id',
      '3': 12,
      '4': 1,
      '5': 9,
      '9': 8,
      '10': 'activeStoreId',
      '17': true
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
    {'1': '_active_business_id'},
    {'1': '_active_store_id'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhoKBnJlZl9pZBgBIAEoCUgAUgVyZWZJZIgBARIbCgl1c2VyX25hbWUYAiABKAlSCH'
    'VzZXJOYW1lEkwKEmNvbm5lY3RlZF9hY2NvdW50cxgDIAMoCzIdLmlkZW50aXR5LnYxLkNvbm5l'
    'Y3RlZEFjY291bnRSEWNvbm5lY3RlZEFjY291bnRzEiUKBWVtYWlsGAQgASgJQgq6SAfIAQByAm'
    'ABSAFSBWVtYWlsiAEBEiYKDHBob25lX251bWJlchgFIAEoCUgCUgtwaG9uZU51bWJlcogBARIi'
    'CgpmaXJzdF9uYW1lGAYgASgJSANSCWZpcnN0TmFtZYgBARIgCglsYXN0X25hbWUYByABKAlIBF'
    'IIbGFzdE5hbWWIAQESPQoMcHJvZmlsZV9saW5rGAggASgLMhUubGluay52MS5SZXNvdXJjZUxp'
    'bmtIBVILcHJvZmlsZUxpbmuIAQESSgoOYWNjb3VudF9zdGF0dXMYCSABKA4yHi5pZGVudGl0eS'
    '52MS5BY2NvdW50U3RhdHVzVHlwZUgGUg1hY2NvdW50U3RhdHVziAEBEkYKEHJlcXVpcmVkX2Fj'
    'dGlvbnMYCiADKA4yGy5pZGVudGl0eS52MS5BdXRoQWN0aW9uVHlwZVIPcmVxdWlyZWRBY3Rpb2'
    '5zEjEKEmFjdGl2ZV9idXNpbmVzc19pZBgLIAEoCUgHUhBhY3RpdmVCdXNpbmVzc0lkiAEBEisK'
    'D2FjdGl2ZV9zdG9yZV9pZBgMIAEoCUgIUg1hY3RpdmVTdG9yZUlkiAEBQgkKB19yZWZfaWRCCA'
    'oGX2VtYWlsQg8KDV9waG9uZV9udW1iZXJCDQoLX2ZpcnN0X25hbWVCDAoKX2xhc3RfbmFtZUIP'
    'Cg1fcHJvZmlsZV9saW5rQhEKD19hY2NvdW50X3N0YXR1c0IVChNfYWN0aXZlX2J1c2luZXNzX2'
    'lkQhIKEF9hY3RpdmVfc3RvcmVfaWQ=');

@$core.Deprecated('Use invitationDescriptor instead')
const Invitation$json = {
  '1': 'Invitation',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '10': 'refId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'store_id', '3': 3, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'invited_by', '3': 4, '4': 1, '5': 9, '10': 'invitedBy'},
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.InvitationStatus',
      '10': 'status'
    },
    {
      '1': 'expires_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiresAt'
    },
    {
      '1': 'created_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'responded_at',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 0,
      '10': 'respondedAt',
      '17': true
    },
  ],
  '8': [
    {'1': '_responded_at'},
  ],
};

/// Descriptor for `Invitation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invitationDescriptor = $convert.base64Decode(
    'CgpJbnZpdGF0aW9uEhUKBnJlZl9pZBgBIAEoCVIFcmVmSWQSFwoHdXNlcl9pZBgCIAEoCVIGdX'
    'NlcklkEhkKCHN0b3JlX2lkGAMgASgJUgdzdG9yZUlkEh0KCmludml0ZWRfYnkYBCABKAlSCWlu'
    'dml0ZWRCeRI1CgZzdGF0dXMYBSABKA4yHS5pZGVudGl0eS52MS5JbnZpdGF0aW9uU3RhdHVzUg'
    'ZzdGF0dXMSOQoKZXhwaXJlc19hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBS'
    'CWV4cGlyZXNBdBI5CgpjcmVhdGVkX2F0GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIJY3JlYXRlZEF0EkIKDHJlc3BvbmRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5U'
    'aW1lc3RhbXBIAFILcmVzcG9uZGVkQXSIAQFCDwoNX3Jlc3BvbmRlZF9hdA==');

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

@$core.Deprecated('Use updateRequestDescriptor instead')
const UpdateRequest$json = {
  '1': 'UpdateRequest',
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

/// Descriptor for `UpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRequestDescriptor = $convert.base64Decode(
    'Cg1VcGRhdGVSZXF1ZXN0EiUKBHVzZXIYASABKAsyES5pZGVudGl0eS52MS5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use updateResponseDescriptor instead')
const UpdateResponse$json = {
  '1': 'UpdateResponse',
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

/// Descriptor for `UpdateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateResponseDescriptor = $convert.base64Decode(
    'Cg5VcGRhdGVSZXNwb25zZRIlCgR1c2VyGAEgASgLMhEuaWRlbnRpdHkudjEuVXNlclIEdXNlcg'
    '==');

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

@$core.Deprecated('Use createUserDirectRequestDescriptor instead')
const CreateUserDirectRequest$json = {
  '1': 'CreateUserDirectRequest',
  '2': [
    {'1': 'user_name', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'store_id', '3': 4, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'first_name',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'firstName',
      '17': true
    },
    {
      '1': 'last_name',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'lastName',
      '17': true
    },
    {
      '1': 'phone_number',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'phoneNumber',
      '17': true
    },
    {
      '1': 'permissions',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermissions',
      '10': 'permissions'
    },
    {
      '1': 'force_password_change_on_first_login',
      '3': 9,
      '4': 1,
      '5': 8,
      '10': 'forcePasswordChangeOnFirstLogin'
    },
  ],
  '8': [
    {'1': '_first_name'},
    {'1': '_last_name'},
    {'1': '_phone_number'},
  ],
};

/// Descriptor for `CreateUserDirectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserDirectRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVVc2VyRGlyZWN0UmVxdWVzdBIbCgl1c2VyX25hbWUYASABKAlSCHVzZXJOYW1lEh'
    'QKBWVtYWlsGAIgASgJUgVlbWFpbBIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQSGQoIc3Rv'
    'cmVfaWQYBCABKAlSB3N0b3JlSWQSIgoKZmlyc3RfbmFtZRgFIAEoCUgAUglmaXJzdE5hbWWIAQ'
    'ESIAoJbGFzdF9uYW1lGAYgASgJSAFSCGxhc3ROYW1liAEBEiYKDHBob25lX251bWJlchgHIAEo'
    'CUgCUgtwaG9uZU51bWJlcogBARI/CgtwZXJtaXNzaW9ucxgIIAEoCzIdLmlkZW50aXR5LnYxLl'
    'N0b3JlUGVybWlzc2lvbnNSC3Blcm1pc3Npb25zEk0KJGZvcmNlX3Bhc3N3b3JkX2NoYW5nZV9v'
    'bl9maXJzdF9sb2dpbhgJIAEoCFIfZm9yY2VQYXNzd29yZENoYW5nZU9uRmlyc3RMb2dpbkINCg'
    'tfZmlyc3RfbmFtZUIMCgpfbGFzdF9uYW1lQg8KDV9waG9uZV9udW1iZXI=');

@$core.Deprecated('Use createUserDirectResponseDescriptor instead')
const CreateUserDirectResponse$json = {
  '1': 'CreateUserDirectResponse',
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

/// Descriptor for `CreateUserDirectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserDirectResponseDescriptor =
    $convert.base64Decode(
        'ChhDcmVhdGVVc2VyRGlyZWN0UmVzcG9uc2USJQoEdXNlchgBIAEoCzIRLmlkZW50aXR5LnYxLl'
        'VzZXJSBHVzZXI=');

@$core.Deprecated('Use inviteUserRequestDescriptor instead')
const InviteUserRequest$json = {
  '1': 'InviteUserRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'first_name',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'firstName',
      '17': true
    },
    {
      '1': 'last_name',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'lastName',
      '17': true
    },
    {
      '1': 'permissions',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermissions',
      '10': 'permissions'
    },
  ],
  '8': [
    {'1': '_first_name'},
    {'1': '_last_name'},
  ],
};

/// Descriptor for `InviteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inviteUserRequestDescriptor = $convert.base64Decode(
    'ChFJbnZpdGVVc2VyUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGQoIc3RvcmVfaWQYAi'
    'ABKAlSB3N0b3JlSWQSIgoKZmlyc3RfbmFtZRgDIAEoCUgAUglmaXJzdE5hbWWIAQESIAoJbGFz'
    'dF9uYW1lGAQgASgJSAFSCGxhc3ROYW1liAEBEj8KC3Blcm1pc3Npb25zGAUgASgLMh0uaWRlbn'
    'RpdHkudjEuU3RvcmVQZXJtaXNzaW9uc1ILcGVybWlzc2lvbnNCDQoLX2ZpcnN0X25hbWVCDAoK'
    'X2xhc3RfbmFtZQ==');

@$core.Deprecated('Use inviteUserResponseDescriptor instead')
const InviteUserResponse$json = {
  '1': 'InviteUserResponse',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.User',
      '10': 'user'
    },
    {
      '1': 'invitation',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.Invitation',
      '10': 'invitation'
    },
  ],
};

/// Descriptor for `InviteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inviteUserResponseDescriptor = $convert.base64Decode(
    'ChJJbnZpdGVVc2VyUmVzcG9uc2USJQoEdXNlchgBIAEoCzIRLmlkZW50aXR5LnYxLlVzZXJSBH'
    'VzZXISNwoKaW52aXRhdGlvbhgCIAEoCzIXLmlkZW50aXR5LnYxLkludml0YXRpb25SCmludml0'
    'YXRpb24=');

@$core.Deprecated('Use acceptInvitationRequestDescriptor instead')
const AcceptInvitationRequest$json = {
  '1': 'AcceptInvitationRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'newPassword'},
  ],
};

/// Descriptor for `AcceptInvitationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptInvitationRequestDescriptor =
    $convert.base64Decode(
        'ChdBY2NlcHRJbnZpdGF0aW9uUmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SLAoMbmV3X3'
        'Bhc3N3b3JkGAIgASgJQgm6SAZyBBAIGCBSC25ld1Bhc3N3b3Jk');

@$core.Deprecated('Use acceptInvitationResponseDescriptor instead')
const AcceptInvitationResponse$json = {
  '1': 'AcceptInvitationResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AcceptInvitationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptInvitationResponseDescriptor =
    $convert.base64Decode(
        'ChhBY2NlcHRJbnZpdGF0aW9uUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use cancelInvitationRequestDescriptor instead')
const CancelInvitationRequest$json = {
  '1': 'CancelInvitationRequest',
  '2': [
    {'1': 'invitation_id', '3': 1, '4': 1, '5': 9, '10': 'invitationId'},
  ],
};

/// Descriptor for `CancelInvitationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelInvitationRequestDescriptor =
    $convert.base64Decode(
        'ChdDYW5jZWxJbnZpdGF0aW9uUmVxdWVzdBIjCg1pbnZpdGF0aW9uX2lkGAEgASgJUgxpbnZpdG'
        'F0aW9uSWQ=');

@$core.Deprecated('Use cancelInvitationResponseDescriptor instead')
const CancelInvitationResponse$json = {
  '1': 'CancelInvitationResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CancelInvitationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelInvitationResponseDescriptor =
    $convert.base64Decode(
        'ChhDYW5jZWxJbnZpdGF0aW9uUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use resendInvitationRequestDescriptor instead')
const ResendInvitationRequest$json = {
  '1': 'ResendInvitationRequest',
  '2': [
    {'1': 'invitation_id', '3': 1, '4': 1, '5': 9, '10': 'invitationId'},
  ],
};

/// Descriptor for `ResendInvitationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resendInvitationRequestDescriptor =
    $convert.base64Decode(
        'ChdSZXNlbmRJbnZpdGF0aW9uUmVxdWVzdBIjCg1pbnZpdGF0aW9uX2lkGAEgASgJUgxpbnZpdG'
        'F0aW9uSWQ=');

@$core.Deprecated('Use resendInvitationResponseDescriptor instead')
const ResendInvitationResponse$json = {
  '1': 'ResendInvitationResponse',
  '2': [
    {
      '1': 'invitation',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.Invitation',
      '10': 'invitation'
    },
  ],
};

/// Descriptor for `ResendInvitationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resendInvitationResponseDescriptor =
    $convert.base64Decode(
        'ChhSZXNlbmRJbnZpdGF0aW9uUmVzcG9uc2USNwoKaW52aXRhdGlvbhgBIAEoCzIXLmlkZW50aX'
        'R5LnYxLkludml0YXRpb25SCmludml0YXRpb24=');

const $core.Map<$core.String, $core.dynamic> UserServiceBase$json = {
  '1': 'UserService',
  '2': [
    {
      '1': 'Update',
      '2': '.identity.v1.UpdateRequest',
      '3': '.identity.v1.UpdateResponse',
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
    {
      '1': 'CreateUserDirect',
      '2': '.identity.v1.CreateUserDirectRequest',
      '3': '.identity.v1.CreateUserDirectResponse',
      '4': {}
    },
    {
      '1': 'InviteUser',
      '2': '.identity.v1.InviteUserRequest',
      '3': '.identity.v1.InviteUserResponse',
      '4': {}
    },
    {
      '1': 'CancelInvitation',
      '2': '.identity.v1.CancelInvitationRequest',
      '3': '.identity.v1.CancelInvitationResponse',
      '4': {}
    },
    {
      '1': 'ResendInvitation',
      '2': '.identity.v1.ResendInvitationRequest',
      '3': '.identity.v1.ResendInvitationResponse',
      '4': {}
    },
    {
      '1': 'AcceptInvitation',
      '2': '.identity.v1.AcceptInvitationRequest',
      '3': '.identity.v1.AcceptInvitationResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use userServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    UserServiceBase$messageJson = {
  '.identity.v1.UpdateRequest': UpdateRequest$json,
  '.identity.v1.User': User$json,
  '.identity.v1.ConnectedAccount': ConnectedAccount$json,
  '.link.v1.ResourceLink': $0.ResourceLink$json,
  '.identity.v1.UpdateResponse': UpdateResponse$json,
  '.identity.v1.RequestDeleteUserRequest': RequestDeleteUserRequest$json,
  '.identity.v1.RequestDeleteUserResponse': RequestDeleteUserResponse$json,
  '.identity.v1.DeleteUserRequest': DeleteUserRequest$json,
  '.identity.v1.DeleteUserResponse': DeleteUserResponse$json,
  '.identity.v1.ChangePasswordRequest': ChangePasswordRequest$json,
  '.identity.v1.ChangePasswordResponse': ChangePasswordResponse$json,
  '.identity.v1.CreateUserDirectRequest': CreateUserDirectRequest$json,
  '.identity.v1.StorePermissions': $2.StorePermissions$json,
  '.identity.v1.StoreProductPermission': $2.StoreProductPermission$json,
  '.identity.v1.StoreMemberPermission': $2.StoreMemberPermission$json,
  '.identity.v1.StoreReportPermission': $2.StoreReportPermission$json,
  '.identity.v1.StoreOrderPermission': $2.StoreOrderPermission$json,
  '.identity.v1.StoreInvoicePermission': $2.StoreInvoicePermission$json,
  '.identity.v1.StoreSupplierPermission': $2.StoreSupplierPermission$json,
  '.identity.v1.StoreTransactionPermission': $2.StoreTransactionPermission$json,
  '.identity.v1.CreateUserDirectResponse': CreateUserDirectResponse$json,
  '.identity.v1.InviteUserRequest': InviteUserRequest$json,
  '.identity.v1.InviteUserResponse': InviteUserResponse$json,
  '.identity.v1.Invitation': Invitation$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.identity.v1.CancelInvitationRequest': CancelInvitationRequest$json,
  '.identity.v1.CancelInvitationResponse': CancelInvitationResponse$json,
  '.identity.v1.ResendInvitationRequest': ResendInvitationRequest$json,
  '.identity.v1.ResendInvitationResponse': ResendInvitationResponse$json,
  '.identity.v1.AcceptInvitationRequest': AcceptInvitationRequest$json,
  '.identity.v1.AcceptInvitationResponse': AcceptInvitationResponse$json,
};

/// Descriptor for `UserService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List userServiceDescriptor = $convert.base64Decode(
    'CgtVc2VyU2VydmljZRJDCgZVcGRhdGUSGi5pZGVudGl0eS52MS5VcGRhdGVSZXF1ZXN0GhsuaW'
    'RlbnRpdHkudjEuVXBkYXRlUmVzcG9uc2UiABJkChFSZXF1ZXN0RGVsZXRlVXNlchIlLmlkZW50'
    'aXR5LnYxLlJlcXVlc3REZWxldGVVc2VyUmVxdWVzdBomLmlkZW50aXR5LnYxLlJlcXVlc3REZW'
    'xldGVVc2VyUmVzcG9uc2UiABJPCgpEZWxldGVVc2VyEh4uaWRlbnRpdHkudjEuRGVsZXRlVXNl'
    'clJlcXVlc3QaHy5pZGVudGl0eS52MS5EZWxldGVVc2VyUmVzcG9uc2UiABJbCg5DaGFuZ2VQYX'
    'Nzd29yZBIiLmlkZW50aXR5LnYxLkNoYW5nZVBhc3N3b3JkUmVxdWVzdBojLmlkZW50aXR5LnYx'
    'LkNoYW5nZVBhc3N3b3JkUmVzcG9uc2UiABJhChBDcmVhdGVVc2VyRGlyZWN0EiQuaWRlbnRpdH'
    'kudjEuQ3JlYXRlVXNlckRpcmVjdFJlcXVlc3QaJS5pZGVudGl0eS52MS5DcmVhdGVVc2VyRGly'
    'ZWN0UmVzcG9uc2UiABJPCgpJbnZpdGVVc2VyEh4uaWRlbnRpdHkudjEuSW52aXRlVXNlclJlcX'
    'Vlc3QaHy5pZGVudGl0eS52MS5JbnZpdGVVc2VyUmVzcG9uc2UiABJhChBDYW5jZWxJbnZpdGF0'
    'aW9uEiQuaWRlbnRpdHkudjEuQ2FuY2VsSW52aXRhdGlvblJlcXVlc3QaJS5pZGVudGl0eS52MS'
    '5DYW5jZWxJbnZpdGF0aW9uUmVzcG9uc2UiABJhChBSZXNlbmRJbnZpdGF0aW9uEiQuaWRlbnRp'
    'dHkudjEuUmVzZW5kSW52aXRhdGlvblJlcXVlc3QaJS5pZGVudGl0eS52MS5SZXNlbmRJbnZpdG'
    'F0aW9uUmVzcG9uc2UiABJhChBBY2NlcHRJbnZpdGF0aW9uEiQuaWRlbnRpdHkudjEuQWNjZXB0'
    'SW52aXRhdGlvblJlcXVlc3QaJS5pZGVudGl0eS52MS5BY2NlcHRJbnZpdGF0aW9uUmVzcG9uc2'
    'UiAA==');
