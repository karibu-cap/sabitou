// This is a generated file - do not edit.
//
// Generated from payments/v1/payment_utils.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use paymentMethodDescriptor instead')
const PaymentMethod$json = {
  '1': 'PaymentMethod',
  '2': [
    {'1': 'PAYMENT_METHOD_UNSPECIFIED', '2': 0},
    {'1': 'PAYMENT_METHOD_CASH', '2': 1},
    {'1': 'PAYMENT_METHOD_CHECK', '2': 2},
    {'1': 'PAYMENT_METHOD_BANK_TRANSFER', '2': 3},
    {'1': 'PAYMENT_METHOD_CREDIT_CARD', '2': 4},
    {'1': 'PAYMENT_METHOD_MOBILE_MONEY', '2': 5},
    {'1': 'PAYMENT_METHOD_STORE_CREDIT', '2': 6},
  ],
};

/// Descriptor for `PaymentMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paymentMethodDescriptor = $convert.base64Decode(
    'Cg1QYXltZW50TWV0aG9kEh4KGlBBWU1FTlRfTUVUSE9EX1VOU1BFQ0lGSUVEEAASFwoTUEFZTU'
    'VOVF9NRVRIT0RfQ0FTSBABEhgKFFBBWU1FTlRfTUVUSE9EX0NIRUNLEAISIAocUEFZTUVOVF9N'
    'RVRIT0RfQkFOS19UUkFOU0ZFUhADEh4KGlBBWU1FTlRfTUVUSE9EX0NSRURJVF9DQVJEEAQSHw'
    'obUEFZTUVOVF9NRVRIT0RfTU9CSUxFX01PTkVZEAUSHwobUEFZTUVOVF9NRVRIT0RfU1RPUkVf'
    'Q1JFRElUEAY=');
