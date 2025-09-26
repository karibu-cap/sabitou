// This is a generated file - do not edit.
//
// Generated from inventory/v1/category.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use categoryStatusDescriptor instead')
const CategoryStatus$json = {
  '1': 'CategoryStatus',
  '2': [
    {'1': 'CATEGORY_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'CATEGORY_STATUS_ACTIVE', '2': 1},
    {'1': 'CATEGORY_STATUS_INACTIVE', '2': 2},
  ],
};

/// Descriptor for `CategoryStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List categoryStatusDescriptor = $convert.base64Decode(
    'Cg5DYXRlZ29yeVN0YXR1cxIfChtDQVRFR09SWV9TVEFUVVNfVU5TUEVDSUZJRUQQABIaChZDQV'
    'RFR09SWV9TVEFUVVNfQUNUSVZFEAESHAoYQ0FURUdPUllfU1RBVFVTX0lOQUNUSVZFEAI=');

@$core.Deprecated('Use categoryTypeDescriptor instead')
const CategoryType$json = {
  '1': 'CategoryType',
  '2': [
    {'1': 'CATEGORY_TYPE_STORE', '2': 0},
    {'1': 'CATEGORY_TYPE_BUSINESS', '2': 1},
    {'1': 'CATEGORY_TYPE_PRODUCT', '2': 2},
  ],
};

/// Descriptor for `CategoryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List categoryTypeDescriptor = $convert.base64Decode(
    'CgxDYXRlZ29yeVR5cGUSFwoTQ0FURUdPUllfVFlQRV9TVE9SRRAAEhoKFkNBVEVHT1JZX1RZUE'
    'VfQlVTSU5FU1MQARIZChVDQVRFR09SWV9UWVBFX1BST0RVQ1QQAg==');

@$core.Deprecated('Use internationalizedDescriptor instead')
const Internationalized$json = {
  '1': 'Internationalized',
  '2': [
    {'1': 'en', '3': 1, '4': 1, '5': 9, '10': 'en'},
    {'1': 'fr', '3': 2, '4': 1, '5': 9, '10': 'fr'},
  ],
};

/// Descriptor for `Internationalized`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List internationalizedDescriptor = $convert.base64Decode(
    'ChFJbnRlcm5hdGlvbmFsaXplZBIOCgJlbhgBIAEoCVICZW4SDgoCZnIYAiABKAlSAmZy');

@$core.Deprecated('Use categoryDescriptor instead')
const Category$json = {
  '1': 'Category',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {
      '1': 'name',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Internationalized',
      '10': 'name'
    },
    {
      '1': 'parent_category_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'parentCategoryId',
      '17': true
    },
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.CategoryStatus',
      '10': 'status'
    },
    {
      '1': 'type',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.CategoryType',
      '10': 'type'
    },
    {
      '1': 'business_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 2,
      '10': 'businessId',
      '17': true
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
      '1': 'updated_at',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 3,
      '10': 'updatedAt',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_parent_category_id'},
    {'1': '_business_id'},
    {'1': '_updated_at'},
  ],
};

/// Descriptor for `Category`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoryDescriptor = $convert.base64Decode(
    'CghDYXRlZ29yeRIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESMwoEbmFtZRgCIAEoCzIfLm'
    'ludmVudG9yeS52MS5JbnRlcm5hdGlvbmFsaXplZFIEbmFtZRIxChJwYXJlbnRfY2F0ZWdvcnlf'
    'aWQYAyABKAlIAVIQcGFyZW50Q2F0ZWdvcnlJZIgBARI0CgZzdGF0dXMYBCABKA4yHC5pbnZlbn'
    'RvcnkudjEuQ2F0ZWdvcnlTdGF0dXNSBnN0YXR1cxIuCgR0eXBlGAUgASgOMhouaW52ZW50b3J5'
    'LnYxLkNhdGVnb3J5VHlwZVIEdHlwZRIwCgtidXNpbmVzc19pZBgGIAEoCUIKukgHyAEBcgIQBk'
    'gCUgpidXNpbmVzc0lkiAEBEjkKCmNyZWF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYu'
    'VGltZXN0YW1wUgljcmVhdGVkQXQSPgoKdXBkYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBIA1IJdXBkYXRlZEF0iAEBQgkKB19yZWZfaWRCFQoTX3BhcmVudF9jYXRl'
    'Z29yeV9pZEIOCgxfYnVzaW5lc3NfaWRCDQoLX3VwZGF0ZWRfYXQ=');

@$core.Deprecated('Use findCategoriesRequestDescriptor instead')
const FindCategoriesRequest$json = {
  '1': 'FindCategoriesRequest',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
    {'1': 'ref_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'name', '17': true},
    {
      '1': 'parent_category_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'parentCategoryId',
      '17': true
    },
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.CategoryStatus',
      '9': 3,
      '10': 'status',
      '17': true
    },
    {
      '1': 'type',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.CategoryType',
      '9': 4,
      '10': 'type',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_name'},
    {'1': '_parent_category_id'},
    {'1': '_status'},
    {'1': '_type'},
  ],
};

