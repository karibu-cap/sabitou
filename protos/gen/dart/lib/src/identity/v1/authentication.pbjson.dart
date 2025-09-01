// This is a generated file - do not edit.
//
// Generated from identity/v1/authentication.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'u_ref', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'uRef'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QS4wEKBXVfcmVmGAEgASgJQs0BukjJAboBxQEKEnN0cmluZy5pc191c2'
    'VyX3JlZhI+dXNlcl9yZWYgbXVzdCBiZSBhIHZhbGlkIGVtYWlsIGFkZHJlc3Mgb3IgdXNlciBp'
    'ZCBvciBAdXNlcm5hbWUab3RoaXMuaXNFbWFpbCgpIHx8IHRoaXMubWF0Y2hlcygnXlswLTlhLW'
    'ZBLUZdezh9LVswLTlhLWZBLUZdezR9LVswLTlhLWZBLUZdezR9LVswLTlhLWZBLUZdezR9LVsw'
    'LTlhLWZBLUZdezEyfSQnKVIEdVJlZhIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhQKBXRva2VuGAEgASgJUgV0b2tlbhIjCg1yZWZyZXNoX3Rva2VuGA'
    'IgASgJUgxyZWZyZXNoVG9rZW4=');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'user_name', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSGwoJdXNlcl9uYW1lGAEgASgJUgh1c2VyTmFtZRIUCgVlbWFpbB'
    'gCIAEoCVIFZW1haWw=');

@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = {
  '1': 'RegisterResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RlclJlc3BvbnNlEhQKBXRva2VuGAEgASgJUgV0b2tlbhIjCg1yZWZyZXNoX3Rva2'
    'VuGAIgASgJUgxyZWZyZXNoVG9rZW4=');

@$core.Deprecated('Use requestPasswordResetRequestDescriptor instead')
const RequestPasswordResetRequest$json = {
  '1': 'RequestPasswordResetRequest',
  '2': [
    {'1': 'u_ref', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'uRef'},
  ],
};

/// Descriptor for `RequestPasswordResetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestPasswordResetRequestDescriptor = $convert.base64Decode(
    'ChtSZXF1ZXN0UGFzc3dvcmRSZXNldFJlcXVlc3QS4wEKBXVfcmVmGAEgASgJQs0BukjJAboBxQ'
    'EKEnN0cmluZy5pc191c2VyX3JlZhI+dXNlcl9yZWYgbXVzdCBiZSBhIHZhbGlkIGVtYWlsIGFk'
    'ZHJlc3Mgb3IgdXNlciBpZCBvciBAdXNlcm5hbWUab3RoaXMuaXNFbWFpbCgpIHx8IHRoaXMubW'
    'F0Y2hlcygnXlswLTlhLWZBLUZdezh9LVswLTlhLWZBLUZdezR9LVswLTlhLWZBLUZdezR9LVsw'
    'LTlhLWZBLUZdezR9LVswLTlhLWZBLUZdezEyfSQnKVIEdVJlZg==');

@$core.Deprecated('Use requestPasswordResetResponseDescriptor instead')
const RequestPasswordResetResponse$json = {
  '1': 'RequestPasswordResetResponse',
  '2': [
    {'1': 'request_token', '3': 1, '4': 1, '5': 9, '10': 'requestToken'},
    {
      '1': 'verification_code',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'verificationCode',
      '17': true
    },
  ],
  '8': [
    {'1': '_verification_code'},
  ],
};

/// Descriptor for `RequestPasswordResetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestPasswordResetResponseDescriptor =
    $convert.base64Decode(
        'ChxSZXF1ZXN0UGFzc3dvcmRSZXNldFJlc3BvbnNlEiMKDXJlcXVlc3RfdG9rZW4YASABKAlSDH'
        'JlcXVlc3RUb2tlbhIwChF2ZXJpZmljYXRpb25fY29kZRgCIAEoCUgAUhB2ZXJpZmljYXRpb25D'
        'b2RliAEBQhQKEl92ZXJpZmljYXRpb25fY29kZQ==');

