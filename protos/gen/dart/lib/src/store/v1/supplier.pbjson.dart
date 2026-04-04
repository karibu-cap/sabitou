// This is a generated file - do not edit.
//
// Generated from store/v1/supplier.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use supplierStatusDescriptor instead')
const SupplierStatus$json = {
  '1': 'SupplierStatus',
  '2': [
    {'1': 'SUPPLIER_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'SUPPLIER_STATUS_ACTIVE', '2': 1},
    {'1': 'SUPPLIER_STATUS_INACTIVE', '2': 2},
    {'1': 'SUPPLIER_STATUS_DELETE', '2': 3},
  ],
};

/// Descriptor for `SupplierStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List supplierStatusDescriptor = $convert.base64Decode(
    'Cg5TdXBwbGllclN0YXR1cxIfChtTVVBQTElFUl9TVEFUVVNfVU5TUEVDSUZJRUQQABIaChZTVV'
    'BQTElFUl9TVEFUVVNfQUNUSVZFEAESHAoYU1VQUExJRVJfU1RBVFVTX0lOQUNUSVZFEAISGgoW'
    'U1VQUExJRVJfU1RBVFVTX0RFTEVURRAD');

@$core.Deprecated('Use linkDescriptor instead')
const Link$json = {
  '1': 'Link',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Link`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkDescriptor = $convert.base64Decode(
    'CgRMaW5rEhQKBWxhYmVsGAEgASgJUgVsYWJlbBIQCgN1cmwYAiABKAlSA3VybA==');

@$core.Deprecated('Use supplierDescriptor instead')
const Supplier$json = {
  '1': 'Supplier',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'description',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'description',
      '17': true
    },
    {
      '1': 'logo_link_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'logoLinkId',
      '17': true
    },
    {
      '1': 'external_links_ids',
      '3': 5,
      '4': 3,
      '5': 9,
      '10': 'externalLinksIds'
    },
    {
      '1': 'contact_phone',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'contactPhone',
      '17': true
    },
    {
      '1': 'contact_email',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'contactEmail',
      '17': true
    },
    {
      '1': 'contact_address',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'contactAddress',
      '17': true
    },
    {
      '1': 'status',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.store.v1.SupplierStatus',
      '10': 'status'
    },
    {'1': 'store_ids', '3': 10, '4': 3, '5': 9, '10': 'storeIds'},
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
    {'1': '_contact_phone'},
    {'1': '_contact_email'},
    {'1': '_contact_address'},
  ],
};

/// Descriptor for `Supplier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierDescriptor = $convert.base64Decode(
    'CghTdXBwbGllchIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgBUgtkZXNjcmlwdGlvbogBARIlCgxsb2dvX2xpbmtf'
    'aWQYBCABKAlIAlIKbG9nb0xpbmtJZIgBARIsChJleHRlcm5hbF9saW5rc19pZHMYBSADKAlSEG'
    'V4dGVybmFsTGlua3NJZHMSKAoNY29udGFjdF9waG9uZRgGIAEoCUgDUgxjb250YWN0UGhvbmWI'
    'AQESKAoNY29udGFjdF9lbWFpbBgHIAEoCUgEUgxjb250YWN0RW1haWyIAQESLAoPY29udGFjdF'
    '9hZGRyZXNzGAggASgJSAVSDmNvbnRhY3RBZGRyZXNziAEBEjAKBnN0YXR1cxgJIAEoDjIYLnN0'
    'b3JlLnYxLlN1cHBsaWVyU3RhdHVzUgZzdGF0dXMSGwoJc3RvcmVfaWRzGAogAygJUghzdG9yZU'
    'lkc0IJCgdfcmVmX2lkQg4KDF9kZXNjcmlwdGlvbkIPCg1fbG9nb19saW5rX2lkQhAKDl9jb250'
    'YWN0X3Bob25lQhAKDl9jb250YWN0X2VtYWlsQhIKEF9jb250YWN0X2FkZHJlc3M=');