/// Descriptor for `FindCategoriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findCategoriesRequestDescriptor = $convert.base64Decode(
    'ChVGaW5kQ2F0ZWdvcmllc1JlcXVlc3QSKwoLYnVzaW5lc3NfaWQYASABKAlCCrpIB8gBAXICEA'
    'NSCmJ1c2luZXNzSWQSGgoGcmVmX2lkGAIgASgJSABSBXJlZklkiAEBEhcKBG5hbWUYAyABKAlI'
    'AVIEbmFtZYgBARIxChJwYXJlbnRfY2F0ZWdvcnlfaWQYBCABKAlIAlIQcGFyZW50Q2F0ZWdvcn'
    'lJZIgBARI5CgZzdGF0dXMYBSABKA4yHC5pbnZlbnRvcnkudjEuQ2F0ZWdvcnlTdGF0dXNIA1IG'
    'c3RhdHVziAEBEjMKBHR5cGUYBiABKA4yGi5pbnZlbnRvcnkudjEuQ2F0ZWdvcnlUeXBlSARSBH'
    'R5cGWIAQFCCQoHX3JlZl9pZEIHCgVfbmFtZUIVChNfcGFyZW50X2NhdGVnb3J5X2lkQgkKB19z'
    'dGF0dXNCBwoFX3R5cGU=');

@$core.Deprecated('Use findCategoriesResponseDescriptor instead')
const FindCategoriesResponse$json = {
  '1': 'FindCategoriesResponse',
  '2': [
    {
      '1': 'categories',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.Category',
      '10': 'categories'
    },
  ],
};

/// Descriptor for `FindCategoriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findCategoriesResponseDescriptor =
    $convert.base64Decode(
        'ChZGaW5kQ2F0ZWdvcmllc1Jlc3BvbnNlEjYKCmNhdGVnb3JpZXMYASADKAsyFi5pbnZlbnRvcn'
        'kudjEuQ2F0ZWdvcnlSCmNhdGVnb3JpZXM=');

@$core.Deprecated('Use createCategoryRequestDescriptor instead')
const CreateCategoryRequest$json = {
  '1': 'CreateCategoryRequest',
  '2': [
    {
      '1': 'category',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Category',
      '10': 'category'
    },
  ],
};

/// Descriptor for `CreateCategoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCategoryRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVDYXRlZ29yeVJlcXVlc3QSMgoIY2F0ZWdvcnkYASABKAsyFi5pbnZlbnRvcnkudj'
    'EuQ2F0ZWdvcnlSCGNhdGVnb3J5');

