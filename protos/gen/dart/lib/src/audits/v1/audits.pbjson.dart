// This is a generated file - do not edit.
//
// Generated from audits/v1/audits.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/timestamp.pbjson.dart' as $2;
import 'inventory_transaction.pbjson.dart' as $0;
import 'voucher_transaction.pbjson.dart' as $1;

@$core
    .Deprecated('Use getInventoryTransactionAuditLogsRequestDescriptor instead')
const GetInventoryTransactionAuditLogsRequest$json = {
  '1': 'GetInventoryTransactionAuditLogsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `GetInventoryTransactionAuditLogsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInventoryTransactionAuditLogsRequestDescriptor =
    $convert.base64Decode(
        'CidHZXRJbnZlbnRvcnlUcmFuc2FjdGlvbkF1ZGl0TG9nc1JlcXVlc3QSIQoIc3RvcmVfaWQYAS'
        'ABKAlCBrpIA8gBAVIHc3RvcmVJZA==');

@$core.Deprecated(
    'Use getInventoryTransactionAuditLogsResponseDescriptor instead')
const GetInventoryTransactionAuditLogsResponse$json = {
  '1': 'GetInventoryTransactionAuditLogsResponse',
  '2': [
    {
      '1': 'inventory_transactions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.audits.v1.InventoryTransaction',
      '10': 'inventoryTransactions'
    },
  ],
};

/// Descriptor for `GetInventoryTransactionAuditLogsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInventoryTransactionAuditLogsResponseDescriptor =
    $convert.base64Decode(
        'CihHZXRJbnZlbnRvcnlUcmFuc2FjdGlvbkF1ZGl0TG9nc1Jlc3BvbnNlElYKFmludmVudG9yeV'
        '90cmFuc2FjdGlvbnMYASADKAsyHy5hdWRpdHMudjEuSW52ZW50b3J5VHJhbnNhY3Rpb25SFWlu'
        'dmVudG9yeVRyYW5zYWN0aW9ucw==');

@$core.Deprecated('Use getVoucherTransactionAuditLogsRequestDescriptor instead')
const GetVoucherTransactionAuditLogsRequest$json = {
  '1': 'GetVoucherTransactionAuditLogsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `GetVoucherTransactionAuditLogsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherTransactionAuditLogsRequestDescriptor =
    $convert.base64Decode(
        'CiVHZXRWb3VjaGVyVHJhbnNhY3Rpb25BdWRpdExvZ3NSZXF1ZXN0EiEKCHN0b3JlX2lkGAEgAS'
        'gJQga6SAPIAQFSB3N0b3JlSWQ=');

@$core
    .Deprecated('Use getVoucherTransactionAuditLogsResponseDescriptor instead')
const GetVoucherTransactionAuditLogsResponse$json = {
  '1': 'GetVoucherTransactionAuditLogsResponse',
  '2': [
    {
      '1': 'voucher_transactions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.audits.v1.VoucherTransaction',
      '10': 'voucherTransactions'
    },
  ],
};

/// Descriptor for `GetVoucherTransactionAuditLogsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherTransactionAuditLogsResponseDescriptor =
    $convert.base64Decode(
        'CiZHZXRWb3VjaGVyVHJhbnNhY3Rpb25BdWRpdExvZ3NSZXNwb25zZRJQChR2b3VjaGVyX3RyYW'
        '5zYWN0aW9ucxgBIAMoCzIdLmF1ZGl0cy52MS5Wb3VjaGVyVHJhbnNhY3Rpb25SE3ZvdWNoZXJU'
        'cmFuc2FjdGlvbnM=');

const $core.Map<$core.String, $core.dynamic> AuditsServiceBase$json = {
  '1': 'AuditsService',
  '2': [
    {
      '1': 'GetInventoryTransactionAuditLogs',
      '2': '.audits.v1.GetInventoryTransactionAuditLogsRequest',
      '3': '.audits.v1.GetInventoryTransactionAuditLogsResponse'
    },
    {
      '1': 'GetVoucherTransactionAuditLogs',
      '2': '.audits.v1.GetVoucherTransactionAuditLogsRequest',
      '3': '.audits.v1.GetVoucherTransactionAuditLogsResponse'
    },
  ],
};

@$core.Deprecated('Use auditsServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    AuditsServiceBase$messageJson = {
  '.audits.v1.GetInventoryTransactionAuditLogsRequest':
      GetInventoryTransactionAuditLogsRequest$json,
  '.audits.v1.GetInventoryTransactionAuditLogsResponse':
      GetInventoryTransactionAuditLogsResponse$json,
  '.audits.v1.InventoryTransaction': $0.InventoryTransaction$json,
  '.google.protobuf.Timestamp': $2.Timestamp$json,
  '.audits.v1.GetVoucherTransactionAuditLogsRequest':
      GetVoucherTransactionAuditLogsRequest$json,
  '.audits.v1.GetVoucherTransactionAuditLogsResponse':
      GetVoucherTransactionAuditLogsResponse$json,
  '.audits.v1.VoucherTransaction': $1.VoucherTransaction$json,
};

/// Descriptor for `AuditsService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List auditsServiceDescriptor = $convert.base64Decode(
    'Cg1BdWRpdHNTZXJ2aWNlEosBCiBHZXRJbnZlbnRvcnlUcmFuc2FjdGlvbkF1ZGl0TG9ncxIyLm'
    'F1ZGl0cy52MS5HZXRJbnZlbnRvcnlUcmFuc2FjdGlvbkF1ZGl0TG9nc1JlcXVlc3QaMy5hdWRp'
    'dHMudjEuR2V0SW52ZW50b3J5VHJhbnNhY3Rpb25BdWRpdExvZ3NSZXNwb25zZRKFAQoeR2V0Vm'
    '91Y2hlclRyYW5zYWN0aW9uQXVkaXRMb2dzEjAuYXVkaXRzLnYxLkdldFZvdWNoZXJUcmFuc2Fj'
    'dGlvbkF1ZGl0TG9nc1JlcXVlc3QaMS5hdWRpdHMudjEuR2V0Vm91Y2hlclRyYW5zYWN0aW9uQX'
    'VkaXRMb2dzUmVzcG9uc2U=');
