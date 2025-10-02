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
import '../../identity/v1/permission.pb.dart' as $2;
import '../../identity/v1/user.pb.dart' as $1;
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
    $1.User? user,
    $core.String? storeId,
    $2.StorePermissions? permissions,
    $0.Timestamp? memberSince,
    StoreMemberStatus? status,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (storeId != null) result.storeId = storeId;
    if (permissions != null) result.permissions = permissions;
    if (memberSince != null) result.memberSince = memberSince;
    if (status != null) result.status = status;
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
    ..aOM<$1.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $1.User.create)
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOM<$2.StorePermissions>(3, _omitFieldNames ? '' : 'permissions',
        subBuilder: $2.StorePermissions.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'memberSince',
        subBuilder: $0.Timestamp.create)
    ..e<StoreMemberStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: StoreMemberStatus.STORE_MEMBER_STATUS_UNSPECIFIED,
        valueOf: StoreMemberStatus.valueOf,
        enumValues: StoreMemberStatus.values)
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

  /// The user.
  @$pb.TagNumber(1)
  $1.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureUser() => $_ensure(0);

  /// The unique identifier of the store.
  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  /// The permissions that the user has.
  @$pb.TagNumber(3)
  $2.StorePermissions get permissions => $_getN(2);
  @$pb.TagNumber(3)
  set permissions($2.StorePermissions value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPermissions() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissions() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.StorePermissions ensurePermissions() => $_ensure(2);

  /// The date since when the user became a member.
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

  /// The status of the user.
  @$pb.TagNumber(5)
  StoreMemberStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(StoreMemberStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);
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

class GetStoreRequest extends $pb.GeneratedMessage {
  factory GetStoreRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetStoreRequest._();

  factory GetStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreRequest clone() => GetStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreRequest copyWith(void Function(GetStoreRequest) updates) =>
      super.copyWith((message) => updates(message as GetStoreRequest))
          as GetStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreRequest create() => GetStoreRequest._();
  @$core.override
  GetStoreRequest createEmptyInstance() => create();
  static $pb.PbList<GetStoreRequest> createRepeated() =>
      $pb.PbList<GetStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreRequest>(create);
  static GetStoreRequest? _defaultInstance;

  /// The unique identifier of the store to retrieve.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetStoreResponse extends $pb.GeneratedMessage {
  factory GetStoreResponse({
    Store? store,
  }) {
    final result = create();
    if (store != null) result.store = store;
    return result;
  }

  GetStoreResponse._();

  factory GetStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreResponse clone() => GetStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreResponse copyWith(void Function(GetStoreResponse) updates) =>
      super.copyWith((message) => updates(message as GetStoreResponse))
          as GetStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreResponse create() => GetStoreResponse._();
  @$core.override
  GetStoreResponse createEmptyInstance() => create();
  static $pb.PbList<GetStoreResponse> createRepeated() =>
      $pb.PbList<GetStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreResponse>(create);
  static GetStoreResponse? _defaultInstance;

  /// The retrieved store data.
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
}

class UpdateStoreRequest extends $pb.GeneratedMessage {
  factory UpdateStoreRequest({
    Store? store,
    $core.List<$core.int>? logoRawImage,
  }) {
    final result = create();
    if (store != null) result.store = store;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    return result;
  }

  UpdateStoreRequest._();

  factory UpdateStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreRequest clone() => UpdateStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreRequest copyWith(void Function(UpdateStoreRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreRequest))
          as UpdateStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreRequest create() => UpdateStoreRequest._();
  @$core.override
  UpdateStoreRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreRequest> createRepeated() =>
      $pb.PbList<UpdateStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreRequest>(create);
  static UpdateStoreRequest? _defaultInstance;

  /// The store information to update.
  /// Note:Only the fields that are set will be updated.
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

class UpdateStoreResponse extends $pb.GeneratedMessage {
  factory UpdateStoreResponse({
    Store? store,
  }) {
    final result = create();
    if (store != null) result.store = store;
    return result;
  }

  UpdateStoreResponse._();

  factory UpdateStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreResponse clone() => UpdateStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreResponse copyWith(void Function(UpdateStoreResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreResponse))
          as UpdateStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreResponse create() => UpdateStoreResponse._();
  @$core.override
  UpdateStoreResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreResponse> createRepeated() =>
      $pb.PbList<UpdateStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreResponse>(create);
  static UpdateStoreResponse? _defaultInstance;

  /// The updated store data.
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

class GetBusinessStoresRequest extends $pb.GeneratedMessage {
  factory GetBusinessStoresRequest({
    $core.String? businessId,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  GetBusinessStoresRequest._();

  factory GetBusinessStoresRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessStoresRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessStoresRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessStoresRequest clone() =>
      GetBusinessStoresRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessStoresRequest copyWith(
          void Function(GetBusinessStoresRequest) updates) =>
      super.copyWith((message) => updates(message as GetBusinessStoresRequest))
          as GetBusinessStoresRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessStoresRequest create() => GetBusinessStoresRequest._();
  @$core.override
  GetBusinessStoresRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessStoresRequest> createRepeated() =>
      $pb.PbList<GetBusinessStoresRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessStoresRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessStoresRequest>(create);
  static GetBusinessStoresRequest? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);
}

class GetBusinessStoresResponse extends $pb.GeneratedMessage {
  factory GetBusinessStoresResponse({
    $core.Iterable<Store>? stores,
  }) {
    final result = create();
    if (stores != null) result.stores.addAll(stores);
    return result;
  }

  GetBusinessStoresResponse._();

  factory GetBusinessStoresResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessStoresResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessStoresResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..pc<Store>(1, _omitFieldNames ? '' : 'stores', $pb.PbFieldType.PM,
        subBuilder: Store.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessStoresResponse clone() =>
      GetBusinessStoresResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessStoresResponse copyWith(
          void Function(GetBusinessStoresResponse) updates) =>
      super.copyWith((message) => updates(message as GetBusinessStoresResponse))
          as GetBusinessStoresResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessStoresResponse create() => GetBusinessStoresResponse._();
  @$core.override
  GetBusinessStoresResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessStoresResponse> createRepeated() =>
      $pb.PbList<GetBusinessStoresResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessStoresResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessStoresResponse>(create);
  static GetBusinessStoresResponse? _defaultInstance;

  /// The list of stores of the business.
  /// Note: Only the ids and names of the stores are returned.
  @$pb.TagNumber(1)
  $pb.PbList<Store> get stores => $_getList(0);
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

class AddUserToStoreRequest extends $pb.GeneratedMessage {
  factory AddUserToStoreRequest({
    $core.String? email,
    $2.StorePermissions? permissions,
    $core.String? storeId,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (permissions != null) result.permissions = permissions;
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  AddUserToStoreRequest._();

  factory AddUserToStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddUserToStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddUserToStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOM<$2.StorePermissions>(2, _omitFieldNames ? '' : 'permissions',
        subBuilder: $2.StorePermissions.create)
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddUserToStoreRequest clone() =>
      AddUserToStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddUserToStoreRequest copyWith(
          void Function(AddUserToStoreRequest) updates) =>
      super.copyWith((message) => updates(message as AddUserToStoreRequest))
          as AddUserToStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUserToStoreRequest create() => AddUserToStoreRequest._();
  @$core.override
  AddUserToStoreRequest createEmptyInstance() => create();
  static $pb.PbList<AddUserToStoreRequest> createRepeated() =>
      $pb.PbList<AddUserToStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static AddUserToStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddUserToStoreRequest>(create);
  static AddUserToStoreRequest? _defaultInstance;

  /// The email of the user.
  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  /// The permissions that the user has.
  @$pb.TagNumber(2)
  $2.StorePermissions get permissions => $_getN(1);
  @$pb.TagNumber(2)
  set permissions($2.StorePermissions value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPermissions() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissions() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.StorePermissions ensurePermissions() => $_ensure(1);

  /// The store id.
  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);
}

class AddUserToStoreResponse extends $pb.GeneratedMessage {
  factory AddUserToStoreResponse({
    $core.bool? success,
    StoreMember? storeMember,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (storeMember != null) result.storeMember = storeMember;
    return result;
  }

  AddUserToStoreResponse._();

  factory AddUserToStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddUserToStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddUserToStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<StoreMember>(2, _omitFieldNames ? '' : 'storeMember',
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddUserToStoreResponse clone() =>
      AddUserToStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddUserToStoreResponse copyWith(
          void Function(AddUserToStoreResponse) updates) =>
      super.copyWith((message) => updates(message as AddUserToStoreResponse))
          as AddUserToStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUserToStoreResponse create() => AddUserToStoreResponse._();
  @$core.override
  AddUserToStoreResponse createEmptyInstance() => create();
  static $pb.PbList<AddUserToStoreResponse> createRepeated() =>
      $pb.PbList<AddUserToStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static AddUserToStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddUserToStoreResponse>(create);
  static AddUserToStoreResponse? _defaultInstance;

  /// Whether the store was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  /// The store member to return
  @$pb.TagNumber(2)
  StoreMember get storeMember => $_getN(1);
  @$pb.TagNumber(2)
  set storeMember(StoreMember value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreMember() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreMember() => $_clearField(2);
  @$pb.TagNumber(2)
  StoreMember ensureStoreMember() => $_ensure(1);
}

class UpdateStoreMemberRequest extends $pb.GeneratedMessage {
  factory UpdateStoreMemberRequest({
    $core.String? userId,
    $core.String? storeId,
    $2.StorePermissions? permissions,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    if (permissions != null) result.permissions = permissions;
    return result;
  }

  UpdateStoreMemberRequest._();

  factory UpdateStoreMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreMemberRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOM<$2.StorePermissions>(5, _omitFieldNames ? '' : 'permissions',
        subBuilder: $2.StorePermissions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreMemberRequest clone() =>
      UpdateStoreMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreMemberRequest copyWith(
          void Function(UpdateStoreMemberRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreMemberRequest))
          as UpdateStoreMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreMemberRequest create() => UpdateStoreMemberRequest._();
  @$core.override
  UpdateStoreMemberRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreMemberRequest> createRepeated() =>
      $pb.PbList<UpdateStoreMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreMemberRequest>(create);
  static UpdateStoreMemberRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the store.
  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  /// The new permissions to add (optional).
  @$pb.TagNumber(5)
  $2.StorePermissions get permissions => $_getN(2);
  @$pb.TagNumber(5)
  set permissions($2.StorePermissions value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPermissions() => $_has(2);
  @$pb.TagNumber(5)
  void clearPermissions() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.StorePermissions ensurePermissions() => $_ensure(2);
}

class UpdateStoreMemberResponse extends $pb.GeneratedMessage {
  factory UpdateStoreMemberResponse({
    $core.bool? success,
    StoreMember? storeMember,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (storeMember != null) result.storeMember = storeMember;
    return result;
  }

  UpdateStoreMemberResponse._();

  factory UpdateStoreMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreMemberResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<StoreMember>(2, _omitFieldNames ? '' : 'storeMember',
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreMemberResponse clone() =>
      UpdateStoreMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreMemberResponse copyWith(
          void Function(UpdateStoreMemberResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreMemberResponse))
          as UpdateStoreMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreMemberResponse create() => UpdateStoreMemberResponse._();
  @$core.override
  UpdateStoreMemberResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreMemberResponse> createRepeated() =>
      $pb.PbList<UpdateStoreMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreMemberResponse>(create);
  static UpdateStoreMemberResponse? _defaultInstance;

  /// Whether the member was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  /// The updated store member.
  @$pb.TagNumber(2)
  StoreMember get storeMember => $_getN(1);
  @$pb.TagNumber(2)
  set storeMember(StoreMember value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreMember() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreMember() => $_clearField(2);
  @$pb.TagNumber(2)
  StoreMember ensureStoreMember() => $_ensure(1);
}

class StreamStoreMembersRequest extends $pb.GeneratedMessage {
  factory StreamStoreMembersRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  StreamStoreMembersRequest._();

  factory StreamStoreMembersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamStoreMembersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamStoreMembersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreMembersRequest clone() =>
      StreamStoreMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreMembersRequest copyWith(
          void Function(StreamStoreMembersRequest) updates) =>
      super.copyWith((message) => updates(message as StreamStoreMembersRequest))
          as StreamStoreMembersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamStoreMembersRequest create() => StreamStoreMembersRequest._();
  @$core.override
  StreamStoreMembersRequest createEmptyInstance() => create();
  static $pb.PbList<StreamStoreMembersRequest> createRepeated() =>
      $pb.PbList<StreamStoreMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamStoreMembersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamStoreMembersRequest>(create);
  static StreamStoreMembersRequest? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class StreamStoreMembersResponse extends $pb.GeneratedMessage {
  factory StreamStoreMembersResponse({
    $core.Iterable<StoreMember>? storeMembers,
  }) {
    final result = create();
    if (storeMembers != null) result.storeMembers.addAll(storeMembers);
    return result;
  }

  StreamStoreMembersResponse._();

  factory StreamStoreMembersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamStoreMembersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamStoreMembersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..pc<StoreMember>(
        1, _omitFieldNames ? '' : 'storeMembers', $pb.PbFieldType.PM,
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreMembersResponse clone() =>
      StreamStoreMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreMembersResponse copyWith(
          void Function(StreamStoreMembersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StreamStoreMembersResponse))
          as StreamStoreMembersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamStoreMembersResponse create() => StreamStoreMembersResponse._();
  @$core.override
  StreamStoreMembersResponse createEmptyInstance() => create();
  static $pb.PbList<StreamStoreMembersResponse> createRepeated() =>
      $pb.PbList<StreamStoreMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamStoreMembersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamStoreMembersResponse>(create);
  static StreamStoreMembersResponse? _defaultInstance;

  /// The store members.
  @$pb.TagNumber(1)
  $pb.PbList<StoreMember> get storeMembers => $_getList(0);
}

class SetStoreMemberStatusRequest extends $pb.GeneratedMessage {
  factory SetStoreMemberStatusRequest({
    $core.String? storeId,
    $core.String? userId,
    StoreMemberStatus? status,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (userId != null) result.userId = userId;
    if (status != null) result.status = status;
    return result;
  }

  SetStoreMemberStatusRequest._();

  factory SetStoreMemberStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetStoreMemberStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetStoreMemberStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..e<StoreMemberStatus>(
        3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: StoreMemberStatus.STORE_MEMBER_STATUS_UNSPECIFIED,
        valueOf: StoreMemberStatus.valueOf,
        enumValues: StoreMemberStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetStoreMemberStatusRequest clone() =>
      SetStoreMemberStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetStoreMemberStatusRequest copyWith(
          void Function(SetStoreMemberStatusRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SetStoreMemberStatusRequest))
          as SetStoreMemberStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetStoreMemberStatusRequest create() =>
      SetStoreMemberStatusRequest._();
  @$core.override
  SetStoreMemberStatusRequest createEmptyInstance() => create();
  static $pb.PbList<SetStoreMemberStatusRequest> createRepeated() =>
      $pb.PbList<SetStoreMemberStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static SetStoreMemberStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetStoreMemberStatusRequest>(create);
  static SetStoreMemberStatusRequest? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// The unique identifier of the user.
  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  /// The status of the user.
  @$pb.TagNumber(3)
  StoreMemberStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(StoreMemberStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);
}

class SetStoreMemberStatusResponse extends $pb.GeneratedMessage {
  factory SetStoreMemberStatusResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  SetStoreMemberStatusResponse._();

  factory SetStoreMemberStatusResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetStoreMemberStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetStoreMemberStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetStoreMemberStatusResponse clone() =>
      SetStoreMemberStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetStoreMemberStatusResponse copyWith(
          void Function(SetStoreMemberStatusResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SetStoreMemberStatusResponse))
          as SetStoreMemberStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetStoreMemberStatusResponse create() =>
      SetStoreMemberStatusResponse._();
  @$core.override
  SetStoreMemberStatusResponse createEmptyInstance() => create();
  static $pb.PbList<SetStoreMemberStatusResponse> createRepeated() =>
      $pb.PbList<SetStoreMemberStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static SetStoreMemberStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetStoreMemberStatusResponse>(create);
  static SetStoreMemberStatusResponse? _defaultInstance;

  /// Whether the member was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class GetStoreMembersRequest extends $pb.GeneratedMessage {
  factory GetStoreMembersRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetStoreMembersRequest._();

  factory GetStoreMembersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreMembersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreMembersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreMembersRequest clone() =>
      GetStoreMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreMembersRequest copyWith(
          void Function(GetStoreMembersRequest) updates) =>
      super.copyWith((message) => updates(message as GetStoreMembersRequest))
          as GetStoreMembersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreMembersRequest create() => GetStoreMembersRequest._();
  @$core.override
  GetStoreMembersRequest createEmptyInstance() => create();
  static $pb.PbList<GetStoreMembersRequest> createRepeated() =>
      $pb.PbList<GetStoreMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStoreMembersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreMembersRequest>(create);
  static GetStoreMembersRequest? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetStoreMembersResponse extends $pb.GeneratedMessage {
  factory GetStoreMembersResponse({
    $core.Iterable<StoreMember>? storeMembers,
  }) {
    final result = create();
    if (storeMembers != null) result.storeMembers.addAll(storeMembers);
    return result;
  }

  GetStoreMembersResponse._();

  factory GetStoreMembersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreMembersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreMembersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..pc<StoreMember>(
        1, _omitFieldNames ? '' : 'storeMembers', $pb.PbFieldType.PM,
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreMembersResponse clone() =>
      GetStoreMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreMembersResponse copyWith(
          void Function(GetStoreMembersResponse) updates) =>
      super.copyWith((message) => updates(message as GetStoreMembersResponse))
          as GetStoreMembersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreMembersResponse create() => GetStoreMembersResponse._();
  @$core.override
  GetStoreMembersResponse createEmptyInstance() => create();
  static $pb.PbList<GetStoreMembersResponse> createRepeated() =>
      $pb.PbList<GetStoreMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStoreMembersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreMembersResponse>(create);
  static GetStoreMembersResponse? _defaultInstance;

  /// The store members.
  @$pb.TagNumber(1)
  $pb.PbList<StoreMember> get storeMembers => $_getList(0);
}

class GetStoreMemberRequest extends $pb.GeneratedMessage {
  factory GetStoreMemberRequest({
    $core.String? storeId,
    $core.String? userId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (userId != null) result.userId = userId;
    return result;
  }

  GetStoreMemberRequest._();

  factory GetStoreMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreMemberRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreMemberRequest clone() =>
      GetStoreMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreMemberRequest copyWith(
          void Function(GetStoreMemberRequest) updates) =>
      super.copyWith((message) => updates(message as GetStoreMemberRequest))
          as GetStoreMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreMemberRequest create() => GetStoreMemberRequest._();
  @$core.override
  GetStoreMemberRequest createEmptyInstance() => create();
  static $pb.PbList<GetStoreMemberRequest> createRepeated() =>
      $pb.PbList<GetStoreMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStoreMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreMemberRequest>(create);
  static GetStoreMemberRequest? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// The unique identifier of the user.
  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);
}

class GetStoreMemberResponse extends $pb.GeneratedMessage {
  factory GetStoreMemberResponse({
    StoreMember? storeMember,
  }) {
    final result = create();
    if (storeMember != null) result.storeMember = storeMember;
    return result;
  }

  GetStoreMemberResponse._();

  factory GetStoreMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreMemberResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<StoreMember>(1, _omitFieldNames ? '' : 'storeMember',
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreMemberResponse clone() =>
      GetStoreMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreMemberResponse copyWith(
          void Function(GetStoreMemberResponse) updates) =>
      super.copyWith((message) => updates(message as GetStoreMemberResponse))
          as GetStoreMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreMemberResponse create() => GetStoreMemberResponse._();
  @$core.override
  GetStoreMemberResponse createEmptyInstance() => create();
  static $pb.PbList<GetStoreMemberResponse> createRepeated() =>
      $pb.PbList<GetStoreMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStoreMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreMemberResponse>(create);
  static GetStoreMemberResponse? _defaultInstance;

  /// The store member.
  @$pb.TagNumber(1)
  StoreMember get storeMember => $_getN(0);
  @$pb.TagNumber(1)
  set storeMember(StoreMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreMember() => $_clearField(1);
  @$pb.TagNumber(1)
  StoreMember ensureStoreMember() => $_ensure(0);
}

class RemoveUserFromStoreRequest extends $pb.GeneratedMessage {
  factory RemoveUserFromStoreRequest({
    $core.String? userId,
    $core.String? storeId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  RemoveUserFromStoreRequest._();

  factory RemoveUserFromStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveUserFromStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveUserFromStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveUserFromStoreRequest clone() =>
      RemoveUserFromStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveUserFromStoreRequest copyWith(
          void Function(RemoveUserFromStoreRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveUserFromStoreRequest))
          as RemoveUserFromStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromStoreRequest create() => RemoveUserFromStoreRequest._();
  @$core.override
  RemoveUserFromStoreRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromStoreRequest> createRepeated() =>
      $pb.PbList<RemoveUserFromStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveUserFromStoreRequest>(create);
  static RemoveUserFromStoreRequest? _defaultInstance;

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
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);
}

class RemoveUserFromStoreResponse extends $pb.GeneratedMessage {
  factory RemoveUserFromStoreResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  RemoveUserFromStoreResponse._();

  factory RemoveUserFromStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveUserFromStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveUserFromStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveUserFromStoreResponse clone() =>
      RemoveUserFromStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveUserFromStoreResponse copyWith(
          void Function(RemoveUserFromStoreResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveUserFromStoreResponse))
          as RemoveUserFromStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromStoreResponse create() =>
      RemoveUserFromStoreResponse._();
  @$core.override
  RemoveUserFromStoreResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromStoreResponse> createRepeated() =>
      $pb.PbList<RemoveUserFromStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveUserFromStoreResponse>(create);
  static RemoveUserFromStoreResponse? _defaultInstance;

  /// Whether the user was successfully removed from the store.
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

  /// Gets a store by id.
  $async.Future<GetStoreResponse> getStore(
          $pb.ClientContext? ctx, GetStoreRequest request) =>
      _client.invoke<GetStoreResponse>(
          ctx, 'StoreService', 'GetStore', request, GetStoreResponse());

  /// Updates a store.
  /// Note:Only the fields that are set will be updated.
  $async.Future<UpdateStoreResponse> updateStore(
          $pb.ClientContext? ctx, UpdateStoreRequest request) =>
      _client.invoke<UpdateStoreResponse>(
          ctx, 'StoreService', 'UpdateStore', request, UpdateStoreResponse());

  /// Deletes a store.
  $async.Future<DeleteStoreResponse> deleteStore(
          $pb.ClientContext? ctx, DeleteStoreRequest request) =>
      _client.invoke<DeleteStoreResponse>(
          ctx, 'StoreService', 'DeleteStore', request, DeleteStoreResponse());

  /// Gets all stores base on business Id.
  $async.Future<GetBusinessStoresResponse> getBusinessStores(
          $pb.ClientContext? ctx, GetBusinessStoresRequest request) =>
      _client.invoke<GetBusinessStoresResponse>(ctx, 'StoreService',
          'GetBusinessStores', request, GetBusinessStoresResponse());

  /// Add user to store or invite user to store.
  $async.Future<AddUserToStoreResponse> addUserToStore(
          $pb.ClientContext? ctx, AddUserToStoreRequest request) =>
      _client.invoke<AddUserToStoreResponse>(ctx, 'StoreService',
          'AddUserToStore', request, AddUserToStoreResponse());

  /// Update store member.
  $async.Future<UpdateStoreMemberResponse> updateStoreMember(
          $pb.ClientContext? ctx, UpdateStoreMemberRequest request) =>
      _client.invoke<UpdateStoreMemberResponse>(ctx, 'StoreService',
          'UpdateStoreMember', request, UpdateStoreMemberResponse());

  /// Stream store members.
  $async.Future<StreamStoreMembersResponse> streamStoreMembers(
          $pb.ClientContext? ctx, StreamStoreMembersRequest request) =>
      _client.invoke<StreamStoreMembersResponse>(ctx, 'StoreService',
          'StreamStoreMembers', request, StreamStoreMembersResponse());

  /// Get store members.
  $async.Future<GetStoreMembersResponse> getStoreMembers(
          $pb.ClientContext? ctx, GetStoreMembersRequest request) =>
      _client.invoke<GetStoreMembersResponse>(ctx, 'StoreService',
          'GetStoreMembers', request, GetStoreMembersResponse());

  /// Get store member.
  $async.Future<GetStoreMemberResponse> getStoreMember(
          $pb.ClientContext? ctx, GetStoreMemberRequest request) =>
      _client.invoke<GetStoreMemberResponse>(ctx, 'StoreService',
          'GetStoreMember', request, GetStoreMemberResponse());

  /// Set store member status.
  $async.Future<SetStoreMemberStatusResponse> setStoreMemberStatus(
          $pb.ClientContext? ctx, SetStoreMemberStatusRequest request) =>
      _client.invoke<SetStoreMemberStatusResponse>(ctx, 'StoreService',
          'SetStoreMemberStatus', request, SetStoreMemberStatusResponse());

  /// Remove user from store.
  $async.Future<RemoveUserFromStoreResponse> removeUserFromStore(
          $pb.ClientContext? ctx, RemoveUserFromStoreRequest request) =>
      _client.invoke<RemoveUserFromStoreResponse>(ctx, 'StoreService',
          'RemoveUserFromStore', request, RemoveUserFromStoreResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
