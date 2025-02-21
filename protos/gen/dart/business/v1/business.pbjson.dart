//
//  Generated code. Do not modify.
//  source: business/v1/business.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use businessStatusTypeDescriptor instead')
const BusinessStatusType$json = {
  '1': 'BusinessStatusType',
  '2': [
    {'1': 'BUSINESS_STATUS_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'BUSINESS_STATUS_TYPE_ACTIVE', '2': 1},
    {'1': 'BUSINESS_STATUS_TYPE_DELETED', '2': 2},
  ],
};

/// Descriptor for `BusinessStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List businessStatusTypeDescriptor = $convert.base64Decode(
    'ChJCdXNpbmVzc1N0YXR1c1R5cGUSJAogQlVTSU5FU1NfU1RBVFVTX1RZUEVfVU5TUEVDSUZJRU'
    'QQABIfChtCVVNJTkVTU19TVEFUVVNfVFlQRV9BQ1RJVkUQARIgChxCVVNJTkVTU19TVEFUVVNf'
    'VFlQRV9ERUxFVEVEEAI=');

@$core.Deprecated('Use businessDescriptor instead')
const Business$json = {
  '1': 'Business',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.business.v1.BusinessStatusType', '10': 'status'},
    {'1': 'owner_uid', '3': 5, '4': 1, '5': 9, '10': 'ownerUid'},
    {'1': 'logo_media_uid', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'logoMediaUid', '17': true},
    {'1': 'country_code', '3': 7, '4': 1, '5': 9, '10': 'countryCode'},
    {'1': 'currency_code', '3': 8, '4': 1, '5': 9, '10': 'currencyCode'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 10, '4': 1, '5': 9, '10': 'updatedAt'},
  ],
  '8': [
    {'1': '_description'},
    {'1': '_logo_media_uid'},
  ],
};

/// Descriptor for `Business`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessDescriptor = $convert.base64Decode(
    'CghCdXNpbmVzcxIQCgN1aWQYASABKAlSA3VpZBISCgRuYW1lGAIgASgJUgRuYW1lEiUKC2Rlc2'
    'NyaXB0aW9uGAMgASgJSABSC2Rlc2NyaXB0aW9uiAEBEjcKBnN0YXR1cxgEIAEoDjIfLmJ1c2lu'
    'ZXNzLnYxLkJ1c2luZXNzU3RhdHVzVHlwZVIGc3RhdHVzEhsKCW93bmVyX3VpZBgFIAEoCVIIb3'
    'duZXJVaWQSKQoObG9nb19tZWRpYV91aWQYBiABKAlIAVIMbG9nb01lZGlhVWlkiAEBEiEKDGNv'
    'dW50cnlfY29kZRgHIAEoCVILY291bnRyeUNvZGUSIwoNY3VycmVuY3lfY29kZRgIIAEoCVIMY3'
    'VycmVuY3lDb2RlEh0KCmNyZWF0ZWRfYXQYCSABKAlSCWNyZWF0ZWRBdBIdCgp1cGRhdGVkX2F0'
    'GAogASgJUgl1cGRhdGVkQXRCDgoMX2Rlc2NyaXB0aW9uQhEKD19sb2dvX21lZGlhX3VpZA==');

@$core.Deprecated('Use createBusinessRequestDescriptor instead')
const CreateBusinessRequest$json = {
  '1': 'CreateBusinessRequest',
  '2': [
    {'1': 'business', '3': 1, '4': 1, '5': 11, '6': '.business.v1.Business', '10': 'business'},
    {'1': 'logo_raw_image', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'logoRawImage', '17': true},
  ],
  '8': [
    {'1': '_logo_raw_image'},
  ],
};

/// Descriptor for `CreateBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVCdXNpbmVzc1JlcXVlc3QSMQoIYnVzaW5lc3MYASABKAsyFS5idXNpbmVzcy52MS'
    '5CdXNpbmVzc1IIYnVzaW5lc3MSKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0lt'
    'YWdliAEBQhEKD19sb2dvX3Jhd19pbWFnZQ==');

