// This is a generated file - do not edit.
//
// Generated from identity/v1/permission.proto.

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

/// / ----- PRODUCT ----- ///
class StoreProductPermission extends $pb.GeneratedMessage {
  factory StoreProductPermission({
    $core.bool? readProductInInventory,
    $core.bool? createProductInInventory,
    $core.bool? updateProductInInventory,
    $core.bool? deleteProductInInventory,
  }) {
    final result = create();
    if (readProductInInventory != null)
      result.readProductInInventory = readProductInInventory;
    if (createProductInInventory != null)
      result.createProductInInventory = createProductInInventory;
    if (updateProductInInventory != null)
      result.updateProductInInventory = updateProductInInventory;
    if (deleteProductInInventory != null)
      result.deleteProductInInventory = deleteProductInInventory;
    return result;
  }

  StoreProductPermission._();

  factory StoreProductPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreProductPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreProductPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'readProductInInventory')
    ..aOB(2, _omitFieldNames ? '' : 'createProductInInventory')
    ..aOB(3, _omitFieldNames ? '' : 'updateProductInInventory')
    ..aOB(4, _omitFieldNames ? '' : 'deleteProductInInventory')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreProductPermission clone() =>
      StoreProductPermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreProductPermission copyWith(
          void Function(StoreProductPermission) updates) =>
      super.copyWith((message) => updates(message as StoreProductPermission))
          as StoreProductPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreProductPermission create() => StoreProductPermission._();
  @$core.override
  StoreProductPermission createEmptyInstance() => create();
  static $pb.PbList<StoreProductPermission> createRepeated() =>
      $pb.PbList<StoreProductPermission>();
  @$core.pragma('dart2js:noInline')
  static StoreProductPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreProductPermission>(create);
  static StoreProductPermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get readProductInInventory => $_getBF(0);
  @$pb.TagNumber(1)
  set readProductInInventory($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReadProductInInventory() => $_has(0);
  @$pb.TagNumber(1)
  void clearReadProductInInventory() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get createProductInInventory => $_getBF(1);
  @$pb.TagNumber(2)
  set createProductInInventory($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreateProductInInventory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateProductInInventory() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get updateProductInInventory => $_getBF(2);
  @$pb.TagNumber(3)
  set updateProductInInventory($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateProductInInventory() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateProductInInventory() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get deleteProductInInventory => $_getBF(3);
  @$pb.TagNumber(4)
  set deleteProductInInventory($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeleteProductInInventory() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeleteProductInInventory() => $_clearField(4);
}

/// / ----- MEMBER ----- ///
class StoreMemberPermission extends $pb.GeneratedMessage {
  factory StoreMemberPermission({
    $core.bool? readInformation,
    $core.bool? inviteMember,
    $core.bool? updateMember,
    $core.bool? deleteMember,
  }) {
    final result = create();
    if (readInformation != null) result.readInformation = readInformation;
    if (inviteMember != null) result.inviteMember = inviteMember;
    if (updateMember != null) result.updateMember = updateMember;
    if (deleteMember != null) result.deleteMember = deleteMember;
    return result;
  }

  StoreMemberPermission._();

  factory StoreMemberPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreMemberPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreMemberPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'readInformation')
    ..aOB(2, _omitFieldNames ? '' : 'inviteMember')
    ..aOB(3, _omitFieldNames ? '' : 'updateMember')
    ..aOB(4, _omitFieldNames ? '' : 'deleteMember')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreMemberPermission clone() =>
      StoreMemberPermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreMemberPermission copyWith(
          void Function(StoreMemberPermission) updates) =>
      super.copyWith((message) => updates(message as StoreMemberPermission))
          as StoreMemberPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreMemberPermission create() => StoreMemberPermission._();
  @$core.override
  StoreMemberPermission createEmptyInstance() => create();
  static $pb.PbList<StoreMemberPermission> createRepeated() =>
      $pb.PbList<StoreMemberPermission>();
  @$core.pragma('dart2js:noInline')
  static StoreMemberPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreMemberPermission>(create);
  static StoreMemberPermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get readInformation => $_getBF(0);
  @$pb.TagNumber(1)
  set readInformation($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReadInformation() => $_has(0);
  @$pb.TagNumber(1)
  void clearReadInformation() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get inviteMember => $_getBF(1);
  @$pb.TagNumber(2)
  set inviteMember($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInviteMember() => $_has(1);
  @$pb.TagNumber(2)
  void clearInviteMember() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get updateMember => $_getBF(2);
  @$pb.TagNumber(3)
  set updateMember($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateMember() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateMember() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get deleteMember => $_getBF(3);
  @$pb.TagNumber(4)
  set deleteMember($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeleteMember() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeleteMember() => $_clearField(4);
}

/// / ----- REPORT ----- ///
class StoreReportPermission extends $pb.GeneratedMessage {
  factory StoreReportPermission({
    $core.bool? readReport,
  }) {
    final result = create();
    if (readReport != null) result.readReport = readReport;
    return result;
  }

  StoreReportPermission._();

  factory StoreReportPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreReportPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreReportPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'readReport')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreReportPermission clone() =>
      StoreReportPermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreReportPermission copyWith(
          void Function(StoreReportPermission) updates) =>
      super.copyWith((message) => updates(message as StoreReportPermission))
          as StoreReportPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreReportPermission create() => StoreReportPermission._();
  @$core.override
  StoreReportPermission createEmptyInstance() => create();
  static $pb.PbList<StoreReportPermission> createRepeated() =>
      $pb.PbList<StoreReportPermission>();
  @$core.pragma('dart2js:noInline')
  static StoreReportPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreReportPermission>(create);
  static StoreReportPermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get readReport => $_getBF(0);
  @$pb.TagNumber(1)
  set readReport($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReadReport() => $_has(0);
  @$pb.TagNumber(1)
  void clearReadReport() => $_clearField(1);
}

/// / ----- ORDER ----- ///
class StoreOrderPermission extends $pb.GeneratedMessage {
  factory StoreOrderPermission({
    $core.bool? readOrder,
    $core.bool? createOrder,
  }) {
    final result = create();
    if (readOrder != null) result.readOrder = readOrder;
    if (createOrder != null) result.createOrder = createOrder;
    return result;
  }

  StoreOrderPermission._();

  factory StoreOrderPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreOrderPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreOrderPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'readOrder')
    ..aOB(2, _omitFieldNames ? '' : 'createOrder')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreOrderPermission clone() =>
      StoreOrderPermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreOrderPermission copyWith(void Function(StoreOrderPermission) updates) =>
      super.copyWith((message) => updates(message as StoreOrderPermission))
          as StoreOrderPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreOrderPermission create() => StoreOrderPermission._();
  @$core.override
  StoreOrderPermission createEmptyInstance() => create();
  static $pb.PbList<StoreOrderPermission> createRepeated() =>
      $pb.PbList<StoreOrderPermission>();
  @$core.pragma('dart2js:noInline')
  static StoreOrderPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreOrderPermission>(create);
  static StoreOrderPermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get readOrder => $_getBF(0);
  @$pb.TagNumber(1)
  set readOrder($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReadOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearReadOrder() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get createOrder => $_getBF(1);
  @$pb.TagNumber(2)
  set createOrder($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreateOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateOrder() => $_clearField(2);
}

/// / ----- INVOICE ----- ///
class StoreInvoicePermission extends $pb.GeneratedMessage {
  factory StoreInvoicePermission({
    $core.bool? readInvoice,
    $core.bool? createInvoice,
  }) {
    final result = create();
    if (readInvoice != null) result.readInvoice = readInvoice;
    if (createInvoice != null) result.createInvoice = createInvoice;
    return result;
  }

  StoreInvoicePermission._();

  factory StoreInvoicePermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreInvoicePermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreInvoicePermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'readInvoice')
    ..aOB(2, _omitFieldNames ? '' : 'createInvoice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreInvoicePermission clone() =>
      StoreInvoicePermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreInvoicePermission copyWith(
          void Function(StoreInvoicePermission) updates) =>
      super.copyWith((message) => updates(message as StoreInvoicePermission))
          as StoreInvoicePermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreInvoicePermission create() => StoreInvoicePermission._();
  @$core.override
  StoreInvoicePermission createEmptyInstance() => create();
  static $pb.PbList<StoreInvoicePermission> createRepeated() =>
      $pb.PbList<StoreInvoicePermission>();
  @$core.pragma('dart2js:noInline')
  static StoreInvoicePermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreInvoicePermission>(create);
  static StoreInvoicePermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get readInvoice => $_getBF(0);
  @$pb.TagNumber(1)
  set readInvoice($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReadInvoice() => $_has(0);
  @$pb.TagNumber(1)
  void clearReadInvoice() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get createInvoice => $_getBF(1);
  @$pb.TagNumber(2)
  set createInvoice($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreateInvoice() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateInvoice() => $_clearField(2);
}

/// / ----- SUPPLIER ----- ///
class StoreSupplierPermission extends $pb.GeneratedMessage {
  factory StoreSupplierPermission({
    $core.bool? readSupplier,
    $core.bool? createSupplier,
    $core.bool? updateSupplier,
    $core.bool? deleteSupplier,
  }) {
    final result = create();
    if (readSupplier != null) result.readSupplier = readSupplier;
    if (createSupplier != null) result.createSupplier = createSupplier;
    if (updateSupplier != null) result.updateSupplier = updateSupplier;
    if (deleteSupplier != null) result.deleteSupplier = deleteSupplier;
    return result;
  }

  StoreSupplierPermission._();

  factory StoreSupplierPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreSupplierPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreSupplierPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'readSupplier')
    ..aOB(2, _omitFieldNames ? '' : 'createSupplier')
    ..aOB(3, _omitFieldNames ? '' : 'updateSupplier')
    ..aOB(4, _omitFieldNames ? '' : 'deleteSupplier')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreSupplierPermission clone() =>
      StoreSupplierPermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreSupplierPermission copyWith(
          void Function(StoreSupplierPermission) updates) =>
      super.copyWith((message) => updates(message as StoreSupplierPermission))
          as StoreSupplierPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreSupplierPermission create() => StoreSupplierPermission._();
  @$core.override
  StoreSupplierPermission createEmptyInstance() => create();
  static $pb.PbList<StoreSupplierPermission> createRepeated() =>
      $pb.PbList<StoreSupplierPermission>();
  @$core.pragma('dart2js:noInline')
  static StoreSupplierPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreSupplierPermission>(create);
  static StoreSupplierPermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get readSupplier => $_getBF(0);
  @$pb.TagNumber(1)
  set readSupplier($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReadSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearReadSupplier() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get createSupplier => $_getBF(1);
  @$pb.TagNumber(2)
  set createSupplier($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreateSupplier() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateSupplier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get updateSupplier => $_getBF(2);
  @$pb.TagNumber(3)
  set updateSupplier($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateSupplier() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateSupplier() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get deleteSupplier => $_getBF(3);
  @$pb.TagNumber(4)
  set deleteSupplier($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeleteSupplier() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeleteSupplier() => $_clearField(4);
}

/// / ----- TRANSACTION ----- ///
class StoreTransactionPermission extends $pb.GeneratedMessage {
  factory StoreTransactionPermission({
    $core.bool? readTransaction,
    $core.bool? createTransaction,
    $core.bool? updateTransaction,
  }) {
    final result = create();
    if (readTransaction != null) result.readTransaction = readTransaction;
    if (createTransaction != null) result.createTransaction = createTransaction;
    if (updateTransaction != null) result.updateTransaction = updateTransaction;
    return result;
  }

  StoreTransactionPermission._();

  factory StoreTransactionPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreTransactionPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreTransactionPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'readTransaction')
    ..aOB(2, _omitFieldNames ? '' : 'createTransaction')
    ..aOB(3, _omitFieldNames ? '' : 'updateTransaction')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreTransactionPermission clone() =>
      StoreTransactionPermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreTransactionPermission copyWith(
          void Function(StoreTransactionPermission) updates) =>
      super.copyWith(
              (message) => updates(message as StoreTransactionPermission))
          as StoreTransactionPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreTransactionPermission create() => StoreTransactionPermission._();
  @$core.override
  StoreTransactionPermission createEmptyInstance() => create();
  static $pb.PbList<StoreTransactionPermission> createRepeated() =>
      $pb.PbList<StoreTransactionPermission>();
  @$core.pragma('dart2js:noInline')
  static StoreTransactionPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreTransactionPermission>(create);
  static StoreTransactionPermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get readTransaction => $_getBF(0);
  @$pb.TagNumber(1)
  set readTransaction($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReadTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearReadTransaction() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get createTransaction => $_getBF(1);
  @$pb.TagNumber(2)
  set createTransaction($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreateTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateTransaction() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get updateTransaction => $_getBF(2);
  @$pb.TagNumber(3)
  set updateTransaction($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateTransaction() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateTransaction() => $_clearField(3);
}

/// / ----- STORE PERMISSIONS (AGGREGATOR) ----- ///
class StorePermissions extends $pb.GeneratedMessage {
  factory StorePermissions({
    StoreProductPermission? product,
    StoreMemberPermission? member,
    StoreReportPermission? report,
    StoreOrderPermission? order,
    StoreInvoicePermission? invoice,
    StoreSupplierPermission? supplier,
    StoreTransactionPermission? transaction,
  }) {
    final result = create();
    if (product != null) result.product = product;
    if (member != null) result.member = member;
    if (report != null) result.report = report;
    if (order != null) result.order = order;
    if (invoice != null) result.invoice = invoice;
    if (supplier != null) result.supplier = supplier;
    if (transaction != null) result.transaction = transaction;
    return result;
  }

  StorePermissions._();

  factory StorePermissions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StorePermissions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StorePermissions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<StoreProductPermission>(1, _omitFieldNames ? '' : 'product',
        subBuilder: StoreProductPermission.create)
    ..aOM<StoreMemberPermission>(2, _omitFieldNames ? '' : 'member',
        subBuilder: StoreMemberPermission.create)
    ..aOM<StoreReportPermission>(3, _omitFieldNames ? '' : 'report',
        subBuilder: StoreReportPermission.create)
    ..aOM<StoreOrderPermission>(4, _omitFieldNames ? '' : 'order',
        subBuilder: StoreOrderPermission.create)
    ..aOM<StoreInvoicePermission>(5, _omitFieldNames ? '' : 'invoice',
        subBuilder: StoreInvoicePermission.create)
    ..aOM<StoreSupplierPermission>(6, _omitFieldNames ? '' : 'supplier',
        subBuilder: StoreSupplierPermission.create)
    ..aOM<StoreTransactionPermission>(7, _omitFieldNames ? '' : 'transaction',
        subBuilder: StoreTransactionPermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePermissions clone() => StorePermissions()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePermissions copyWith(void Function(StorePermissions) updates) =>
      super.copyWith((message) => updates(message as StorePermissions))
          as StorePermissions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StorePermissions create() => StorePermissions._();
  @$core.override
  StorePermissions createEmptyInstance() => create();
  static $pb.PbList<StorePermissions> createRepeated() =>
      $pb.PbList<StorePermissions>();
  @$core.pragma('dart2js:noInline')
  static StorePermissions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StorePermissions>(create);
  static StorePermissions? _defaultInstance;

  @$pb.TagNumber(1)
  StoreProductPermission get product => $_getN(0);
  @$pb.TagNumber(1)
  set product(StoreProductPermission value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  StoreProductPermission ensureProduct() => $_ensure(0);

  @$pb.TagNumber(2)
  StoreMemberPermission get member => $_getN(1);
  @$pb.TagNumber(2)
  set member(StoreMemberPermission value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMember() => $_has(1);
  @$pb.TagNumber(2)
  void clearMember() => $_clearField(2);
  @$pb.TagNumber(2)
  StoreMemberPermission ensureMember() => $_ensure(1);

  @$pb.TagNumber(3)
  StoreReportPermission get report => $_getN(2);
  @$pb.TagNumber(3)
  set report(StoreReportPermission value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasReport() => $_has(2);
  @$pb.TagNumber(3)
  void clearReport() => $_clearField(3);
  @$pb.TagNumber(3)
  StoreReportPermission ensureReport() => $_ensure(2);

  @$pb.TagNumber(4)
  StoreOrderPermission get order => $_getN(3);
  @$pb.TagNumber(4)
  set order(StoreOrderPermission value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrder() => $_clearField(4);
  @$pb.TagNumber(4)
  StoreOrderPermission ensureOrder() => $_ensure(3);

  @$pb.TagNumber(5)
  StoreInvoicePermission get invoice => $_getN(4);
  @$pb.TagNumber(5)
  set invoice(StoreInvoicePermission value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasInvoice() => $_has(4);
  @$pb.TagNumber(5)
  void clearInvoice() => $_clearField(5);
  @$pb.TagNumber(5)
  StoreInvoicePermission ensureInvoice() => $_ensure(4);

  @$pb.TagNumber(6)
  StoreSupplierPermission get supplier => $_getN(5);
  @$pb.TagNumber(6)
  set supplier(StoreSupplierPermission value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSupplier() => $_has(5);
  @$pb.TagNumber(6)
  void clearSupplier() => $_clearField(6);
  @$pb.TagNumber(6)
  StoreSupplierPermission ensureSupplier() => $_ensure(5);

  @$pb.TagNumber(7)
  StoreTransactionPermission get transaction => $_getN(6);
  @$pb.TagNumber(7)
  set transaction(StoreTransactionPermission value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTransaction() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransaction() => $_clearField(7);
  @$pb.TagNumber(7)
  StoreTransactionPermission ensureTransaction() => $_ensure(6);
}

class CreateStorePermissionRequest extends $pb.GeneratedMessage {
  factory CreateStorePermissionRequest({
    StorePermissions? permissions,
    $core.String? storeId,
  }) {
    final result = create();
    if (permissions != null) result.permissions = permissions;
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  CreateStorePermissionRequest._();

  factory CreateStorePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStorePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStorePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<StorePermissions>(1, _omitFieldNames ? '' : 'permissions',
        subBuilder: StorePermissions.create)
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStorePermissionRequest clone() =>
      CreateStorePermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStorePermissionRequest copyWith(
          void Function(CreateStorePermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateStorePermissionRequest))
          as CreateStorePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStorePermissionRequest create() =>
      CreateStorePermissionRequest._();
  @$core.override
  CreateStorePermissionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateStorePermissionRequest> createRepeated() =>
      $pb.PbList<CreateStorePermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateStorePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStorePermissionRequest>(create);
  static CreateStorePermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  StorePermissions get permissions => $_getN(0);
  @$pb.TagNumber(1)
  set permissions(StorePermissions value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPermissions() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissions() => $_clearField(1);
  @$pb.TagNumber(1)
  StorePermissions ensurePermissions() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);
}

class UpdateStorePermissionRequest extends $pb.GeneratedMessage {
  factory UpdateStorePermissionRequest({
    StorePermissions? permissions,
    $core.String? storePermissionId,
  }) {
    final result = create();
    if (permissions != null) result.permissions = permissions;
    if (storePermissionId != null) result.storePermissionId = storePermissionId;
    return result;
  }

  UpdateStorePermissionRequest._();

  factory UpdateStorePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStorePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStorePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<StorePermissions>(1, _omitFieldNames ? '' : 'permissions',
        subBuilder: StorePermissions.create)
    ..aOS(2, _omitFieldNames ? '' : 'storePermissionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStorePermissionRequest clone() =>
      UpdateStorePermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStorePermissionRequest copyWith(
          void Function(UpdateStorePermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateStorePermissionRequest))
          as UpdateStorePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStorePermissionRequest create() =>
      UpdateStorePermissionRequest._();
  @$core.override
  UpdateStorePermissionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStorePermissionRequest> createRepeated() =>
      $pb.PbList<UpdateStorePermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStorePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStorePermissionRequest>(create);
  static UpdateStorePermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  StorePermissions get permissions => $_getN(0);
  @$pb.TagNumber(1)
  set permissions(StorePermissions value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPermissions() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissions() => $_clearField(1);
  @$pb.TagNumber(1)
  StorePermissions ensurePermissions() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get storePermissionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storePermissionId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStorePermissionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStorePermissionId() => $_clearField(2);
}

class DeleteStorePermissionRequest extends $pb.GeneratedMessage {
  factory DeleteStorePermissionRequest({
    $core.String? storePermissionId,
  }) {
    final result = create();
    if (storePermissionId != null) result.storePermissionId = storePermissionId;
    return result;
  }

  DeleteStorePermissionRequest._();

  factory DeleteStorePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStorePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStorePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storePermissionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStorePermissionRequest clone() =>
      DeleteStorePermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStorePermissionRequest copyWith(
          void Function(DeleteStorePermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteStorePermissionRequest))
          as DeleteStorePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStorePermissionRequest create() =>
      DeleteStorePermissionRequest._();
  @$core.override
  DeleteStorePermissionRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteStorePermissionRequest> createRepeated() =>
      $pb.PbList<DeleteStorePermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteStorePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStorePermissionRequest>(create);
  static DeleteStorePermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storePermissionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storePermissionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStorePermissionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStorePermissionId() => $_clearField(1);
}

class CheckStorePermissionRequest extends $pb.GeneratedMessage {
  factory CheckStorePermissionRequest({
    $core.String? userId,
    $core.String? storeId,
    $core.String? permissionField,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    if (permissionField != null) result.permissionField = permissionField;
    return result;
  }

  CheckStorePermissionRequest._();

  factory CheckStorePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckStorePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckStorePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOS(3, _omitFieldNames ? '' : 'permissionField')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckStorePermissionRequest clone() =>
      CheckStorePermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckStorePermissionRequest copyWith(
          void Function(CheckStorePermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CheckStorePermissionRequest))
          as CheckStorePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckStorePermissionRequest create() =>
      CheckStorePermissionRequest._();
  @$core.override
  CheckStorePermissionRequest createEmptyInstance() => create();
  static $pb.PbList<CheckStorePermissionRequest> createRepeated() =>
      $pb.PbList<CheckStorePermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckStorePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckStorePermissionRequest>(create);
  static CheckStorePermissionRequest? _defaultInstance;

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

  /// Example: "product.create_product_in_inventory"
  @$pb.TagNumber(3)
  $core.String get permissionField => $_getSZ(2);
  @$pb.TagNumber(3)
  set permissionField($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPermissionField() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissionField() => $_clearField(3);
}

class SuccessResponse extends $pb.GeneratedMessage {
  factory SuccessResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  SuccessResponse._();

  factory SuccessResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SuccessResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SuccessResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuccessResponse clone() => SuccessResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuccessResponse copyWith(void Function(SuccessResponse) updates) =>
      super.copyWith((message) => updates(message as SuccessResponse))
          as SuccessResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SuccessResponse create() => SuccessResponse._();
  @$core.override
  SuccessResponse createEmptyInstance() => create();
  static $pb.PbList<SuccessResponse> createRepeated() =>
      $pb.PbList<SuccessResponse>();
  @$core.pragma('dart2js:noInline')
  static SuccessResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuccessResponse>(create);
  static SuccessResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class CheckStorePermissionResponse extends $pb.GeneratedMessage {
  factory CheckStorePermissionResponse({
    $core.bool? hasPermission,
  }) {
    final result = create();
    if (hasPermission != null) result.hasPermission = hasPermission;
    return result;
  }

  CheckStorePermissionResponse._();

  factory CheckStorePermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckStorePermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckStorePermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasPermission')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckStorePermissionResponse clone() =>
      CheckStorePermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckStorePermissionResponse copyWith(
          void Function(CheckStorePermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CheckStorePermissionResponse))
          as CheckStorePermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckStorePermissionResponse create() =>
      CheckStorePermissionResponse._();
  @$core.override
  CheckStorePermissionResponse createEmptyInstance() => create();
  static $pb.PbList<CheckStorePermissionResponse> createRepeated() =>
      $pb.PbList<CheckStorePermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckStorePermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckStorePermissionResponse>(create);
  static CheckStorePermissionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasPermission => $_getBF(0);
  @$pb.TagNumber(1)
  set hasPermission($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasPermission() => $_clearField(1);
}

class PermissionServiceApi {
  final $pb.RpcClient _client;

  PermissionServiceApi(this._client);

  /// Create store permission
  $async.Future<SuccessResponse> createStorePermission(
          $pb.ClientContext? ctx, CreateStorePermissionRequest request) =>
      _client.invoke<SuccessResponse>(ctx, 'PermissionService',
          'CreateStorePermission', request, SuccessResponse());

  /// Update store permission
  $async.Future<SuccessResponse> updateStorePermission(
          $pb.ClientContext? ctx, UpdateStorePermissionRequest request) =>
      _client.invoke<SuccessResponse>(ctx, 'PermissionService',
          'UpdateStorePermission', request, SuccessResponse());

  /// Delete store permission
  $async.Future<SuccessResponse> deleteStorePermission(
          $pb.ClientContext? ctx, DeleteStorePermissionRequest request) =>
      _client.invoke<SuccessResponse>(ctx, 'PermissionService',
          'DeleteStorePermission', request, SuccessResponse());

  /// Check if a user has a store permission
  $async.Future<CheckStorePermissionResponse> checkStorePermission(
          $pb.ClientContext? ctx, CheckStorePermissionRequest request) =>
      _client.invoke<CheckStorePermissionResponse>(ctx, 'PermissionService',
          'CheckStorePermission', request, CheckStorePermissionResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
