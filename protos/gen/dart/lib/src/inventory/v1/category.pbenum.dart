// This is a generated file - do not edit.
//
// Generated from inventory/v1/category.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CategoryStatus extends $pb.ProtobufEnum {
  static const CategoryStatus CATEGORY_STATUS_UNSPECIFIED =
      CategoryStatus._(0, _omitEnumNames ? '' : 'CATEGORY_STATUS_UNSPECIFIED');

  /// / The product category is active.
  static const CategoryStatus CATEGORY_STATUS_ACTIVE =
      CategoryStatus._(1, _omitEnumNames ? '' : 'CATEGORY_STATUS_ACTIVE');

  /// / The product category is inactive.
  static const CategoryStatus CATEGORY_STATUS_INACTIVE =
      CategoryStatus._(2, _omitEnumNames ? '' : 'CATEGORY_STATUS_INACTIVE');

  static const $core.List<CategoryStatus> values = <CategoryStatus>[
    CATEGORY_STATUS_UNSPECIFIED,
    CATEGORY_STATUS_ACTIVE,
    CATEGORY_STATUS_INACTIVE,
  ];

  static final $core.List<CategoryStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CategoryStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CategoryStatus._(super.value, super.name);
}

class CategoryType extends $pb.ProtobufEnum {
  static const CategoryType CATEGORY_TYPE_UNSPECIFIED =
      CategoryType._(0, _omitEnumNames ? '' : 'CATEGORY_TYPE_UNSPECIFIED');
  static const CategoryType CATEGORY_TYPE_STORE =
      CategoryType._(1, _omitEnumNames ? '' : 'CATEGORY_TYPE_STORE');

  /// / The product category is activ.
  static const CategoryType CATEGORY_TYPE_BUSINESS =
      CategoryType._(2, _omitEnumNames ? '' : 'CATEGORY_TYPE_BUSINESS');

  /// / The product category is inactive.
  static const CategoryType CATEGORY_TYPE_PRODUCT =
      CategoryType._(3, _omitEnumNames ? '' : 'CATEGORY_TYPE_PRODUCT');

  static const $core.List<CategoryType> values = <CategoryType>[
    CATEGORY_TYPE_UNSPECIFIED,
    CATEGORY_TYPE_STORE,
    CATEGORY_TYPE_BUSINESS,
    CATEGORY_TYPE_PRODUCT,
  ];

  static final $core.List<CategoryType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CategoryType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CategoryType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
