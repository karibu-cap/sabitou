// This is a generated file - do not edit.
//
// Generated from store/v1/store.proto.

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
import '../../identity/v1/permission.pb.dart' as $1;
import 'store.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'store.pbenum.dart';

class Address extends $pb.GeneratedMessage {
  factory Address({
    $core.String? street,
    $core.String? city,
    $core.String? region,
    $core.String? postalCode,
    $core.String? country,
  }) {
    final result = create();
    if (street != null) result.street = street;
    if (city != null) result.city = city;
    if (region != null) result.region = region;
    if (postalCode != null) result.postalCode = postalCode;
    if (country != null) result.country = country;
    return result;
  }

  Address._();

  factory Address.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Address.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Address',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'street')
    ..aOS(2, _omitFieldNames ? '' : 'city')
    ..aOS(3, _omitFieldNames ? '' : 'region')
    ..aOS(4, _omitFieldNames ? '' : 'postalCode')
    ..aOS(5, _omitFieldNames ? '' : 'country')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Address clone() => Address()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Address copyWith(void Function(Address) updates) =>
      super.copyWith((message) => updates(message as Address)) as Address;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Address create() => Address._();
  @$core.override
  Address createEmptyInstance() => create();
  static $pb.PbList<Address> createRepeated() => $pb.PbList<Address>();
  @$core.pragma('dart2js:noInline')
  static Address getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Address>(create);
  static Address? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get street => $_getSZ(0);
  @$pb.TagNumber(1)
  set street($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStreet() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreet() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get city => $_getSZ(1);
  @$pb.TagNumber(2)
  set city($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCity() => $_has(1);
  @$pb.TagNumber(2)
  void clearCity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get region => $_getSZ(2);
  @$pb.TagNumber(3)
  set region($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get postalCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set postalCode($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPostalCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearPostalCode() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get country => $_getSZ(4);
  @$pb.TagNumber(5)
  set country($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCountry() => $_has(4);
  @$pb.TagNumber(5)
  void clearCountry() => $_clearField(5);
}

/// Stores are used to store products.
/// Note: A store is not always a shop.
class Store extends $pb.GeneratedMessage {
  factory Store({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    $core.String? logoLinkId,
    $core.String? externalLinksIds,
    $core.String? businessId,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
    $core.String? phone,
    Address? address,
    $core.String? email,
    StoreCostingMethod? costingMethod,
    $core.double? tax,
    $core.String? postalBox,
    $core.String? nui,
    $core.String? taxPayerNumber,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (logoLinkId != null) result.logoLinkId = logoLinkId;
    if (externalLinksIds != null) result.externalLinksIds = externalLinksIds;
    if (businessId != null) result.businessId = businessId;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (phone != null) result.phone = phone;
    if (address != null) result.address = address;
    if (email != null) result.email = email;
    if (costingMethod != null) result.costingMethod = costingMethod;
    if (tax != null) result.tax = tax;
    if (postalBox != null) result.postalBox = postalBox;
    if (nui != null) result.nui = nui;
    if (taxPayerNumber != null) result.taxPayerNumber = taxPayerNumber;
    return result;
  }

  Store._();

  factory Store.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Store.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Store',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'logoLinkId')
    ..aOS(7, _omitFieldNames ? '' : 'externalLinksIds')
    ..aOS(8, _omitFieldNames ? '' : 'businessId')
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(11, _omitFieldNames ? '' : 'phone')
    ..aOM<Address>(12, _omitFieldNames ? '' : 'address',
        subBuilder: Address.create)
    ..aOS(13, _omitFieldNames ? '' : 'email')
    ..e<StoreCostingMethod>(
        14, _omitFieldNames ? '' : 'costingMethod', $pb.PbFieldType.OE,
        defaultOrMaker: StoreCostingMethod.STORE_COSTING_METHOD_UNSPECIFIED,
        valueOf: StoreCostingMethod.valueOf,
        enumValues: StoreCostingMethod.values)
    ..a<$core.double>(15, _omitFieldNames ? '' : 'tax', $pb.PbFieldType.OD)
    ..aOS(16, _omitFieldNames ? '' : 'postalBox')
    ..aOS(17, _omitFieldNames ? '' : 'nui')
    ..aOS(18, _omitFieldNames ? '' : 'taxPayerNumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Store clone() => Store()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Store copyWith(void Function(Store) updates) =>
      super.copyWith((message) => updates(message as Store)) as Store;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Store create() => Store._();
  @$core.override
  Store createEmptyInstance() => create();
  static $pb.PbList<Store> createRepeated() => $pb.PbList<Store>();
  @$core.pragma('dart2js:noInline')
  static Store getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Store>(create);
  static Store? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The name of the store.
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  /// The description of the store.
  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  /// The id of the media of the logo of the store.
  @$pb.TagNumber(6)
  $core.String get logoLinkId => $_getSZ(3);
  @$pb.TagNumber(6)
  set logoLinkId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(6)
  $core.bool hasLogoLinkId() => $_has(3);
  @$pb.TagNumber(6)
  void clearLogoLinkId() => $_clearField(6);

  /// The list of external links of the store it can be an address link, a phone number, an email, a website etc.
  @$pb.TagNumber(7)
  $core.String get externalLinksIds => $_getSZ(4);
  @$pb.TagNumber(7)
  set externalLinksIds($core.String value) => $_setString(4, value);
  @$pb.TagNumber(7)
  $core.bool hasExternalLinksIds() => $_has(4);
  @$pb.TagNumber(7)
  void clearExternalLinksIds() => $_clearField(7);

  /// The id of the business of the store.
  @$pb.TagNumber(8)
  $core.String get businessId => $_getSZ(5);
  @$pb.TagNumber(8)
  set businessId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(8)
  $core.bool hasBusinessId() => $_has(5);
  @$pb.TagNumber(8)
  void clearBusinessId() => $_clearField(8);

  /// The date and time the store was created.
  @$pb.TagNumber(9)
  $0.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(9)
  set createdAt($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureCreatedAt() => $_ensure(6);

  /// The date and time the store was last updated.
  @$pb.TagNumber(10)
  $0.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(10)
  set updatedAt($0.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureUpdatedAt() => $_ensure(7);

  /// The business contact information.
  @$pb.TagNumber(11)
  $core.String get phone => $_getSZ(8);
  @$pb.TagNumber(11)
  set phone($core.String value) => $_setString(8, value);
  @$pb.TagNumber(11)
  $core.bool hasPhone() => $_has(8);
  @$pb.TagNumber(11)
  void clearPhone() => $_clearField(11);

  /// The business address.
  @$pb.TagNumber(12)
  Address get address => $_getN(9);
  @$pb.TagNumber(12)
  set address(Address value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasAddress() => $_has(9);
  @$pb.TagNumber(12)
  void clearAddress() => $_clearField(12);
  @$pb.TagNumber(12)
  Address ensureAddress() => $_ensure(9);

  /// The business email.
  @$pb.TagNumber(13)
  $core.String get email => $_getSZ(10);
  @$pb.TagNumber(13)
  set email($core.String value) => $_setString(10, value);
  @$pb.TagNumber(13)
  $core.bool hasEmail() => $_has(10);
  @$pb.TagNumber(13)
  void clearEmail() => $_clearField(13);

  /// The costing method of the store.
  @$pb.TagNumber(14)
  StoreCostingMethod get costingMethod => $_getN(11);
  @$pb.TagNumber(14)
  set costingMethod(StoreCostingMethod value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasCostingMethod() => $_has(11);
  @$pb.TagNumber(14)
  void clearCostingMethod() => $_clearField(14);

  /// The tax of the store.
  @$pb.TagNumber(15)
  $core.double get tax => $_getN(12);
  @$pb.TagNumber(15)
  set tax($core.double value) => $_setDouble(12, value);
  @$pb.TagNumber(15)
  $core.bool hasTax() => $_has(12);
  @$pb.TagNumber(15)
  void clearTax() => $_clearField(15);

  /// The postal box of the store.
  @$pb.TagNumber(16)
  $core.String get postalBox => $_getSZ(13);
  @$pb.TagNumber(16)
  set postalBox($core.String value) => $_setString(13, value);
  @$pb.TagNumber(16)
  $core.bool hasPostalBox() => $_has(13);
  @$pb.TagNumber(16)
  void clearPostalBox() => $_clearField(16);

  /// The nui of the store.
  @$pb.TagNumber(17)
  $core.String get nui => $_getSZ(14);
  @$pb.TagNumber(17)
  set nui($core.String value) => $_setString(14, value);
  @$pb.TagNumber(17)
  $core.bool hasNui() => $_has(14);
  @$pb.TagNumber(17)
  void clearNui() => $_clearField(17);

  /// The tax payer number of the store.
  @$pb.TagNumber(18)
  $core.String get taxPayerNumber => $_getSZ(15);
  @$pb.TagNumber(18)
  set taxPayerNumber($core.String value) => $_setString(15, value);
  @$pb.TagNumber(18)
  $core.bool hasTaxPayerNumber() => $_has(15);
  @$pb.TagNumber(18)
  void clearTaxPayerNumber() => $_clearField(18);
}

class StoreMember extends $pb.GeneratedMessage {
  factory StoreMember({
    $core.String? userId,
    $core.String? storeId,
    $1.StorePermissions? permissions,
    $0.Timestamp? memberSince,
    StoreMemberStatus? status,
    OnboardingType? onboardingType,
    $core.String? invitationId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    if (permissions != null) result.permissions = permissions;
    if (memberSince != null) result.memberSince = memberSince;
    if (status != null) result.status = status;
    if (onboardingType != null) result.onboardingType = onboardingType;
    if (invitationId != null) result.invitationId = invitationId;
    return result;
  }

  StoreMember._();

  factory StoreMember.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreMember.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreMember',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOM<$1.StorePermissions>(3, _omitFieldNames ? '' : 'permissions',
        subBuilder: $1.StorePermissions.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'memberSince',
        subBuilder: $0.Timestamp.create)
    ..e<StoreMemberStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: StoreMemberStatus.STORE_MEMBER_STATUS_UNSPECIFIED,
        valueOf: StoreMemberStatus.valueOf,
        enumValues: StoreMemberStatus.values)
    ..e<OnboardingType>(
        6, _omitFieldNames ? '' : 'onboardingType', $pb.PbFieldType.OE,
        defaultOrMaker: OnboardingType.ONBOARDING_TYPE_UNSPECIFIED,
        valueOf: OnboardingType.valueOf,
        enumValues: OnboardingType.values)
    ..aOS(7, _omitFieldNames ? '' : 'invitationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreMember clone() => StoreMember()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreMember copyWith(void Function(StoreMember) updates) =>
      super.copyWith((message) => updates(message as StoreMember))
          as StoreMember;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreMember create() => StoreMember._();
  @$core.override
  StoreMember createEmptyInstance() => create();
  static $pb.PbList<StoreMember> createRepeated() => $pb.PbList<StoreMember>();
  @$core.pragma('dart2js:noInline')
  static StoreMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreMember>(create);
  static StoreMember? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.StorePermissions get permissions => $_getN(2);
  @$pb.TagNumber(3)
  set permissions($1.StorePermissions value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPermissions() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissions() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.StorePermissions ensurePermissions() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Timestamp get memberSince => $_getN(3);
  @$pb.TagNumber(4)
  set memberSince($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMemberSince() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberSince() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureMemberSince() => $_ensure(3);

  @$pb.TagNumber(5)
  StoreMemberStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(StoreMemberStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  OnboardingType get onboardingType => $_getN(5);
  @$pb.TagNumber(6)
  set onboardingType(OnboardingType value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasOnboardingType() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnboardingType() => $_clearField(6);

  /// Null if DIRECT
  @$pb.TagNumber(7)
  $core.String get invitationId => $_getSZ(6);
  @$pb.TagNumber(7)
  set invitationId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasInvitationId() => $_has(6);
  @$pb.TagNumber(7)
  void clearInvitationId() => $_clearField(7);
}

class CreateStoreRequest extends $pb.GeneratedMessage {
  factory CreateStoreRequest({
    Store? store,
    $core.List<$core.int>? logoRawImage,
  }) {
    final result = create();
    if (store != null) result.store = store;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    return result;
  }

  CreateStoreRequest._();

  factory CreateStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStoreRequest clone() => CreateStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStoreRequest copyWith(void Function(CreateStoreRequest) updates) =>
      super.copyWith((message) => updates(message as CreateStoreRequest))
          as CreateStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStoreRequest create() => CreateStoreRequest._();
  @$core.override
  CreateStoreRequest createEmptyInstance() => create();
  static $pb.PbList<CreateStoreRequest> createRepeated() =>
      $pb.PbList<CreateStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStoreRequest>(create);
  static CreateStoreRequest? _defaultInstance;

  /// The store information to create.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => $_clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);

  /// The raw image of the logo of the store.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);
}

class CreateStoreResponse extends $pb.GeneratedMessage {
  factory CreateStoreResponse({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  CreateStoreResponse._();

  factory CreateStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStoreResponse clone() => CreateStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStoreResponse copyWith(void Function(CreateStoreResponse) updates) =>
      super.copyWith((message) => updates(message as CreateStoreResponse))
          as CreateStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStoreResponse create() => CreateStoreResponse._();
  @$core.override
  CreateStoreResponse createEmptyInstance() => create();
  static $pb.PbList<CreateStoreResponse> createRepeated() =>
      $pb.PbList<CreateStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStoreResponse>(create);
  static CreateStoreResponse? _defaultInstance;

  /// The unique identifier of the created store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class DeleteStoreRequest extends $pb.GeneratedMessage {
  factory DeleteStoreRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  DeleteStoreRequest._();

  factory DeleteStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreRequest clone() => DeleteStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreRequest copyWith(void Function(DeleteStoreRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteStoreRequest))
          as DeleteStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStoreRequest create() => DeleteStoreRequest._();
  @$core.override
  DeleteStoreRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteStoreRequest> createRepeated() =>
      $pb.PbList<DeleteStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStoreRequest>(create);
  static DeleteStoreRequest? _defaultInstance;

  /// The unique identifier of the store to delete.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class DeleteStoreResponse extends $pb.GeneratedMessage {
  factory DeleteStoreResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteStoreResponse._();

  factory DeleteStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreResponse clone() => DeleteStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreResponse copyWith(void Function(DeleteStoreResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteStoreResponse))
          as DeleteStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStoreResponse create() => DeleteStoreResponse._();
  @$core.override
  DeleteStoreResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteStoreResponse> createRepeated() =>
      $pb.PbList<DeleteStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStoreResponse>(create);
  static DeleteStoreResponse? _defaultInstance;

  /// Whether the store was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class StoreServiceApi {
  final $pb.RpcClient _client;

  StoreServiceApi(this._client);

  /// Creates a new store.
  $async.Future<CreateStoreResponse> createStore(
          $pb.ClientContext? ctx, CreateStoreRequest request) =>
      _client.invoke<CreateStoreResponse>(
          ctx, 'StoreService', 'CreateStore', request, CreateStoreResponse());

  /// Deletes a store.
  $async.Future<DeleteStoreResponse> deleteStore(
          $pb.ClientContext? ctx, DeleteStoreRequest request) =>
      _client.invoke<DeleteStoreResponse>(
          ctx, 'StoreService', 'DeleteStore', request, DeleteStoreResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
