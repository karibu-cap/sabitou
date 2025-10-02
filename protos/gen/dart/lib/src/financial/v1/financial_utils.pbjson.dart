// This is a generated file - do not edit.
//
// Generated from financial/v1/financial_utils.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use invoiceLineItemDescriptor instead')
const InvoiceLineItem$json = {
  '1': 'InvoiceLineItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'unit_price', '3': 3, '4': 1, '5': 1, '10': 'unitPrice'},
    {'1': 'subtotal', '3': 4, '4': 1, '5': 1, '10': 'subtotal'},
    {'1': 'tax_rate', '3': 5, '4': 1, '5': 1, '10': 'taxRate'},
    {'1': 'tax_amount', '3': 6, '4': 1, '5': 1, '10': 'taxAmount'},
    {'1': 'total', '3': 7, '4': 1, '5': 1, '10': 'total'},
    {'1': 'batch_id', '3': 8, '4': 1, '5': 9, '10': 'batchId'},
    {
      '1': 'product_name',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Internationalized',
      '10': 'productName'
    },
  ],
};

/// Descriptor for `InvoiceLineItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invoiceLineItemDescriptor = $convert.base64Decode(
    'Cg9JbnZvaWNlTGluZUl0ZW0SHQoKcHJvZHVjdF9pZBgBIAEoCVIJcHJvZHVjdElkEhoKCHF1YW'
    '50aXR5GAIgASgFUghxdWFudGl0eRIdCgp1bml0X3ByaWNlGAMgASgBUgl1bml0UHJpY2USGgoI'
    'c3VidG90YWwYBCABKAFSCHN1YnRvdGFsEhkKCHRheF9yYXRlGAUgASgBUgd0YXhSYXRlEh0KCn'
    'RheF9hbW91bnQYBiABKAFSCXRheEFtb3VudBIUCgV0b3RhbBgHIAEoAVIFdG90YWwSGQoIYmF0'
    'Y2hfaWQYCCABKAlSB2JhdGNoSWQSQgoMcHJvZHVjdF9uYW1lGAkgASgLMh8uaW52ZW50b3J5Ln'
    'YxLkludGVybmF0aW9uYWxpemVkUgtwcm9kdWN0TmFtZQ==');
