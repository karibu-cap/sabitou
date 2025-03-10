//
//  Generated code. Do not modify.
//  source: business/v1/business.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../identity/v1/permission.pb.dart' as $3;
import '../../link/v1/link.pb.dart' as $4;
import 'business.pbenum.dart';

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
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (status != null) {
      $result.status = status;
    }
    if (ownerId != null) {
      $result.ownerId = ownerId;
    }
    if (logoLinkId != null) {
      $result.logoLinkId = logoLinkId;
    }
    if (countryCode != null) {
      $result.countryCode = countryCode;
    }
    if (currencyCode != null) {
      $result.currencyCode = currencyCode;
    }
    if (externalLinksIds != null) {
      $result.externalLinksIds.addAll(externalLinksIds);
    }
    return $result;
  }
  Business._() : super();
  factory Business.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Business.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Business', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..e<BusinessStatusType>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: BusinessStatusType.BUSINESS_STATUS_TYPE_UNSPECIFIED, valueOf: BusinessStatusType.valueOf, enumValues: BusinessStatusType.values)
    ..aOS(5, _omitFieldNames ? '' : 'ownerId')
    ..aOS(6, _omitFieldNames ? '' : 'logoLinkId')
    ..aOS(7, _omitFieldNames ? '' : 'countryCode')
    ..aOS(8, _omitFieldNames ? '' : 'currencyCode')
    ..pPS(9, _omitFieldNames ? '' : 'externalLinksIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Business clone() => Business()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Business copyWith(void Function(Business) updates) => super.copyWith((message) => updates(message as Business)) as Business;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Business create() => Business._();
  Business createEmptyInstance() => create();
  static $pb.PbList<Business> createRepeated() => $pb.PbList<Business>();
  @$core.pragma('dart2js:noInline')
  static Business getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Business>(create);
  static Business? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The name of the business.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  /// The description of the business.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  /// The status of the business.
  @$pb.TagNumber(4)
  BusinessStatusType get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(BusinessStatusType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  /// The id of the owner of the business.
  @$pb.TagNumber(5)
  $core.String get ownerId => $_getSZ(4);
  @$pb.TagNumber(5)
  set ownerId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOwnerId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnerId() => clearField(5);

  /// The id of the media of the logo of the business.
  @$pb.TagNumber(6)
  $core.String get logoLinkId => $_getSZ(5);
  @$pb.TagNumber(6)
  set logoLinkId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLogoLinkId() => $_has(5);
  @$pb.TagNumber(6)
  void clearLogoLinkId() => clearField(6);

  /// The ISO 3166-1 alpha-2 country code of the business.
  /// e.g. CM, US, GB, etc.
  @$pb.TagNumber(7)
  $core.String get countryCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set countryCode($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCountryCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountryCode() => clearField(7);

  /// The ISO 4217 currency code of the business.
  /// For example: XAF, USD, EUR, etc.
  /// Note: All price in the business will be in this currency.
  @$pb.TagNumber(8)
  $core.String get currencyCode => $_getSZ(7);
  @$pb.TagNumber(8)
  set currencyCode($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCurrencyCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurrencyCode() => clearField(8);

  /// The media ids of different links of the business.
  /// It can be social media links, website links, etc.
  @$pb.TagNumber(9)
  $core.List<$core.String> get externalLinksIds => $_getList(8);
}

class BusinessMember extends $pb.GeneratedMessage {
  factory BusinessMember({
    $core.String? userId,
    $core.String? businessId,
    $core.Iterable<$3.Permission>? permissions,
    $core.Iterable<$core.String>? permissionsGroupsIds,
    $core.String? memberSince,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    if (permissions != null) {
      $result.permissions.addAll(permissions);
    }
    if (permissionsGroupsIds != null) {
      $result.permissionsGroupsIds.addAll(permissionsGroupsIds);
    }
    if (memberSince != null) {
      $result.memberSince = memberSince;
    }
    return $result;
  }
  BusinessMember._() : super();
  factory BusinessMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BusinessMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BusinessMember', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..pc<$3.Permission>(3, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM, subBuilder: $3.Permission.create)
    ..pPS(4, _omitFieldNames ? '' : 'permissionsGroupsIds')
    ..aOS(5, _omitFieldNames ? '' : 'memberSince')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BusinessMember clone() => BusinessMember()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BusinessMember copyWith(void Function(BusinessMember) updates) => super.copyWith((message) => updates(message as BusinessMember)) as BusinessMember;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessMember create() => BusinessMember._();
  BusinessMember createEmptyInstance() => create();
  static $pb.PbList<BusinessMember> createRepeated() => $pb.PbList<BusinessMember>();
  @$core.pragma('dart2js:noInline')
  static BusinessMember getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BusinessMember>(create);
  static BusinessMember? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => clearField(2);

  /// The permissions that the user has.
  @$pb.TagNumber(3)
  $core.List<$3.Permission> get permissions => $_getList(2);

  /// The unique identifier of the permission group.
  @$pb.TagNumber(4)
  $core.List<$core.String> get permissionsGroupsIds => $_getList(3);

  /// The date since when the
  @$pb.TagNumber(5)
  $core.String get memberSince => $_getSZ(4);
  @$pb.TagNumber(5)
  set memberSince($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMemberSince() => $_has(4);
  @$pb.TagNumber(5)
  void clearMemberSince() => clearField(5);
}

class CreateBusinessRequest extends $pb.GeneratedMessage {
  factory CreateBusinessRequest({
    Business? business,
    $core.List<$core.int>? logoRawImage,
    $core.Iterable<$4.ResourceLink>? externalLinks,
  }) {
    final $result = create();
    if (business != null) {
      $result.business = business;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    if (externalLinks != null) {
      $result.externalLinks.addAll(externalLinks);
    }
    return $result;
  }
  CreateBusinessRequest._() : super();
  factory CreateBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business', subBuilder: Business.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..pc<$4.ResourceLink>(3, _omitFieldNames ? '' : 'externalLinks', $pb.PbFieldType.PM, subBuilder: $4.ResourceLink.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessRequest clone() => CreateBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessRequest copyWith(void Function(CreateBusinessRequest) updates) => super.copyWith((message) => updates(message as CreateBusinessRequest)) as CreateBusinessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessRequest create() => CreateBusinessRequest._();
  CreateBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessRequest> createRepeated() => $pb.PbList<CreateBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessRequest>(create);
  static CreateBusinessRequest? _defaultInstance;

  /// The business information to create.
  /// Note:Only the fields that are set will be created.
  @$pb.TagNumber(1)
  Business get business => $_getN(0);
  @$pb.TagNumber(1)
  set business(Business v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusiness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusiness() => clearField(1);
  @$pb.TagNumber(1)
  Business ensureBusiness() => $_ensure(0);

  /// The raw image of the logo of the business.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => clearField(2);

  /// The links of the business.
  @$pb.TagNumber(3)
  $core.List<$4.ResourceLink> get externalLinks => $_getList(2);
}

class CreateBusinessResponse extends $pb.GeneratedMessage {
  factory CreateBusinessResponse({
    $core.String? businessId,
  }) {
    final $result = create();
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  CreateBusinessResponse._() : super();
  factory CreateBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessResponse clone() => CreateBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessResponse copyWith(void Function(CreateBusinessResponse) updates) => super.copyWith((message) => updates(message as CreateBusinessResponse)) as CreateBusinessResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessResponse create() => CreateBusinessResponse._();
  CreateBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessResponse> createRepeated() => $pb.PbList<CreateBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessResponse>(create);
  static CreateBusinessResponse? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => clearField(1);
}

class ChangeBusinessCurrencyRequest extends $pb.GeneratedMessage {
  factory ChangeBusinessCurrencyRequest({
    CurrencyChangePolicyType? currencyChangePolicy,
    $core.String? businessId,
    $core.String? countryCode,
  }) {
    final $result = create();
    if (currencyChangePolicy != null) {
      $result.currencyChangePolicy = currencyChangePolicy;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    if (countryCode != null) {
      $result.countryCode = countryCode;
    }
    return $result;
  }
  ChangeBusinessCurrencyRequest._() : super();
  factory ChangeBusinessCurrencyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeBusinessCurrencyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeBusinessCurrencyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..e<CurrencyChangePolicyType>(1, _omitFieldNames ? '' : 'currencyChangePolicy', $pb.PbFieldType.OE, defaultOrMaker: CurrencyChangePolicyType.CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED, valueOf: CurrencyChangePolicyType.valueOf, enumValues: CurrencyChangePolicyType.values)
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..aOS(3, _omitFieldNames ? '' : 'countryCode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeBusinessCurrencyRequest clone() => ChangeBusinessCurrencyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeBusinessCurrencyRequest copyWith(void Function(ChangeBusinessCurrencyRequest) updates) => super.copyWith((message) => updates(message as ChangeBusinessCurrencyRequest)) as ChangeBusinessCurrencyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeBusinessCurrencyRequest create() => ChangeBusinessCurrencyRequest._();
  ChangeBusinessCurrencyRequest createEmptyInstance() => create();
  static $pb.PbList<ChangeBusinessCurrencyRequest> createRepeated() => $pb.PbList<ChangeBusinessCurrencyRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangeBusinessCurrencyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeBusinessCurrencyRequest>(create);
  static ChangeBusinessCurrencyRequest? _defaultInstance;

  /// The policy to apply when changing the currency
  /// This field is required on currency change.
  @$pb.TagNumber(1)
  CurrencyChangePolicyType get currencyChangePolicy => $_getN(0);
  @$pb.TagNumber(1)
  set currencyChangePolicy(CurrencyChangePolicyType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrencyChangePolicy() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrencyChangePolicy() => clearField(1);

  /// The unique ref id of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => clearField(2);

  /// The ISO 3166-1 alpha-2 country code of the business.
  /// e.g. CM, US, GB, etc.
  @$pb.TagNumber(3)
  $core.String get countryCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set countryCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCountryCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountryCode() => clearField(3);
}

class ChangeBusinessCurrencyResponse extends $pb.GeneratedMessage {
  factory ChangeBusinessCurrencyResponse({
    $core.bool? sucess,
  }) {
    final $result = create();
    if (sucess != null) {
      $result.sucess = sucess;
    }
    return $result;
  }
  ChangeBusinessCurrencyResponse._() : super();
  factory ChangeBusinessCurrencyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeBusinessCurrencyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeBusinessCurrencyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sucess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeBusinessCurrencyResponse clone() => ChangeBusinessCurrencyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeBusinessCurrencyResponse copyWith(void Function(ChangeBusinessCurrencyResponse) updates) => super.copyWith((message) => updates(message as ChangeBusinessCurrencyResponse)) as ChangeBusinessCurrencyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeBusinessCurrencyResponse create() => ChangeBusinessCurrencyResponse._();
  ChangeBusinessCurrencyResponse createEmptyInstance() => create();
  static $pb.PbList<ChangeBusinessCurrencyResponse> createRepeated() => $pb.PbList<ChangeBusinessCurrencyResponse>();
  @$core.pragma('dart2js:noInline')
  static ChangeBusinessCurrencyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeBusinessCurrencyResponse>(create);
  static ChangeBusinessCurrencyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get sucess => $_getBF(0);
  @$pb.TagNumber(1)
  set sucess($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucess() => clearField(1);
}

class GetMyBusinessesRequest extends $pb.GeneratedMessage {
  factory GetMyBusinessesRequest() => create();
  GetMyBusinessesRequest._() : super();
  factory GetMyBusinessesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMyBusinessesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMyBusinessesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMyBusinessesRequest clone() => GetMyBusinessesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMyBusinessesRequest copyWith(void Function(GetMyBusinessesRequest) updates) => super.copyWith((message) => updates(message as GetMyBusinessesRequest)) as GetMyBusinessesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMyBusinessesRequest create() => GetMyBusinessesRequest._();
  GetMyBusinessesRequest createEmptyInstance() => create();
  static $pb.PbList<GetMyBusinessesRequest> createRepeated() => $pb.PbList<GetMyBusinessesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMyBusinessesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMyBusinessesRequest>(create);
  static GetMyBusinessesRequest? _defaultInstance;
}

class GetMyBusinessesResponse extends $pb.GeneratedMessage {
  factory GetMyBusinessesResponse({
    $core.Iterable<Business>? businesses,
  }) {
    final $result = create();
    if (businesses != null) {
      $result.businesses.addAll(businesses);
    }
    return $result;
  }
  GetMyBusinessesResponse._() : super();
  factory GetMyBusinessesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMyBusinessesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMyBusinessesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..pc<Business>(1, _omitFieldNames ? '' : 'businesses', $pb.PbFieldType.PM, subBuilder: Business.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMyBusinessesResponse clone() => GetMyBusinessesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMyBusinessesResponse copyWith(void Function(GetMyBusinessesResponse) updates) => super.copyWith((message) => updates(message as GetMyBusinessesResponse)) as GetMyBusinessesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMyBusinessesResponse create() => GetMyBusinessesResponse._();
  GetMyBusinessesResponse createEmptyInstance() => create();
  static $pb.PbList<GetMyBusinessesResponse> createRepeated() => $pb.PbList<GetMyBusinessesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMyBusinessesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMyBusinessesResponse>(create);
  static GetMyBusinessesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Business> get businesses => $_getList(0);
}

class GetBusinessDetailsRequest extends $pb.GeneratedMessage {
  factory GetBusinessDetailsRequest({
    $core.String? businessId,
  }) {
    final $result = create();
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  GetBusinessDetailsRequest._() : super();
  factory GetBusinessDetailsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessDetailsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessDetailsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessDetailsRequest clone() => GetBusinessDetailsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessDetailsRequest copyWith(void Function(GetBusinessDetailsRequest) updates) => super.copyWith((message) => updates(message as GetBusinessDetailsRequest)) as GetBusinessDetailsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessDetailsRequest create() => GetBusinessDetailsRequest._();
  GetBusinessDetailsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessDetailsRequest> createRepeated() => $pb.PbList<GetBusinessDetailsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessDetailsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessDetailsRequest>(create);
  static GetBusinessDetailsRequest? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => clearField(1);
}

class GetBusinessDetailsResponse extends $pb.GeneratedMessage {
  factory GetBusinessDetailsResponse({
    Business? business,
  }) {
    final $result = create();
    if (business != null) {
      $result.business = business;
    }
    return $result;
  }
  GetBusinessDetailsResponse._() : super();
  factory GetBusinessDetailsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessDetailsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessDetailsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business', subBuilder: Business.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessDetailsResponse clone() => GetBusinessDetailsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessDetailsResponse copyWith(void Function(GetBusinessDetailsResponse) updates) => super.copyWith((message) => updates(message as GetBusinessDetailsResponse)) as GetBusinessDetailsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessDetailsResponse create() => GetBusinessDetailsResponse._();
  GetBusinessDetailsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessDetailsResponse> createRepeated() => $pb.PbList<GetBusinessDetailsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessDetailsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessDetailsResponse>(create);
  static GetBusinessDetailsResponse? _defaultInstance;

  /// The retrieved business data.
  @$pb.TagNumber(1)
  Business get business => $_getN(0);
  @$pb.TagNumber(1)
  set business(Business v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusiness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusiness() => clearField(1);
  @$pb.TagNumber(1)
  Business ensureBusiness() => $_ensure(0);
}

class UpdateBusinessRequest extends $pb.GeneratedMessage {
  factory UpdateBusinessRequest({
    Business? business,
    $core.List<$core.int>? logoRawImage,
    $core.Iterable<$4.ResourceLink>? externalLinks,
  }) {
    final $result = create();
    if (business != null) {
      $result.business = business;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    if (externalLinks != null) {
      $result.externalLinks.addAll(externalLinks);
    }
    return $result;
  }
  UpdateBusinessRequest._() : super();
  factory UpdateBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business', subBuilder: Business.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..pc<$4.ResourceLink>(3, _omitFieldNames ? '' : 'externalLinks', $pb.PbFieldType.PM, subBuilder: $4.ResourceLink.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessRequest clone() => UpdateBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessRequest copyWith(void Function(UpdateBusinessRequest) updates) => super.copyWith((message) => updates(message as UpdateBusinessRequest)) as UpdateBusinessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessRequest create() => UpdateBusinessRequest._();
  UpdateBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessRequest> createRepeated() => $pb.PbList<UpdateBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessRequest>(create);
  static UpdateBusinessRequest? _defaultInstance;

  /// The business information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  Business get business => $_getN(0);
  @$pb.TagNumber(1)
  set business(Business v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusiness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusiness() => clearField(1);
  @$pb.TagNumber(1)
  Business ensureBusiness() => $_ensure(0);

  /// The raw image of the logo of the business.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => clearField(2);

  /// The links of the business.
  @$pb.TagNumber(3)
  $core.List<$4.ResourceLink> get externalLinks => $_getList(2);
}

class UpdateBusinessResponse extends $pb.GeneratedMessage {
  factory UpdateBusinessResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UpdateBusinessResponse._() : super();
  factory UpdateBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessResponse clone() => UpdateBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessResponse copyWith(void Function(UpdateBusinessResponse) updates) => super.copyWith((message) => updates(message as UpdateBusinessResponse)) as UpdateBusinessResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessResponse create() => UpdateBusinessResponse._();
  UpdateBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessResponse> createRepeated() => $pb.PbList<UpdateBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessResponse>(create);
  static UpdateBusinessResponse? _defaultInstance;

  /// Whether the business was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class RequestDeleteBusinessRequest extends $pb.GeneratedMessage {
  factory RequestDeleteBusinessRequest({
    $core.String? businessId,
    $core.String? password,
  }) {
    final $result = create();
    if (businessId != null) {
      $result.businessId = businessId;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  RequestDeleteBusinessRequest._() : super();
  factory RequestDeleteBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestDeleteBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestDeleteBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestDeleteBusinessRequest clone() => RequestDeleteBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestDeleteBusinessRequest copyWith(void Function(RequestDeleteBusinessRequest) updates) => super.copyWith((message) => updates(message as RequestDeleteBusinessRequest)) as RequestDeleteBusinessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDeleteBusinessRequest create() => RequestDeleteBusinessRequest._();
  RequestDeleteBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<RequestDeleteBusinessRequest> createRepeated() => $pb.PbList<RequestDeleteBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static RequestDeleteBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestDeleteBusinessRequest>(create);
  static RequestDeleteBusinessRequest? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => clearField(1);

  /// The password of the user who is trying to delete the business.
  /// If the user doesn't have a password, he must set it before handling any deletion.
  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class RequestDeleteBusinessResponse extends $pb.GeneratedMessage {
  factory RequestDeleteBusinessResponse({
    $core.bool? success,
    $core.String? noticePeriod,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (noticePeriod != null) {
      $result.noticePeriod = noticePeriod;
    }
    return $result;
  }
  RequestDeleteBusinessResponse._() : super();
  factory RequestDeleteBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestDeleteBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestDeleteBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'noticePeriod')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestDeleteBusinessResponse clone() => RequestDeleteBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestDeleteBusinessResponse copyWith(void Function(RequestDeleteBusinessResponse) updates) => super.copyWith((message) => updates(message as RequestDeleteBusinessResponse)) as RequestDeleteBusinessResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDeleteBusinessResponse create() => RequestDeleteBusinessResponse._();
  RequestDeleteBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<RequestDeleteBusinessResponse> createRepeated() => $pb.PbList<RequestDeleteBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static RequestDeleteBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestDeleteBusinessResponse>(create);
  static RequestDeleteBusinessResponse? _defaultInstance;

  /// Whether the business will be deleted or not.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  /// The notice period before the business will be deleted.
  @$pb.TagNumber(2)
  $core.String get noticePeriod => $_getSZ(1);
  @$pb.TagNumber(2)
  set noticePeriod($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNoticePeriod() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoticePeriod() => clearField(2);
}

class AddUserToBusinessRequest extends $pb.GeneratedMessage {
  factory AddUserToBusinessRequest({
    $core.String? userName,
    $core.String? password,
    $core.String? businessId,
  }) {
    final $result = create();
    if (userName != null) {
      $result.userName = userName;
    }
    if (password != null) {
      $result.password = password;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  AddUserToBusinessRequest._() : super();
  factory AddUserToBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserToBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserToBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userName')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUserToBusinessRequest clone() => AddUserToBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUserToBusinessRequest copyWith(void Function(AddUserToBusinessRequest) updates) => super.copyWith((message) => updates(message as AddUserToBusinessRequest)) as AddUserToBusinessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUserToBusinessRequest create() => AddUserToBusinessRequest._();
  AddUserToBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<AddUserToBusinessRequest> createRepeated() => $pb.PbList<AddUserToBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static AddUserToBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserToBusinessRequest>(create);
  static AddUserToBusinessRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get businessId => $_getSZ(2);
  @$pb.TagNumber(3)
  set businessId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBusinessId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBusinessId() => clearField(3);
}

class AddUserToBusinessResponse extends $pb.GeneratedMessage {
  factory AddUserToBusinessResponse({
    BusinessMember? businessMember,
  }) {
    final $result = create();
    if (businessMember != null) {
      $result.businessMember = businessMember;
    }
    return $result;
  }
  AddUserToBusinessResponse._() : super();
  factory AddUserToBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserToBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserToBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<BusinessMember>(1, _omitFieldNames ? '' : 'businessMember', subBuilder: BusinessMember.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUserToBusinessResponse clone() => AddUserToBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUserToBusinessResponse copyWith(void Function(AddUserToBusinessResponse) updates) => super.copyWith((message) => updates(message as AddUserToBusinessResponse)) as AddUserToBusinessResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUserToBusinessResponse create() => AddUserToBusinessResponse._();
  AddUserToBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<AddUserToBusinessResponse> createRepeated() => $pb.PbList<AddUserToBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static AddUserToBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserToBusinessResponse>(create);
  static AddUserToBusinessResponse? _defaultInstance;

  /// The business member to return
  @$pb.TagNumber(1)
  BusinessMember get businessMember => $_getN(0);
  @$pb.TagNumber(1)
  set businessMember(BusinessMember v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessMember() => clearField(1);
  @$pb.TagNumber(1)
  BusinessMember ensureBusinessMember() => $_ensure(0);
}

class RemoveUserFromBusinessRequest extends $pb.GeneratedMessage {
  factory RemoveUserFromBusinessRequest({
    $core.String? userId,
    $core.String? businessId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  RemoveUserFromBusinessRequest._() : super();
  factory RemoveUserFromBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserFromBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserFromBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveUserFromBusinessRequest clone() => RemoveUserFromBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveUserFromBusinessRequest copyWith(void Function(RemoveUserFromBusinessRequest) updates) => super.copyWith((message) => updates(message as RemoveUserFromBusinessRequest)) as RemoveUserFromBusinessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromBusinessRequest create() => RemoveUserFromBusinessRequest._();
  RemoveUserFromBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromBusinessRequest> createRepeated() => $pb.PbList<RemoveUserFromBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveUserFromBusinessRequest>(create);
  static RemoveUserFromBusinessRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => clearField(2);
}

class RemoveUserFromBusinessResponse extends $pb.GeneratedMessage {
  factory RemoveUserFromBusinessResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  RemoveUserFromBusinessResponse._() : super();
  factory RemoveUserFromBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserFromBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserFromBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveUserFromBusinessResponse clone() => RemoveUserFromBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveUserFromBusinessResponse copyWith(void Function(RemoveUserFromBusinessResponse) updates) => super.copyWith((message) => updates(message as RemoveUserFromBusinessResponse)) as RemoveUserFromBusinessResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromBusinessResponse create() => RemoveUserFromBusinessResponse._();
  RemoveUserFromBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromBusinessResponse> createRepeated() => $pb.PbList<RemoveUserFromBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveUserFromBusinessResponse>(create);
  static RemoveUserFromBusinessResponse? _defaultInstance;

  /// Whether the user was successfully removed from the business.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class GetBusinessMembersRequest extends $pb.GeneratedMessage {
  factory GetBusinessMembersRequest({
    $core.String? businessId,
  }) {
    final $result = create();
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  GetBusinessMembersRequest._() : super();
  factory GetBusinessMembersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessMembersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessMembersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessMembersRequest clone() => GetBusinessMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessMembersRequest copyWith(void Function(GetBusinessMembersRequest) updates) => super.copyWith((message) => updates(message as GetBusinessMembersRequest)) as GetBusinessMembersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessMembersRequest create() => GetBusinessMembersRequest._();
  GetBusinessMembersRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessMembersRequest> createRepeated() => $pb.PbList<GetBusinessMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessMembersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessMembersRequest>(create);
  static GetBusinessMembersRequest? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => clearField(1);
}

class GetBusinessMembersResponse extends $pb.GeneratedMessage {
  factory GetBusinessMembersResponse({
    $core.Iterable<BusinessMember>? businessMembers,
  }) {
    final $result = create();
    if (businessMembers != null) {
      $result.businessMembers.addAll(businessMembers);
    }
    return $result;
  }
  GetBusinessMembersResponse._() : super();
  factory GetBusinessMembersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessMembersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessMembersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..pc<BusinessMember>(1, _omitFieldNames ? '' : 'businessMembers', $pb.PbFieldType.PM, subBuilder: BusinessMember.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessMembersResponse clone() => GetBusinessMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessMembersResponse copyWith(void Function(GetBusinessMembersResponse) updates) => super.copyWith((message) => updates(message as GetBusinessMembersResponse)) as GetBusinessMembersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessMembersResponse create() => GetBusinessMembersResponse._();
  GetBusinessMembersResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessMembersResponse> createRepeated() => $pb.PbList<GetBusinessMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessMembersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessMembersResponse>(create);
  static GetBusinessMembersResponse? _defaultInstance;

  /// The set of business member
  @$pb.TagNumber(1)
  $core.List<BusinessMember> get businessMembers => $_getList(0);
}

class BusinessServiceApi {
  $pb.RpcClient _client;
  BusinessServiceApi(this._client);

  $async.Future<CreateBusinessResponse> createBusiness($pb.ClientContext? ctx, CreateBusinessRequest request) =>
    _client.invoke<CreateBusinessResponse>(ctx, 'BusinessService', 'CreateBusiness', request, CreateBusinessResponse())
  ;
  $async.Future<GetMyBusinessesResponse> getMyBusinesses($pb.ClientContext? ctx, GetMyBusinessesRequest request) =>
    _client.invoke<GetMyBusinessesResponse>(ctx, 'BusinessService', 'GetMyBusinesses', request, GetMyBusinessesResponse())
  ;
  $async.Future<GetBusinessDetailsResponse> getBusinessDetails($pb.ClientContext? ctx, GetBusinessDetailsRequest request) =>
    _client.invoke<GetBusinessDetailsResponse>(ctx, 'BusinessService', 'GetBusinessDetails', request, GetBusinessDetailsResponse())
  ;
  $async.Future<UpdateBusinessResponse> updateBusiness($pb.ClientContext? ctx, UpdateBusinessRequest request) =>
    _client.invoke<UpdateBusinessResponse>(ctx, 'BusinessService', 'UpdateBusiness', request, UpdateBusinessResponse())
  ;
  $async.Future<RequestDeleteBusinessResponse> requestDeleteBusiness($pb.ClientContext? ctx, RequestDeleteBusinessRequest request) =>
    _client.invoke<RequestDeleteBusinessResponse>(ctx, 'BusinessService', 'RequestDeleteBusiness', request, RequestDeleteBusinessResponse())
  ;
  $async.Future<AddUserToBusinessResponse> addUserToBusiness($pb.ClientContext? ctx, AddUserToBusinessRequest request) =>
    _client.invoke<AddUserToBusinessResponse>(ctx, 'BusinessService', 'AddUserToBusiness', request, AddUserToBusinessResponse())
  ;
  $async.Future<RemoveUserFromBusinessResponse> removeUserFromBusiness($pb.ClientContext? ctx, RemoveUserFromBusinessRequest request) =>
    _client.invoke<RemoveUserFromBusinessResponse>(ctx, 'BusinessService', 'RemoveUserFromBusiness', request, RemoveUserFromBusinessResponse())
  ;
  $async.Future<ChangeBusinessCurrencyResponse> changeBusinessCurrency($pb.ClientContext? ctx, ChangeBusinessCurrencyRequest request) =>
    _client.invoke<ChangeBusinessCurrencyResponse>(ctx, 'BusinessService', 'ChangeBusinessCurrency', request, ChangeBusinessCurrencyResponse())
  ;
  $async.Future<GetBusinessMembersResponse> getBusinessMembers($pb.ClientContext? ctx, GetBusinessMembersRequest request) =>
    _client.invoke<GetBusinessMembersResponse>(ctx, 'BusinessService', 'GetBusinessMembers', request, GetBusinessMembersResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
