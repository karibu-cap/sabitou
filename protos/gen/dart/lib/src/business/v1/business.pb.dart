// This is a generated file - do not edit.
//
// Generated from business/v1/business.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $1;
import '../../identity/v1/permission.pb.dart' as $0;
import '../../link/v1/link.pb.dart' as $2;
import 'business.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'business.pbenum.dart';

class Business extends $pb.GeneratedMessage {
  factory Business({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    BusinessStatusType? status,
    $core.String? ownerId,
    $core.String? logoLinkId,
    $core.String? countryCode,
    $core.String? currencyCode,
    $core.Iterable<$core.String>? externalLinksIds,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (status != null) result.status = status;
    if (ownerId != null) result.ownerId = ownerId;
    if (logoLinkId != null) result.logoLinkId = logoLinkId;
    if (countryCode != null) result.countryCode = countryCode;
    if (currencyCode != null) result.currencyCode = currencyCode;
    if (externalLinksIds != null)
      result.externalLinksIds.addAll(externalLinksIds);
    return result;
  }

  Business._();

  factory Business.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Business.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Business',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..e<BusinessStatusType>(
        4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: BusinessStatusType.BUSINESS_STATUS_TYPE_UNSPECIFIED,
        valueOf: BusinessStatusType.valueOf,
        enumValues: BusinessStatusType.values)
    ..aOS(5, _omitFieldNames ? '' : 'ownerId')
    ..aOS(6, _omitFieldNames ? '' : 'logoLinkId')
    ..aOS(7, _omitFieldNames ? '' : 'countryCode')
    ..aOS(8, _omitFieldNames ? '' : 'currencyCode')
    ..pPS(9, _omitFieldNames ? '' : 'externalLinksIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Business clone() => Business()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Business copyWith(void Function(Business) updates) =>
      super.copyWith((message) => updates(message as Business)) as Business;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Business create() => Business._();
  @$core.override
  Business createEmptyInstance() => create();
  static $pb.PbList<Business> createRepeated() => $pb.PbList<Business>();
  @$core.pragma('dart2js:noInline')
  static Business getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Business>(create);
  static Business? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The name of the business.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// The description of the business.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// The status of the business.
  @$pb.TagNumber(4)
  BusinessStatusType get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(BusinessStatusType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  /// The id of the owner of the business.
  @$pb.TagNumber(5)
  $core.String get ownerId => $_getSZ(4);
  @$pb.TagNumber(5)
  set ownerId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOwnerId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnerId() => $_clearField(5);

  /// The id of the media of the logo of the business.
  @$pb.TagNumber(6)
  $core.String get logoLinkId => $_getSZ(5);
  @$pb.TagNumber(6)
  set logoLinkId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLogoLinkId() => $_has(5);
  @$pb.TagNumber(6)
  void clearLogoLinkId() => $_clearField(6);

  /// The ISO 3166-1 alpha-2 country code of the business.
  /// e.g. CM, US, GB, etc.
  @$pb.TagNumber(7)
  $core.String get countryCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set countryCode($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCountryCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountryCode() => $_clearField(7);

  /// The ISO 4217 currency code of the business.
  /// For example: XAF, USD, EUR, etc.
  /// Note: All price in the business will be in this currency.
  @$pb.TagNumber(8)
  $core.String get currencyCode => $_getSZ(7);
  @$pb.TagNumber(8)
  set currencyCode($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCurrencyCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurrencyCode() => $_clearField(8);

  /// The media ids of different links of the business.
  /// It can be social media links, website links, etc.
  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get externalLinksIds => $_getList(8);
}

class BusinessMember extends $pb.GeneratedMessage {
  factory BusinessMember({
    $core.String? userId,
    $core.String? businessId,
    $core.Iterable<$0.BusinessPermission>? permissions,
    $1.Timestamp? memberSince,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    if (permissions != null) result.permissions.addAll(permissions);
    if (memberSince != null) result.memberSince = memberSince;
    return result;
  }

  BusinessMember._();

  factory BusinessMember.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusinessMember.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusinessMember',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..pc<$0.BusinessPermission>(
        3, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM,
        subBuilder: $0.BusinessPermission.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'memberSince',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessMember clone() => BusinessMember()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessMember copyWith(void Function(BusinessMember) updates) =>
      super.copyWith((message) => updates(message as BusinessMember))
          as BusinessMember;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessMember create() => BusinessMember._();
  @$core.override
  BusinessMember createEmptyInstance() => create();
  static $pb.PbList<BusinessMember> createRepeated() =>
      $pb.PbList<BusinessMember>();
  @$core.pragma('dart2js:noInline')
  static BusinessMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessMember>(create);
  static BusinessMember? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// The permissions that the user has.
  @$pb.TagNumber(3)
  $pb.PbList<$0.BusinessPermission> get permissions => $_getList(2);

  /// The date since when the user became a member.
  @$pb.TagNumber(4)
  $1.Timestamp get memberSince => $_getN(3);
  @$pb.TagNumber(4)
  set memberSince($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMemberSince() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberSince() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureMemberSince() => $_ensure(3);
}

class CreateBusinessRequest extends $pb.GeneratedMessage {
  factory CreateBusinessRequest({
    Business? business,
    $core.List<$core.int>? logoRawImage,
    $core.Iterable<$2.ResourceLink>? externalLinks,
  }) {
    final result = create();
    if (business != null) result.business = business;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    if (externalLinks != null) result.externalLinks.addAll(externalLinks);
    return result;
  }

  CreateBusinessRequest._();

  factory CreateBusinessRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBusinessRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBusinessRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business',
        subBuilder: Business.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..pc<$2.ResourceLink>(
        3, _omitFieldNames ? '' : 'externalLinks', $pb.PbFieldType.PM,
        subBuilder: $2.ResourceLink.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessRequest clone() =>
      CreateBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessRequest copyWith(
          void Function(CreateBusinessRequest) updates) =>
      super.copyWith((message) => updates(message as CreateBusinessRequest))
          as CreateBusinessRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessRequest create() => CreateBusinessRequest._();
  @$core.override
  CreateBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessRequest> createRepeated() =>
      $pb.PbList<CreateBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBusinessRequest>(create);
  static CreateBusinessRequest? _defaultInstance;

  /// The business information to create.
  /// Note:Only the fields that are set will be created.
  @$pb.TagNumber(1)
  Business get business => $_getN(0);
  @$pb.TagNumber(1)
  set business(Business value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBusiness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusiness() => $_clearField(1);
  @$pb.TagNumber(1)
  Business ensureBusiness() => $_ensure(0);

  /// The raw image of the logo of the business.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);

  /// The links of the business.
  @$pb.TagNumber(3)
  $pb.PbList<$2.ResourceLink> get externalLinks => $_getList(2);
}

class CreateBusinessResponse extends $pb.GeneratedMessage {
  factory CreateBusinessResponse({
    $core.String? businessId,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  CreateBusinessResponse._();

  factory CreateBusinessResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBusinessResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBusinessResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessResponse clone() =>
      CreateBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessResponse copyWith(
          void Function(CreateBusinessResponse) updates) =>
      super.copyWith((message) => updates(message as CreateBusinessResponse))
          as CreateBusinessResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessResponse create() => CreateBusinessResponse._();
  @$core.override
  CreateBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessResponse> createRepeated() =>
      $pb.PbList<CreateBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBusinessResponse>(create);
  static CreateBusinessResponse? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);
}

class ChangeBusinessCurrencyRequest extends $pb.GeneratedMessage {
  factory ChangeBusinessCurrencyRequest({
    CurrencyChangePolicyType? currencyChangePolicy,
    $core.String? businessId,
    $core.String? countryCode,
  }) {
    final result = create();
    if (currencyChangePolicy != null)
      result.currencyChangePolicy = currencyChangePolicy;
    if (businessId != null) result.businessId = businessId;
    if (countryCode != null) result.countryCode = countryCode;
    return result;
  }

  ChangeBusinessCurrencyRequest._();

  factory ChangeBusinessCurrencyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChangeBusinessCurrencyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangeBusinessCurrencyRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..e<CurrencyChangePolicyType>(
        1, _omitFieldNames ? '' : 'currencyChangePolicy', $pb.PbFieldType.OE,
        defaultOrMaker:
            CurrencyChangePolicyType.CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED,
        valueOf: CurrencyChangePolicyType.valueOf,
        enumValues: CurrencyChangePolicyType.values)
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..aOS(3, _omitFieldNames ? '' : 'countryCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeBusinessCurrencyRequest clone() =>
      ChangeBusinessCurrencyRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeBusinessCurrencyRequest copyWith(
          void Function(ChangeBusinessCurrencyRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ChangeBusinessCurrencyRequest))
          as ChangeBusinessCurrencyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeBusinessCurrencyRequest create() =>
      ChangeBusinessCurrencyRequest._();
  @$core.override
  ChangeBusinessCurrencyRequest createEmptyInstance() => create();
  static $pb.PbList<ChangeBusinessCurrencyRequest> createRepeated() =>
      $pb.PbList<ChangeBusinessCurrencyRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangeBusinessCurrencyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangeBusinessCurrencyRequest>(create);
  static ChangeBusinessCurrencyRequest? _defaultInstance;

  /// The policy to apply when changing the currency
  /// This field is required on currency change.
  @$pb.TagNumber(1)
  CurrencyChangePolicyType get currencyChangePolicy => $_getN(0);
  @$pb.TagNumber(1)
  set currencyChangePolicy(CurrencyChangePolicyType value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrencyChangePolicy() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrencyChangePolicy() => $_clearField(1);

  /// The unique ref id of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// The ISO 3166-1 alpha-2 country code of the business.
  /// e.g. CM, US, GB, etc.
  @$pb.TagNumber(3)
  $core.String get countryCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set countryCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCountryCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountryCode() => $_clearField(3);
}

class ChangeBusinessCurrencyResponse extends $pb.GeneratedMessage {
  factory ChangeBusinessCurrencyResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  ChangeBusinessCurrencyResponse._();

  factory ChangeBusinessCurrencyResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChangeBusinessCurrencyResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangeBusinessCurrencyResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeBusinessCurrencyResponse clone() =>
      ChangeBusinessCurrencyResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeBusinessCurrencyResponse copyWith(
          void Function(ChangeBusinessCurrencyResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ChangeBusinessCurrencyResponse))
          as ChangeBusinessCurrencyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeBusinessCurrencyResponse create() =>
      ChangeBusinessCurrencyResponse._();
  @$core.override
  ChangeBusinessCurrencyResponse createEmptyInstance() => create();
  static $pb.PbList<ChangeBusinessCurrencyResponse> createRepeated() =>
      $pb.PbList<ChangeBusinessCurrencyResponse>();
  @$core.pragma('dart2js:noInline')
  static ChangeBusinessCurrencyResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangeBusinessCurrencyResponse>(create);
  static ChangeBusinessCurrencyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class GetMyBusinessesRequest extends $pb.GeneratedMessage {
  factory GetMyBusinessesRequest() => create();

  GetMyBusinessesRequest._();

  factory GetMyBusinessesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMyBusinessesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMyBusinessesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMyBusinessesRequest clone() =>
      GetMyBusinessesRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMyBusinessesRequest copyWith(
          void Function(GetMyBusinessesRequest) updates) =>
      super.copyWith((message) => updates(message as GetMyBusinessesRequest))
          as GetMyBusinessesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMyBusinessesRequest create() => GetMyBusinessesRequest._();
  @$core.override
  GetMyBusinessesRequest createEmptyInstance() => create();
  static $pb.PbList<GetMyBusinessesRequest> createRepeated() =>
      $pb.PbList<GetMyBusinessesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMyBusinessesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMyBusinessesRequest>(create);
  static GetMyBusinessesRequest? _defaultInstance;
}

class GetMyBusinessesResponse extends $pb.GeneratedMessage {
  factory GetMyBusinessesResponse({
    $core.Iterable<Business>? businesses,
  }) {
    final result = create();
    if (businesses != null) result.businesses.addAll(businesses);
    return result;
  }

  GetMyBusinessesResponse._();

  factory GetMyBusinessesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMyBusinessesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMyBusinessesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..pc<Business>(1, _omitFieldNames ? '' : 'businesses', $pb.PbFieldType.PM,
        subBuilder: Business.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMyBusinessesResponse clone() =>
      GetMyBusinessesResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMyBusinessesResponse copyWith(
          void Function(GetMyBusinessesResponse) updates) =>
      super.copyWith((message) => updates(message as GetMyBusinessesResponse))
          as GetMyBusinessesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMyBusinessesResponse create() => GetMyBusinessesResponse._();
  @$core.override
  GetMyBusinessesResponse createEmptyInstance() => create();
  static $pb.PbList<GetMyBusinessesResponse> createRepeated() =>
      $pb.PbList<GetMyBusinessesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMyBusinessesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMyBusinessesResponse>(create);
  static GetMyBusinessesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Business> get businesses => $_getList(0);
}

class GetBusinessDetailsRequest extends $pb.GeneratedMessage {
  factory GetBusinessDetailsRequest({
    $core.String? businessId,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  GetBusinessDetailsRequest._();

  factory GetBusinessDetailsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessDetailsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessDetailsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessDetailsRequest clone() =>
      GetBusinessDetailsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessDetailsRequest copyWith(
          void Function(GetBusinessDetailsRequest) updates) =>
      super.copyWith((message) => updates(message as GetBusinessDetailsRequest))
          as GetBusinessDetailsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessDetailsRequest create() => GetBusinessDetailsRequest._();
  @$core.override
  GetBusinessDetailsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessDetailsRequest> createRepeated() =>
      $pb.PbList<GetBusinessDetailsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessDetailsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessDetailsRequest>(create);
  static GetBusinessDetailsRequest? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);
}

class GetBusinessDetailsResponse extends $pb.GeneratedMessage {
  factory GetBusinessDetailsResponse({
    Business? business,
  }) {
    final result = create();
    if (business != null) result.business = business;
    return result;
  }

  GetBusinessDetailsResponse._();

  factory GetBusinessDetailsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessDetailsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessDetailsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business',
        subBuilder: Business.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessDetailsResponse clone() =>
      GetBusinessDetailsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessDetailsResponse copyWith(
          void Function(GetBusinessDetailsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetBusinessDetailsResponse))
          as GetBusinessDetailsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessDetailsResponse create() => GetBusinessDetailsResponse._();
  @$core.override
  GetBusinessDetailsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessDetailsResponse> createRepeated() =>
      $pb.PbList<GetBusinessDetailsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessDetailsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessDetailsResponse>(create);
  static GetBusinessDetailsResponse? _defaultInstance;

  /// The retrieved business data.
  @$pb.TagNumber(1)
  Business get business => $_getN(0);
  @$pb.TagNumber(1)
  set business(Business value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBusiness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusiness() => $_clearField(1);
  @$pb.TagNumber(1)
  Business ensureBusiness() => $_ensure(0);
}

class UpdateBusinessRequest extends $pb.GeneratedMessage {
  factory UpdateBusinessRequest({
    Business? business,
    $core.List<$core.int>? logoRawImage,
    $core.Iterable<$2.ResourceLink>? externalLinks,
  }) {
    final result = create();
    if (business != null) result.business = business;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    if (externalLinks != null) result.externalLinks.addAll(externalLinks);
    return result;
  }

  UpdateBusinessRequest._();

  factory UpdateBusinessRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBusinessRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBusinessRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business',
        subBuilder: Business.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..pc<$2.ResourceLink>(
        3, _omitFieldNames ? '' : 'externalLinks', $pb.PbFieldType.PM,
        subBuilder: $2.ResourceLink.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessRequest clone() =>
      UpdateBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessRequest copyWith(
          void Function(UpdateBusinessRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateBusinessRequest))
          as UpdateBusinessRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessRequest create() => UpdateBusinessRequest._();
  @$core.override
  UpdateBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessRequest> createRepeated() =>
      $pb.PbList<UpdateBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBusinessRequest>(create);
  static UpdateBusinessRequest? _defaultInstance;

  /// The business information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  Business get business => $_getN(0);
  @$pb.TagNumber(1)
  set business(Business value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBusiness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusiness() => $_clearField(1);
  @$pb.TagNumber(1)
  Business ensureBusiness() => $_ensure(0);

  /// The raw image of the logo of the business.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);

  /// The links of the business.
  @$pb.TagNumber(3)
  $pb.PbList<$2.ResourceLink> get externalLinks => $_getList(2);
}

class UpdateBusinessResponse extends $pb.GeneratedMessage {
  factory UpdateBusinessResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateBusinessResponse._();

  factory UpdateBusinessResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBusinessResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBusinessResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessResponse clone() =>
      UpdateBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessResponse copyWith(
          void Function(UpdateBusinessResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateBusinessResponse))
          as UpdateBusinessResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessResponse create() => UpdateBusinessResponse._();
  @$core.override
  UpdateBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessResponse> createRepeated() =>
      $pb.PbList<UpdateBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBusinessResponse>(create);
  static UpdateBusinessResponse? _defaultInstance;

  /// Whether the business was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class RequestDeleteBusinessRequest extends $pb.GeneratedMessage {
  factory RequestDeleteBusinessRequest({
    $core.String? businessId,
    $core.String? password,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    if (password != null) result.password = password;
    return result;
  }

  RequestDeleteBusinessRequest._();

  factory RequestDeleteBusinessRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestDeleteBusinessRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestDeleteBusinessRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeleteBusinessRequest clone() =>
      RequestDeleteBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeleteBusinessRequest copyWith(
          void Function(RequestDeleteBusinessRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RequestDeleteBusinessRequest))
          as RequestDeleteBusinessRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDeleteBusinessRequest create() =>
      RequestDeleteBusinessRequest._();
  @$core.override
  RequestDeleteBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<RequestDeleteBusinessRequest> createRepeated() =>
      $pb.PbList<RequestDeleteBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static RequestDeleteBusinessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestDeleteBusinessRequest>(create);
  static RequestDeleteBusinessRequest? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);

  /// The password of the user who is trying to delete the business.
  /// If the user doesn't have a password, he must set it before handling any deletion.
  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class RequestDeleteBusinessResponse extends $pb.GeneratedMessage {
  factory RequestDeleteBusinessResponse({
    $core.bool? success,
    $core.String? noticePeriod,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (noticePeriod != null) result.noticePeriod = noticePeriod;
    return result;
  }

  RequestDeleteBusinessResponse._();

  factory RequestDeleteBusinessResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestDeleteBusinessResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestDeleteBusinessResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'noticePeriod')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeleteBusinessResponse clone() =>
      RequestDeleteBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeleteBusinessResponse copyWith(
          void Function(RequestDeleteBusinessResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RequestDeleteBusinessResponse))
          as RequestDeleteBusinessResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDeleteBusinessResponse create() =>
      RequestDeleteBusinessResponse._();
  @$core.override
  RequestDeleteBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<RequestDeleteBusinessResponse> createRepeated() =>
      $pb.PbList<RequestDeleteBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static RequestDeleteBusinessResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestDeleteBusinessResponse>(create);
  static RequestDeleteBusinessResponse? _defaultInstance;

  /// Whether the business will be deleted or not.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  /// The notice period before the business will be deleted.
  @$pb.TagNumber(2)
  $core.String get noticePeriod => $_getSZ(1);
  @$pb.TagNumber(2)
  set noticePeriod($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNoticePeriod() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoticePeriod() => $_clearField(2);
}

class CreateUserToBusinessRequest extends $pb.GeneratedMessage {
  factory CreateUserToBusinessRequest({
    $core.String? firstName,
    $core.String? lastName,
    $core.String? userName,
    $core.String? phoneNumber,
    $core.String? email,
    $core.String? password,
    $core.String? businessId,
    $core.Iterable<$0.BusinessPermission>? permissions,
  }) {
    final result = create();
    if (firstName != null) result.firstName = firstName;
    if (lastName != null) result.lastName = lastName;
    if (userName != null) result.userName = userName;
    if (phoneNumber != null) result.phoneNumber = phoneNumber;
    if (email != null) result.email = email;
    if (password != null) result.password = password;
    if (businessId != null) result.businessId = businessId;
    if (permissions != null) result.permissions.addAll(permissions);
    return result;
  }

  CreateUserToBusinessRequest._();

  factory CreateUserToBusinessRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateUserToBusinessRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateUserToBusinessRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firstName')
    ..aOS(2, _omitFieldNames ? '' : 'lastName')
    ..aOS(3, _omitFieldNames ? '' : 'userName')
    ..aOS(4, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'password')
    ..aOS(7, _omitFieldNames ? '' : 'businessId')
    ..pc<$0.BusinessPermission>(
        8, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM,
        subBuilder: $0.BusinessPermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserToBusinessRequest clone() =>
      CreateUserToBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserToBusinessRequest copyWith(
          void Function(CreateUserToBusinessRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateUserToBusinessRequest))
          as CreateUserToBusinessRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserToBusinessRequest create() =>
      CreateUserToBusinessRequest._();
  @$core.override
  CreateUserToBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserToBusinessRequest> createRepeated() =>
      $pb.PbList<CreateUserToBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserToBusinessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateUserToBusinessRequest>(create);
  static CreateUserToBusinessRequest? _defaultInstance;

  /// The first name of the user.
  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => $_clearField(1);

  /// The last name of the user.
  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => $_clearField(2);

  /// The username of the user.
  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => $_clearField(3);

  /// The phone number of the user.
  @$pb.TagNumber(4)
  $core.String get phoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set phoneNumber($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => $_clearField(4);

  /// The email of the user.
  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => $_clearField(5);

  /// The password of the user.
  @$pb.TagNumber(6)
  $core.String get password => $_getSZ(5);
  @$pb.TagNumber(6)
  set password($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassword() => $_clearField(6);

  /// The unique identifier of the business.
  @$pb.TagNumber(7)
  $core.String get businessId => $_getSZ(6);
  @$pb.TagNumber(7)
  set businessId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBusinessId() => $_has(6);
  @$pb.TagNumber(7)
  void clearBusinessId() => $_clearField(7);

  /// The permissions that the user has.
  @$pb.TagNumber(8)
  $pb.PbList<$0.BusinessPermission> get permissions => $_getList(7);
}

class CreateUserToBusinessResponse extends $pb.GeneratedMessage {
  factory CreateUserToBusinessResponse({
    BusinessMember? businessMember,
  }) {
    final result = create();
    if (businessMember != null) result.businessMember = businessMember;
    return result;
  }

  CreateUserToBusinessResponse._();

  factory CreateUserToBusinessResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateUserToBusinessResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateUserToBusinessResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessMember>(1, _omitFieldNames ? '' : 'businessMember',
        subBuilder: BusinessMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserToBusinessResponse clone() =>
      CreateUserToBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserToBusinessResponse copyWith(
          void Function(CreateUserToBusinessResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateUserToBusinessResponse))
          as CreateUserToBusinessResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserToBusinessResponse create() =>
      CreateUserToBusinessResponse._();
  @$core.override
  CreateUserToBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserToBusinessResponse> createRepeated() =>
      $pb.PbList<CreateUserToBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserToBusinessResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateUserToBusinessResponse>(create);
  static CreateUserToBusinessResponse? _defaultInstance;

  /// The business member to return
  @$pb.TagNumber(1)
  BusinessMember get businessMember => $_getN(0);
  @$pb.TagNumber(1)
  set businessMember(BusinessMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessMember() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessMember ensureBusinessMember() => $_ensure(0);
}

class AssociateUserToBusinessRequest extends $pb.GeneratedMessage {
  factory AssociateUserToBusinessRequest({
    $core.String? userId,
    $core.String? businessId,
    $core.Iterable<$0.BusinessPermission>? permissions,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    if (permissions != null) result.permissions.addAll(permissions);
    return result;
  }

  AssociateUserToBusinessRequest._();

  factory AssociateUserToBusinessRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssociateUserToBusinessRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssociateUserToBusinessRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..pc<$0.BusinessPermission>(
        3, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM,
        subBuilder: $0.BusinessPermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssociateUserToBusinessRequest clone() =>
      AssociateUserToBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssociateUserToBusinessRequest copyWith(
          void Function(AssociateUserToBusinessRequest) updates) =>
      super.copyWith(
              (message) => updates(message as AssociateUserToBusinessRequest))
          as AssociateUserToBusinessRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssociateUserToBusinessRequest create() =>
      AssociateUserToBusinessRequest._();
  @$core.override
  AssociateUserToBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<AssociateUserToBusinessRequest> createRepeated() =>
      $pb.PbList<AssociateUserToBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static AssociateUserToBusinessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssociateUserToBusinessRequest>(create);
  static AssociateUserToBusinessRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// The permissions that the user has.
  @$pb.TagNumber(3)
  $pb.PbList<$0.BusinessPermission> get permissions => $_getList(2);
}

class AssociateUserToBusinessResponse extends $pb.GeneratedMessage {
  factory AssociateUserToBusinessResponse({
    BusinessMember? businessMember,
  }) {
    final result = create();
    if (businessMember != null) result.businessMember = businessMember;
    return result;
  }

  AssociateUserToBusinessResponse._();

  factory AssociateUserToBusinessResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssociateUserToBusinessResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssociateUserToBusinessResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessMember>(1, _omitFieldNames ? '' : 'businessMember',
        subBuilder: BusinessMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssociateUserToBusinessResponse clone() =>
      AssociateUserToBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssociateUserToBusinessResponse copyWith(
          void Function(AssociateUserToBusinessResponse) updates) =>
      super.copyWith(
              (message) => updates(message as AssociateUserToBusinessResponse))
          as AssociateUserToBusinessResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssociateUserToBusinessResponse create() =>
      AssociateUserToBusinessResponse._();
  @$core.override
  AssociateUserToBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<AssociateUserToBusinessResponse> createRepeated() =>
      $pb.PbList<AssociateUserToBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static AssociateUserToBusinessResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssociateUserToBusinessResponse>(
          create);
  static AssociateUserToBusinessResponse? _defaultInstance;

  /// The business member to return
  @$pb.TagNumber(1)
  BusinessMember get businessMember => $_getN(0);
  @$pb.TagNumber(1)
  set businessMember(BusinessMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessMember() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessMember ensureBusinessMember() => $_ensure(0);
}

class RemoveUserFromBusinessRequest extends $pb.GeneratedMessage {
  factory RemoveUserFromBusinessRequest({
    $core.String? userId,
    $core.String? businessId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  RemoveUserFromBusinessRequest._();

  factory RemoveUserFromBusinessRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveUserFromBusinessRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveUserFromBusinessRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveUserFromBusinessRequest clone() =>
      RemoveUserFromBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveUserFromBusinessRequest copyWith(
          void Function(RemoveUserFromBusinessRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveUserFromBusinessRequest))
          as RemoveUserFromBusinessRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromBusinessRequest create() =>
      RemoveUserFromBusinessRequest._();
  @$core.override
  RemoveUserFromBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromBusinessRequest> createRepeated() =>
      $pb.PbList<RemoveUserFromBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromBusinessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveUserFromBusinessRequest>(create);
  static RemoveUserFromBusinessRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);
}

class RemoveUserFromBusinessResponse extends $pb.GeneratedMessage {
  factory RemoveUserFromBusinessResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  RemoveUserFromBusinessResponse._();

  factory RemoveUserFromBusinessResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveUserFromBusinessResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveUserFromBusinessResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveUserFromBusinessResponse clone() =>
      RemoveUserFromBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveUserFromBusinessResponse copyWith(
          void Function(RemoveUserFromBusinessResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveUserFromBusinessResponse))
          as RemoveUserFromBusinessResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromBusinessResponse create() =>
      RemoveUserFromBusinessResponse._();
  @$core.override
  RemoveUserFromBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromBusinessResponse> createRepeated() =>
      $pb.PbList<RemoveUserFromBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromBusinessResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveUserFromBusinessResponse>(create);
  static RemoveUserFromBusinessResponse? _defaultInstance;

  /// Whether the user was successfully removed from the business.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class GetBusinessMembersRequest extends $pb.GeneratedMessage {
  factory GetBusinessMembersRequest({
    $core.String? businessId,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  GetBusinessMembersRequest._();

  factory GetBusinessMembersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessMembersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessMembersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessMembersRequest clone() =>
      GetBusinessMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessMembersRequest copyWith(
          void Function(GetBusinessMembersRequest) updates) =>
      super.copyWith((message) => updates(message as GetBusinessMembersRequest))
          as GetBusinessMembersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessMembersRequest create() => GetBusinessMembersRequest._();
  @$core.override
  GetBusinessMembersRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessMembersRequest> createRepeated() =>
      $pb.PbList<GetBusinessMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessMembersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessMembersRequest>(create);
  static GetBusinessMembersRequest? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);
}

class GetBusinessMembersResponse extends $pb.GeneratedMessage {
  factory GetBusinessMembersResponse({
    $core.Iterable<BusinessMember>? businessMembers,
  }) {
    final result = create();
    if (businessMembers != null) result.businessMembers.addAll(businessMembers);
    return result;
  }

  GetBusinessMembersResponse._();

  factory GetBusinessMembersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessMembersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessMembersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..pc<BusinessMember>(
        1, _omitFieldNames ? '' : 'businessMembers', $pb.PbFieldType.PM,
        subBuilder: BusinessMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessMembersResponse clone() =>
      GetBusinessMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessMembersResponse copyWith(
          void Function(GetBusinessMembersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetBusinessMembersResponse))
          as GetBusinessMembersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessMembersResponse create() => GetBusinessMembersResponse._();
  @$core.override
  GetBusinessMembersResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessMembersResponse> createRepeated() =>
      $pb.PbList<GetBusinessMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessMembersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessMembersResponse>(create);
  static GetBusinessMembersResponse? _defaultInstance;

  /// The set of business member
  @$pb.TagNumber(1)
  $pb.PbList<BusinessMember> get businessMembers => $_getList(0);
}

class UpdateBusinessMemberRequest extends $pb.GeneratedMessage {
  factory UpdateBusinessMemberRequest({
    $core.String? userId,
    $core.String? businessId,
    $core.Iterable<$0.BusinessPermission>? addPermissions,
    $core.Iterable<$0.BusinessPermission>? removePermissions,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    if (addPermissions != null) result.addPermissions.addAll(addPermissions);
    if (removePermissions != null)
      result.removePermissions.addAll(removePermissions);
    return result;
  }

  UpdateBusinessMemberRequest._();

  factory UpdateBusinessMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBusinessMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBusinessMemberRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..pc<$0.BusinessPermission>(
        5, _omitFieldNames ? '' : 'addPermissions', $pb.PbFieldType.PM,
        subBuilder: $0.BusinessPermission.create)
    ..pc<$0.BusinessPermission>(
        6, _omitFieldNames ? '' : 'removePermissions', $pb.PbFieldType.PM,
        subBuilder: $0.BusinessPermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessMemberRequest clone() =>
      UpdateBusinessMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessMemberRequest copyWith(
          void Function(UpdateBusinessMemberRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateBusinessMemberRequest))
          as UpdateBusinessMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessMemberRequest create() =>
      UpdateBusinessMemberRequest._();
  @$core.override
  UpdateBusinessMemberRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessMemberRequest> createRepeated() =>
      $pb.PbList<UpdateBusinessMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBusinessMemberRequest>(create);
  static UpdateBusinessMemberRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// The permissions to add (optional).
  @$pb.TagNumber(5)
  $pb.PbList<$0.BusinessPermission> get addPermissions => $_getList(2);

  /// The permissions to remove (optional).
  @$pb.TagNumber(6)
  $pb.PbList<$0.BusinessPermission> get removePermissions => $_getList(3);
}

class UpdateBusinessMemberResponse extends $pb.GeneratedMessage {
  factory UpdateBusinessMemberResponse({
    $core.bool? success,
    BusinessMember? businessMember,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (businessMember != null) result.businessMember = businessMember;
    return result;
  }

  UpdateBusinessMemberResponse._();

  factory UpdateBusinessMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBusinessMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBusinessMemberResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<BusinessMember>(2, _omitFieldNames ? '' : 'businessMember',
        subBuilder: BusinessMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessMemberResponse clone() =>
      UpdateBusinessMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessMemberResponse copyWith(
          void Function(UpdateBusinessMemberResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateBusinessMemberResponse))
          as UpdateBusinessMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessMemberResponse create() =>
      UpdateBusinessMemberResponse._();
  @$core.override
  UpdateBusinessMemberResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessMemberResponse> createRepeated() =>
      $pb.PbList<UpdateBusinessMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBusinessMemberResponse>(create);
  static UpdateBusinessMemberResponse? _defaultInstance;

  /// Whether the member was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  /// The updated business member.
  @$pb.TagNumber(2)
  BusinessMember get businessMember => $_getN(1);
  @$pb.TagNumber(2)
  set businessMember(BusinessMember value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessMember() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessMember() => $_clearField(2);
  @$pb.TagNumber(2)
  BusinessMember ensureBusinessMember() => $_ensure(1);
}

class GetBusinessMemberRequest extends $pb.GeneratedMessage {
  factory GetBusinessMemberRequest({
    $core.String? userId,
    $core.String? businessId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  GetBusinessMemberRequest._();

  factory GetBusinessMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessMemberRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessMemberRequest clone() =>
      GetBusinessMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessMemberRequest copyWith(
          void Function(GetBusinessMemberRequest) updates) =>
      super.copyWith((message) => updates(message as GetBusinessMemberRequest))
          as GetBusinessMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessMemberRequest create() => GetBusinessMemberRequest._();
  @$core.override
  GetBusinessMemberRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessMemberRequest> createRepeated() =>
      $pb.PbList<GetBusinessMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessMemberRequest>(create);
  static GetBusinessMemberRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);
}

class GetBusinessMemberResponse extends $pb.GeneratedMessage {
  factory GetBusinessMemberResponse({
    BusinessMember? businessMember,
  }) {
    final result = create();
    if (businessMember != null) result.businessMember = businessMember;
    return result;
  }

  GetBusinessMemberResponse._();

  factory GetBusinessMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessMemberResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessMember>(1, _omitFieldNames ? '' : 'businessMember',
        subBuilder: BusinessMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessMemberResponse clone() =>
      GetBusinessMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessMemberResponse copyWith(
          void Function(GetBusinessMemberResponse) updates) =>
      super.copyWith((message) => updates(message as GetBusinessMemberResponse))
          as GetBusinessMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessMemberResponse create() => GetBusinessMemberResponse._();
  @$core.override
  GetBusinessMemberResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessMemberResponse> createRepeated() =>
      $pb.PbList<GetBusinessMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessMemberResponse>(create);
  static GetBusinessMemberResponse? _defaultInstance;

  /// The business member.
  @$pb.TagNumber(1)
  BusinessMember get businessMember => $_getN(0);
  @$pb.TagNumber(1)
  set businessMember(BusinessMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessMember() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessMember ensureBusinessMember() => $_ensure(0);
}

class StreamBusinessMembersRequest extends $pb.GeneratedMessage {
  factory StreamBusinessMembersRequest({
    $core.String? businessId,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  StreamBusinessMembersRequest._();

  factory StreamBusinessMembersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamBusinessMembersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamBusinessMembersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamBusinessMembersRequest clone() =>
      StreamBusinessMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamBusinessMembersRequest copyWith(
          void Function(StreamBusinessMembersRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StreamBusinessMembersRequest))
          as StreamBusinessMembersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamBusinessMembersRequest create() =>
      StreamBusinessMembersRequest._();
  @$core.override
  StreamBusinessMembersRequest createEmptyInstance() => create();
  static $pb.PbList<StreamBusinessMembersRequest> createRepeated() =>
      $pb.PbList<StreamBusinessMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamBusinessMembersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamBusinessMembersRequest>(create);
  static StreamBusinessMembersRequest? _defaultInstance;

  /// The unique identifier of the business.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);
}

class StreamBusinessMembersResponse extends $pb.GeneratedMessage {
  factory StreamBusinessMembersResponse({
    $core.Iterable<BusinessMember>? businessMembers,
  }) {
    final result = create();
    if (businessMembers != null) result.businessMembers.addAll(businessMembers);
    return result;
  }

  StreamBusinessMembersResponse._();

  factory StreamBusinessMembersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamBusinessMembersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamBusinessMembersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..pc<BusinessMember>(
        1, _omitFieldNames ? '' : 'businessMembers', $pb.PbFieldType.PM,
        subBuilder: BusinessMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamBusinessMembersResponse clone() =>
      StreamBusinessMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamBusinessMembersResponse copyWith(
          void Function(StreamBusinessMembersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StreamBusinessMembersResponse))
          as StreamBusinessMembersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamBusinessMembersResponse create() =>
      StreamBusinessMembersResponse._();
  @$core.override
  StreamBusinessMembersResponse createEmptyInstance() => create();
  static $pb.PbList<StreamBusinessMembersResponse> createRepeated() =>
      $pb.PbList<StreamBusinessMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamBusinessMembersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamBusinessMembersResponse>(create);
  static StreamBusinessMembersResponse? _defaultInstance;

  /// The business members.
  @$pb.TagNumber(1)
  $pb.PbList<BusinessMember> get businessMembers => $_getList(0);
}

class BusinessServiceApi {
  final $pb.RpcClient _client;

  BusinessServiceApi(this._client);

  /// Create a new business.
  $async.Future<CreateBusinessResponse> createBusiness(
          $pb.ClientContext? ctx, CreateBusinessRequest request) =>
      _client.invoke<CreateBusinessResponse>(ctx, 'BusinessService',
          'CreateBusiness', request, CreateBusinessResponse());

  /// Get all businesses of the current user.
  $async.Future<GetMyBusinessesResponse> getMyBusinesses(
          $pb.ClientContext? ctx, GetMyBusinessesRequest request) =>
      _client.invoke<GetMyBusinessesResponse>(ctx, 'BusinessService',
          'GetMyBusinesses', request, GetMyBusinessesResponse());

  /// Get a business by id.
  $async.Future<GetBusinessDetailsResponse> getBusinessDetails(
          $pb.ClientContext? ctx, GetBusinessDetailsRequest request) =>
      _client.invoke<GetBusinessDetailsResponse>(ctx, 'BusinessService',
          'GetBusinessDetails', request, GetBusinessDetailsResponse());

  /// Update a business.
  $async.Future<UpdateBusinessResponse> updateBusiness(
          $pb.ClientContext? ctx, UpdateBusinessRequest request) =>
      _client.invoke<UpdateBusinessResponse>(ctx, 'BusinessService',
          'UpdateBusiness', request, UpdateBusinessResponse());

  /// Request the deletion of the business. This request doesn't delete the business directly instead it put the business in inactive state and remove all business members.
  $async.Future<RequestDeleteBusinessResponse> requestDeleteBusiness(
          $pb.ClientContext? ctx, RequestDeleteBusinessRequest request) =>
      _client.invoke<RequestDeleteBusinessResponse>(ctx, 'BusinessService',
          'RequestDeleteBusiness', request, RequestDeleteBusinessResponse());

  /// Add user to business or invite user to business.
  $async.Future<CreateUserToBusinessResponse> createUserToBusiness(
          $pb.ClientContext? ctx, CreateUserToBusinessRequest request) =>
      _client.invoke<CreateUserToBusinessResponse>(ctx, 'BusinessService',
          'CreateUserToBusiness', request, CreateUserToBusinessResponse());

  /// Associate user to business.
  $async.Future<AssociateUserToBusinessResponse> associateUserToBusiness(
          $pb.ClientContext? ctx, AssociateUserToBusinessRequest request) =>
      _client.invoke<AssociateUserToBusinessResponse>(
          ctx,
          'BusinessService',
          'AssociateUserToBusiness',
          request,
          AssociateUserToBusinessResponse());

  /// Remove user from business.
  /// If the user has been created by the business, the user will be deleted.
  /// NOTE: The authenticated user need to have the permission to remove the
  /// user.
  $async.Future<RemoveUserFromBusinessResponse> removeUserFromBusiness(
          $pb.ClientContext? ctx, RemoveUserFromBusinessRequest request) =>
      _client.invoke<RemoveUserFromBusinessResponse>(ctx, 'BusinessService',
          'RemoveUserFromBusiness', request, RemoveUserFromBusinessResponse());

  /// Changes the business currency
  $async.Future<ChangeBusinessCurrencyResponse> changeBusinessCurrency(
          $pb.ClientContext? ctx, ChangeBusinessCurrencyRequest request) =>
      _client.invoke<ChangeBusinessCurrencyResponse>(ctx, 'BusinessService',
          'ChangeBusinessCurrency', request, ChangeBusinessCurrencyResponse());

  /// Get the users of the business.
  $async.Future<GetBusinessMembersResponse> getBusinessMembers(
          $pb.ClientContext? ctx, GetBusinessMembersRequest request) =>
      _client.invoke<GetBusinessMembersResponse>(ctx, 'BusinessService',
          'GetBusinessMembers', request, GetBusinessMembersResponse());

  /// Get a specific business member.
  $async.Future<GetBusinessMemberResponse> getBusinessMember(
          $pb.ClientContext? ctx, GetBusinessMemberRequest request) =>
      _client.invoke<GetBusinessMemberResponse>(ctx, 'BusinessService',
          'GetBusinessMember', request, GetBusinessMemberResponse());

  /// Update a business member (role, status, permissions).
  $async.Future<UpdateBusinessMemberResponse> updateBusinessMember(
          $pb.ClientContext? ctx, UpdateBusinessMemberRequest request) =>
      _client.invoke<UpdateBusinessMemberResponse>(ctx, 'BusinessService',
          'UpdateBusinessMember', request, UpdateBusinessMemberResponse());

  /// Stream business members for real-time updates.
  $async.Future<StreamBusinessMembersResponse> streamBusinessMembers(
          $pb.ClientContext? ctx, StreamBusinessMembersRequest request) =>
      _client.invoke<StreamBusinessMembersResponse>(ctx, 'BusinessService',
          'StreamBusinessMembers', request, StreamBusinessMembersResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