@$core.Deprecated('Use createCategoryResponseDescriptor instead')
const CreateCategoryResponse$json = {
  '1': 'CreateCategoryResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateCategoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCategoryResponseDescriptor =
    $convert.base64Decode(
        'ChZDcmVhdGVDYXRlZ29yeVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use updateCategoryRequestDescriptor instead')
const UpdateCategoryRequest$json = {
  '1': 'UpdateCategoryRequest',
  '2': [
    {'1': 'category_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'categoryId'},
    {
      '1': 'category',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Category',
      '10': 'category'
    },
  ],
};

/// Descriptor for `UpdateCategoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCategoryRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVDYXRlZ29yeVJlcXVlc3QSKwoLY2F0ZWdvcnlfaWQYASABKAlCCrpIB8gBAXICEA'
    'NSCmNhdGVnb3J5SWQSMgoIY2F0ZWdvcnkYAiABKAsyFi5pbnZlbnRvcnkudjEuQ2F0ZWdvcnlS'
    'CGNhdGVnb3J5');

@$core.Deprecated('Use updateCategoryResponseDescriptor instead')
const UpdateCategoryResponse$json = {
  '1': 'UpdateCategoryResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateCategoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCategoryResponseDescriptor =
    $convert.base64Decode(
        'ChZVcGRhdGVDYXRlZ29yeVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use deleteCategoryRequestDescriptor instead')
const DeleteCategoryRequest$json = {
  '1': 'DeleteCategoryRequest',
  '2': [
    {'1': 'category_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'categoryId'},
  ],
};

/// Descriptor for `DeleteCategoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCategoryRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVDYXRlZ29yeVJlcXVlc3QSKwoLY2F0ZWdvcnlfaWQYASABKAlCCrpIB8gBAXICEA'
    'NSCmNhdGVnb3J5SWQ=');

@$core.Deprecated('Use deleteCategoryResponseDescriptor instead')
const DeleteCategoryResponse$json = {
  '1': 'DeleteCategoryResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteCategoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCategoryResponseDescriptor =
    $convert.base64Decode(
        'ChZEZWxldGVDYXRlZ29yeVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use getCategoryRequestDescriptor instead')
const GetCategoryRequest$json = {
  '1': 'GetCategoryRequest',
  '2': [
    {'1': 'category_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'categoryId'},
  ],
};

/// Descriptor for `GetCategoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCategoryRequestDescriptor = $convert.base64Decode(
    'ChJHZXRDYXRlZ29yeVJlcXVlc3QSKwoLY2F0ZWdvcnlfaWQYASABKAlCCrpIB8gBAXICEANSCm'
    'NhdGVnb3J5SWQ=');

@$core.Deprecated('Use getCategoryResponseDescriptor instead')
const GetCategoryResponse$json = {
  '1': 'GetCategoryResponse',
  '2': [
    {
      '1': 'category',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Category',
      '10': 'category'
    },
  ],
};

/// Descriptor for `GetCategoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCategoryResponseDescriptor = $convert.base64Decode(
    'ChNHZXRDYXRlZ29yeVJlc3BvbnNlEjIKCGNhdGVnb3J5GAEgASgLMhYuaW52ZW50b3J5LnYxLk'
    'NhdGVnb3J5UghjYXRlZ29yeQ==');

const $core.Map<$core.String, $core.dynamic> CategoryServiceBase$json = {
  '1': 'CategoryService',
  '2': [
    {
      '1': 'CreateCategory',
      '2': '.inventory.v1.CreateCategoryRequest',
      '3': '.inventory.v1.CreateCategoryResponse'
    },
    {
      '1': 'UpdateCategory',
      '2': '.inventory.v1.UpdateCategoryRequest',
      '3': '.inventory.v1.UpdateCategoryResponse'
    },
    {
      '1': 'DeleteCategory',
      '2': '.inventory.v1.DeleteCategoryRequest',
      '3': '.inventory.v1.DeleteCategoryResponse'
    },
    {
      '1': 'FindCategories',
      '2': '.inventory.v1.FindCategoriesRequest',
      '3': '.inventory.v1.FindCategoriesResponse'
    },
    {
      '1': 'GetCategory',
      '2': '.inventory.v1.GetCategoryRequest',
      '3': '.inventory.v1.GetCategoryResponse'
    },
  ],
};

@$core.Deprecated('Use categoryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    CategoryServiceBase$messageJson = {
  '.inventory.v1.CreateCategoryRequest': CreateCategoryRequest$json,
  '.inventory.v1.Category': Category$json,
  '.inventory.v1.Internationalized': Internationalized$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.inventory.v1.CreateCategoryResponse': CreateCategoryResponse$json,
  '.inventory.v1.UpdateCategoryRequest': UpdateCategoryRequest$json,
  '.inventory.v1.UpdateCategoryResponse': UpdateCategoryResponse$json,
  '.inventory.v1.DeleteCategoryRequest': DeleteCategoryRequest$json,
  '.inventory.v1.DeleteCategoryResponse': DeleteCategoryResponse$json,
  '.inventory.v1.FindCategoriesRequest': FindCategoriesRequest$json,
  '.inventory.v1.FindCategoriesResponse': FindCategoriesResponse$json,
  '.inventory.v1.GetCategoryRequest': GetCategoryRequest$json,
  '.inventory.v1.GetCategoryResponse': GetCategoryResponse$json,
};

/// Descriptor for `CategoryService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List categoryServiceDescriptor = $convert.base64Decode(
    'Cg9DYXRlZ29yeVNlcnZpY2USWwoOQ3JlYXRlQ2F0ZWdvcnkSIy5pbnZlbnRvcnkudjEuQ3JlYX'
    'RlQ2F0ZWdvcnlSZXF1ZXN0GiQuaW52ZW50b3J5LnYxLkNyZWF0ZUNhdGVnb3J5UmVzcG9uc2US'
    'WwoOVXBkYXRlQ2F0ZWdvcnkSIy5pbnZlbnRvcnkudjEuVXBkYXRlQ2F0ZWdvcnlSZXF1ZXN0Gi'
    'QuaW52ZW50b3J5LnYxLlVwZGF0ZUNhdGVnb3J5UmVzcG9uc2USWwoORGVsZXRlQ2F0ZWdvcnkS'
    'Iy5pbnZlbnRvcnkudjEuRGVsZXRlQ2F0ZWdvcnlSZXF1ZXN0GiQuaW52ZW50b3J5LnYxLkRlbG'
    'V0ZUNhdGVnb3J5UmVzcG9uc2USWwoORmluZENhdGVnb3JpZXMSIy5pbnZlbnRvcnkudjEuRmlu'
    'ZENhdGVnb3JpZXNSZXF1ZXN0GiQuaW52ZW50b3J5LnYxLkZpbmRDYXRlZ29yaWVzUmVzcG9uc2'
    'USUgoLR2V0Q2F0ZWdvcnkSIC5pbnZlbnRvcnkudjEuR2V0Q2F0ZWdvcnlSZXF1ZXN0GiEuaW52'
    'ZW50b3J5LnYxLkdldENhdGVnb3J5UmVzcG9uc2U=');