@$core.Deprecated('Use createBusinessResponseDescriptor instead')
const CreateBusinessResponse$json = {
  '1': 'CreateBusinessResponse',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `CreateBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessResponseDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVCdXNpbmVzc1Jlc3BvbnNlEhAKA3VpZBgBIAEoCVIDdWlk');

@$core.Deprecated('Use getBusinessRequestDescriptor instead')
const GetBusinessRequest$json = {
  '1': 'GetBusinessRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `GetBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessRequestDescriptor = $convert.base64Decode(
    'ChJHZXRCdXNpbmVzc1JlcXVlc3QSEAoDdWlkGAEgASgJUgN1aWQ=');

@$core.Deprecated('Use getBusinessResponseDescriptor instead')
const GetBusinessResponse$json = {
  '1': 'GetBusinessResponse',
  '2': [
    {'1': 'business', '3': 1, '4': 1, '5': 11, '6': '.business.v1.Business', '10': 'business'},
  ],
};

/// Descriptor for `GetBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessResponseDescriptor = $convert.base64Decode(
    'ChNHZXRCdXNpbmVzc1Jlc3BvbnNlEjEKCGJ1c2luZXNzGAEgASgLMhUuYnVzaW5lc3MudjEuQn'
    'VzaW5lc3NSCGJ1c2luZXNz');

@$core.Deprecated('Use updateBusinessRequestDescriptor instead')
const UpdateBusinessRequest$json = {
  '1': 'UpdateBusinessRequest',
  '2': [
    {'1': 'business', '3': 1, '4': 1, '5': 11, '6': '.business.v1.Business', '10': 'business'},
    {'1': 'logo_raw_image', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'logoRawImage', '17': true},
  ],
  '8': [
    {'1': '_logo_raw_image'},
  ],
};

/// Descriptor for `UpdateBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVCdXNpbmVzc1JlcXVlc3QSMQoIYnVzaW5lc3MYASABKAsyFS5idXNpbmVzcy52MS'
    '5CdXNpbmVzc1IIYnVzaW5lc3MSKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0lt'
    'YWdliAEBQhEKD19sb2dvX3Jhd19pbWFnZQ==');

@$core.Deprecated('Use updateBusinessResponseDescriptor instead')
const UpdateBusinessResponse$json = {
  '1': 'UpdateBusinessResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessResponseDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVCdXNpbmVzc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use requestDeleteBusinessRequestDescriptor instead')
const RequestDeleteBusinessRequest$json = {
  '1': 'RequestDeleteBusinessRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RequestDeleteBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeleteBusinessRequestDescriptor = $convert.base64Decode(
    'ChxSZXF1ZXN0RGVsZXRlQnVzaW5lc3NSZXF1ZXN0EhAKA3VpZBgBIAEoCVIDdWlkEhoKCHBhc3'
    'N3b3JkGAIgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use requestDeleteBusinessResponseDescriptor instead')
const RequestDeleteBusinessResponse$json = {
  '1': 'RequestDeleteBusinessResponse',
  '2': [
    {'1': 'request_token', '3': 1, '4': 1, '5': 9, '10': 'requestToken'},
  ],
};

/// Descriptor for `RequestDeleteBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeleteBusinessResponseDescriptor = $convert.base64Decode(
    'Ch1SZXF1ZXN0RGVsZXRlQnVzaW5lc3NSZXNwb25zZRIjCg1yZXF1ZXN0X3Rva2VuGAEgASgJUg'
    'xyZXF1ZXN0VG9rZW4=');

@$core.Deprecated('Use deleteBusinessRequestDescriptor instead')
const DeleteBusinessRequest$json = {
  '1': 'DeleteBusinessRequest',
  '2': [
    {'1': 'request_token', '3': 1, '4': 1, '5': 9, '10': 'requestToken'},
    {'1': 'verification_code', '3': 2, '4': 1, '5': 9, '10': 'verificationCode'},
  ],
};

/// Descriptor for `DeleteBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBusinessRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVCdXNpbmVzc1JlcXVlc3QSIwoNcmVxdWVzdF90b2tlbhgBIAEoCVIMcmVxdWVzdF'
    'Rva2VuEisKEXZlcmlmaWNhdGlvbl9jb2RlGAIgASgJUhB2ZXJpZmljYXRpb25Db2Rl');

@$core.Deprecated('Use deleteBusinessResponseDescriptor instead')
const DeleteBusinessResponse$json = {
  '1': 'DeleteBusinessResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBusinessResponseDescriptor = $convert.base64Decode(
    'ChZEZWxldGVCdXNpbmVzc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use addUserToBusinessRequestDescriptor instead')
const AddUserToBusinessRequest$json = {
  '1': 'AddUserToBusinessRequest',
  '2': [
    {'1': 'u_ref', '3': 1, '4': 1, '5': 9, '10': 'uRef'},
  ],
};

