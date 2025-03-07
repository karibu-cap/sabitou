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

import 'business.pbenum.dart';

export 'business.pbenum.dart';

class Business extends $pb.GeneratedMessage {
  factory Business({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    BusinessStatusType? status,
    $core.String? ownerId,
    $core.String? logoMediaId,
    $core.String? countryCode,
    $core.String? currencyCode,
    $core.Iterable<$core.String>? linksMediaIds,
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
    if (logoMediaId != null) {
      $result.logoMediaId = logoMediaId;
    }
    if (countryCode != null) {
      $result.countryCode = countryCode;
    }
    if (currencyCode != null) {
      $result.currencyCode = currencyCode;
    }
    if (linksMediaIds != null) {
      $result.linksMediaIds.addAll(linksMediaIds);
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
    ..aOS(6, _omitFieldNames ? '' : 'logoMediaId')
    ..aOS(7, _omitFieldNames ? '' : 'countryCode')
    ..aOS(8, _omitFieldNames ? '' : 'currencyCode')
    ..pPS(9, _omitFieldNames ? '' : 'linksMediaIds')
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
  $core.String get logoMediaId => $_getSZ(5);
  @$pb.TagNumber(6)
  set logoMediaId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLogoMediaId() => $_has(5);
  @$pb.TagNumber(6)
  void clearLogoMediaId() => clearField(6);

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
  $core.List<$core.String> get linksMediaIds => $_getList(8);
}

class CreateBusinessRequest extends $pb.GeneratedMessage {
  factory CreateBusinessRequest({
    Business? business,
    $core.List<$core.int>? logoRawImage,
  }) {
    final $result = create();
    if (business != null) {
      $result.business = business;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    return $result;
  }
  CreateBusinessRequest._() : super();
  factory CreateBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business', subBuilder: Business.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
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
}

class CreateBusinessResponse extends $pb.GeneratedMessage {
  factory CreateBusinessResponse({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  CreateBusinessResponse._() : super();
  factory CreateBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
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
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
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

class GetBusinessRequest extends $pb.GeneratedMessage {
  factory GetBusinessRequest({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  GetBusinessRequest._() : super();
  factory GetBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessRequest clone() => GetBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessRequest copyWith(void Function(GetBusinessRequest) updates) => super.copyWith((message) => updates(message as GetBusinessRequest)) as GetBusinessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessRequest create() => GetBusinessRequest._();
  GetBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessRequest> createRepeated() => $pb.PbList<GetBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessRequest>(create);
  static GetBusinessRequest? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class GetBusinessResponse extends $pb.GeneratedMessage {
  factory GetBusinessResponse({
    Business? business,
  }) {
    final $result = create();
    if (business != null) {
      $result.business = business;
    }
    return $result;
  }
  GetBusinessResponse._() : super();
  factory GetBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business', subBuilder: Business.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessResponse clone() => GetBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessResponse copyWith(void Function(GetBusinessResponse) updates) => super.copyWith((message) => updates(message as GetBusinessResponse)) as GetBusinessResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessResponse create() => GetBusinessResponse._();
  GetBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessResponse> createRepeated() => $pb.PbList<GetBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessResponse>(create);
  static GetBusinessResponse? _defaultInstance;

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
  }) {
    final $result = create();
    if (business != null) {
      $result.business = business;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    return $result;
  }
  UpdateBusinessRequest._() : super();
  factory UpdateBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Business>(1, _omitFieldNames ? '' : 'business', subBuilder: Business.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
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
    $core.String? refId,
    $core.String? password,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
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
    ..aOS(1, _omitFieldNames ? '' : 'refId')
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
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The password of the user who is trying to delete the business.
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
    $core.String? requestToken,
  }) {
    final $result = create();
    if (requestToken != null) {
      $result.requestToken = requestToken;
    }
    return $result;
  }
  RequestDeleteBusinessResponse._() : super();
  factory RequestDeleteBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestDeleteBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestDeleteBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestToken')
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

  /// The token to use to process the deletion of the business
  /// after verification (email or phone number).
  @$pb.TagNumber(1)
  $core.String get requestToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestToken() => clearField(1);
}

class DeleteBusinessRequest extends $pb.GeneratedMessage {
  factory DeleteBusinessRequest({
    $core.String? requestToken,
    $core.String? verificationCode,
  }) {
    final $result = create();
    if (requestToken != null) {
      $result.requestToken = requestToken;
    }
    if (verificationCode != null) {
      $result.verificationCode = verificationCode;
    }
    return $result;
  }
  DeleteBusinessRequest._() : super();
  factory DeleteBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestToken')
    ..aOS(2, _omitFieldNames ? '' : 'verificationCode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBusinessRequest clone() => DeleteBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBusinessRequest copyWith(void Function(DeleteBusinessRequest) updates) => super.copyWith((message) => updates(message as DeleteBusinessRequest)) as DeleteBusinessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessRequest create() => DeleteBusinessRequest._();
  DeleteBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessRequest> createRepeated() => $pb.PbList<DeleteBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBusinessRequest>(create);
  static DeleteBusinessRequest? _defaultInstance;

  /// The token to use to process the deletion of the business.
  @$pb.TagNumber(1)
  $core.String get requestToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestToken() => clearField(1);

  /// The verification code sent to the user's email or phone number.
  @$pb.TagNumber(2)
  $core.String get verificationCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set verificationCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVerificationCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerificationCode() => clearField(2);
}

class DeleteBusinessResponse extends $pb.GeneratedMessage {
  factory DeleteBusinessResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteBusinessResponse._() : super();
  factory DeleteBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBusinessResponse clone() => DeleteBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBusinessResponse copyWith(void Function(DeleteBusinessResponse) updates) => super.copyWith((message) => updates(message as DeleteBusinessResponse)) as DeleteBusinessResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessResponse create() => DeleteBusinessResponse._();
  DeleteBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessResponse> createRepeated() => $pb.PbList<DeleteBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBusinessResponse>(create);
  static DeleteBusinessResponse? _defaultInstance;

  /// Whether the business was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class AddUserToBusinessRequest extends $pb.GeneratedMessage {
  factory AddUserToBusinessRequest({
    $core.String? uRef,
  }) {
    final $result = create();
    if (uRef != null) {
      $result.uRef = uRef;
    }
    return $result;
  }
  AddUserToBusinessRequest._() : super();
  factory AddUserToBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserToBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserToBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uRef')
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

  /// The unique identifier of the user.
  /// For example, the email address or phone number or @username.
  @$pb.TagNumber(1)
  $core.String get uRef => $_getSZ(0);
  @$pb.TagNumber(1)
  set uRef($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasURef() => $_has(0);
  @$pb.TagNumber(1)
  void clearURef() => clearField(1);
}

class AddUserToBusinessResponse extends $pb.GeneratedMessage {
  factory AddUserToBusinessResponse({
    $core.String? uRef,
  }) {
    final $result = create();
    if (uRef != null) {
      $result.uRef = uRef;
    }
    return $result;
  }
  AddUserToBusinessResponse._() : super();
  factory AddUserToBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserToBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserToBusinessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uRef')
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

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get uRef => $_getSZ(0);
  @$pb.TagNumber(1)
  set uRef($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasURef() => $_has(0);
  @$pb.TagNumber(1)
  void clearURef() => clearField(1);
}

class RemoveUserFromBusinessRequest extends $pb.GeneratedMessage {
  factory RemoveUserFromBusinessRequest({
    $core.String? uRef,
  }) {
    final $result = create();
    if (uRef != null) {
      $result.uRef = uRef;
    }
    return $result;
  }
  RemoveUserFromBusinessRequest._() : super();
  factory RemoveUserFromBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserFromBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserFromBusinessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uRef')
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
  /// For example, the email address or phone number or @username.
  @$pb.TagNumber(1)
  $core.String get uRef => $_getSZ(0);
  @$pb.TagNumber(1)
  set uRef($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasURef() => $_has(0);
  @$pb.TagNumber(1)
  void clearURef() => clearField(1);
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

class GetBusinessUsersRequest extends $pb.GeneratedMessage {
  factory GetBusinessUsersRequest({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  GetBusinessUsersRequest._() : super();
  factory GetBusinessUsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessUsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessUsersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessUsersRequest clone() => GetBusinessUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessUsersRequest copyWith(void Function(GetBusinessUsersRequest) updates) => super.copyWith((message) => updates(message as GetBusinessUsersRequest)) as GetBusinessUsersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessUsersRequest create() => GetBusinessUsersRequest._();
  GetBusinessUsersRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessUsersRequest> createRepeated() => $pb.PbList<GetBusinessUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessUsersRequest>(create);
  static GetBusinessUsersRequest? _defaultInstance;

  /// The reference id to the business identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class GetBusinessUsersResponse extends $pb.GeneratedMessage {
  factory GetBusinessUsersResponse({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  GetBusinessUsersResponse._() : super();
  factory GetBusinessUsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessUsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessUsersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessUsersResponse clone() => GetBusinessUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessUsersResponse copyWith(void Function(GetBusinessUsersResponse) updates) => super.copyWith((message) => updates(message as GetBusinessUsersResponse)) as GetBusinessUsersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessUsersResponse create() => GetBusinessUsersResponse._();
  GetBusinessUsersResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessUsersResponse> createRepeated() => $pb.PbList<GetBusinessUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessUsersResponse>(create);
  static GetBusinessUsersResponse? _defaultInstance;

  /// The unique identifiers of the users of the business.
  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
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
  $async.Future<GetBusinessResponse> getBusiness($pb.ClientContext? ctx, GetBusinessRequest request) =>
    _client.invoke<GetBusinessResponse>(ctx, 'BusinessService', 'GetBusiness', request, GetBusinessResponse())
  ;
  $async.Future<UpdateBusinessResponse> updateBusiness($pb.ClientContext? ctx, UpdateBusinessRequest request) =>
    _client.invoke<UpdateBusinessResponse>(ctx, 'BusinessService', 'UpdateBusiness', request, UpdateBusinessResponse())
  ;
  $async.Future<RequestDeleteBusinessResponse> requestDeleteBusiness($pb.ClientContext? ctx, RequestDeleteBusinessRequest request) =>
    _client.invoke<RequestDeleteBusinessResponse>(ctx, 'BusinessService', 'RequestDeleteBusiness', request, RequestDeleteBusinessResponse())
  ;
  $async.Future<DeleteBusinessResponse> deleteBusiness($pb.ClientContext? ctx, DeleteBusinessRequest request) =>
    _client.invoke<DeleteBusinessResponse>(ctx, 'BusinessService', 'DeleteBusiness', request, DeleteBusinessResponse())
  ;
  $async.Future<AddUserToBusinessResponse> addUserToBusiness($pb.ClientContext? ctx, AddUserToBusinessRequest request) =>
    _client.invoke<AddUserToBusinessResponse>(ctx, 'BusinessService', 'AddUserToBusiness', request, AddUserToBusinessResponse())
  ;
  $async.Future<RemoveUserFromBusinessResponse> removeUserFromBusiness($pb.ClientContext? ctx, RemoveUserFromBusinessRequest request) =>
    _client.invoke<RemoveUserFromBusinessResponse>(ctx, 'BusinessService', 'RemoveUserFromBusiness', request, RemoveUserFromBusinessResponse())
  ;
  $async.Future<GetBusinessUsersResponse> getBusinessUsers($pb.ClientContext? ctx, GetBusinessUsersRequest request) =>
    _client.invoke<GetBusinessUsersResponse>(ctx, 'BusinessService', 'GetBusinessUsers', request, GetBusinessUsersResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
