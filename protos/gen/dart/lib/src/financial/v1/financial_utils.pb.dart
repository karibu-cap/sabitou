// This is a generated file - do not edit.
//
// Generated from financial/v1/financial_utils.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../inventory/v1/category.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
///  InvoiceLineItem represents one product on an invoice.
///
///  Fix: Added optional batch_id for lot traceability in accounting.
class InvoiceLineItem extends $pb.GeneratedMessage {
  factory InvoiceLineItem({
    $core.String? productId,
    $core.double? quantity,
    $fixnum.Int64? unitPrice,
    $fixnum.Int64? subtotal,
    $core.double? taxRate,
    $fixnum.Int64? taxAmount,
    $fixnum.Int64? total,
    $core.String? batchId,
    $0.Internationalized? productName,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (quantity != null) result.quantity = quantity;
    if (unitPrice != null) result.unitPrice = unitPrice;
    if (subtotal != null) result.subtotal = subtotal;
    if (taxRate != null) result.taxRate = taxRate;
    if (taxAmount != null) result.taxAmount = taxAmount;
    if (total != null) result.total = total;
    if (batchId != null) result.batchId = batchId;
    if (productName != null) result.productName = productName;
    return result;
  }

  InvoiceLineItem._();

  factory InvoiceLineItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InvoiceLineItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvoiceLineItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'financial.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.OD)
    ..aInt64(3, _omitFieldNames ? '' : 'unitPrice')
    ..aInt64(4, _omitFieldNames ? '' : 'subtotal')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'taxRate', $pb.PbFieldType.OD)
    ..aInt64(6, _omitFieldNames ? '' : 'taxAmount')
    ..aInt64(7, _omitFieldNames ? '' : 'total')
    ..aOS(8, _omitFieldNames ? '' : 'batchId')
    ..aOM<$0.Internationalized>(9, _omitFieldNames ? '' : 'productName',
        subBuilder: $0.Internationalized.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceLineItem clone() => InvoiceLineItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceLineItem copyWith(void Function(InvoiceLineItem) updates) =>
      super.copyWith((message) => updates(message as InvoiceLineItem))
          as InvoiceLineItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvoiceLineItem create() => InvoiceLineItem._();
  @$core.override
  InvoiceLineItem createEmptyInstance() => create();
  static $pb.PbList<InvoiceLineItem> createRepeated() =>
      $pb.PbList<InvoiceLineItem>();
  @$core.pragma('dart2js:noInline')
  static InvoiceLineItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvoiceLineItem>(create);
  static InvoiceLineItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get quantity => $_getN(1);
  @$pb.TagNumber(2)
  set quantity($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get unitPrice => $_getI64(2);
  @$pb.TagNumber(3)
  set unitPrice($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnitPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnitPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get subtotal => $_getI64(3);
  @$pb.TagNumber(4)
  set subtotal($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSubtotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubtotal() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get taxRate => $_getN(4);
  @$pb.TagNumber(5)
  set taxRate($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTaxRate() => $_has(4);
  @$pb.TagNumber(5)
  void clearTaxRate() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get taxAmount => $_getI64(5);
  @$pb.TagNumber(6)
  set taxAmount($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTaxAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearTaxAmount() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get total => $_getI64(6);
  @$pb.TagNumber(7)
  set total($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotal() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotal() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get batchId => $_getSZ(7);
  @$pb.TagNumber(8)
  set batchId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBatchId() => $_has(7);
  @$pb.TagNumber(8)
  void clearBatchId() => $_clearField(8);

  @$pb.TagNumber(9)
  $0.Internationalized get productName => $_getN(8);
  @$pb.TagNumber(9)
  set productName($0.Internationalized value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasProductName() => $_has(8);
  @$pb.TagNumber(9)
  void clearProductName() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Internationalized ensureProductName() => $_ensure(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
