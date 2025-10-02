// This is a generated file - do not edit.
//
// Generated from reports/v1/reports.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../audits/v1/inventory_transaction.pb.dart' as $2;
import '../../financial/v1/invoice.pb.dart' as $4;
import '../../google/protobuf/timestamp.pb.dart' as $0;
import '../../inventory/v1/store_product.pb.dart' as $1;
import '../../store/v1/store.pb.dart' as $3;
import '../../store/v1/supplier.pb.dart' as $5;
import 'reports.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'reports.pbenum.dart';

class GetSalesReportRequest extends $pb.GeneratedMessage {
  factory GetSalesReportRequest({
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.String? supplierId,
    $core.String? storeId,
    $core.String? category,
    ReportGroupBy? groupBy,
  }) {
    final result = create();
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (supplierId != null) result.supplierId = supplierId;
    if (storeId != null) result.storeId = storeId;
    if (category != null) result.category = category;
    if (groupBy != null) result.groupBy = groupBy;
    return result;
  }

  GetSalesReportRequest._();

  factory GetSalesReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSalesReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSalesReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'supplierId')
    ..aOS(4, _omitFieldNames ? '' : 'storeId')
    ..aOS(5, _omitFieldNames ? '' : 'category')
    ..e<ReportGroupBy>(6, _omitFieldNames ? '' : 'groupBy', $pb.PbFieldType.OE,
        defaultOrMaker: ReportGroupBy.REPORT_GROUP_BY_UNSPECIFIED,
        valueOf: ReportGroupBy.valueOf,
        enumValues: ReportGroupBy.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesReportRequest clone() =>
      GetSalesReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesReportRequest copyWith(
          void Function(GetSalesReportRequest) updates) =>
      super.copyWith((message) => updates(message as GetSalesReportRequest))
          as GetSalesReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSalesReportRequest create() => GetSalesReportRequest._();
  @$core.override
  GetSalesReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetSalesReportRequest> createRepeated() =>
      $pb.PbList<GetSalesReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSalesReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSalesReportRequest>(create);
  static GetSalesReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get startDate => $_getN(0);
  @$pb.TagNumber(1)
  set startDate($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStartDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartDate() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureStartDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get endDate => $_getN(1);
  @$pb.TagNumber(2)
  set endDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureEndDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get supplierId => $_getSZ(2);
  @$pb.TagNumber(3)
  set supplierId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSupplierId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupplierId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get storeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set storeId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStoreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get category => $_getSZ(4);
  @$pb.TagNumber(5)
  set category($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => $_clearField(5);

  @$pb.TagNumber(6)
  ReportGroupBy get groupBy => $_getN(5);
  @$pb.TagNumber(6)
  set groupBy(ReportGroupBy value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasGroupBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearGroupBy() => $_clearField(6);
}

class GetSalesReportResponse extends $pb.GeneratedMessage {
  factory GetSalesReportResponse({
    $core.Iterable<SalesSummary>? summaries,
    $core.double? totalSalesAmount,
    $core.int? totalTransactions,
    $core.int? totalUnitsSold,
    $core.double? averageTransactionValue,
  }) {
    final result = create();
    if (summaries != null) result.summaries.addAll(summaries);
    if (totalSalesAmount != null) result.totalSalesAmount = totalSalesAmount;
    if (totalTransactions != null) result.totalTransactions = totalTransactions;
    if (totalUnitsSold != null) result.totalUnitsSold = totalUnitsSold;
    if (averageTransactionValue != null)
      result.averageTransactionValue = averageTransactionValue;
    return result;
  }

  GetSalesReportResponse._();

  factory GetSalesReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSalesReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSalesReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..pc<SalesSummary>(
        1, _omitFieldNames ? '' : 'summaries', $pb.PbFieldType.PM,
        subBuilder: SalesSummary.create)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'totalSalesAmount', $pb.PbFieldType.OD)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'totalTransactions', $pb.PbFieldType.O3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'totalUnitsSold', $pb.PbFieldType.O3)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'averageTransactionValue', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesReportResponse clone() =>
      GetSalesReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesReportResponse copyWith(
          void Function(GetSalesReportResponse) updates) =>
      super.copyWith((message) => updates(message as GetSalesReportResponse))
          as GetSalesReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSalesReportResponse create() => GetSalesReportResponse._();
  @$core.override
  GetSalesReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetSalesReportResponse> createRepeated() =>
      $pb.PbList<GetSalesReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSalesReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSalesReportResponse>(create);
  static GetSalesReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SalesSummary> get summaries => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get totalSalesAmount => $_getN(1);
  @$pb.TagNumber(2)
  set totalSalesAmount($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalSalesAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalSalesAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalTransactions => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalTransactions($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalTransactions() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalTransactions() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalUnitsSold => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalUnitsSold($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalUnitsSold() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalUnitsSold() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get averageTransactionValue => $_getN(4);
  @$pb.TagNumber(5)
  set averageTransactionValue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAverageTransactionValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearAverageTransactionValue() => $_clearField(5);
}

class SalesSummary extends $pb.GeneratedMessage {
  factory SalesSummary({
    $0.Timestamp? periodStart,
    $0.Timestamp? periodEnd,
    $core.double? salesAmount,
    $core.int? transactionCount,
    $core.int? unitsSold,
  }) {
    final result = create();
    if (periodStart != null) result.periodStart = periodStart;
    if (periodEnd != null) result.periodEnd = periodEnd;
    if (salesAmount != null) result.salesAmount = salesAmount;
    if (transactionCount != null) result.transactionCount = transactionCount;
    if (unitsSold != null) result.unitsSold = unitsSold;
    return result;
  }

  SalesSummary._();

  factory SalesSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalesSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalesSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'periodStart',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'periodEnd',
        subBuilder: $0.Timestamp.create)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'salesAmount', $pb.PbFieldType.OD)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'transactionCount', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'unitsSold', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalesSummary clone() => SalesSummary()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalesSummary copyWith(void Function(SalesSummary) updates) =>
      super.copyWith((message) => updates(message as SalesSummary))
          as SalesSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalesSummary create() => SalesSummary._();
  @$core.override
  SalesSummary createEmptyInstance() => create();
  static $pb.PbList<SalesSummary> createRepeated() =>
      $pb.PbList<SalesSummary>();
  @$core.pragma('dart2js:noInline')
  static SalesSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalesSummary>(create);
  static SalesSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get periodStart => $_getN(0);
  @$pb.TagNumber(1)
  set periodStart($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPeriodStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeriodStart() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensurePeriodStart() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get periodEnd => $_getN(1);
  @$pb.TagNumber(2)
  set periodEnd($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPeriodEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeriodEnd() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensurePeriodEnd() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.double get salesAmount => $_getN(2);
  @$pb.TagNumber(3)
  set salesAmount($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSalesAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSalesAmount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get transactionCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set transactionCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTransactionCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransactionCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get unitsSold => $_getIZ(4);
  @$pb.TagNumber(5)
  set unitsSold($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUnitsSold() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnitsSold() => $_clearField(5);
}

class GetPurchaseReportRequest extends $pb.GeneratedMessage {
  factory GetPurchaseReportRequest({
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.String? storeId,
    $core.String? supplierId,
    $core.String? category,
    ReportGroupBy? groupBy,
  }) {
    final result = create();
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (storeId != null) result.storeId = storeId;
    if (supplierId != null) result.supplierId = supplierId;
    if (category != null) result.category = category;
    if (groupBy != null) result.groupBy = groupBy;
    return result;
  }

  GetPurchaseReportRequest._();

  factory GetPurchaseReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPurchaseReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPurchaseReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..aOS(4, _omitFieldNames ? '' : 'supplierId')
    ..aOS(5, _omitFieldNames ? '' : 'category')
    ..e<ReportGroupBy>(6, _omitFieldNames ? '' : 'groupBy', $pb.PbFieldType.OE,
        defaultOrMaker: ReportGroupBy.REPORT_GROUP_BY_UNSPECIFIED,
        valueOf: ReportGroupBy.valueOf,
        enumValues: ReportGroupBy.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPurchaseReportRequest clone() =>
      GetPurchaseReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPurchaseReportRequest copyWith(
          void Function(GetPurchaseReportRequest) updates) =>
      super.copyWith((message) => updates(message as GetPurchaseReportRequest))
          as GetPurchaseReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPurchaseReportRequest create() => GetPurchaseReportRequest._();
  @$core.override
  GetPurchaseReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetPurchaseReportRequest> createRepeated() =>
      $pb.PbList<GetPurchaseReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPurchaseReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPurchaseReportRequest>(create);
  static GetPurchaseReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get startDate => $_getN(0);
  @$pb.TagNumber(1)
  set startDate($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStartDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartDate() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureStartDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get endDate => $_getN(1);
  @$pb.TagNumber(2)
  set endDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureEndDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get supplierId => $_getSZ(3);
  @$pb.TagNumber(4)
  set supplierId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSupplierId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSupplierId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get category => $_getSZ(4);
  @$pb.TagNumber(5)
  set category($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => $_clearField(5);

  @$pb.TagNumber(6)
  ReportGroupBy get groupBy => $_getN(5);
  @$pb.TagNumber(6)
  set groupBy(ReportGroupBy value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasGroupBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearGroupBy() => $_clearField(6);
}

class GetPurchaseReportResponse extends $pb.GeneratedMessage {
  factory GetPurchaseReportResponse({
    $core.Iterable<PurchaseSummary>? summaries,
    $core.double? totalPurchaseAmount,
    $core.int? totalPurchaseOrders,
    $core.int? totalUnitsPurchased,
  }) {
    final result = create();
    if (summaries != null) result.summaries.addAll(summaries);
    if (totalPurchaseAmount != null)
      result.totalPurchaseAmount = totalPurchaseAmount;
    if (totalPurchaseOrders != null)
      result.totalPurchaseOrders = totalPurchaseOrders;
    if (totalUnitsPurchased != null)
      result.totalUnitsPurchased = totalUnitsPurchased;
    return result;
  }

  GetPurchaseReportResponse._();

  factory GetPurchaseReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPurchaseReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPurchaseReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..pc<PurchaseSummary>(
        1, _omitFieldNames ? '' : 'summaries', $pb.PbFieldType.PM,
        subBuilder: PurchaseSummary.create)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'totalPurchaseAmount', $pb.PbFieldType.OD)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'totalPurchaseOrders', $pb.PbFieldType.O3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'totalUnitsPurchased', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPurchaseReportResponse clone() =>
      GetPurchaseReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPurchaseReportResponse copyWith(
          void Function(GetPurchaseReportResponse) updates) =>
      super.copyWith((message) => updates(message as GetPurchaseReportResponse))
          as GetPurchaseReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPurchaseReportResponse create() => GetPurchaseReportResponse._();
  @$core.override
  GetPurchaseReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetPurchaseReportResponse> createRepeated() =>
      $pb.PbList<GetPurchaseReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPurchaseReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPurchaseReportResponse>(create);
  static GetPurchaseReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PurchaseSummary> get summaries => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get totalPurchaseAmount => $_getN(1);
  @$pb.TagNumber(2)
  set totalPurchaseAmount($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalPurchaseAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalPurchaseAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalPurchaseOrders => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalPurchaseOrders($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalPurchaseOrders() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalPurchaseOrders() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalUnitsPurchased => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalUnitsPurchased($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalUnitsPurchased() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalUnitsPurchased() => $_clearField(4);
}

class PurchaseSummary extends $pb.GeneratedMessage {
  factory PurchaseSummary({
    $0.Timestamp? periodStart,
    $0.Timestamp? periodEnd,
    $core.double? purchaseAmount,
    $core.int? purchaseOrderCount,
    $core.int? unitsPurchased,
  }) {
    final result = create();
    if (periodStart != null) result.periodStart = periodStart;
    if (periodEnd != null) result.periodEnd = periodEnd;
    if (purchaseAmount != null) result.purchaseAmount = purchaseAmount;
    if (purchaseOrderCount != null)
      result.purchaseOrderCount = purchaseOrderCount;
    if (unitsPurchased != null) result.unitsPurchased = unitsPurchased;
    return result;
  }

  PurchaseSummary._();

  factory PurchaseSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PurchaseSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PurchaseSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'periodStart',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'periodEnd',
        subBuilder: $0.Timestamp.create)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'purchaseAmount', $pb.PbFieldType.OD)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'purchaseOrderCount', $pb.PbFieldType.O3)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'unitsPurchased', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchaseSummary clone() => PurchaseSummary()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchaseSummary copyWith(void Function(PurchaseSummary) updates) =>
      super.copyWith((message) => updates(message as PurchaseSummary))
          as PurchaseSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchaseSummary create() => PurchaseSummary._();
  @$core.override
  PurchaseSummary createEmptyInstance() => create();
  static $pb.PbList<PurchaseSummary> createRepeated() =>
      $pb.PbList<PurchaseSummary>();
  @$core.pragma('dart2js:noInline')
  static PurchaseSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PurchaseSummary>(create);
  static PurchaseSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get periodStart => $_getN(0);
  @$pb.TagNumber(1)
  set periodStart($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPeriodStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeriodStart() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensurePeriodStart() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get periodEnd => $_getN(1);
  @$pb.TagNumber(2)
  set periodEnd($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPeriodEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeriodEnd() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensurePeriodEnd() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.double get purchaseAmount => $_getN(2);
  @$pb.TagNumber(3)
  set purchaseAmount($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPurchaseAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearPurchaseAmount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get purchaseOrderCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set purchaseOrderCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPurchaseOrderCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearPurchaseOrderCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get unitsPurchased => $_getIZ(4);
  @$pb.TagNumber(5)
  set unitsPurchased($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUnitsPurchased() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnitsPurchased() => $_clearField(5);
}

class GetInventoryMovementReportRequest extends $pb.GeneratedMessage {
  factory GetInventoryMovementReportRequest({
    $core.String? productId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.String? storeId,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetInventoryMovementReportRequest._();

  factory GetInventoryMovementReportRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInventoryMovementReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInventoryMovementReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryMovementReportRequest clone() =>
      GetInventoryMovementReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryMovementReportRequest copyWith(
          void Function(GetInventoryMovementReportRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetInventoryMovementReportRequest))
          as GetInventoryMovementReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInventoryMovementReportRequest create() =>
      GetInventoryMovementReportRequest._();
  @$core.override
  GetInventoryMovementReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetInventoryMovementReportRequest> createRepeated() =>
      $pb.PbList<GetInventoryMovementReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetInventoryMovementReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInventoryMovementReportRequest>(
          create);
  static GetInventoryMovementReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Timestamp get endDate => $_getN(2);
  @$pb.TagNumber(3)
  set endDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureEndDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get storeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set storeId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStoreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreId() => $_clearField(4);
}

class GetInventoryMovementReportResponse extends $pb.GeneratedMessage {
  factory GetInventoryMovementReportResponse({
    $1.StoreProduct? product,
    $core.double? openingBalance,
    $core.double? totalIn,
    $core.double? totalOut,
    $core.double? closingBalance,
    $core.Iterable<$2.InventoryTransaction>? transactions,
  }) {
    final result = create();
    if (product != null) result.product = product;
    if (openingBalance != null) result.openingBalance = openingBalance;
    if (totalIn != null) result.totalIn = totalIn;
    if (totalOut != null) result.totalOut = totalOut;
    if (closingBalance != null) result.closingBalance = closingBalance;
    if (transactions != null) result.transactions.addAll(transactions);
    return result;
  }

  GetInventoryMovementReportResponse._();

  factory GetInventoryMovementReportResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInventoryMovementReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInventoryMovementReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$1.StoreProduct>(1, _omitFieldNames ? '' : 'product',
        subBuilder: $1.StoreProduct.create)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'openingBalance', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'totalIn', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'totalOut', $pb.PbFieldType.OD)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'closingBalance', $pb.PbFieldType.OD)
    ..pc<$2.InventoryTransaction>(
        6, _omitFieldNames ? '' : 'transactions', $pb.PbFieldType.PM,
        subBuilder: $2.InventoryTransaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryMovementReportResponse clone() =>
      GetInventoryMovementReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryMovementReportResponse copyWith(
          void Function(GetInventoryMovementReportResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetInventoryMovementReportResponse))
          as GetInventoryMovementReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInventoryMovementReportResponse create() =>
      GetInventoryMovementReportResponse._();
  @$core.override
  GetInventoryMovementReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetInventoryMovementReportResponse> createRepeated() =>
      $pb.PbList<GetInventoryMovementReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetInventoryMovementReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInventoryMovementReportResponse>(
          create);
  static GetInventoryMovementReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StoreProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product($1.StoreProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.StoreProduct ensureProduct() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get openingBalance => $_getN(1);
  @$pb.TagNumber(2)
  set openingBalance($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOpeningBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpeningBalance() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalIn => $_getN(2);
  @$pb.TagNumber(3)
  set totalIn($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalIn() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get totalOut => $_getN(3);
  @$pb.TagNumber(4)
  set totalOut($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalOut() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalOut() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get closingBalance => $_getN(4);
  @$pb.TagNumber(5)
  set closingBalance($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasClosingBalance() => $_has(4);
  @$pb.TagNumber(5)
  void clearClosingBalance() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$2.InventoryTransaction> get transactions => $_getList(5);
}

class GetBestSellingProductsRequest extends $pb.GeneratedMessage {
  factory GetBestSellingProductsRequest({
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.String? storeId,
    $core.String? category,
    $core.int? topN,
  }) {
    final result = create();
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (storeId != null) result.storeId = storeId;
    if (category != null) result.category = category;
    if (topN != null) result.topN = topN;
    return result;
  }

  GetBestSellingProductsRequest._();

  factory GetBestSellingProductsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBestSellingProductsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBestSellingProductsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..aOS(4, _omitFieldNames ? '' : 'category')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'topN', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBestSellingProductsRequest clone() =>
      GetBestSellingProductsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBestSellingProductsRequest copyWith(
          void Function(GetBestSellingProductsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetBestSellingProductsRequest))
          as GetBestSellingProductsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBestSellingProductsRequest create() =>
      GetBestSellingProductsRequest._();
  @$core.override
  GetBestSellingProductsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBestSellingProductsRequest> createRepeated() =>
      $pb.PbList<GetBestSellingProductsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBestSellingProductsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBestSellingProductsRequest>(create);
  static GetBestSellingProductsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get startDate => $_getN(0);
  @$pb.TagNumber(1)
  set startDate($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStartDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartDate() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureStartDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get endDate => $_getN(1);
  @$pb.TagNumber(2)
  set endDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureEndDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get category => $_getSZ(3);
  @$pb.TagNumber(4)
  set category($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get topN => $_getIZ(4);
  @$pb.TagNumber(5)
  set topN($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTopN() => $_has(4);
  @$pb.TagNumber(5)
  void clearTopN() => $_clearField(5);
}

class GetBestSellingProductsResponse extends $pb.GeneratedMessage {
  factory GetBestSellingProductsResponse({
    $core.Iterable<BestSellingProduct>? products,
  }) {
    final result = create();
    if (products != null) result.products.addAll(products);
    return result;
  }

  GetBestSellingProductsResponse._();

  factory GetBestSellingProductsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBestSellingProductsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBestSellingProductsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..pc<BestSellingProduct>(
        1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM,
        subBuilder: BestSellingProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBestSellingProductsResponse clone() =>
      GetBestSellingProductsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBestSellingProductsResponse copyWith(
          void Function(GetBestSellingProductsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetBestSellingProductsResponse))
          as GetBestSellingProductsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBestSellingProductsResponse create() =>
      GetBestSellingProductsResponse._();
  @$core.override
  GetBestSellingProductsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBestSellingProductsResponse> createRepeated() =>
      $pb.PbList<GetBestSellingProductsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBestSellingProductsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBestSellingProductsResponse>(create);
  static GetBestSellingProductsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BestSellingProduct> get products => $_getList(0);
}

class BestSellingProduct extends $pb.GeneratedMessage {
  factory BestSellingProduct({
    $1.StoreProduct? product,
    $core.int? unitsSold,
    $core.double? totalRevenue,
    $core.int? transactionCount,
    $core.String? productName,
    $core.int? rank,
  }) {
    final result = create();
    if (product != null) result.product = product;
    if (unitsSold != null) result.unitsSold = unitsSold;
    if (totalRevenue != null) result.totalRevenue = totalRevenue;
    if (transactionCount != null) result.transactionCount = transactionCount;
    if (productName != null) result.productName = productName;
    if (rank != null) result.rank = rank;
    return result;
  }

  BestSellingProduct._();

  factory BestSellingProduct.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BestSellingProduct.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BestSellingProduct',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$1.StoreProduct>(1, _omitFieldNames ? '' : 'product',
        subBuilder: $1.StoreProduct.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'unitsSold', $pb.PbFieldType.O3)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'totalRevenue', $pb.PbFieldType.OD)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'transactionCount', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'productName', protoName: 'productName')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'rank', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BestSellingProduct clone() => BestSellingProduct()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BestSellingProduct copyWith(void Function(BestSellingProduct) updates) =>
      super.copyWith((message) => updates(message as BestSellingProduct))
          as BestSellingProduct;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BestSellingProduct create() => BestSellingProduct._();
  @$core.override
  BestSellingProduct createEmptyInstance() => create();
  static $pb.PbList<BestSellingProduct> createRepeated() =>
      $pb.PbList<BestSellingProduct>();
  @$core.pragma('dart2js:noInline')
  static BestSellingProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BestSellingProduct>(create);
  static BestSellingProduct? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StoreProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product($1.StoreProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.StoreProduct ensureProduct() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get unitsSold => $_getIZ(1);
  @$pb.TagNumber(2)
  set unitsSold($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUnitsSold() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnitsSold() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalRevenue => $_getN(2);
  @$pb.TagNumber(3)
  set totalRevenue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalRevenue() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalRevenue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get transactionCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set transactionCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTransactionCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransactionCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get productName => $_getSZ(4);
  @$pb.TagNumber(5)
  set productName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasProductName() => $_has(4);
  @$pb.TagNumber(5)
  void clearProductName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get rank => $_getIZ(5);
  @$pb.TagNumber(6)
  set rank($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRank() => $_has(5);
  @$pb.TagNumber(6)
  void clearRank() => $_clearField(6);
}

class GetStorePurchaseHistoryRequest extends $pb.GeneratedMessage {
  factory GetStorePurchaseHistoryRequest({
    $core.String? storeId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    return result;
  }

  GetStorePurchaseHistoryRequest._();

  factory GetStorePurchaseHistoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStorePurchaseHistoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStorePurchaseHistoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStorePurchaseHistoryRequest clone() =>
      GetStorePurchaseHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStorePurchaseHistoryRequest copyWith(
          void Function(GetStorePurchaseHistoryRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetStorePurchaseHistoryRequest))
          as GetStorePurchaseHistoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStorePurchaseHistoryRequest create() =>
      GetStorePurchaseHistoryRequest._();
  @$core.override
  GetStorePurchaseHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetStorePurchaseHistoryRequest> createRepeated() =>
      $pb.PbList<GetStorePurchaseHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStorePurchaseHistoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStorePurchaseHistoryRequest>(create);
  static GetStorePurchaseHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Timestamp get endDate => $_getN(2);
  @$pb.TagNumber(3)
  set endDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureEndDate() => $_ensure(2);
}

class GetStorePurchaseHistoryResponse extends $pb.GeneratedMessage {
  factory GetStorePurchaseHistoryResponse({
    $3.Store? store,
    $core.Iterable<$4.Invoice>? invoices,
    $core.double? totalPurchases,
    $core.double? totalPaid,
    $core.double? outstandingBalance,
    $core.int? transactionCount,
    $0.Timestamp? lastPurchaseDate,
  }) {
    final result = create();
    if (store != null) result.store = store;
    if (invoices != null) result.invoices.addAll(invoices);
    if (totalPurchases != null) result.totalPurchases = totalPurchases;
    if (totalPaid != null) result.totalPaid = totalPaid;
    if (outstandingBalance != null)
      result.outstandingBalance = outstandingBalance;
    if (transactionCount != null) result.transactionCount = transactionCount;
    if (lastPurchaseDate != null) result.lastPurchaseDate = lastPurchaseDate;
    return result;
  }

  GetStorePurchaseHistoryResponse._();

  factory GetStorePurchaseHistoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStorePurchaseHistoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStorePurchaseHistoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$3.Store>(1, _omitFieldNames ? '' : 'store',
        subBuilder: $3.Store.create)
    ..pc<$4.Invoice>(2, _omitFieldNames ? '' : 'invoices', $pb.PbFieldType.PM,
        subBuilder: $4.Invoice.create)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'totalPurchases', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'totalPaid', $pb.PbFieldType.OD)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'outstandingBalance', $pb.PbFieldType.OD)
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'transactionCount', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'lastPurchaseDate',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStorePurchaseHistoryResponse clone() =>
      GetStorePurchaseHistoryResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStorePurchaseHistoryResponse copyWith(
          void Function(GetStorePurchaseHistoryResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetStorePurchaseHistoryResponse))
          as GetStorePurchaseHistoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStorePurchaseHistoryResponse create() =>
      GetStorePurchaseHistoryResponse._();
  @$core.override
  GetStorePurchaseHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetStorePurchaseHistoryResponse> createRepeated() =>
      $pb.PbList<GetStorePurchaseHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStorePurchaseHistoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStorePurchaseHistoryResponse>(
          create);
  static GetStorePurchaseHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store($3.Store value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Store ensureStore() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$4.Invoice> get invoices => $_getList(1);

  @$pb.TagNumber(3)
  $core.double get totalPurchases => $_getN(2);
  @$pb.TagNumber(3)
  set totalPurchases($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalPurchases() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalPurchases() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get totalPaid => $_getN(3);
  @$pb.TagNumber(4)
  set totalPaid($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalPaid() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalPaid() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get outstandingBalance => $_getN(4);
  @$pb.TagNumber(5)
  set outstandingBalance($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOutstandingBalance() => $_has(4);
  @$pb.TagNumber(5)
  void clearOutstandingBalance() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get transactionCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set transactionCount($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTransactionCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearTransactionCount() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.Timestamp get lastPurchaseDate => $_getN(6);
  @$pb.TagNumber(7)
  set lastPurchaseDate($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasLastPurchaseDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastPurchaseDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureLastPurchaseDate() => $_ensure(6);
}

class GetSupplierPerformanceReportRequest extends $pb.GeneratedMessage {
  factory GetSupplierPerformanceReportRequest({
    $core.String? supplierId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    return result;
  }

  GetSupplierPerformanceReportRequest._();

  factory GetSupplierPerformanceReportRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSupplierPerformanceReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSupplierPerformanceReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'supplierId')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSupplierPerformanceReportRequest clone() =>
      GetSupplierPerformanceReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSupplierPerformanceReportRequest copyWith(
          void Function(GetSupplierPerformanceReportRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetSupplierPerformanceReportRequest))
          as GetSupplierPerformanceReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSupplierPerformanceReportRequest create() =>
      GetSupplierPerformanceReportRequest._();
  @$core.override
  GetSupplierPerformanceReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetSupplierPerformanceReportRequest> createRepeated() =>
      $pb.PbList<GetSupplierPerformanceReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSupplierPerformanceReportRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetSupplierPerformanceReportRequest>(create);
  static GetSupplierPerformanceReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get supplierId => $_getSZ(0);
  @$pb.TagNumber(1)
  set supplierId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplierId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplierId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Timestamp get endDate => $_getN(2);
  @$pb.TagNumber(3)
  set endDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureEndDate() => $_ensure(2);
}

class GetSupplierPerformanceReportResponse extends $pb.GeneratedMessage {
  factory GetSupplierPerformanceReportResponse({
    $5.Supplier? supplier,
    $core.int? totalPurchaseOrders,
    $core.double? totalPurchaseValue,
    $core.int? onTimeDeliveries,
    $core.int? lateDeliveries,
    $core.double? onTimePercentage,
    $core.int? qualityIssues,
    $core.double? averageDeliveryTimeDays,
  }) {
    final result = create();
    if (supplier != null) result.supplier = supplier;
    if (totalPurchaseOrders != null)
      result.totalPurchaseOrders = totalPurchaseOrders;
    if (totalPurchaseValue != null)
      result.totalPurchaseValue = totalPurchaseValue;
    if (onTimeDeliveries != null) result.onTimeDeliveries = onTimeDeliveries;
    if (lateDeliveries != null) result.lateDeliveries = lateDeliveries;
    if (onTimePercentage != null) result.onTimePercentage = onTimePercentage;
    if (qualityIssues != null) result.qualityIssues = qualityIssues;
    if (averageDeliveryTimeDays != null)
      result.averageDeliveryTimeDays = averageDeliveryTimeDays;
    return result;
  }

  GetSupplierPerformanceReportResponse._();

  factory GetSupplierPerformanceReportResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSupplierPerformanceReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSupplierPerformanceReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$5.Supplier>(1, _omitFieldNames ? '' : 'supplier',
        subBuilder: $5.Supplier.create)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'totalPurchaseOrders', $pb.PbFieldType.O3)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'totalPurchaseValue', $pb.PbFieldType.OD)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'onTimeDeliveries', $pb.PbFieldType.O3)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'lateDeliveries', $pb.PbFieldType.O3)
    ..a<$core.double>(
        6, _omitFieldNames ? '' : 'onTimePercentage', $pb.PbFieldType.OD)
    ..a<$core.int>(
        7, _omitFieldNames ? '' : 'qualityIssues', $pb.PbFieldType.O3)
    ..a<$core.double>(
        8, _omitFieldNames ? '' : 'averageDeliveryTimeDays', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSupplierPerformanceReportResponse clone() =>
      GetSupplierPerformanceReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSupplierPerformanceReportResponse copyWith(
          void Function(GetSupplierPerformanceReportResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetSupplierPerformanceReportResponse))
          as GetSupplierPerformanceReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSupplierPerformanceReportResponse create() =>
      GetSupplierPerformanceReportResponse._();
  @$core.override
  GetSupplierPerformanceReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetSupplierPerformanceReportResponse> createRepeated() =>
      $pb.PbList<GetSupplierPerformanceReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSupplierPerformanceReportResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetSupplierPerformanceReportResponse>(create);
  static GetSupplierPerformanceReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier($5.Supplier value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => $_clearField(1);
  @$pb.TagNumber(1)
  $5.Supplier ensureSupplier() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get totalPurchaseOrders => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalPurchaseOrders($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalPurchaseOrders() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalPurchaseOrders() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalPurchaseValue => $_getN(2);
  @$pb.TagNumber(3)
  set totalPurchaseValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalPurchaseValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalPurchaseValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get onTimeDeliveries => $_getIZ(3);
  @$pb.TagNumber(4)
  set onTimeDeliveries($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOnTimeDeliveries() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnTimeDeliveries() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get lateDeliveries => $_getIZ(4);
  @$pb.TagNumber(5)
  set lateDeliveries($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLateDeliveries() => $_has(4);
  @$pb.TagNumber(5)
  void clearLateDeliveries() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get onTimePercentage => $_getN(5);
  @$pb.TagNumber(6)
  set onTimePercentage($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOnTimePercentage() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnTimePercentage() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get qualityIssues => $_getIZ(6);
  @$pb.TagNumber(7)
  set qualityIssues($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasQualityIssues() => $_has(6);
  @$pb.TagNumber(7)
  void clearQualityIssues() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get averageDeliveryTimeDays => $_getN(7);
  @$pb.TagNumber(8)
  set averageDeliveryTimeDays($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAverageDeliveryTimeDays() => $_has(7);
  @$pb.TagNumber(8)
  void clearAverageDeliveryTimeDays() => $_clearField(8);
}

class GetProfitLossReportRequest extends $pb.GeneratedMessage {
  factory GetProfitLossReportRequest({
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.String? storeId,
  }) {
    final result = create();
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetProfitLossReportRequest._();

  factory GetProfitLossReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProfitLossReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProfitLossReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProfitLossReportRequest clone() =>
      GetProfitLossReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProfitLossReportRequest copyWith(
          void Function(GetProfitLossReportRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetProfitLossReportRequest))
          as GetProfitLossReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfitLossReportRequest create() => GetProfitLossReportRequest._();
  @$core.override
  GetProfitLossReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetProfitLossReportRequest> createRepeated() =>
      $pb.PbList<GetProfitLossReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProfitLossReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProfitLossReportRequest>(create);
  static GetProfitLossReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get startDate => $_getN(0);
  @$pb.TagNumber(1)
  set startDate($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStartDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartDate() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureStartDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get endDate => $_getN(1);
  @$pb.TagNumber(2)
  set endDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureEndDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);
}

class GetProfitLossReportResponse extends $pb.GeneratedMessage {
  factory GetProfitLossReportResponse({
    $core.double? totalRevenue,
    $core.double? costOfGoodsSold,
    $core.double? grossProfit,
    $core.double? grossProfitMargin,
    $core.double? returnsValue,
    $core.double? adjustmentsValue,
    $core.double? netProfit,
  }) {
    final result = create();
    if (totalRevenue != null) result.totalRevenue = totalRevenue;
    if (costOfGoodsSold != null) result.costOfGoodsSold = costOfGoodsSold;
    if (grossProfit != null) result.grossProfit = grossProfit;
    if (grossProfitMargin != null) result.grossProfitMargin = grossProfitMargin;
    if (returnsValue != null) result.returnsValue = returnsValue;
    if (adjustmentsValue != null) result.adjustmentsValue = adjustmentsValue;
    if (netProfit != null) result.netProfit = netProfit;
    return result;
  }

  GetProfitLossReportResponse._();

  factory GetProfitLossReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProfitLossReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProfitLossReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1, _omitFieldNames ? '' : 'totalRevenue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'costOfGoodsSold', $pb.PbFieldType.OD)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'grossProfit', $pb.PbFieldType.OD)
    ..a<$core.double>(
        4, _omitFieldNames ? '' : 'grossProfitMargin', $pb.PbFieldType.OD)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'returnsValue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        6, _omitFieldNames ? '' : 'adjustmentsValue', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'netProfit', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProfitLossReportResponse clone() =>
      GetProfitLossReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProfitLossReportResponse copyWith(
          void Function(GetProfitLossReportResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetProfitLossReportResponse))
          as GetProfitLossReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfitLossReportResponse create() =>
      GetProfitLossReportResponse._();
  @$core.override
  GetProfitLossReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetProfitLossReportResponse> createRepeated() =>
      $pb.PbList<GetProfitLossReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProfitLossReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProfitLossReportResponse>(create);
  static GetProfitLossReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get totalRevenue => $_getN(0);
  @$pb.TagNumber(1)
  set totalRevenue($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalRevenue() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalRevenue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get costOfGoodsSold => $_getN(1);
  @$pb.TagNumber(2)
  set costOfGoodsSold($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCostOfGoodsSold() => $_has(1);
  @$pb.TagNumber(2)
  void clearCostOfGoodsSold() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get grossProfit => $_getN(2);
  @$pb.TagNumber(3)
  set grossProfit($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGrossProfit() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrossProfit() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get grossProfitMargin => $_getN(3);
  @$pb.TagNumber(4)
  set grossProfitMargin($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGrossProfitMargin() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrossProfitMargin() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get returnsValue => $_getN(4);
  @$pb.TagNumber(5)
  set returnsValue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReturnsValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearReturnsValue() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get adjustmentsValue => $_getN(5);
  @$pb.TagNumber(6)
  set adjustmentsValue($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAdjustmentsValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearAdjustmentsValue() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get netProfit => $_getN(6);
  @$pb.TagNumber(7)
  set netProfit($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNetProfit() => $_has(6);
  @$pb.TagNumber(7)
  void clearNetProfit() => $_clearField(7);
}

class GetStockAgingReportRequest extends $pb.GeneratedMessage {
  factory GetStockAgingReportRequest({
    $core.String? storeId,
    $core.String? category,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (category != null) result.category = category;
    return result;
  }

  GetStockAgingReportRequest._();

  factory GetStockAgingReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStockAgingReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStockAgingReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'category')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStockAgingReportRequest clone() =>
      GetStockAgingReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStockAgingReportRequest copyWith(
          void Function(GetStockAgingReportRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetStockAgingReportRequest))
          as GetStockAgingReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStockAgingReportRequest create() => GetStockAgingReportRequest._();
  @$core.override
  GetStockAgingReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetStockAgingReportRequest> createRepeated() =>
      $pb.PbList<GetStockAgingReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStockAgingReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStockAgingReportRequest>(create);
  static GetStockAgingReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get category => $_getSZ(1);
  @$pb.TagNumber(2)
  set category($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => $_clearField(2);
}

class GetStockAgingReportResponse extends $pb.GeneratedMessage {
  factory GetStockAgingReportResponse({
    $core.Iterable<StockAgingItem>? items,
    $core.double? totalStockValue,
    $core.double? slowMovingStockValue,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (totalStockValue != null) result.totalStockValue = totalStockValue;
    if (slowMovingStockValue != null)
      result.slowMovingStockValue = slowMovingStockValue;
    return result;
  }

  GetStockAgingReportResponse._();

  factory GetStockAgingReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStockAgingReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStockAgingReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..pc<StockAgingItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: StockAgingItem.create)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'totalStockValue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'slowMovingStockValue', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStockAgingReportResponse clone() =>
      GetStockAgingReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStockAgingReportResponse copyWith(
          void Function(GetStockAgingReportResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetStockAgingReportResponse))
          as GetStockAgingReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStockAgingReportResponse create() =>
      GetStockAgingReportResponse._();
  @$core.override
  GetStockAgingReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetStockAgingReportResponse> createRepeated() =>
      $pb.PbList<GetStockAgingReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStockAgingReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStockAgingReportResponse>(create);
  static GetStockAgingReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<StockAgingItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get totalStockValue => $_getN(1);
  @$pb.TagNumber(2)
  set totalStockValue($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalStockValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalStockValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get slowMovingStockValue => $_getN(2);
  @$pb.TagNumber(3)
  set slowMovingStockValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSlowMovingStockValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearSlowMovingStockValue() => $_clearField(3);
}

class StockAgingItem extends $pb.GeneratedMessage {
  factory StockAgingItem({
    $1.StoreProduct? product,
    $core.double? quantity,
    $core.double? stockValue,
    $0.Timestamp? lastMovementDate,
    $core.int? daysSinceLastMovement,
    StockMovementCategory? movementCategory,
  }) {
    final result = create();
    if (product != null) result.product = product;
    if (quantity != null) result.quantity = quantity;
    if (stockValue != null) result.stockValue = stockValue;
    if (lastMovementDate != null) result.lastMovementDate = lastMovementDate;
    if (daysSinceLastMovement != null)
      result.daysSinceLastMovement = daysSinceLastMovement;
    if (movementCategory != null) result.movementCategory = movementCategory;
    return result;
  }

  StockAgingItem._();

  factory StockAgingItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockAgingItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockAgingItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$1.StoreProduct>(1, _omitFieldNames ? '' : 'product',
        subBuilder: $1.StoreProduct.create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.OD)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'stockValue', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'lastMovementDate',
        subBuilder: $0.Timestamp.create)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'daysSinceLastMovement', $pb.PbFieldType.O3)
    ..e<StockMovementCategory>(
        6, _omitFieldNames ? '' : 'movementCategory', $pb.PbFieldType.OE,
        defaultOrMaker:
            StockMovementCategory.STOCK_MOVEMENT_CATEGORY_UNSPECIFIED,
        valueOf: StockMovementCategory.valueOf,
        enumValues: StockMovementCategory.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockAgingItem clone() => StockAgingItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockAgingItem copyWith(void Function(StockAgingItem) updates) =>
      super.copyWith((message) => updates(message as StockAgingItem))
          as StockAgingItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockAgingItem create() => StockAgingItem._();
  @$core.override
  StockAgingItem createEmptyInstance() => create();
  static $pb.PbList<StockAgingItem> createRepeated() =>
      $pb.PbList<StockAgingItem>();
  @$core.pragma('dart2js:noInline')
  static StockAgingItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockAgingItem>(create);
  static StockAgingItem? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StoreProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product($1.StoreProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.StoreProduct ensureProduct() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get quantity => $_getN(1);
  @$pb.TagNumber(2)
  set quantity($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get stockValue => $_getN(2);
  @$pb.TagNumber(3)
  set stockValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStockValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearStockValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get lastMovementDate => $_getN(3);
  @$pb.TagNumber(4)
  set lastMovementDate($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasLastMovementDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastMovementDate() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureLastMovementDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get daysSinceLastMovement => $_getIZ(4);
  @$pb.TagNumber(5)
  set daysSinceLastMovement($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDaysSinceLastMovement() => $_has(4);
  @$pb.TagNumber(5)
  void clearDaysSinceLastMovement() => $_clearField(5);

  @$pb.TagNumber(6)
  StockMovementCategory get movementCategory => $_getN(5);
  @$pb.TagNumber(6)
  set movementCategory(StockMovementCategory value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMovementCategory() => $_has(5);
  @$pb.TagNumber(6)
  void clearMovementCategory() => $_clearField(6);
}

class GetInventoryReportRequest extends $pb.GeneratedMessage {
  factory GetInventoryReportRequest({
    $core.String? storeId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.String? category,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (category != null) result.category = category;
    return result;
  }

  GetInventoryReportRequest._();

  factory GetInventoryReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInventoryReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInventoryReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'category')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryReportRequest clone() =>
      GetInventoryReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryReportRequest copyWith(
          void Function(GetInventoryReportRequest) updates) =>
      super.copyWith((message) => updates(message as GetInventoryReportRequest))
          as GetInventoryReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInventoryReportRequest create() => GetInventoryReportRequest._();
  @$core.override
  GetInventoryReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetInventoryReportRequest> createRepeated() =>
      $pb.PbList<GetInventoryReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetInventoryReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInventoryReportRequest>(create);
  static GetInventoryReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Timestamp get endDate => $_getN(2);
  @$pb.TagNumber(3)
  set endDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureEndDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get category => $_getSZ(3);
  @$pb.TagNumber(4)
  set category($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);
}

class InventoryMovementSummary extends $pb.GeneratedMessage {
  factory InventoryMovementSummary({
    $core.double? totalIn,
    $core.double? totalOut,
    $core.double? netChange,
  }) {
    final result = create();
    if (totalIn != null) result.totalIn = totalIn;
    if (totalOut != null) result.totalOut = totalOut;
    if (netChange != null) result.netChange = netChange;
    return result;
  }

  InventoryMovementSummary._();

  factory InventoryMovementSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InventoryMovementSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InventoryMovementSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'totalIn', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'totalOut', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'netChange', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryMovementSummary clone() =>
      InventoryMovementSummary()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryMovementSummary copyWith(
          void Function(InventoryMovementSummary) updates) =>
      super.copyWith((message) => updates(message as InventoryMovementSummary))
          as InventoryMovementSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InventoryMovementSummary create() => InventoryMovementSummary._();
  @$core.override
  InventoryMovementSummary createEmptyInstance() => create();
  static $pb.PbList<InventoryMovementSummary> createRepeated() =>
      $pb.PbList<InventoryMovementSummary>();
  @$core.pragma('dart2js:noInline')
  static InventoryMovementSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InventoryMovementSummary>(create);
  static InventoryMovementSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get totalIn => $_getN(0);
  @$pb.TagNumber(1)
  set totalIn($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalIn() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalIn() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get totalOut => $_getN(1);
  @$pb.TagNumber(2)
  set totalOut($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalOut() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get netChange => $_getN(2);
  @$pb.TagNumber(3)
  set netChange($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNetChange() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetChange() => $_clearField(3);
}

class GetInventoryReportResponse extends $pb.GeneratedMessage {
  factory GetInventoryReportResponse({
    $core.int? totalProducts,
    $core.double? totalValue,
    $core.int? lowStockCount,
    $core.Iterable<StockAgingItem>? agingItems,
    InventoryMovementSummary? movementSummary,
    $core.Iterable<BestSellingProduct>? bestSellers,
    $core.Iterable<StockMovementDataPoint>? stockMovementData,
    InventoryComparisonData? previousYearComparison,
  }) {
    final result = create();
    if (totalProducts != null) result.totalProducts = totalProducts;
    if (totalValue != null) result.totalValue = totalValue;
    if (lowStockCount != null) result.lowStockCount = lowStockCount;
    if (agingItems != null) result.agingItems.addAll(agingItems);
    if (movementSummary != null) result.movementSummary = movementSummary;
    if (bestSellers != null) result.bestSellers.addAll(bestSellers);
    if (stockMovementData != null)
      result.stockMovementData.addAll(stockMovementData);
    if (previousYearComparison != null)
      result.previousYearComparison = previousYearComparison;
    return result;
  }

  GetInventoryReportResponse._();

  factory GetInventoryReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInventoryReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInventoryReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'totalProducts', $pb.PbFieldType.O3)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'totalValue', $pb.PbFieldType.OD)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'lowStockCount', $pb.PbFieldType.O3)
    ..pc<StockAgingItem>(
        4, _omitFieldNames ? '' : 'agingItems', $pb.PbFieldType.PM,
        subBuilder: StockAgingItem.create)
    ..aOM<InventoryMovementSummary>(5, _omitFieldNames ? '' : 'movementSummary',
        subBuilder: InventoryMovementSummary.create)
    ..pc<BestSellingProduct>(
        6, _omitFieldNames ? '' : 'bestSellers', $pb.PbFieldType.PM,
        subBuilder: BestSellingProduct.create)
    ..pc<StockMovementDataPoint>(
        7, _omitFieldNames ? '' : 'stockMovementData', $pb.PbFieldType.PM,
        subBuilder: StockMovementDataPoint.create)
    ..aOM<InventoryComparisonData>(
        8, _omitFieldNames ? '' : 'previousYearComparison',
        subBuilder: InventoryComparisonData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryReportResponse clone() =>
      GetInventoryReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryReportResponse copyWith(
          void Function(GetInventoryReportResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetInventoryReportResponse))
          as GetInventoryReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInventoryReportResponse create() => GetInventoryReportResponse._();
  @$core.override
  GetInventoryReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetInventoryReportResponse> createRepeated() =>
      $pb.PbList<GetInventoryReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetInventoryReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInventoryReportResponse>(create);
  static GetInventoryReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalProducts => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalProducts($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalProducts() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalProducts() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get totalValue => $_getN(1);
  @$pb.TagNumber(2)
  set totalValue($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get lowStockCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set lowStockCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLowStockCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearLowStockCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<StockAgingItem> get agingItems => $_getList(3);

  @$pb.TagNumber(5)
  InventoryMovementSummary get movementSummary => $_getN(4);
  @$pb.TagNumber(5)
  set movementSummary(InventoryMovementSummary value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasMovementSummary() => $_has(4);
  @$pb.TagNumber(5)
  void clearMovementSummary() => $_clearField(5);
  @$pb.TagNumber(5)
  InventoryMovementSummary ensureMovementSummary() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<BestSellingProduct> get bestSellers => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<StockMovementDataPoint> get stockMovementData => $_getList(6);

  @$pb.TagNumber(8)
  InventoryComparisonData get previousYearComparison => $_getN(7);
  @$pb.TagNumber(8)
  set previousYearComparison(InventoryComparisonData value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPreviousYearComparison() => $_has(7);
  @$pb.TagNumber(8)
  void clearPreviousYearComparison() => $_clearField(8);
  @$pb.TagNumber(8)
  InventoryComparisonData ensurePreviousYearComparison() => $_ensure(7);
}

class StockMovementDataPoint extends $pb.GeneratedMessage {
  factory StockMovementDataPoint({
    $0.Timestamp? date,
    $core.double? stockLevel,
    $core.double? movementQuantity,
    $core.String? movementType,
  }) {
    final result = create();
    if (date != null) result.date = date;
    if (stockLevel != null) result.stockLevel = stockLevel;
    if (movementQuantity != null) result.movementQuantity = movementQuantity;
    if (movementType != null) result.movementType = movementType;
    return result;
  }

  StockMovementDataPoint._();

  factory StockMovementDataPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockMovementDataPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockMovementDataPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'date',
        subBuilder: $0.Timestamp.create)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'stockLevel', $pb.PbFieldType.OD)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'movementQuantity', $pb.PbFieldType.OD)
    ..aOS(4, _omitFieldNames ? '' : 'movementType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockMovementDataPoint clone() =>
      StockMovementDataPoint()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockMovementDataPoint copyWith(
          void Function(StockMovementDataPoint) updates) =>
      super.copyWith((message) => updates(message as StockMovementDataPoint))
          as StockMovementDataPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockMovementDataPoint create() => StockMovementDataPoint._();
  @$core.override
  StockMovementDataPoint createEmptyInstance() => create();
  static $pb.PbList<StockMovementDataPoint> createRepeated() =>
      $pb.PbList<StockMovementDataPoint>();
  @$core.pragma('dart2js:noInline')
  static StockMovementDataPoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockMovementDataPoint>(create);
  static StockMovementDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get date => $_getN(0);
  @$pb.TagNumber(1)
  set date($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get stockLevel => $_getN(1);
  @$pb.TagNumber(2)
  set stockLevel($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStockLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearStockLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get movementQuantity => $_getN(2);
  @$pb.TagNumber(3)
  set movementQuantity($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMovementQuantity() => $_has(2);
  @$pb.TagNumber(3)
  void clearMovementQuantity() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get movementType => $_getSZ(3);
  @$pb.TagNumber(4)
  set movementType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMovementType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMovementType() => $_clearField(4);
}

class GetSalesReportFullResponse extends $pb.GeneratedMessage {
  factory GetSalesReportFullResponse({
    $core.Iterable<SalesSummary>? summaries,
    $core.double? totalSalesAmount,
    $core.int? totalTransactions,
    $core.int? totalUnitsSold,
    $core.double? averageTransactionValue,
    $core.Iterable<BestSellingProduct>? bestProducts,
    $core.Iterable<CategorySalesData>? categorySalesData,
    SalesComparisonData? previousYearComparison,
  }) {
    final result = create();
    if (summaries != null) result.summaries.addAll(summaries);
    if (totalSalesAmount != null) result.totalSalesAmount = totalSalesAmount;
    if (totalTransactions != null) result.totalTransactions = totalTransactions;
    if (totalUnitsSold != null) result.totalUnitsSold = totalUnitsSold;
    if (averageTransactionValue != null)
      result.averageTransactionValue = averageTransactionValue;
    if (bestProducts != null) result.bestProducts.addAll(bestProducts);
    if (categorySalesData != null)
      result.categorySalesData.addAll(categorySalesData);
    if (previousYearComparison != null)
      result.previousYearComparison = previousYearComparison;
    return result;
  }

  GetSalesReportFullResponse._();

  factory GetSalesReportFullResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSalesReportFullResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSalesReportFullResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..pc<SalesSummary>(
        1, _omitFieldNames ? '' : 'summaries', $pb.PbFieldType.PM,
        subBuilder: SalesSummary.create)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'totalSalesAmount', $pb.PbFieldType.OD)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'totalTransactions', $pb.PbFieldType.O3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'totalUnitsSold', $pb.PbFieldType.O3)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'averageTransactionValue', $pb.PbFieldType.OD)
    ..pc<BestSellingProduct>(
        6, _omitFieldNames ? '' : 'bestProducts', $pb.PbFieldType.PM,
        subBuilder: BestSellingProduct.create)
    ..pc<CategorySalesData>(
        7, _omitFieldNames ? '' : 'categorySalesData', $pb.PbFieldType.PM,
        subBuilder: CategorySalesData.create)
    ..aOM<SalesComparisonData>(
        8, _omitFieldNames ? '' : 'previousYearComparison',
        subBuilder: SalesComparisonData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesReportFullResponse clone() =>
      GetSalesReportFullResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesReportFullResponse copyWith(
          void Function(GetSalesReportFullResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSalesReportFullResponse))
          as GetSalesReportFullResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSalesReportFullResponse create() => GetSalesReportFullResponse._();
  @$core.override
  GetSalesReportFullResponse createEmptyInstance() => create();
  static $pb.PbList<GetSalesReportFullResponse> createRepeated() =>
      $pb.PbList<GetSalesReportFullResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSalesReportFullResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSalesReportFullResponse>(create);
  static GetSalesReportFullResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SalesSummary> get summaries => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get totalSalesAmount => $_getN(1);
  @$pb.TagNumber(2)
  set totalSalesAmount($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalSalesAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalSalesAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalTransactions => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalTransactions($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalTransactions() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalTransactions() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalUnitsSold => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalUnitsSold($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalUnitsSold() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalUnitsSold() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get averageTransactionValue => $_getN(4);
  @$pb.TagNumber(5)
  set averageTransactionValue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAverageTransactionValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearAverageTransactionValue() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<BestSellingProduct> get bestProducts => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<CategorySalesData> get categorySalesData => $_getList(6);

  @$pb.TagNumber(8)
  SalesComparisonData get previousYearComparison => $_getN(7);
  @$pb.TagNumber(8)
  set previousYearComparison(SalesComparisonData value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPreviousYearComparison() => $_has(7);
  @$pb.TagNumber(8)
  void clearPreviousYearComparison() => $_clearField(8);
  @$pb.TagNumber(8)
  SalesComparisonData ensurePreviousYearComparison() => $_ensure(7);
}

class CategorySalesData extends $pb.GeneratedMessage {
  factory CategorySalesData({
    $core.String? categoryName,
    $core.double? totalSalesAmount,
    $core.int? totalUnitsSold,
    $core.int? transactionCount,
    $core.double? percentageOfTotal,
  }) {
    final result = create();
    if (categoryName != null) result.categoryName = categoryName;
    if (totalSalesAmount != null) result.totalSalesAmount = totalSalesAmount;
    if (totalUnitsSold != null) result.totalUnitsSold = totalUnitsSold;
    if (transactionCount != null) result.transactionCount = transactionCount;
    if (percentageOfTotal != null) result.percentageOfTotal = percentageOfTotal;
    return result;
  }

  CategorySalesData._();

  factory CategorySalesData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CategorySalesData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CategorySalesData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'categoryName')
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'totalSalesAmount', $pb.PbFieldType.OD)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'totalUnitsSold', $pb.PbFieldType.O3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'transactionCount', $pb.PbFieldType.O3)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'percentageOfTotal', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategorySalesData clone() => CategorySalesData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategorySalesData copyWith(void Function(CategorySalesData) updates) =>
      super.copyWith((message) => updates(message as CategorySalesData))
          as CategorySalesData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategorySalesData create() => CategorySalesData._();
  @$core.override
  CategorySalesData createEmptyInstance() => create();
  static $pb.PbList<CategorySalesData> createRepeated() =>
      $pb.PbList<CategorySalesData>();
  @$core.pragma('dart2js:noInline')
  static CategorySalesData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategorySalesData>(create);
  static CategorySalesData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get categoryName => $_getSZ(0);
  @$pb.TagNumber(1)
  set categoryName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCategoryName() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategoryName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get totalSalesAmount => $_getN(1);
  @$pb.TagNumber(2)
  set totalSalesAmount($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalSalesAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalSalesAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalUnitsSold => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalUnitsSold($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalUnitsSold() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalUnitsSold() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get transactionCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set transactionCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTransactionCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransactionCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get percentageOfTotal => $_getN(4);
  @$pb.TagNumber(5)
  set percentageOfTotal($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPercentageOfTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearPercentageOfTotal() => $_clearField(5);
}

class SalesComparisonData extends $pb.GeneratedMessage {
  factory SalesComparisonData({
    $core.double? previousYearTotalSales,
    $core.int? previousYearTotalTransactions,
    $core.double? previousYearAverageTransactionValue,
  }) {
    final result = create();
    if (previousYearTotalSales != null)
      result.previousYearTotalSales = previousYearTotalSales;
    if (previousYearTotalTransactions != null)
      result.previousYearTotalTransactions = previousYearTotalTransactions;
    if (previousYearAverageTransactionValue != null)
      result.previousYearAverageTransactionValue =
          previousYearAverageTransactionValue;
    return result;
  }

  SalesComparisonData._();

  factory SalesComparisonData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalesComparisonData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalesComparisonData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1, _omitFieldNames ? '' : 'previousYearTotalSales', $pb.PbFieldType.OD)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'previousYearTotalTransactions',
        $pb.PbFieldType.O3)
    ..a<$core.double>(
        3,
        _omitFieldNames ? '' : 'previousYearAverageTransactionValue',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalesComparisonData clone() => SalesComparisonData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalesComparisonData copyWith(void Function(SalesComparisonData) updates) =>
      super.copyWith((message) => updates(message as SalesComparisonData))
          as SalesComparisonData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalesComparisonData create() => SalesComparisonData._();
  @$core.override
  SalesComparisonData createEmptyInstance() => create();
  static $pb.PbList<SalesComparisonData> createRepeated() =>
      $pb.PbList<SalesComparisonData>();
  @$core.pragma('dart2js:noInline')
  static SalesComparisonData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalesComparisonData>(create);
  static SalesComparisonData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get previousYearTotalSales => $_getN(0);
  @$pb.TagNumber(1)
  set previousYearTotalSales($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreviousYearTotalSales() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreviousYearTotalSales() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get previousYearTotalTransactions => $_getIZ(1);
  @$pb.TagNumber(2)
  set previousYearTotalTransactions($core.int value) =>
      $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreviousYearTotalTransactions() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreviousYearTotalTransactions() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get previousYearAverageTransactionValue => $_getN(2);
  @$pb.TagNumber(3)
  set previousYearAverageTransactionValue($core.double value) =>
      $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPreviousYearAverageTransactionValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreviousYearAverageTransactionValue() => $_clearField(3);
}

class GetFinancialReportRequest extends $pb.GeneratedMessage {
  factory GetFinancialReportRequest({
    $core.String? storeId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    return result;
  }

  GetFinancialReportRequest._();

  factory GetFinancialReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFinancialReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFinancialReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFinancialReportRequest clone() =>
      GetFinancialReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFinancialReportRequest copyWith(
          void Function(GetFinancialReportRequest) updates) =>
      super.copyWith((message) => updates(message as GetFinancialReportRequest))
          as GetFinancialReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFinancialReportRequest create() => GetFinancialReportRequest._();
  @$core.override
  GetFinancialReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetFinancialReportRequest> createRepeated() =>
      $pb.PbList<GetFinancialReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFinancialReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFinancialReportRequest>(create);
  static GetFinancialReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Timestamp get endDate => $_getN(2);
  @$pb.TagNumber(3)
  set endDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureEndDate() => $_ensure(2);
}

class GetFinancialReportResponse extends $pb.GeneratedMessage {
  factory GetFinancialReportResponse({
    $core.double? totalRevenue,
    $core.double? costOfGoodsSold,
    $core.double? grossProfit,
    $core.double? grossProfitMargin,
    $core.double? returnsValue,
    $core.double? adjustmentsValue,
    $core.double? netProfit,
    $core.double? totalPurchases,
    $core.double? outstandingBalance,
    $core.Iterable<SupplierPerformanceSummary>? supplierPerformances,
    $core.Iterable<RevenueExpenseDataPoint>? revenueVsExpensesData,
    FinancialComparisonData? previousYearComparison,
  }) {
    final result = create();
    if (totalRevenue != null) result.totalRevenue = totalRevenue;
    if (costOfGoodsSold != null) result.costOfGoodsSold = costOfGoodsSold;
    if (grossProfit != null) result.grossProfit = grossProfit;
    if (grossProfitMargin != null) result.grossProfitMargin = grossProfitMargin;
    if (returnsValue != null) result.returnsValue = returnsValue;
    if (adjustmentsValue != null) result.adjustmentsValue = adjustmentsValue;
    if (netProfit != null) result.netProfit = netProfit;
    if (totalPurchases != null) result.totalPurchases = totalPurchases;
    if (outstandingBalance != null)
      result.outstandingBalance = outstandingBalance;
    if (supplierPerformances != null)
      result.supplierPerformances.addAll(supplierPerformances);
    if (revenueVsExpensesData != null)
      result.revenueVsExpensesData.addAll(revenueVsExpensesData);
    if (previousYearComparison != null)
      result.previousYearComparison = previousYearComparison;
    return result;
  }

  GetFinancialReportResponse._();

  factory GetFinancialReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFinancialReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFinancialReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1, _omitFieldNames ? '' : 'totalRevenue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'costOfGoodsSold', $pb.PbFieldType.OD)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'grossProfit', $pb.PbFieldType.OD)
    ..a<$core.double>(
        4, _omitFieldNames ? '' : 'grossProfitMargin', $pb.PbFieldType.OD)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'returnsValue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        6, _omitFieldNames ? '' : 'adjustmentsValue', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'netProfit', $pb.PbFieldType.OD)
    ..a<$core.double>(
        8, _omitFieldNames ? '' : 'totalPurchases', $pb.PbFieldType.OD)
    ..a<$core.double>(
        9, _omitFieldNames ? '' : 'outstandingBalance', $pb.PbFieldType.OD)
    ..pc<SupplierPerformanceSummary>(
        10, _omitFieldNames ? '' : 'supplierPerformances', $pb.PbFieldType.PM,
        subBuilder: SupplierPerformanceSummary.create)
    ..pc<RevenueExpenseDataPoint>(
        11, _omitFieldNames ? '' : 'revenueVsExpensesData', $pb.PbFieldType.PM,
        subBuilder: RevenueExpenseDataPoint.create)
    ..aOM<FinancialComparisonData>(
        12, _omitFieldNames ? '' : 'previousYearComparison',
        subBuilder: FinancialComparisonData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFinancialReportResponse clone() =>
      GetFinancialReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFinancialReportResponse copyWith(
          void Function(GetFinancialReportResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetFinancialReportResponse))
          as GetFinancialReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFinancialReportResponse create() => GetFinancialReportResponse._();
  @$core.override
  GetFinancialReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetFinancialReportResponse> createRepeated() =>
      $pb.PbList<GetFinancialReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFinancialReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFinancialReportResponse>(create);
  static GetFinancialReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get totalRevenue => $_getN(0);
  @$pb.TagNumber(1)
  set totalRevenue($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalRevenue() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalRevenue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get costOfGoodsSold => $_getN(1);
  @$pb.TagNumber(2)
  set costOfGoodsSold($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCostOfGoodsSold() => $_has(1);
  @$pb.TagNumber(2)
  void clearCostOfGoodsSold() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get grossProfit => $_getN(2);
  @$pb.TagNumber(3)
  set grossProfit($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGrossProfit() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrossProfit() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get grossProfitMargin => $_getN(3);
  @$pb.TagNumber(4)
  set grossProfitMargin($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGrossProfitMargin() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrossProfitMargin() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get returnsValue => $_getN(4);
  @$pb.TagNumber(5)
  set returnsValue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReturnsValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearReturnsValue() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get adjustmentsValue => $_getN(5);
  @$pb.TagNumber(6)
  set adjustmentsValue($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAdjustmentsValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearAdjustmentsValue() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get netProfit => $_getN(6);
  @$pb.TagNumber(7)
  set netProfit($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNetProfit() => $_has(6);
  @$pb.TagNumber(7)
  void clearNetProfit() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get totalPurchases => $_getN(7);
  @$pb.TagNumber(8)
  set totalPurchases($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalPurchases() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalPurchases() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get outstandingBalance => $_getN(8);
  @$pb.TagNumber(9)
  set outstandingBalance($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasOutstandingBalance() => $_has(8);
  @$pb.TagNumber(9)
  void clearOutstandingBalance() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbList<SupplierPerformanceSummary> get supplierPerformances =>
      $_getList(9);

  @$pb.TagNumber(11)
  $pb.PbList<RevenueExpenseDataPoint> get revenueVsExpensesData =>
      $_getList(10);

  @$pb.TagNumber(12)
  FinancialComparisonData get previousYearComparison => $_getN(11);
  @$pb.TagNumber(12)
  set previousYearComparison(FinancialComparisonData value) =>
      $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasPreviousYearComparison() => $_has(11);
  @$pb.TagNumber(12)
  void clearPreviousYearComparison() => $_clearField(12);
  @$pb.TagNumber(12)
  FinancialComparisonData ensurePreviousYearComparison() => $_ensure(11);
}

class RevenueExpenseDataPoint extends $pb.GeneratedMessage {
  factory RevenueExpenseDataPoint({
    $0.Timestamp? periodStart,
    $0.Timestamp? periodEnd,
    $core.double? revenue,
    $core.double? expenses,
    $core.double? netAmount,
  }) {
    final result = create();
    if (periodStart != null) result.periodStart = periodStart;
    if (periodEnd != null) result.periodEnd = periodEnd;
    if (revenue != null) result.revenue = revenue;
    if (expenses != null) result.expenses = expenses;
    if (netAmount != null) result.netAmount = netAmount;
    return result;
  }

  RevenueExpenseDataPoint._();

  factory RevenueExpenseDataPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RevenueExpenseDataPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RevenueExpenseDataPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'periodStart',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'periodEnd',
        subBuilder: $0.Timestamp.create)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'revenue', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'expenses', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'netAmount', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RevenueExpenseDataPoint clone() =>
      RevenueExpenseDataPoint()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RevenueExpenseDataPoint copyWith(
          void Function(RevenueExpenseDataPoint) updates) =>
      super.copyWith((message) => updates(message as RevenueExpenseDataPoint))
          as RevenueExpenseDataPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevenueExpenseDataPoint create() => RevenueExpenseDataPoint._();
  @$core.override
  RevenueExpenseDataPoint createEmptyInstance() => create();
  static $pb.PbList<RevenueExpenseDataPoint> createRepeated() =>
      $pb.PbList<RevenueExpenseDataPoint>();
  @$core.pragma('dart2js:noInline')
  static RevenueExpenseDataPoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RevenueExpenseDataPoint>(create);
  static RevenueExpenseDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get periodStart => $_getN(0);
  @$pb.TagNumber(1)
  set periodStart($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPeriodStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeriodStart() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensurePeriodStart() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get periodEnd => $_getN(1);
  @$pb.TagNumber(2)
  set periodEnd($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPeriodEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeriodEnd() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensurePeriodEnd() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.double get revenue => $_getN(2);
  @$pb.TagNumber(3)
  set revenue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRevenue() => $_has(2);
  @$pb.TagNumber(3)
  void clearRevenue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get expenses => $_getN(3);
  @$pb.TagNumber(4)
  set expenses($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpenses() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpenses() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get netAmount => $_getN(4);
  @$pb.TagNumber(5)
  set netAmount($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNetAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearNetAmount() => $_clearField(5);
}

class SupplierPerformanceSummary extends $pb.GeneratedMessage {
  factory SupplierPerformanceSummary({
    $core.String? supplierId,
    $core.String? supplierName,
    $core.double? totalPurchaseValue,
    $core.double? onTimePercentage,
    $core.int? totalOrders,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    if (supplierName != null) result.supplierName = supplierName;
    if (totalPurchaseValue != null)
      result.totalPurchaseValue = totalPurchaseValue;
    if (onTimePercentage != null) result.onTimePercentage = onTimePercentage;
    if (totalOrders != null) result.totalOrders = totalOrders;
    return result;
  }

  SupplierPerformanceSummary._();

  factory SupplierPerformanceSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupplierPerformanceSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupplierPerformanceSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'supplierId')
    ..aOS(2, _omitFieldNames ? '' : 'supplierName')
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'totalPurchaseValue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        4, _omitFieldNames ? '' : 'onTimePercentage', $pb.PbFieldType.OD)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'totalOrders', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupplierPerformanceSummary clone() =>
      SupplierPerformanceSummary()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupplierPerformanceSummary copyWith(
          void Function(SupplierPerformanceSummary) updates) =>
      super.copyWith(
              (message) => updates(message as SupplierPerformanceSummary))
          as SupplierPerformanceSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupplierPerformanceSummary create() => SupplierPerformanceSummary._();
  @$core.override
  SupplierPerformanceSummary createEmptyInstance() => create();
  static $pb.PbList<SupplierPerformanceSummary> createRepeated() =>
      $pb.PbList<SupplierPerformanceSummary>();
  @$core.pragma('dart2js:noInline')
  static SupplierPerformanceSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupplierPerformanceSummary>(create);
  static SupplierPerformanceSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get supplierId => $_getSZ(0);
  @$pb.TagNumber(1)
  set supplierId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplierId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplierId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get supplierName => $_getSZ(1);
  @$pb.TagNumber(2)
  set supplierName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSupplierName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupplierName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalPurchaseValue => $_getN(2);
  @$pb.TagNumber(3)
  set totalPurchaseValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalPurchaseValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalPurchaseValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get onTimePercentage => $_getN(3);
  @$pb.TagNumber(4)
  set onTimePercentage($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOnTimePercentage() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnTimePercentage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalOrders => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalOrders($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalOrders() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalOrders() => $_clearField(5);
}

class FinancialComparisonData extends $pb.GeneratedMessage {
  factory FinancialComparisonData({
    $core.double? previousYearTotalRevenue,
    $core.double? previousYearNetProfit,
    $core.double? previousYearGrossProfitMargin,
    $core.double? previousYearTotalPurchases,
  }) {
    final result = create();
    if (previousYearTotalRevenue != null)
      result.previousYearTotalRevenue = previousYearTotalRevenue;
    if (previousYearNetProfit != null)
      result.previousYearNetProfit = previousYearNetProfit;
    if (previousYearGrossProfitMargin != null)
      result.previousYearGrossProfitMargin = previousYearGrossProfitMargin;
    if (previousYearTotalPurchases != null)
      result.previousYearTotalPurchases = previousYearTotalPurchases;
    return result;
  }

  FinancialComparisonData._();

  factory FinancialComparisonData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinancialComparisonData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinancialComparisonData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'previousYearTotalRevenue',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'previousYearNetProfit', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'previousYearGrossProfitMargin',
        $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'previousYearTotalPurchases',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinancialComparisonData clone() =>
      FinancialComparisonData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinancialComparisonData copyWith(
          void Function(FinancialComparisonData) updates) =>
      super.copyWith((message) => updates(message as FinancialComparisonData))
          as FinancialComparisonData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinancialComparisonData create() => FinancialComparisonData._();
  @$core.override
  FinancialComparisonData createEmptyInstance() => create();
  static $pb.PbList<FinancialComparisonData> createRepeated() =>
      $pb.PbList<FinancialComparisonData>();
  @$core.pragma('dart2js:noInline')
  static FinancialComparisonData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinancialComparisonData>(create);
  static FinancialComparisonData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get previousYearTotalRevenue => $_getN(0);
  @$pb.TagNumber(1)
  set previousYearTotalRevenue($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreviousYearTotalRevenue() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreviousYearTotalRevenue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get previousYearNetProfit => $_getN(1);
  @$pb.TagNumber(2)
  set previousYearNetProfit($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreviousYearNetProfit() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreviousYearNetProfit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get previousYearGrossProfitMargin => $_getN(2);
  @$pb.TagNumber(3)
  set previousYearGrossProfitMargin($core.double value) =>
      $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPreviousYearGrossProfitMargin() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreviousYearGrossProfitMargin() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get previousYearTotalPurchases => $_getN(3);
  @$pb.TagNumber(4)
  set previousYearTotalPurchases($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPreviousYearTotalPurchases() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreviousYearTotalPurchases() => $_clearField(4);
}

class InventoryComparisonData extends $pb.GeneratedMessage {
  factory InventoryComparisonData({
    $core.int? previousYearTotalProducts,
    $core.double? previousYearTotalValue,
    $core.int? previousYearLowStockCount,
    $core.double? previousYearMovementTotalIn,
    $core.double? previousYearMovementTotalOut,
  }) {
    final result = create();
    if (previousYearTotalProducts != null)
      result.previousYearTotalProducts = previousYearTotalProducts;
    if (previousYearTotalValue != null)
      result.previousYearTotalValue = previousYearTotalValue;
    if (previousYearLowStockCount != null)
      result.previousYearLowStockCount = previousYearLowStockCount;
    if (previousYearMovementTotalIn != null)
      result.previousYearMovementTotalIn = previousYearMovementTotalIn;
    if (previousYearMovementTotalOut != null)
      result.previousYearMovementTotalOut = previousYearMovementTotalOut;
    return result;
  }

  InventoryComparisonData._();

  factory InventoryComparisonData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InventoryComparisonData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InventoryComparisonData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'previousYearTotalProducts',
        $pb.PbFieldType.O3)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'previousYearTotalValue', $pb.PbFieldType.OD)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'previousYearLowStockCount',
        $pb.PbFieldType.O3)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'previousYearMovementTotalIn',
        $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'previousYearMovementTotalOut',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryComparisonData clone() =>
      InventoryComparisonData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryComparisonData copyWith(
          void Function(InventoryComparisonData) updates) =>
      super.copyWith((message) => updates(message as InventoryComparisonData))
          as InventoryComparisonData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InventoryComparisonData create() => InventoryComparisonData._();
  @$core.override
  InventoryComparisonData createEmptyInstance() => create();
  static $pb.PbList<InventoryComparisonData> createRepeated() =>
      $pb.PbList<InventoryComparisonData>();
  @$core.pragma('dart2js:noInline')
  static InventoryComparisonData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InventoryComparisonData>(create);
  static InventoryComparisonData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get previousYearTotalProducts => $_getIZ(0);
  @$pb.TagNumber(1)
  set previousYearTotalProducts($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreviousYearTotalProducts() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreviousYearTotalProducts() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get previousYearTotalValue => $_getN(1);
  @$pb.TagNumber(2)
  set previousYearTotalValue($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreviousYearTotalValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreviousYearTotalValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get previousYearLowStockCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set previousYearLowStockCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPreviousYearLowStockCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreviousYearLowStockCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get previousYearMovementTotalIn => $_getN(3);
  @$pb.TagNumber(4)
  set previousYearMovementTotalIn($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPreviousYearMovementTotalIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreviousYearMovementTotalIn() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get previousYearMovementTotalOut => $_getN(4);
  @$pb.TagNumber(5)
  set previousYearMovementTotalOut($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPreviousYearMovementTotalOut() => $_has(4);
  @$pb.TagNumber(5)
  void clearPreviousYearMovementTotalOut() => $_clearField(5);
}

class GetDashboardReportRequest extends $pb.GeneratedMessage {
  factory GetDashboardReportRequest({
    $core.String? storeId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    return result;
  }

  GetDashboardReportRequest._();

  factory GetDashboardReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDashboardReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDashboardReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDashboardReportRequest clone() =>
      GetDashboardReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDashboardReportRequest copyWith(
          void Function(GetDashboardReportRequest) updates) =>
      super.copyWith((message) => updates(message as GetDashboardReportRequest))
          as GetDashboardReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDashboardReportRequest create() => GetDashboardReportRequest._();
  @$core.override
  GetDashboardReportRequest createEmptyInstance() => create();
  static $pb.PbList<GetDashboardReportRequest> createRepeated() =>
      $pb.PbList<GetDashboardReportRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDashboardReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDashboardReportRequest>(create);
  static GetDashboardReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Timestamp get endDate => $_getN(2);
  @$pb.TagNumber(3)
  set endDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureEndDate() => $_ensure(2);
}

class GetDashboardReportResponse extends $pb.GeneratedMessage {
  factory GetDashboardReportResponse({
    $core.double? totalSalesAmount,
    $core.int? totalTransactions,
    $core.double? averageTransactionValue,
    $core.int? totalUnitsSold,
    $core.double? totalRevenue,
    $core.double? netProfit,
    $core.double? grossProfitMargin,
    $core.double? totalPurchases,
    $core.int? totalProducts,
    $core.double? totalInventoryValue,
    $core.int? lowStockCount,
    $core.Iterable<TrendDataPoint>? salesAndProfitTrend,
    $core.Iterable<CategorySalesData>? categorySalesBreakdown,
    $core.Iterable<RevenueExpenseDataPoint>? revenueVsExpenses,
    $core.Iterable<StockMovementDataPoint>? inventoryMovement,
    SalesComparisonData? salesComparison,
    FinancialComparisonData? financialComparison,
    InventoryComparisonData? inventoryComparison,
    $core.Iterable<BestSellingProduct>? topPerformingProducts,
    $core.Iterable<SupplierPerformanceSummary>? supplierPerformances,
    $core.Iterable<StockAgingItem>? stockAgingItems,
  }) {
    final result = create();
    if (totalSalesAmount != null) result.totalSalesAmount = totalSalesAmount;
    if (totalTransactions != null) result.totalTransactions = totalTransactions;
    if (averageTransactionValue != null)
      result.averageTransactionValue = averageTransactionValue;
    if (totalUnitsSold != null) result.totalUnitsSold = totalUnitsSold;
    if (totalRevenue != null) result.totalRevenue = totalRevenue;
    if (netProfit != null) result.netProfit = netProfit;
    if (grossProfitMargin != null) result.grossProfitMargin = grossProfitMargin;
    if (totalPurchases != null) result.totalPurchases = totalPurchases;
    if (totalProducts != null) result.totalProducts = totalProducts;
    if (totalInventoryValue != null)
      result.totalInventoryValue = totalInventoryValue;
    if (lowStockCount != null) result.lowStockCount = lowStockCount;
    if (salesAndProfitTrend != null)
      result.salesAndProfitTrend.addAll(salesAndProfitTrend);
    if (categorySalesBreakdown != null)
      result.categorySalesBreakdown.addAll(categorySalesBreakdown);
    if (revenueVsExpenses != null)
      result.revenueVsExpenses.addAll(revenueVsExpenses);
    if (inventoryMovement != null)
      result.inventoryMovement.addAll(inventoryMovement);
    if (salesComparison != null) result.salesComparison = salesComparison;
    if (financialComparison != null)
      result.financialComparison = financialComparison;
    if (inventoryComparison != null)
      result.inventoryComparison = inventoryComparison;
    if (topPerformingProducts != null)
      result.topPerformingProducts.addAll(topPerformingProducts);
    if (supplierPerformances != null)
      result.supplierPerformances.addAll(supplierPerformances);
    if (stockAgingItems != null) result.stockAgingItems.addAll(stockAgingItems);
    return result;
  }

  GetDashboardReportResponse._();

  factory GetDashboardReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDashboardReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDashboardReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1, _omitFieldNames ? '' : 'totalSalesAmount', $pb.PbFieldType.OD)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'totalTransactions', $pb.PbFieldType.O3)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'averageTransactionValue', $pb.PbFieldType.OD)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'totalUnitsSold', $pb.PbFieldType.O3)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'totalRevenue', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'netProfit', $pb.PbFieldType.OD)
    ..a<$core.double>(
        7, _omitFieldNames ? '' : 'grossProfitMargin', $pb.PbFieldType.OD)
    ..a<$core.double>(
        8, _omitFieldNames ? '' : 'totalPurchases', $pb.PbFieldType.OD)
    ..a<$core.int>(
        9, _omitFieldNames ? '' : 'totalProducts', $pb.PbFieldType.O3)
    ..a<$core.double>(
        10, _omitFieldNames ? '' : 'totalInventoryValue', $pb.PbFieldType.OD)
    ..a<$core.int>(
        11, _omitFieldNames ? '' : 'lowStockCount', $pb.PbFieldType.O3)
    ..pc<TrendDataPoint>(
        12, _omitFieldNames ? '' : 'salesAndProfitTrend', $pb.PbFieldType.PM,
        subBuilder: TrendDataPoint.create)
    ..pc<CategorySalesData>(
        13, _omitFieldNames ? '' : 'categorySalesBreakdown', $pb.PbFieldType.PM,
        subBuilder: CategorySalesData.create)
    ..pc<RevenueExpenseDataPoint>(
        14, _omitFieldNames ? '' : 'revenueVsExpenses', $pb.PbFieldType.PM,
        subBuilder: RevenueExpenseDataPoint.create)
    ..pc<StockMovementDataPoint>(
        15, _omitFieldNames ? '' : 'inventoryMovement', $pb.PbFieldType.PM,
        subBuilder: StockMovementDataPoint.create)
    ..aOM<SalesComparisonData>(16, _omitFieldNames ? '' : 'salesComparison',
        subBuilder: SalesComparisonData.create)
    ..aOM<FinancialComparisonData>(
        17, _omitFieldNames ? '' : 'financialComparison',
        subBuilder: FinancialComparisonData.create)
    ..aOM<InventoryComparisonData>(
        18, _omitFieldNames ? '' : 'inventoryComparison',
        subBuilder: InventoryComparisonData.create)
    ..pc<BestSellingProduct>(
        19, _omitFieldNames ? '' : 'topPerformingProducts', $pb.PbFieldType.PM,
        subBuilder: BestSellingProduct.create)
    ..pc<SupplierPerformanceSummary>(
        20, _omitFieldNames ? '' : 'supplierPerformances', $pb.PbFieldType.PM,
        subBuilder: SupplierPerformanceSummary.create)
    ..pc<StockAgingItem>(
        21, _omitFieldNames ? '' : 'stockAgingItems', $pb.PbFieldType.PM,
        subBuilder: StockAgingItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDashboardReportResponse clone() =>
      GetDashboardReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDashboardReportResponse copyWith(
          void Function(GetDashboardReportResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetDashboardReportResponse))
          as GetDashboardReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDashboardReportResponse create() => GetDashboardReportResponse._();
  @$core.override
  GetDashboardReportResponse createEmptyInstance() => create();
  static $pb.PbList<GetDashboardReportResponse> createRepeated() =>
      $pb.PbList<GetDashboardReportResponse>();
  @$core.pragma('dart2js:noInline')
  static GetDashboardReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDashboardReportResponse>(create);
  static GetDashboardReportResponse? _defaultInstance;

  /// Sales metrics
  @$pb.TagNumber(1)
  $core.double get totalSalesAmount => $_getN(0);
  @$pb.TagNumber(1)
  set totalSalesAmount($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalSalesAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalSalesAmount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalTransactions => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalTransactions($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalTransactions() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalTransactions() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get averageTransactionValue => $_getN(2);
  @$pb.TagNumber(3)
  set averageTransactionValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAverageTransactionValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearAverageTransactionValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalUnitsSold => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalUnitsSold($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalUnitsSold() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalUnitsSold() => $_clearField(4);

  /// Financial metrics
  @$pb.TagNumber(5)
  $core.double get totalRevenue => $_getN(4);
  @$pb.TagNumber(5)
  set totalRevenue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalRevenue() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalRevenue() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get netProfit => $_getN(5);
  @$pb.TagNumber(6)
  set netProfit($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNetProfit() => $_has(5);
  @$pb.TagNumber(6)
  void clearNetProfit() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get grossProfitMargin => $_getN(6);
  @$pb.TagNumber(7)
  set grossProfitMargin($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGrossProfitMargin() => $_has(6);
  @$pb.TagNumber(7)
  void clearGrossProfitMargin() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get totalPurchases => $_getN(7);
  @$pb.TagNumber(8)
  set totalPurchases($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalPurchases() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalPurchases() => $_clearField(8);

  /// Inventory metrics
  @$pb.TagNumber(9)
  $core.int get totalProducts => $_getIZ(8);
  @$pb.TagNumber(9)
  set totalProducts($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTotalProducts() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalProducts() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get totalInventoryValue => $_getN(9);
  @$pb.TagNumber(10)
  set totalInventoryValue($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTotalInventoryValue() => $_has(9);
  @$pb.TagNumber(10)
  void clearTotalInventoryValue() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get lowStockCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set lowStockCount($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLowStockCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearLowStockCount() => $_clearField(11);

  /// Trend and comparison data
  @$pb.TagNumber(12)
  $pb.PbList<TrendDataPoint> get salesAndProfitTrend => $_getList(11);

  @$pb.TagNumber(13)
  $pb.PbList<CategorySalesData> get categorySalesBreakdown => $_getList(12);

  @$pb.TagNumber(14)
  $pb.PbList<RevenueExpenseDataPoint> get revenueVsExpenses => $_getList(13);

  @$pb.TagNumber(15)
  $pb.PbList<StockMovementDataPoint> get inventoryMovement => $_getList(14);

  /// Previous year comparisons
  @$pb.TagNumber(16)
  SalesComparisonData get salesComparison => $_getN(15);
  @$pb.TagNumber(16)
  set salesComparison(SalesComparisonData value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasSalesComparison() => $_has(15);
  @$pb.TagNumber(16)
  void clearSalesComparison() => $_clearField(16);
  @$pb.TagNumber(16)
  SalesComparisonData ensureSalesComparison() => $_ensure(15);

  @$pb.TagNumber(17)
  FinancialComparisonData get financialComparison => $_getN(16);
  @$pb.TagNumber(17)
  set financialComparison(FinancialComparisonData value) =>
      $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasFinancialComparison() => $_has(16);
  @$pb.TagNumber(17)
  void clearFinancialComparison() => $_clearField(17);
  @$pb.TagNumber(17)
  FinancialComparisonData ensureFinancialComparison() => $_ensure(16);

  @$pb.TagNumber(18)
  InventoryComparisonData get inventoryComparison => $_getN(17);
  @$pb.TagNumber(18)
  set inventoryComparison(InventoryComparisonData value) =>
      $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasInventoryComparison() => $_has(17);
  @$pb.TagNumber(18)
  void clearInventoryComparison() => $_clearField(18);
  @$pb.TagNumber(18)
  InventoryComparisonData ensureInventoryComparison() => $_ensure(17);

  /// Top performers
  @$pb.TagNumber(19)
  $pb.PbList<BestSellingProduct> get topPerformingProducts => $_getList(18);

  @$pb.TagNumber(20)
  $pb.PbList<SupplierPerformanceSummary> get supplierPerformances =>
      $_getList(19);

  /// Stock aging
  @$pb.TagNumber(21)
  $pb.PbList<StockAgingItem> get stockAgingItems => $_getList(20);
}

class TrendDataPoint extends $pb.GeneratedMessage {
  factory TrendDataPoint({
    $0.Timestamp? date,
    $core.double? salesValue,
    $core.double? profitValue,
  }) {
    final result = create();
    if (date != null) result.date = date;
    if (salesValue != null) result.salesValue = salesValue;
    if (profitValue != null) result.profitValue = profitValue;
    return result;
  }

  TrendDataPoint._();

  factory TrendDataPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrendDataPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrendDataPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'reports.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'date',
        subBuilder: $0.Timestamp.create)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'salesValue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'profitValue', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrendDataPoint clone() => TrendDataPoint()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrendDataPoint copyWith(void Function(TrendDataPoint) updates) =>
      super.copyWith((message) => updates(message as TrendDataPoint))
          as TrendDataPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrendDataPoint create() => TrendDataPoint._();
  @$core.override
  TrendDataPoint createEmptyInstance() => create();
  static $pb.PbList<TrendDataPoint> createRepeated() =>
      $pb.PbList<TrendDataPoint>();
  @$core.pragma('dart2js:noInline')
  static TrendDataPoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrendDataPoint>(create);
  static TrendDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get date => $_getN(0);
  @$pb.TagNumber(1)
  set date($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get salesValue => $_getN(1);
  @$pb.TagNumber(2)
  set salesValue($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSalesValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearSalesValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get profitValue => $_getN(2);
  @$pb.TagNumber(3)
  set profitValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProfitValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfitValue() => $_clearField(3);
}

class ReportingServiceApi {
  final $pb.RpcClient _client;

  ReportingServiceApi(this._client);

  /// Sales report by period
  $async.Future<GetSalesReportResponse> getSalesReport(
          $pb.ClientContext? ctx, GetSalesReportRequest request) =>
      _client.invoke<GetSalesReportResponse>(ctx, 'ReportingService',
          'GetSalesReport', request, GetSalesReportResponse());

  /// Purchase report by period
  $async.Future<GetPurchaseReportResponse> getPurchaseReport(
          $pb.ClientContext? ctx, GetPurchaseReportRequest request) =>
      _client.invoke<GetPurchaseReportResponse>(ctx, 'ReportingService',
          'GetPurchaseReport', request, GetPurchaseReportResponse());

  /// Inventory movement report
  $async.Future<GetInventoryMovementReportResponse> getInventoryMovementReport(
          $pb.ClientContext? ctx, GetInventoryMovementReportRequest request) =>
      _client.invoke<GetInventoryMovementReportResponse>(
          ctx,
          'ReportingService',
          'GetInventoryMovementReport',
          request,
          GetInventoryMovementReportResponse());

  /// Best selling products
  $async.Future<GetBestSellingProductsResponse> getBestSellingProducts(
          $pb.ClientContext? ctx, GetBestSellingProductsRequest request) =>
      _client.invoke<GetBestSellingProductsResponse>(ctx, 'ReportingService',
          'GetBestSellingProducts', request, GetBestSellingProductsResponse());

  /// Store purchase history
  $async.Future<GetStorePurchaseHistoryResponse> getStorePurchaseHistory(
          $pb.ClientContext? ctx, GetStorePurchaseHistoryRequest request) =>
      _client.invoke<GetStorePurchaseHistoryResponse>(
          ctx,
          'ReportingService',
          'GetStorePurchaseHistory',
          request,
          GetStorePurchaseHistoryResponse());

  /// Supplier performance report
  $async.Future<GetSupplierPerformanceReportResponse>
      getSupplierPerformanceReport($pb.ClientContext? ctx,
              GetSupplierPerformanceReportRequest request) =>
          _client.invoke<GetSupplierPerformanceReportResponse>(
              ctx,
              'ReportingService',
              'GetSupplierPerformanceReport',
              request,
              GetSupplierPerformanceReportResponse());

  /// Profit & Loss report
  $async.Future<GetProfitLossReportResponse> getProfitLossReport(
          $pb.ClientContext? ctx, GetProfitLossReportRequest request) =>
      _client.invoke<GetProfitLossReportResponse>(ctx, 'ReportingService',
          'GetProfitLossReport', request, GetProfitLossReportResponse());

  /// Stock aging report
  $async.Future<GetStockAgingReportResponse> getStockAgingReport(
          $pb.ClientContext? ctx, GetStockAgingReportRequest request) =>
      _client.invoke<GetStockAgingReportResponse>(ctx, 'ReportingService',
          'GetStockAgingReport', request, GetStockAgingReportResponse());

  /// Comprehensive inventory report with aggregates
  $async.Future<GetInventoryReportResponse> getInventoryReport(
          $pb.ClientContext? ctx, GetInventoryReportRequest request) =>
      _client.invoke<GetInventoryReportResponse>(ctx, 'ReportingService',
          'GetInventoryReport', request, GetInventoryReportResponse());

  /// Full sales report including best sellers
  $async.Future<GetSalesReportFullResponse> getSalesReportFull(
          $pb.ClientContext? ctx, GetSalesReportRequest request) =>
      _client.invoke<GetSalesReportFullResponse>(ctx, 'ReportingService',
          'GetSalesReportFull', request, GetSalesReportFullResponse());

  /// Comprehensive financial report with purchases and balances
  $async.Future<GetFinancialReportResponse> getFinancialReport(
          $pb.ClientContext? ctx, GetFinancialReportRequest request) =>
      _client.invoke<GetFinancialReportResponse>(ctx, 'ReportingService',
          'GetFinancialReport', request, GetFinancialReportResponse());
}

/// Comprehensive dashboard data service for aggregated calculations
class DashboardReportingServiceApi {
  final $pb.RpcClient _client;

  DashboardReportingServiceApi(this._client);

  /// Get comprehensive dashboard data with all calculated fields
  $async.Future<GetDashboardReportResponse> getDashboardReport(
          $pb.ClientContext? ctx, GetDashboardReportRequest request) =>
      _client.invoke<GetDashboardReportResponse>(
          ctx,
          'DashboardReportingService',
          'GetDashboardReport',
          request,
          GetDashboardReportResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
