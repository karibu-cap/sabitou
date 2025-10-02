// This is a generated file - do not edit.
//
// Generated from order/v1/order_utils.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use orderLineItemDescriptor instead')
const OrderLineItem$json = {
  '1': 'OrderLineItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 5, '10': 'quantity'},
    {
      '1': 'product_name',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Internationalized',
      '10': 'productName'
    },
    {'1': 'unit_price', '3': 4, '4': 1, '5': 1, '10': 'unitPrice'},
    {'1': 'total', '3': 5, '4': 1, '5': 1, '10': 'total'},
    {
      '1': 'batch_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'batchId',
      '17': true
    },
  ],
  '8': [
    {'1': '_batch_id'},
  ],
};

/// Descriptor for `OrderLineItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderLineItemDescriptor = $convert.base64Decode(
    'Cg1PcmRlckxpbmVJdGVtEh0KCnByb2R1Y3RfaWQYASABKAlSCXByb2R1Y3RJZBIaCghxdWFudG'
    'l0eRgCIAEoBVIIcXVhbnRpdHkSQgoMcHJvZHVjdF9uYW1lGAMgASgLMh8uaW52ZW50b3J5LnYx'
    'LkludGVybmF0aW9uYWxpemVkUgtwcm9kdWN0TmFtZRIdCgp1bml0X3ByaWNlGAQgASgBUgl1bm'
    'l0UHJpY2USFAoFdG90YWwYBSABKAFSBXRvdGFsEh4KCGJhdGNoX2lkGAYgASgJSABSB2JhdGNo'
    'SWSIAQFCCwoJX2JhdGNoX2lk');