/// Descriptor for `AddUserToBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserToBusinessRequestDescriptor = $convert.base64Decode(
    'ChhBZGRVc2VyVG9CdXNpbmVzc1JlcXVlc3QSEwoFdV9yZWYYASABKAlSBHVSZWY=');

@$core.Deprecated('Use addUserToBusinessResponseDescriptor instead')
const AddUserToBusinessResponse$json = {
  '1': 'AddUserToBusinessResponse',
  '2': [
    {'1': 'u_ref', '3': 1, '4': 1, '5': 9, '10': 'uRef'},
  ],
};

/// Descriptor for `AddUserToBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserToBusinessResponseDescriptor = $convert.base64Decode(
    'ChlBZGRVc2VyVG9CdXNpbmVzc1Jlc3BvbnNlEhMKBXVfcmVmGAEgASgJUgR1UmVm');

@$core.Deprecated('Use removeUserFromBusinessRequestDescriptor instead')
const RemoveUserFromBusinessRequest$json = {
  '1': 'RemoveUserFromBusinessRequest',
  '2': [
    {'1': 'u_ref', '3': 1, '4': 1, '5': 9, '10': 'uRef'},
  ],
};

/// Descriptor for `RemoveUserFromBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromBusinessRequestDescriptor = $convert.base64Decode(
    'Ch1SZW1vdmVVc2VyRnJvbUJ1c2luZXNzUmVxdWVzdBITCgV1X3JlZhgBIAEoCVIEdVJlZg==');

@$core.Deprecated('Use removeUserFromBusinessResponseDescriptor instead')
const RemoveUserFromBusinessResponse$json = {
  '1': 'RemoveUserFromBusinessResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveUserFromBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromBusinessResponseDescriptor = $convert.base64Decode(
    'Ch5SZW1vdmVVc2VyRnJvbUJ1c2luZXNzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2'
    'Vzcw==');

@$core.Deprecated('Use getBusinessUsersRequestDescriptor instead')
const GetBusinessUsersRequest$json = {
  '1': 'GetBusinessUsersRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `GetBusinessUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessUsersRequestDescriptor = $convert.base64Decode(
    'ChdHZXRCdXNpbmVzc1VzZXJzUmVxdWVzdBIQCgN1aWQYASABKAlSA3VpZA==');

@$core.Deprecated('Use getBusinessUsersResponseDescriptor instead')
const GetBusinessUsersResponse$json = {
  '1': 'GetBusinessUsersResponse',
  '2': [
    {'1': 'uids', '3': 1, '4': 3, '5': 9, '10': 'uids'},
  ],
};

/// Descriptor for `GetBusinessUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessUsersResponseDescriptor = $convert.base64Decode(
    'ChhHZXRCdXNpbmVzc1VzZXJzUmVzcG9uc2USEgoEdWlkcxgBIAMoCVIEdWlkcw==');

const $core.Map<$core.String, $core.dynamic> BusinessServiceBase$json = {
  '1': 'BusinessService',
  '2': [
    {'1': 'CreateBusiness', '2': '.business.v1.CreateBusinessRequest', '3': '.business.v1.CreateBusinessResponse'},
    {'1': 'GetBusiness', '2': '.business.v1.GetBusinessRequest', '3': '.business.v1.GetBusinessResponse'},
    {'1': 'UpdateBusiness', '2': '.business.v1.UpdateBusinessRequest', '3': '.business.v1.UpdateBusinessResponse'},
    {'1': 'RequestDeleteBusiness', '2': '.business.v1.RequestDeleteBusinessRequest', '3': '.business.v1.RequestDeleteBusinessResponse'},
    {'1': 'DeleteBusiness', '2': '.business.v1.DeleteBusinessRequest', '3': '.business.v1.DeleteBusinessResponse'},
    {'1': 'AddUserToBusiness', '2': '.business.v1.AddUserToBusinessRequest', '3': '.business.v1.AddUserToBusinessResponse'},
    {'1': 'RemoveUserFromBusiness', '2': '.business.v1.RemoveUserFromBusinessRequest', '3': '.business.v1.RemoveUserFromBusinessResponse'},
    {'1': 'GetBusinessUsers', '2': '.business.v1.GetBusinessUsersRequest', '3': '.business.v1.GetBusinessUsersResponse'},
  ],
};

