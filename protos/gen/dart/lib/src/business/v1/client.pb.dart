// This is a generated file - do not edit.
//
// Generated from business/v1/client.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class BusinessClient extends $pb.GeneratedMessage {
  factory BusinessClient({
    $core.String? refId,
    $core.String? fullName,
    $core.Iterable<$core.String>? externalLinksIds,
    $core.String? logoLinkId,
    $core.String? businessId,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (fullName != null) result.fullName = fullName;
    if (externalLinksIds != null)
      result.externalLinksIds.addAll(externalLinksIds);
    if (logoLinkId != null) result.logoLinkId = logoLinkId;
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  BusinessClient._();

  factory BusinessClient.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusinessClient.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusinessClient',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'fullName')
    ..pPS(3, _omitFieldNames ? '' : 'externalLinksIds')
    ..aOS(4, _omitFieldNames ? '' : 'logoLinkId')
    ..aOS(5, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessClient clone() => BusinessClient()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessClient copyWith(void Function(BusinessClient) updates) =>
      super.copyWith((message) => updates(message as BusinessClient))
          as BusinessClient;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessClient create() => BusinessClient._();
  @$core.override
  BusinessClient createEmptyInstance() => create();
  static $pb.PbList<BusinessClient> createRepeated() =>
      $pb.PbList<BusinessClient>();
  @$core.pragma('dart2js:noInline')
  static BusinessClient getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessClient>(create);
  static BusinessClient? _defaultInstance;

  /// The reference id to the client identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The name of the client.
  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => $_clearField(2);

  /// The links of the client it can contain client mail, phone number, website etc.
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get externalLinksIds => $_getList(2);

  /// The id of the media of the logo of the client.
  @$pb.TagNumber(4)
  $core.String get logoLinkId => $_getSZ(3);
  @$pb.TagNumber(4)
  set logoLinkId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLogoLinkId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogoLinkId() => $_clearField(4);

  /// The id of the business of the client.
  @$pb.TagNumber(5)
  $core.String get businessId => $_getSZ(4);
  @$pb.TagNumber(5)
  set businessId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBusinessId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBusinessId() => $_clearField(5);
}

class CreateBusinessClientRequest extends $pb.GeneratedMessage {
  factory CreateBusinessClientRequest({
    BusinessClient? client,
    $core.List<$core.int>? logoRawImage,
  }) {
    final result = create();
    if (client != null) result.client = client;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    return result;
  }

  CreateBusinessClientRequest._();

  factory CreateBusinessClientRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBusinessClientRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBusinessClientRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessClient>(1, _omitFieldNames ? '' : 'client',
        subBuilder: BusinessClient.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessClientRequest clone() =>
      CreateBusinessClientRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessClientRequest copyWith(
          void Function(CreateBusinessClientRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateBusinessClientRequest))
          as CreateBusinessClientRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessClientRequest create() =>
      CreateBusinessClientRequest._();
  @$core.override
  CreateBusinessClientRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessClientRequest> createRepeated() =>
      $pb.PbList<CreateBusinessClientRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessClientRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBusinessClientRequest>(create);
  static CreateBusinessClientRequest? _defaultInstance;

  /// The client information to create.
  @$pb.TagNumber(1)
  BusinessClient get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(BusinessClient value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessClient ensureClient() => $_ensure(0);

  /// The raw image of the logo of the client.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);
}

class CreateBusinessClientResponse extends $pb.GeneratedMessage {
  factory CreateBusinessClientResponse({
    $core.String? clientId,
  }) {
    final result = create();
    if (clientId != null) result.clientId = clientId;
    return result;
  }

  CreateBusinessClientResponse._();

  factory CreateBusinessClientResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBusinessClientResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBusinessClientResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessClientResponse clone() =>
      CreateBusinessClientResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessClientResponse copyWith(
          void Function(CreateBusinessClientResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateBusinessClientResponse))
          as CreateBusinessClientResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessClientResponse create() =>
      CreateBusinessClientResponse._();
  @$core.override
  CreateBusinessClientResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessClientResponse> createRepeated() =>
      $pb.PbList<CreateBusinessClientResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessClientResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBusinessClientResponse>(create);
  static CreateBusinessClientResponse? _defaultInstance;

  /// The reference id to the client identifier.
  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);
}

class GetBusinessClientRequest extends $pb.GeneratedMessage {
  factory GetBusinessClientRequest({
    $core.String? clientId,
  }) {
    final result = create();
    if (clientId != null) result.clientId = clientId;
    return result;
  }

  GetBusinessClientRequest._();

  factory GetBusinessClientRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessClientRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessClientRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessClientRequest clone() =>
      GetBusinessClientRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessClientRequest copyWith(
          void Function(GetBusinessClientRequest) updates) =>
      super.copyWith((message) => updates(message as GetBusinessClientRequest))
          as GetBusinessClientRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessClientRequest create() => GetBusinessClientRequest._();
  @$core.override
  GetBusinessClientRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessClientRequest> createRepeated() =>
      $pb.PbList<GetBusinessClientRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessClientRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessClientRequest>(create);
  static GetBusinessClientRequest? _defaultInstance;

  /// The reference id to the client identifier.
  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);
}

class GetBusinessClientResponse extends $pb.GeneratedMessage {
  factory GetBusinessClientResponse({
    BusinessClient? client,
  }) {
    final result = create();
    if (client != null) result.client = client;
    return result;
  }

  GetBusinessClientResponse._();

  factory GetBusinessClientResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessClientResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessClientResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessClient>(1, _omitFieldNames ? '' : 'client',
        subBuilder: BusinessClient.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessClientResponse clone() =>
      GetBusinessClientResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessClientResponse copyWith(
          void Function(GetBusinessClientResponse) updates) =>
      super.copyWith((message) => updates(message as GetBusinessClientResponse))
          as GetBusinessClientResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessClientResponse create() => GetBusinessClientResponse._();
  @$core.override
  GetBusinessClientResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessClientResponse> createRepeated() =>
      $pb.PbList<GetBusinessClientResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessClientResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessClientResponse>(create);
  static GetBusinessClientResponse? _defaultInstance;

  /// The retrieved client data.
  @$pb.TagNumber(1)
  BusinessClient get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(BusinessClient value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessClient ensureClient() => $_ensure(0);
}

class UpdateBusinessClientRequest extends $pb.GeneratedMessage {
  factory UpdateBusinessClientRequest({
    BusinessClient? client,
    $core.List<$core.int>? logoRawImage,
  }) {
    final result = create();
    if (client != null) result.client = client;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    return result;
  }

  UpdateBusinessClientRequest._();

  factory UpdateBusinessClientRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBusinessClientRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBusinessClientRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessClient>(1, _omitFieldNames ? '' : 'client',
        subBuilder: BusinessClient.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessClientRequest clone() =>
      UpdateBusinessClientRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessClientRequest copyWith(
          void Function(UpdateBusinessClientRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateBusinessClientRequest))
          as UpdateBusinessClientRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessClientRequest create() =>
      UpdateBusinessClientRequest._();
  @$core.override
  UpdateBusinessClientRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessClientRequest> createRepeated() =>
      $pb.PbList<UpdateBusinessClientRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessClientRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBusinessClientRequest>(create);
  static UpdateBusinessClientRequest? _defaultInstance;

  /// The client information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  BusinessClient get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(BusinessClient value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessClient ensureClient() => $_ensure(0);

  /// The raw image of the logo of the client.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);
}

class UpdateBusinessClientResponse extends $pb.GeneratedMessage {
  factory UpdateBusinessClientResponse({
    BusinessClient? client,
  }) {
    final result = create();
    if (client != null) result.client = client;
    return result;
  }

  UpdateBusinessClientResponse._();

  factory UpdateBusinessClientResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBusinessClientResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBusinessClientResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessClient>(1, _omitFieldNames ? '' : 'client',
        subBuilder: BusinessClient.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessClientResponse clone() =>
      UpdateBusinessClientResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessClientResponse copyWith(
          void Function(UpdateBusinessClientResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateBusinessClientResponse))
          as UpdateBusinessClientResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessClientResponse create() =>
      UpdateBusinessClientResponse._();
  @$core.override
  UpdateBusinessClientResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessClientResponse> createRepeated() =>
      $pb.PbList<UpdateBusinessClientResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessClientResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBusinessClientResponse>(create);
  static UpdateBusinessClientResponse? _defaultInstance;

  /// The updated client data.
  @$pb.TagNumber(1)
  BusinessClient get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(BusinessClient value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessClient ensureClient() => $_ensure(0);
}

class DeleteBusinessClientRequest extends $pb.GeneratedMessage {
  factory DeleteBusinessClientRequest({
    $core.String? clientId,
  }) {
    final result = create();
    if (clientId != null) result.clientId = clientId;
    return result;
  }

  DeleteBusinessClientRequest._();

  factory DeleteBusinessClientRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBusinessClientRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBusinessClientRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBusinessClientRequest clone() =>
      DeleteBusinessClientRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBusinessClientRequest copyWith(
          void Function(DeleteBusinessClientRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteBusinessClientRequest))
          as DeleteBusinessClientRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessClientRequest create() =>
      DeleteBusinessClientRequest._();
  @$core.override
  DeleteBusinessClientRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessClientRequest> createRepeated() =>
      $pb.PbList<DeleteBusinessClientRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessClientRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBusinessClientRequest>(create);
  static DeleteBusinessClientRequest? _defaultInstance;

  /// The reference id to the client identifier.
  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);
}

class DeleteBusinessClientResponse extends $pb.GeneratedMessage {
  factory DeleteBusinessClientResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteBusinessClientResponse._();

  factory DeleteBusinessClientResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBusinessClientResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBusinessClientResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBusinessClientResponse clone() =>
      DeleteBusinessClientResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBusinessClientResponse copyWith(
          void Function(DeleteBusinessClientResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteBusinessClientResponse))
          as DeleteBusinessClientResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessClientResponse create() =>
      DeleteBusinessClientResponse._();
  @$core.override
  DeleteBusinessClientResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessClientResponse> createRepeated() =>
      $pb.PbList<DeleteBusinessClientResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessClientResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBusinessClientResponse>(create);
  static DeleteBusinessClientResponse? _defaultInstance;

  /// Whether the client was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class BusinessClientServiceApi {
  final $pb.RpcClient _client;

  BusinessClientServiceApi(this._client);

  /// Creates a new client.
  $async.Future<CreateBusinessClientResponse> createBusinessClient(
          $pb.ClientContext? ctx, CreateBusinessClientRequest request) =>
      _client.invoke<CreateBusinessClientResponse>(ctx, 'BusinessClientService',
          'CreateBusinessClient', request, CreateBusinessClientResponse());

  /// Gets a client by id.
  $async.Future<GetBusinessClientResponse> getBusinessClient(
          $pb.ClientContext? ctx, GetBusinessClientRequest request) =>
      _client.invoke<GetBusinessClientResponse>(ctx, 'BusinessClientService',
          'GetBusinessClient', request, GetBusinessClientResponse());

  /// Updates a client.
  /// Note:Only the fields that are set will be updated.
  $async.Future<UpdateBusinessClientResponse> updateBusinessClient(
          $pb.ClientContext? ctx, UpdateBusinessClientRequest request) =>
      _client.invoke<UpdateBusinessClientResponse>(ctx, 'BusinessClientService',
          'UpdateBusinessClient', request, UpdateBusinessClientResponse());

  /// Deletes a client.
  $async.Future<DeleteBusinessClientResponse> deleteBusinessClient(
          $pb.ClientContext? ctx, DeleteBusinessClientRequest request) =>
      _client.invoke<DeleteBusinessClientResponse>(ctx, 'BusinessClientService',
          'DeleteBusinessClient', request, DeleteBusinessClientResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
