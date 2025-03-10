//
//  Generated code. Do not modify.
//  source: business/v1/client.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BusinessClient extends $pb.GeneratedMessage {
  factory BusinessClient({
    $core.String? refId,
    $core.String? fullName,
    $core.Iterable<$core.String>? externalLinksIds,
    $core.String? logoLinkId,
    $core.String? businessId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    if (fullName != null) {
      $result.fullName = fullName;
    }
    if (externalLinksIds != null) {
      $result.externalLinksIds.addAll(externalLinksIds);
    }
    if (logoLinkId != null) {
      $result.logoLinkId = logoLinkId;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  BusinessClient._() : super();
  factory BusinessClient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BusinessClient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BusinessClient', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'fullName')
    ..pPS(3, _omitFieldNames ? '' : 'externalLinksIds')
    ..aOS(4, _omitFieldNames ? '' : 'logoLinkId')
    ..aOS(5, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BusinessClient clone() => BusinessClient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BusinessClient copyWith(void Function(BusinessClient) updates) => super.copyWith((message) => updates(message as BusinessClient)) as BusinessClient;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessClient create() => BusinessClient._();
  BusinessClient createEmptyInstance() => create();
  static $pb.PbList<BusinessClient> createRepeated() => $pb.PbList<BusinessClient>();
  @$core.pragma('dart2js:noInline')
  static BusinessClient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BusinessClient>(create);
  static BusinessClient? _defaultInstance;

  /// The reference id to the client identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The name of the client.
  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => clearField(2);

  /// The links of the client it can contain client mail, phone number, website etc.
  @$pb.TagNumber(3)
  $core.List<$core.String> get externalLinksIds => $_getList(2);

  /// The id of the media of the logo of the client.
  @$pb.TagNumber(4)
  $core.String get logoLinkId => $_getSZ(3);
  @$pb.TagNumber(4)
  set logoLinkId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLogoLinkId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogoLinkId() => clearField(4);

  /// The id of the business of the client.
  @$pb.TagNumber(5)
  $core.String get businessId => $_getSZ(4);
  @$pb.TagNumber(5)
  set businessId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBusinessId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBusinessId() => clearField(5);
}

class CreateBusinessClientRequest extends $pb.GeneratedMessage {
  factory CreateBusinessClientRequest({
    BusinessClient? client,
    $core.List<$core.int>? logoRawImage,
  }) {
    final $result = create();
    if (client != null) {
      $result.client = client;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    return $result;
  }
  CreateBusinessClientRequest._() : super();
  factory CreateBusinessClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusinessClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<BusinessClient>(1, _omitFieldNames ? '' : 'client', subBuilder: BusinessClient.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessClientRequest clone() => CreateBusinessClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessClientRequest copyWith(void Function(CreateBusinessClientRequest) updates) => super.copyWith((message) => updates(message as CreateBusinessClientRequest)) as CreateBusinessClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessClientRequest create() => CreateBusinessClientRequest._();
  CreateBusinessClientRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessClientRequest> createRepeated() => $pb.PbList<CreateBusinessClientRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessClientRequest>(create);
  static CreateBusinessClientRequest? _defaultInstance;

  /// The client information to create.
  @$pb.TagNumber(1)
  BusinessClient get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(BusinessClient v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => clearField(1);
  @$pb.TagNumber(1)
  BusinessClient ensureClient() => $_ensure(0);

  /// The raw image of the logo of the client.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => clearField(2);
}

class CreateBusinessClientResponse extends $pb.GeneratedMessage {
  factory CreateBusinessClientResponse({
    $core.String? clientId,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    return $result;
  }
  CreateBusinessClientResponse._() : super();
  factory CreateBusinessClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusinessClientResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessClientResponse clone() => CreateBusinessClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessClientResponse copyWith(void Function(CreateBusinessClientResponse) updates) => super.copyWith((message) => updates(message as CreateBusinessClientResponse)) as CreateBusinessClientResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessClientResponse create() => CreateBusinessClientResponse._();
  CreateBusinessClientResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessClientResponse> createRepeated() => $pb.PbList<CreateBusinessClientResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessClientResponse>(create);
  static CreateBusinessClientResponse? _defaultInstance;

  /// The reference id to the client identifier.
  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);
}

class GetBusinessClientRequest extends $pb.GeneratedMessage {
  factory GetBusinessClientRequest({
    $core.String? clientId,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    return $result;
  }
  GetBusinessClientRequest._() : super();
  factory GetBusinessClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessClientRequest clone() => GetBusinessClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessClientRequest copyWith(void Function(GetBusinessClientRequest) updates) => super.copyWith((message) => updates(message as GetBusinessClientRequest)) as GetBusinessClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessClientRequest create() => GetBusinessClientRequest._();
  GetBusinessClientRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessClientRequest> createRepeated() => $pb.PbList<GetBusinessClientRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessClientRequest>(create);
  static GetBusinessClientRequest? _defaultInstance;

  /// The reference id to the client identifier.
  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);
}

class GetBusinessClientResponse extends $pb.GeneratedMessage {
  factory GetBusinessClientResponse({
    BusinessClient? client,
  }) {
    final $result = create();
    if (client != null) {
      $result.client = client;
    }
    return $result;
  }
  GetBusinessClientResponse._() : super();
  factory GetBusinessClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessClientResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<BusinessClient>(1, _omitFieldNames ? '' : 'client', subBuilder: BusinessClient.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessClientResponse clone() => GetBusinessClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessClientResponse copyWith(void Function(GetBusinessClientResponse) updates) => super.copyWith((message) => updates(message as GetBusinessClientResponse)) as GetBusinessClientResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessClientResponse create() => GetBusinessClientResponse._();
  GetBusinessClientResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessClientResponse> createRepeated() => $pb.PbList<GetBusinessClientResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessClientResponse>(create);
  static GetBusinessClientResponse? _defaultInstance;

  /// The retrieved client data.
  @$pb.TagNumber(1)
  BusinessClient get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(BusinessClient v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => clearField(1);
  @$pb.TagNumber(1)
  BusinessClient ensureClient() => $_ensure(0);
}

class UpdateBusinessClientRequest extends $pb.GeneratedMessage {
  factory UpdateBusinessClientRequest({
    BusinessClient? client,
    $core.List<$core.int>? logoRawImage,
  }) {
    final $result = create();
    if (client != null) {
      $result.client = client;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    return $result;
  }
  UpdateBusinessClientRequest._() : super();
  factory UpdateBusinessClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusinessClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<BusinessClient>(1, _omitFieldNames ? '' : 'client', subBuilder: BusinessClient.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessClientRequest clone() => UpdateBusinessClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessClientRequest copyWith(void Function(UpdateBusinessClientRequest) updates) => super.copyWith((message) => updates(message as UpdateBusinessClientRequest)) as UpdateBusinessClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessClientRequest create() => UpdateBusinessClientRequest._();
  UpdateBusinessClientRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessClientRequest> createRepeated() => $pb.PbList<UpdateBusinessClientRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessClientRequest>(create);
  static UpdateBusinessClientRequest? _defaultInstance;

  /// The client information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  BusinessClient get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(BusinessClient v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => clearField(1);
  @$pb.TagNumber(1)
  BusinessClient ensureClient() => $_ensure(0);

  /// The raw image of the logo of the client.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => clearField(2);
}

class UpdateBusinessClientResponse extends $pb.GeneratedMessage {
  factory UpdateBusinessClientResponse({
    BusinessClient? client,
  }) {
    final $result = create();
    if (client != null) {
      $result.client = client;
    }
    return $result;
  }
  UpdateBusinessClientResponse._() : super();
  factory UpdateBusinessClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusinessClientResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<BusinessClient>(1, _omitFieldNames ? '' : 'client', subBuilder: BusinessClient.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessClientResponse clone() => UpdateBusinessClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessClientResponse copyWith(void Function(UpdateBusinessClientResponse) updates) => super.copyWith((message) => updates(message as UpdateBusinessClientResponse)) as UpdateBusinessClientResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessClientResponse create() => UpdateBusinessClientResponse._();
  UpdateBusinessClientResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessClientResponse> createRepeated() => $pb.PbList<UpdateBusinessClientResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessClientResponse>(create);
  static UpdateBusinessClientResponse? _defaultInstance;

  /// The updated client data.
  @$pb.TagNumber(1)
  BusinessClient get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(BusinessClient v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => clearField(1);
  @$pb.TagNumber(1)
  BusinessClient ensureClient() => $_ensure(0);
}

class DeleteBusinessClientRequest extends $pb.GeneratedMessage {
  factory DeleteBusinessClientRequest({
    $core.String? clientId,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    return $result;
  }
  DeleteBusinessClientRequest._() : super();
  factory DeleteBusinessClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBusinessClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteBusinessClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBusinessClientRequest clone() => DeleteBusinessClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBusinessClientRequest copyWith(void Function(DeleteBusinessClientRequest) updates) => super.copyWith((message) => updates(message as DeleteBusinessClientRequest)) as DeleteBusinessClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessClientRequest create() => DeleteBusinessClientRequest._();
  DeleteBusinessClientRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessClientRequest> createRepeated() => $pb.PbList<DeleteBusinessClientRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBusinessClientRequest>(create);
  static DeleteBusinessClientRequest? _defaultInstance;

  /// The reference id to the client identifier.
  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);
}

class DeleteBusinessClientResponse extends $pb.GeneratedMessage {
  factory DeleteBusinessClientResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteBusinessClientResponse._() : super();
  factory DeleteBusinessClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBusinessClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteBusinessClientResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBusinessClientResponse clone() => DeleteBusinessClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBusinessClientResponse copyWith(void Function(DeleteBusinessClientResponse) updates) => super.copyWith((message) => updates(message as DeleteBusinessClientResponse)) as DeleteBusinessClientResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessClientResponse create() => DeleteBusinessClientResponse._();
  DeleteBusinessClientResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessClientResponse> createRepeated() => $pb.PbList<DeleteBusinessClientResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBusinessClientResponse>(create);
  static DeleteBusinessClientResponse? _defaultInstance;

  /// Whether the client was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class BusinessClientServiceApi {
  $pb.RpcClient _client;
  BusinessClientServiceApi(this._client);

  $async.Future<CreateBusinessClientResponse> createBusinessClient($pb.ClientContext? ctx, CreateBusinessClientRequest request) =>
    _client.invoke<CreateBusinessClientResponse>(ctx, 'BusinessClientService', 'CreateBusinessClient', request, CreateBusinessClientResponse())
  ;
  $async.Future<GetBusinessClientResponse> getBusinessClient($pb.ClientContext? ctx, GetBusinessClientRequest request) =>
    _client.invoke<GetBusinessClientResponse>(ctx, 'BusinessClientService', 'GetBusinessClient', request, GetBusinessClientResponse())
  ;
  $async.Future<UpdateBusinessClientResponse> updateBusinessClient($pb.ClientContext? ctx, UpdateBusinessClientRequest request) =>
    _client.invoke<UpdateBusinessClientResponse>(ctx, 'BusinessClientService', 'UpdateBusinessClient', request, UpdateBusinessClientResponse())
  ;
  $async.Future<DeleteBusinessClientResponse> deleteBusinessClient($pb.ClientContext? ctx, DeleteBusinessClientRequest request) =>
    _client.invoke<DeleteBusinessClientResponse>(ctx, 'BusinessClientService', 'DeleteBusinessClient', request, DeleteBusinessClientResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
