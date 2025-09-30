// This is a generated file - do not edit.
//
// Generated from inventory/v1/store_product.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GlobalProductStatus extends $pb.ProtobufEnum {
  static const GlobalProductStatus GLOBAL_PRODUCT_STATUS_UNSPECIFIED =
      GlobalProductStatus._(
          0, _omitEnumNames ? '' : 'GLOBAL_PRODUCT_STATUS_UNSPECIFIED');

  /// / The product category is active.
  static const GlobalProductStatus GLOBAL_PRODUCT_STATUS_ACTIVE =
      GlobalProductStatus._(
          1, _omitEnumNames ? '' : 'GLOBAL_PRODUCT_STATUS_ACTIVE');

  /// / The product category is inactive.
  static const GlobalProductStatus GLOBAL_PRODUCT_STATUS_INACTIVE =
      GlobalProductStatus._(
          2, _omitEnumNames ? '' : 'GLOBAL_PRODUCT_STATUS_INACTIVE');

  static const $core.List<GlobalProductStatus> values = <GlobalProductStatus>[
    GLOBAL_PRODUCT_STATUS_UNSPECIFIED,
    GLOBAL_PRODUCT_STATUS_ACTIVE,
    GLOBAL_PRODUCT_STATUS_INACTIVE,
  ];

  static final $core.List<GlobalProductStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GlobalProductStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GlobalProductStatus._(super.value, super.name);
}

class ProductStatus extends $pb.ProtobufEnum {
  static const ProductStatus PRODUCT_STATUS_UNSPECIFIED =
      ProductStatus._(0, _omitEnumNames ? '' : 'PRODUCT_STATUS_UNSPECIFIED');
  static const ProductStatus PRODUCT_STATUS_ACTIVE =
      ProductStatus._(1, _omitEnumNames ? '' : 'PRODUCT_STATUS_ACTIVE');
  static const ProductStatus PRODUCT_STATUS_INACTIVE =
      ProductStatus._(2, _omitEnumNames ? '' : 'PRODUCT_STATUS_INACTIVE');

  static const $core.List<ProductStatus> values = <ProductStatus>[
    PRODUCT_STATUS_UNSPECIFIED,
    PRODUCT_STATUS_ACTIVE,
    PRODUCT_STATUS_INACTIVE,
  ];

  static final $core.List<ProductStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ProductStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProductStatus._(super.value, super.name);
}

class ExpirationType extends $pb.ProtobufEnum {
  static const ExpirationType EXPIRATION_TYPE_UNSPECIFIED =
      ExpirationType._(0, _omitEnumNames ? '' : 'EXPIRATION_TYPE_UNSPECIFIED');
  static const ExpirationType EXPIRATION_TYPE_NONE =
      ExpirationType._(1, _omitEnumNames ? '' : 'EXPIRATION_TYPE_NONE');
  static const ExpirationType EXPIRATION_TYPE_PRODUCT_LEVEL = ExpirationType._(
      2, _omitEnumNames ? '' : 'EXPIRATION_TYPE_PRODUCT_LEVEL');
  static const ExpirationType EXPIRATION_TYPE_LOT_LEVEL =
      ExpirationType._(3, _omitEnumNames ? '' : 'EXPIRATION_TYPE_LOT_LEVEL');

  static const $core.List<ExpirationType> values = <ExpirationType>[
    EXPIRATION_TYPE_UNSPECIFIED,
    EXPIRATION_TYPE_NONE,
    EXPIRATION_TYPE_PRODUCT_LEVEL,
    EXPIRATION_TYPE_LOT_LEVEL,
  ];

  static final $core.List<ExpirationType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ExpirationType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ExpirationType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