@$core.Deprecated('Use businessServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> BusinessServiceBase$messageJson = {
  '.business.v1.CreateBusinessRequest': CreateBusinessRequest$json,
  '.business.v1.Business': Business$json,
  '.business.v1.CreateBusinessResponse': CreateBusinessResponse$json,
  '.business.v1.GetBusinessRequest': GetBusinessRequest$json,
  '.business.v1.GetBusinessResponse': GetBusinessResponse$json,
  '.business.v1.UpdateBusinessRequest': UpdateBusinessRequest$json,
  '.business.v1.UpdateBusinessResponse': UpdateBusinessResponse$json,
  '.business.v1.RequestDeleteBusinessRequest': RequestDeleteBusinessRequest$json,
  '.business.v1.RequestDeleteBusinessResponse': RequestDeleteBusinessResponse$json,
  '.business.v1.DeleteBusinessRequest': DeleteBusinessRequest$json,
  '.business.v1.DeleteBusinessResponse': DeleteBusinessResponse$json,
  '.business.v1.AddUserToBusinessRequest': AddUserToBusinessRequest$json,
  '.business.v1.AddUserToBusinessResponse': AddUserToBusinessResponse$json,
  '.business.v1.RemoveUserFromBusinessRequest': RemoveUserFromBusinessRequest$json,
  '.business.v1.RemoveUserFromBusinessResponse': RemoveUserFromBusinessResponse$json,
  '.business.v1.GetBusinessUsersRequest': GetBusinessUsersRequest$json,
  '.business.v1.GetBusinessUsersResponse': GetBusinessUsersResponse$json,
};

/// Descriptor for `BusinessService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List businessServiceDescriptor = $convert.base64Decode(
    'Cg9CdXNpbmVzc1NlcnZpY2USWQoOQ3JlYXRlQnVzaW5lc3MSIi5idXNpbmVzcy52MS5DcmVhdG'
    'VCdXNpbmVzc1JlcXVlc3QaIy5idXNpbmVzcy52MS5DcmVhdGVCdXNpbmVzc1Jlc3BvbnNlElAK'
    'C0dldEJ1c2luZXNzEh8uYnVzaW5lc3MudjEuR2V0QnVzaW5lc3NSZXF1ZXN0GiAuYnVzaW5lc3'
    'MudjEuR2V0QnVzaW5lc3NSZXNwb25zZRJZCg5VcGRhdGVCdXNpbmVzcxIiLmJ1c2luZXNzLnYx'
    'LlVwZGF0ZUJ1c2luZXNzUmVxdWVzdBojLmJ1c2luZXNzLnYxLlVwZGF0ZUJ1c2luZXNzUmVzcG'
    '9uc2USbgoVUmVxdWVzdERlbGV0ZUJ1c2luZXNzEikuYnVzaW5lc3MudjEuUmVxdWVzdERlbGV0'
    'ZUJ1c2luZXNzUmVxdWVzdBoqLmJ1c2luZXNzLnYxLlJlcXVlc3REZWxldGVCdXNpbmVzc1Jlc3'
    'BvbnNlElkKDkRlbGV0ZUJ1c2luZXNzEiIuYnVzaW5lc3MudjEuRGVsZXRlQnVzaW5lc3NSZXF1'
    'ZXN0GiMuYnVzaW5lc3MudjEuRGVsZXRlQnVzaW5lc3NSZXNwb25zZRJiChFBZGRVc2VyVG9CdX'
    'NpbmVzcxIlLmJ1c2luZXNzLnYxLkFkZFVzZXJUb0J1c2luZXNzUmVxdWVzdBomLmJ1c2luZXNz'
    'LnYxLkFkZFVzZXJUb0J1c2luZXNzUmVzcG9uc2UScQoWUmVtb3ZlVXNlckZyb21CdXNpbmVzcx'
    'IqLmJ1c2luZXNzLnYxLlJlbW92ZVVzZXJGcm9tQnVzaW5lc3NSZXF1ZXN0GisuYnVzaW5lc3Mu'
    'djEuUmVtb3ZlVXNlckZyb21CdXNpbmVzc1Jlc3BvbnNlEl8KEEdldEJ1c2luZXNzVXNlcnMSJC'
    '5idXNpbmVzcy52MS5HZXRCdXNpbmVzc1VzZXJzUmVxdWVzdBolLmJ1c2luZXNzLnYxLkdldEJ1'
    'c2luZXNzVXNlcnNSZXNwb25zZQ==');

