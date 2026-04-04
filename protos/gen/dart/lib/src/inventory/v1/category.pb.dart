// This is a generated file - do not edit.
//
// Generated from inventory/v1/category.proto.

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
import 'category.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'category.pbenum.dart';

class Internationalized extends $pb.GeneratedMessage {
  factory Internationalized({
    $core.String? en,
    $core.String? fr,
  }) {
    final result = create();
    if (en != null) result.en = en;
    if (fr != null) result.fr = fr;
    return result;
  }

  Internationalized._();

  factory Internationalized.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Internationalized.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Internationalized',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'en')
    ..aOS(2, _omitFieldNames ? '' : 'fr')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Internationalized clone() => Internationalized()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Internationalized copyWith(void Function(Internationalized) updates) =>
      super.copyWith((message) => updates(message as Internationalized))
          as Internationalized;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Internationalized create() => Internationalized._();
  @$core.override
  Internationalized createEmptyInstance() => create();
  static $pb.PbList<Internationalized> createRepeated() =>
      $pb.PbList<Internationalized>();
  @$core.pragma('dart2js:noInline')
  static Internationalized getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Internationalized>(create);
  static Internationalized? _defaultInstance;

  /// The English name of the product category.
  @$pb.TagNumber(1)
  $core.String get en => $_getSZ(0);
  @$pb.TagNumber(1)
  set en($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEn() => $_has(0);
  @$pb.TagNumber(1)
  void clearEn() => $_clearField(1);

  /// The French name of the product category.
  @$pb.TagNumber(2)
  $core.String get fr => $_getSZ(1);
  @$pb.TagNumber(2)
  set fr($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFr() => $_has(1);
  @$pb.TagNumber(2)
  void clearFr() => $_clearField(2);
}

class Category extends $pb.GeneratedMessage {
  factory Category({
    $core.String? refId,
    Internationalized? name,
    $core.String? parentCategoryId,
    CategoryStatus? status,
    CategoryType? type,
    $core.String? businessId,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    if (parentCategoryId != null) result.parentCategoryId = parentCategoryId;
    if (status != null) result.status = status;
    if (type != null) result.type = type;
    if (businessId != null) result.businessId = businessId;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  Category._();

  factory Category.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Category.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Category',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOM<Internationalized>(2, _omitFieldNames ? '' : 'name',
        subBuilder: Internationalized.create)
    ..aOS(3, _omitFieldNames ? '' : 'parentCategoryId')
    ..e<CategoryStatus>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: CategoryStatus.CATEGORY_STATUS_UNSPECIFIED,
        valueOf: CategoryStatus.valueOf,
        enumValues: CategoryStatus.values)
    ..e<CategoryType>(5, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: CategoryType.CATEGORY_TYPE_UNSPECIFIED,
        valueOf: CategoryType.valueOf,
        enumValues: CategoryType.values)
    ..aOS(6, _omitFieldNames ? '' : 'businessId')
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Category clone() => Category()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Category copyWith(void Function(Category) updates) =>
      super.copyWith((message) => updates(message as Category)) as Category;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Category create() => Category._();
  @$core.override
  Category createEmptyInstance() => create();
  static $pb.PbList<Category> createRepeated() => $pb.PbList<Category>();
  @$core.pragma('dart2js:noInline')
  static Category getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Category>(create);
  static Category? _defaultInstance;

  /// Unique identifier for the category
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// Name of the category (e.g., "Electronics", "Smart TVs")
  @$pb.TagNumber(2)
  Internationalized get name => $_getN(1);
  @$pb.TagNumber(2)
  set name(Internationalized value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
  @$pb.TagNumber(2)
  Internationalized ensureName() => $_ensure(1);

  /// Reference to parent category (empty for root categories)
  @$pb.TagNumber(3)
  $core.String get parentCategoryId => $_getSZ(2);
  @$pb.TagNumber(3)
  set parentCategoryId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParentCategoryId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentCategoryId() => $_clearField(3);

  /// The status of the category.
  @$pb.TagNumber(4)
  CategoryStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(CategoryStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  /// The status of the category.
  @$pb.TagNumber(5)
  CategoryType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(CategoryType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  /// Business ID associated with the category
  @$pb.TagNumber(6)
  $core.String get businessId => $_getSZ(5);
  @$pb.TagNumber(6)
  set businessId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBusinessId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBusinessId() => $_clearField(6);

  /// Timestamp when the category was created
  @$pb.TagNumber(7)
  $0.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureCreatedAt() => $_ensure(6);

  /// Timestamp when the category was last updated
  @$pb.TagNumber(8)
  $0.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureUpdatedAt() => $_ensure(7);
}

class DeleteCategoryRequest extends $pb.GeneratedMessage {
  factory DeleteCategoryRequest({
    $core.String? categoryId,
  }) {
    final result = create();
    if (categoryId != null) result.categoryId = categoryId;
    return result;
  }

  DeleteCategoryRequest._();

  factory DeleteCategoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteCategoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteCategoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'categoryId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteCategoryRequest clone() =>
      DeleteCategoryRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteCategoryRequest copyWith(
          void Function(DeleteCategoryRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteCategoryRequest))
          as DeleteCategoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCategoryRequest create() => DeleteCategoryRequest._();
  @$core.override
  DeleteCategoryRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCategoryRequest> createRepeated() =>
      $pb.PbList<DeleteCategoryRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCategoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteCategoryRequest>(create);
  static DeleteCategoryRequest? _defaultInstance;

  /// The unique identifier of the category.
  @$pb.TagNumber(1)
  $core.String get categoryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set categoryId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCategoryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategoryId() => $_clearField(1);
}

class DeleteCategoryResponse extends $pb.GeneratedMessage {
  factory DeleteCategoryResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteCategoryResponse._();

  factory DeleteCategoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteCategoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteCategoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteCategoryResponse clone() =>
      DeleteCategoryResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteCategoryResponse copyWith(
          void Function(DeleteCategoryResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteCategoryResponse))
          as DeleteCategoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCategoryResponse create() => DeleteCategoryResponse._();
  @$core.override
  DeleteCategoryResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteCategoryResponse> createRepeated() =>
      $pb.PbList<DeleteCategoryResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteCategoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteCategoryResponse>(create);
  static DeleteCategoryResponse? _defaultInstance;

  /// Whether the category was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class CategoryServiceApi {
  final $pb.RpcClient _client;

  CategoryServiceApi(this._client);

  /// Deletes a category.
  $async.Future<DeleteCategoryResponse> deleteCategory(
          $pb.ClientContext? ctx, DeleteCategoryRequest request) =>
      _client.invoke<DeleteCategoryResponse>(ctx, 'CategoryService',
          'DeleteCategory', request, DeleteCategoryResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
