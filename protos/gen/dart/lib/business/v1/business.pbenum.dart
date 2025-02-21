//
//  Generated code. Do not modify.
//  source: business/v1/business.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BusinessStatusType extends $pb.ProtobufEnum {
  static const BusinessStatusType BUSINESS_STATUS_TYPE_UNSPECIFIED = BusinessStatusType._(0, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_UNSPECIFIED');
  static const BusinessStatusType BUSINESS_STATUS_TYPE_ACTIVE = BusinessStatusType._(1, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_ACTIVE');
  static const BusinessStatusType BUSINESS_STATUS_TYPE_DELETED = BusinessStatusType._(2, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_DELETED');

  static const $core.List<BusinessStatusType> values = <BusinessStatusType> [
    BUSINESS_STATUS_TYPE_UNSPECIFIED,
    BUSINESS_STATUS_TYPE_ACTIVE,
    BUSINESS_STATUS_TYPE_DELETED,
  ];

  static final $core.Map<$core.int, BusinessStatusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BusinessStatusType? valueOf($core.int value) => _byValue[value];

  const BusinessStatusType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