@$core.Deprecated('Use resetPasswordRequestDescriptor instead')
const ResetPasswordRequest$json = {
  '1': 'ResetPasswordRequest',
  '2': [
    {'1': 'request_token', '3': 1, '4': 1, '5': 9, '10': 'requestToken'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {
      '1': 'verification_code',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'verificationCode'
    },
  ],
};

/// Descriptor for `ResetPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRequestDescriptor = $convert.base64Decode(
    'ChRSZXNldFBhc3N3b3JkUmVxdWVzdBIjCg1yZXF1ZXN0X3Rva2VuGAEgASgJUgxyZXF1ZXN0VG'
    '9rZW4SGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3JkEisKEXZlcmlmaWNhdGlvbl9jb2RlGAMg'
    'ASgJUhB2ZXJpZmljYXRpb25Db2Rl');

@$core.Deprecated('Use resetPasswordResponseDescriptor instead')
const ResetPasswordResponse$json = {
  '1': 'ResetPasswordResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 9, '10': 'success'},
  ],
};

/// Descriptor for `ResetPasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordResponseDescriptor =
    $convert.base64Decode(
        'ChVSZXNldFBhc3N3b3JkUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCVIHc3VjY2Vzcw==');

const $core.Map<$core.String, $core.dynamic> AuthServiceBase$json = {
  '1': 'AuthService',
  '2': [
    {
      '1': 'Login',
      '2': '.identity.v1.LoginRequest',
      '3': '.identity.v1.LoginResponse',
      '4': {}
    },
    {
      '1': 'Register',
      '2': '.identity.v1.RegisterRequest',
      '3': '.identity.v1.RegisterResponse',
      '4': {}
    },
    {
      '1': 'RequestPasswordReset',
      '2': '.identity.v1.RequestPasswordResetRequest',
      '3': '.identity.v1.RequestPasswordResetResponse',
      '4': {}
    },
    {
      '1': 'ResetPassword',
      '2': '.identity.v1.ResetPasswordRequest',
      '3': '.identity.v1.ResetPasswordResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use authServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    AuthServiceBase$messageJson = {
  '.identity.v1.LoginRequest': LoginRequest$json,
  '.identity.v1.LoginResponse': LoginResponse$json,
  '.identity.v1.RegisterRequest': RegisterRequest$json,
  '.identity.v1.RegisterResponse': RegisterResponse$json,
  '.identity.v1.RequestPasswordResetRequest': RequestPasswordResetRequest$json,
  '.identity.v1.RequestPasswordResetResponse':
      RequestPasswordResetResponse$json,
  '.identity.v1.ResetPasswordRequest': ResetPasswordRequest$json,
  '.identity.v1.ResetPasswordResponse': ResetPasswordResponse$json,
};

/// Descriptor for `AuthService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List authServiceDescriptor = $convert.base64Decode(
    'CgtBdXRoU2VydmljZRJACgVMb2dpbhIZLmlkZW50aXR5LnYxLkxvZ2luUmVxdWVzdBoaLmlkZW'
    '50aXR5LnYxLkxvZ2luUmVzcG9uc2UiABJJCghSZWdpc3RlchIcLmlkZW50aXR5LnYxLlJlZ2lz'
    'dGVyUmVxdWVzdBodLmlkZW50aXR5LnYxLlJlZ2lzdGVyUmVzcG9uc2UiABJtChRSZXF1ZXN0UG'
    'Fzc3dvcmRSZXNldBIoLmlkZW50aXR5LnYxLlJlcXVlc3RQYXNzd29yZFJlc2V0UmVxdWVzdBop'
    'LmlkZW50aXR5LnYxLlJlcXVlc3RQYXNzd29yZFJlc2V0UmVzcG9uc2UiABJYCg1SZXNldFBhc3'
    'N3b3JkEiEuaWRlbnRpdHkudjEuUmVzZXRQYXNzd29yZFJlcXVlc3QaIi5pZGVudGl0eS52MS5S'
    'ZXNldFBhc3N3b3JkUmVzcG9uc2UiAA==');
