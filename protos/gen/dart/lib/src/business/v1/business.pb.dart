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

import '../../google/protobuf/timestamp.pb.dart' as $0;
import '../../link/v1/link.pb.dart' as $1;
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
    $core.String? contactInfo,
    $core.String? address,
    $core.String? email,
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
    if (contactInfo != null) result.contactInfo = contactInfo;
    if (address != null) result.address = address;
    if (email != null) result.email = email;
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
    ..aOS(10, _omitFieldNames ? '' : 'contactInfo')
    ..aOS(11, _omitFieldNames ? '' : 'address')
    ..aOS(12, _omitFieldNames ? '' : 'email')
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

  /// The business contact information.
  @$pb.TagNumber(10)
  $core.String get contactInfo => $_getSZ(9);
  @$pb.TagNumber(10)
  set contactInfo($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasContactInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearContactInfo() => $_clearField(10);

  /// The business address.
  @$pb.TagNumber(11)
  $core.String get address => $_getSZ(10);
  @$pb.TagNumber(11)
  set address($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasAddress() => $_has(10);
  @$pb.TagNumber(11)
  void clearAddress() => $_clearField(11);

  /// The business email.
  @$pb.TagNumber(12)
  $core.String get email => $_getSZ(11);
  @$pb.TagNumber(12)
  set email($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasEmail() => $_has(11);
  @$pb.TagNumber(12)
  void clearEmail() => $_clearField(12);
}

class BusinessMember extends $pb.GeneratedMessage {
  factory BusinessMember({
    $core.String? userId,
    $core.String? businessId,
    $0.Timestamp? memberSince,
    BusinessMemberStatus? status,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    if (memberSince != null) result.memberSince = memberSince;
    if (status != null) result.status = status;
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
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'memberSince',
        subBuilder: $0.Timestamp.create)
    ..e<BusinessMemberStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: BusinessMemberStatus.BUSINESS_MEMBER_STATUS_UNSPECIFIED,
        valueOf: BusinessMemberStatus.valueOf,
        enumValues: BusinessMemberStatus.values)
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

  /// The user.
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

  /// The date since when the user became a member.
  @$pb.TagNumber(4)
  $0.Timestamp get memberSince => $_getN(2);
  @$pb.TagNumber(4)
  set memberSince($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMemberSince() => $_has(2);
  @$pb.TagNumber(4)
  void clearMemberSince() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureMemberSince() => $_ensure(2);

  /// The status of the user.
  @$pb.TagNumber(5)
  BusinessMemberStatus get status => $_getN(3);
  @$pb.TagNumber(5)
  set status(BusinessMemberStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);
}

class CreateBusinessRequest extends $pb.GeneratedMessage {
  factory CreateBusinessRequest({
    Business? business,
    $core.List<$core.int>? logoRawImage,
    $core.Iterable<$1.ResourceLink>? externalLinks,
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
    ..pc<$1.ResourceLink>(
        3, _omitFieldNames ? '' : 'externalLinks', $pb.PbFieldType.PM,
        subBuilder: $1.ResourceLink.create)
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
  $pb.PbList<$1.ResourceLink> get externalLinks => $_getList(2);
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

class BusinessServiceApi {
  final $pb.RpcClient _client;

  BusinessServiceApi(this._client);

  /// Create a new business.
  $async.Future<CreateBusinessResponse> createBusiness(
          $pb.ClientContext? ctx, CreateBusinessRequest request) =>
      _client.invoke<CreateBusinessResponse>(ctx, 'BusinessService',
          'CreateBusiness', request, CreateBusinessResponse());

  /// Request the deletion of the business. This request doesn't delete the business directly instead it put the business in inactive state and remove all business members.
  $async.Future<RequestDeleteBusinessResponse> requestDeleteBusiness(
          $pb.ClientContext? ctx, RequestDeleteBusinessRequest request) =>
      _client.invoke<RequestDeleteBusinessResponse>(ctx, 'BusinessService',
          'RequestDeleteBusiness', request, RequestDeleteBusinessResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
