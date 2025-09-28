// This is a generated file - do not edit.
//
// Generated from store/v1/supplier.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SupplierStatus extends $pb.ProtobufEnum {
  static const SupplierStatus SUPPLIER_STATUS_UNSPECIFIED =
      SupplierStatus._(0, _omitEnumNames ? '' : 'SUPPLIER_STATUS_UNSPECIFIED');

  /// / The product category is active.
  static const SupplierStatus SUPPLIER_STATUS_ACTIVE =
      SupplierStatus._(1, _omitEnumNames ? '' : 'SUPPLIER_STATUS_ACTIVE');

  /// / The product category is inactive.
  static const SupplierStatus SUPPLIER_STATUS_INACTIVE =
      SupplierStatus._(2, _omitEnumNames ? '' : 'SUPPLIER_STATUS_INACTIVE');

  static const $core.List<SupplierStatus> values = <SupplierStatus>[
    SUPPLIER_STATUS_UNSPECIFIED,
    SUPPLIER_STATUS_ACTIVE,
    SUPPLIER_STATUS_INACTIVE,
  ];

  static final $core.List<SupplierStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SupplierStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SupplierStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
