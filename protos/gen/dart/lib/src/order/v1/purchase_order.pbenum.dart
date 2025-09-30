// This is a generated file - do not edit.
//
// Generated from order/v1/purchase_order.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PurchaseOrderStatus extends $pb.ProtobufEnum {
  static const PurchaseOrderStatus PO_STATUS_UNSPECIFIED =
      PurchaseOrderStatus._(0, _omitEnumNames ? '' : 'PO_STATUS_UNSPECIFIED');
  static const PurchaseOrderStatus PO_STATUS_DRAFT =
      PurchaseOrderStatus._(1, _omitEnumNames ? '' : 'PO_STATUS_DRAFT');
  static const PurchaseOrderStatus PO_STATUS_PENDING =
      PurchaseOrderStatus._(2, _omitEnumNames ? '' : 'PO_STATUS_PENDING');
  static const PurchaseOrderStatus PO_STATUS_PARTIALLY_RECEIVED =
      PurchaseOrderStatus._(
          3, _omitEnumNames ? '' : 'PO_STATUS_PARTIALLY_RECEIVED');
  static const PurchaseOrderStatus PO_STATUS_RECEIVED =
      PurchaseOrderStatus._(4, _omitEnumNames ? '' : 'PO_STATUS_RECEIVED');
  static const PurchaseOrderStatus PO_STATUS_CANCELLED =
      PurchaseOrderStatus._(5, _omitEnumNames ? '' : 'PO_STATUS_CANCELLED');

  static const $core.List<PurchaseOrderStatus> values = <PurchaseOrderStatus>[
    PO_STATUS_UNSPECIFIED,
    PO_STATUS_DRAFT,
    PO_STATUS_PENDING,
    PO_STATUS_PARTIALLY_RECEIVED,
    PO_STATUS_RECEIVED,
    PO_STATUS_CANCELLED,
  ];

  static final $core.List<PurchaseOrderStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static PurchaseOrderStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PurchaseOrderStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
