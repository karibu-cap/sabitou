import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/user_preference.dart';
import '../utils/utils.dart';

/// Repository for bill management.
final class BillRepository extends BaseRepository<Bill> {
  final _logger = LoggerApp('BillRepository');

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.bills;

  @override
  String get primaryKey => BillsFields.refId;

  @override
  Bill fromRow(RawRow row) => fromRowToBill(row);

  @override
  RawRow toRow(Bill entity) => fromBillToRaw(entity);

  /// The instance of [BillRepository].
  static BillRepository get instance => GetIt.I.get<BillRepository>();

  /// Constructs a new [BillRepository].
  BillRepository({required this.dataSource});

  /// Lists all bills for the given [storeId], optionally filtered by [purchaseOrderId].
  Future<List<Bill>> listBills({
    required String storeId,
    String? purchaseOrderId,
  }) async {
    try {
      return await findWhere([
        SqlQuery.equals(BillsFields.storeId, storeId),
        if (purchaseOrderId != null)
          SqlQuery.equals(BillsFields.relatedPurchaseOrderId, purchaseOrderId),
      ]);
    } on Exception catch (e) {
      _logger.severe('listBills Error: $e');

      return [];
    }
  }

  /// Gets a single bill by [billId].
  Future<Bill?> getBill(String billId) async {
    try {
      final results = await findWhere(limit: 1, [
        SqlQuery.equals(BillsFields.refId, billId),
      ]);

      return results.isNotEmpty ? results.first : null;
    } on Exception catch (e) {
      _logger.severe('getBill Error: $e');

      return null;
    }
  }

  /// Creates a new bill.
  Future<bool> createBill(Bill bill) async {
    try {
      bill.refId = AppUtils.generateSmartDatabaseId('BILL');

      await create(bill);

      return true;
    } on Exception catch (e) {
      _logger.severe('createBill Error: $e');

      return false;
    }
  }

  /// Creates a new bill from a [PurchaseOrder].
  /// Freezes amounts from the PO and sets status to OPEN.
  Future<Bill?> createBillFromPurchaseOrder({
    required PurchaseOrder purchaseOrder,
    required DateTime dueDate,
    String? notes,
  }) async {
    try {
      if (UserPreferences.instance.store == null) return null;

      final now = DateTime.now();
      final billId = AppUtils.generateSmartDatabaseId('BILL');

      final bill = Bill(
        refId: billId,
        relatedPurchaseOrderId: purchaseOrder.refId,
        supplierId: purchaseOrder.supplierId,
        storeId: purchaseOrder.storeId,
        status: BillStatus.BILL_STATUS_OPEN,
        billDate: Timestamp.fromDateTime(now),
        dueDate: Timestamp.fromDateTime(dueDate),
        subTotal: purchaseOrder.subTotal,
        taxTotal: purchaseOrder.taxTotal,
        totalAmount: purchaseOrder.totalAmount,
        balanceDue: purchaseOrder.totalAmount,
        currency: purchaseOrder.hasCurrency() ? purchaseOrder.currency : 'XAF',
        notes: notes,
        createdAt: Timestamp.fromDateTime(now),
        items: purchaseOrder.items
            .map(
              (item) => BillLineItem(
                productId: item.productId,
                description: item.productId, // no display name on PO item
                quantity: item.quantityOrdered.toInt(),
                unitPrice: item.unitPrice,
                taxAmount: item.taxAmount,
                total: item.total,
              ),
            )
            .toList(),
      );

      final raw = fromBillToRaw(bill);
      await dataSource.createRecord(
        table: CollectionName.bills,
        record: {...raw, 'id': billId},
      );

      // Save bill line items
      for (final lineItem in bill.items) {
        final lineRaw = fromBillLineItemToRaw(lineItem, billId);
        await dataSource.createRecord(
          table: CollectionName.billLineItems,
          record: {...lineRaw, 'id': AppUtils.generateSmartDatabaseId('BILI')},
        );
      }

      _logger.info('Bill created: $billId for PO ${purchaseOrder.refId}');

      return bill;
    } on Exception catch (e) {
      _logger.severe('createBillFromPurchaseOrder Error: $e');

      return null;
    }
  }

  /// Updates the status of a bill.
  Future<bool> updateBillStatus(String billId, BillStatus status) async {
    try {
      await dataSource.updateWhere(
        table: CollectionName.bills,
        fields: {BillsFields.status: status.name},
        filters: [SqlQuery.equals(BillsFields.refId, billId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateBillStatus Error: $e');

      return false;
    }
  }

  /// Deletes a bill by [billId].
  Future<bool> deleteBill(String billId) async {
    try {
      await dataSource.deleteWhere(
        table: CollectionName.bills,
        filters: [SqlQuery.equals(BillsFields.refId, billId)],
      );

      // Also delete line items
      await dataSource.deleteWhere(
        table: CollectionName.billLineItems,
        filters: [SqlQuery.equals(BillLineItemsFields.billId, billId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('deleteBill Error: $e');

      return false;
    }
  }

  /// Watches bills for the given [storeId], optionally filtered by [purchaseOrderId].
  Stream<List<Bill>> watchBills({
    required String storeId,
    String? purchaseOrderId,
  }) {
    return watchWhere([
      SqlQuery.equals(BillsFields.storeId, storeId),
      if (purchaseOrderId != null)
        SqlQuery.equals(BillsFields.relatedPurchaseOrderId, purchaseOrderId),
    ]);
  }
}
