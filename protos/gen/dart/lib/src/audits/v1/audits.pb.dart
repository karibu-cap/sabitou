// This is a generated file - do not edit.
//
// Generated from audits/v1/audits.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'inventory_transaction.pb.dart' as $0;
import 'voucher_transaction.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetInventoryTransactionAuditLogsRequest extends $pb.GeneratedMessage {
  factory GetInventoryTransactionAuditLogsRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetInventoryTransactionAuditLogsRequest._();

  factory GetInventoryTransactionAuditLogsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInventoryTransactionAuditLogsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInventoryTransactionAuditLogsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'audits.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryTransactionAuditLogsRequest clone() =>
      GetInventoryTransactionAuditLogsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryTransactionAuditLogsRequest copyWith(
          void Function(GetInventoryTransactionAuditLogsRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetInventoryTransactionAuditLogsRequest))
          as GetInventoryTransactionAuditLogsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInventoryTransactionAuditLogsRequest create() =>
      GetInventoryTransactionAuditLogsRequest._();
  @$core.override
  GetInventoryTransactionAuditLogsRequest createEmptyInstance() => create();
  static $pb.PbList<GetInventoryTransactionAuditLogsRequest> createRepeated() =>
      $pb.PbList<GetInventoryTransactionAuditLogsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetInventoryTransactionAuditLogsRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetInventoryTransactionAuditLogsRequest>(create);
  static GetInventoryTransactionAuditLogsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetInventoryTransactionAuditLogsResponse extends $pb.GeneratedMessage {
  factory GetInventoryTransactionAuditLogsResponse({
    $core.Iterable<$0.InventoryTransaction>? inventoryTransactions,
  }) {
    final result = create();
    if (inventoryTransactions != null)
      result.inventoryTransactions.addAll(inventoryTransactions);
    return result;
  }

  GetInventoryTransactionAuditLogsResponse._();

  factory GetInventoryTransactionAuditLogsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInventoryTransactionAuditLogsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInventoryTransactionAuditLogsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'audits.v1'),
      createEmptyInstance: create)
    ..pc<$0.InventoryTransaction>(
        1, _omitFieldNames ? '' : 'inventoryTransactions', $pb.PbFieldType.PM,
        subBuilder: $0.InventoryTransaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryTransactionAuditLogsResponse clone() =>
      GetInventoryTransactionAuditLogsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryTransactionAuditLogsResponse copyWith(
          void Function(GetInventoryTransactionAuditLogsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetInventoryTransactionAuditLogsResponse))
          as GetInventoryTransactionAuditLogsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInventoryTransactionAuditLogsResponse create() =>
      GetInventoryTransactionAuditLogsResponse._();
  @$core.override
  GetInventoryTransactionAuditLogsResponse createEmptyInstance() => create();
  static $pb.PbList<GetInventoryTransactionAuditLogsResponse>
      createRepeated() =>
          $pb.PbList<GetInventoryTransactionAuditLogsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetInventoryTransactionAuditLogsResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetInventoryTransactionAuditLogsResponse>(create);
  static GetInventoryTransactionAuditLogsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.InventoryTransaction> get inventoryTransactions => $_getList(0);
}

class GetVoucherTransactionAuditLogsRequest extends $pb.GeneratedMessage {
  factory GetVoucherTransactionAuditLogsRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetVoucherTransactionAuditLogsRequest._();

  factory GetVoucherTransactionAuditLogsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVoucherTransactionAuditLogsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVoucherTransactionAuditLogsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'audits.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVoucherTransactionAuditLogsRequest clone() =>
      GetVoucherTransactionAuditLogsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVoucherTransactionAuditLogsRequest copyWith(
          void Function(GetVoucherTransactionAuditLogsRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetVoucherTransactionAuditLogsRequest))
          as GetVoucherTransactionAuditLogsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVoucherTransactionAuditLogsRequest create() =>
      GetVoucherTransactionAuditLogsRequest._();
  @$core.override
  GetVoucherTransactionAuditLogsRequest createEmptyInstance() => create();
  static $pb.PbList<GetVoucherTransactionAuditLogsRequest> createRepeated() =>
      $pb.PbList<GetVoucherTransactionAuditLogsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetVoucherTransactionAuditLogsRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetVoucherTransactionAuditLogsRequest>(create);
  static GetVoucherTransactionAuditLogsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetVoucherTransactionAuditLogsResponse extends $pb.GeneratedMessage {
  factory GetVoucherTransactionAuditLogsResponse({
    $core.Iterable<$1.VoucherTransaction>? voucherTransactions,
  }) {
    final result = create();
    if (voucherTransactions != null)
      result.voucherTransactions.addAll(voucherTransactions);
    return result;
  }

  GetVoucherTransactionAuditLogsResponse._();

  factory GetVoucherTransactionAuditLogsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVoucherTransactionAuditLogsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVoucherTransactionAuditLogsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'audits.v1'),
      createEmptyInstance: create)
    ..pc<$1.VoucherTransaction>(
        1, _omitFieldNames ? '' : 'voucherTransactions', $pb.PbFieldType.PM,
        subBuilder: $1.VoucherTransaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVoucherTransactionAuditLogsResponse clone() =>
      GetVoucherTransactionAuditLogsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVoucherTransactionAuditLogsResponse copyWith(
          void Function(GetVoucherTransactionAuditLogsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetVoucherTransactionAuditLogsResponse))
          as GetVoucherTransactionAuditLogsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVoucherTransactionAuditLogsResponse create() =>
      GetVoucherTransactionAuditLogsResponse._();
  @$core.override
  GetVoucherTransactionAuditLogsResponse createEmptyInstance() => create();
  static $pb.PbList<GetVoucherTransactionAuditLogsResponse> createRepeated() =>
      $pb.PbList<GetVoucherTransactionAuditLogsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetVoucherTransactionAuditLogsResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetVoucherTransactionAuditLogsResponse>(create);
  static GetVoucherTransactionAuditLogsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.VoucherTransaction> get voucherTransactions => $_getList(0);
}

class AuditsServiceApi {
  final $pb.RpcClient _client;

  AuditsServiceApi(this._client);

  $async.Future<GetInventoryTransactionAuditLogsResponse>
      getInventoryTransactionAuditLogs($pb.ClientContext? ctx,
              GetInventoryTransactionAuditLogsRequest request) =>
          _client.invoke<GetInventoryTransactionAuditLogsResponse>(
              ctx,
              'AuditsService',
              'GetInventoryTransactionAuditLogs',
              request,
              GetInventoryTransactionAuditLogsResponse());
  $async.Future<GetVoucherTransactionAuditLogsResponse>
      getVoucherTransactionAuditLogs($pb.ClientContext? ctx,
              GetVoucherTransactionAuditLogsRequest request) =>
          _client.invoke<GetVoucherTransactionAuditLogsResponse>(
              ctx,
              'AuditsService',
              'GetVoucherTransactionAuditLogs',
              request,
              GetVoucherTransactionAuditLogsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
