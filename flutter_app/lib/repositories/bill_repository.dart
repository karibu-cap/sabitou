import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/utils.dart';
import 'purchase_order_repository.dart';

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
      final result =  await findWhere([
        SqlQuery.equals(BillsFields.storeId, storeId),
        if (purchaseOrderId != null)
          SqlQuery.equals(BillsFields.relatedPurchaseOrderId, purchaseOrderId),
      ]);

       for (final item in result) {
        final result = await findItemsByBillId(item.refId, item.storeId);
        item.items.clear();
        item.items.addAll(result);
        
      }

      return result;
      
    } on Exception catch (e) {
      _logger.severe('listBills Error: $e');

      return [];
    }
  }

  /// Gets a single bill by [billId].
  Future<Bill?> getBill(String billId) async {
    try {
      final results = await findById(billId);
      final items = await findItemsByBillId(billId, results?.storeId ?? '');

      return results?..items.addAll(items);
    } on Exception catch (e) {
      _logger.severe('getBill Error: $e');

      return null;
    }
  }

  /// Watches a single bill by [billId] with its line items.
  Stream<Bill?> watchBill(String billId) {
    try {
      // Watch both the bill and its items, then combine them
      final billStream = watchOne(billId);
      final itemsStream = dataSource.watchCollection(
        CollectionName.billLineItems,
        filters: [SqlQuery.equals(BillLineItemsFields.billId, billId)],
      );
      
      return Rx.combineLatest2(
        billStream,
        itemsStream,
        (bill, itemsRows) async {
          if (bill == null) return null;
          final items = itemsRows.map(fromRowToBillLineItem).toList();
          bill.items.clear();
          bill.items.addAll(items);

          return bill;
        },
      ).asyncMap((future) => future);
    } on Exception catch (e) {
      _logger.severe('watchBill Error: $e');

      return Stream.value(null);
    }
  }

  /// Creates a new bill.
  Future<bool> createBill(Bill bill) async {
    try {
      bill.refId = AppUtils.generateSmartDatabaseId('BILL');

      await create(bill);

      for (final lineItem in bill.items) {
        final lineRaw = fromBillLineItemToRaw(
          lineItem,
          bill.refId,
          bill.storeId,
        );
        await dataSource.createRecord(
          table: CollectionName.billLineItems,
          record: {...lineRaw},
        );
      }

      await PurchaseOrderRepository.instance.syncPOStatusFromBills(
        purchaseOrderId: bill.relatedPurchaseOrderId,
        storeId: bill.storeId,
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('createBill Error: $e');

      return false;
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

  /// Update the bill.
  Future<bool> updateBill(Bill bill) async {
    try {
      final items = bill.items;
      await dataSource.setRecords(
        table: CollectionName.billLineItems,
        records: items
            .asMap()
            .entries
            .map(
              (e) => fromBillLineItemToRaw(e.value, bill.refId, bill.storeId),
            )
            .toList(),
      );

      await updateWhere(
        fields: fromBillToRaw(bill),
        filters: [SqlQuery.equals(BillsFields.refId, bill.refId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateBill Error: $e');

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
    final result = watchWhere([
      SqlQuery.equals(BillsFields.storeId, storeId),
      if (purchaseOrderId != null)
        SqlQuery.equals(BillsFields.relatedPurchaseOrderId, purchaseOrderId),
    ]);

    return result.asyncMap((po) async {
      for (final item in po) {
        final result = await findItemsByBillId(item.refId, item.storeId);
        item.items.clear();
        item.items.addAll(result);
        
      }
      
      return po;
    });
  }

  /// Returns all line items for the given purchase order.
  Future<List<BillLineItem>> findItemsByBillId(
    String billId,
    String storeId,
  ) async {
    try {
      final result = await dataSource.getCollection(
        CollectionName.billLineItems,
        filters: [
          SqlQuery.equals(BillLineItemsFields.billId, billId),
          SqlQuery.equals(BillLineItemsFields.storeId, storeId),
        ],
      );

      return result.map(fromRowToBillLineItem).toList();
    } on Exception catch (e) {
      _logger.severe('findItemsByBillId Error: $e');

      return [];
    }
  }

  /// Applies a given payment to the bill, updating the balance due and status.
  Future<bool> applyPayment(String billId, Payment payment) async {
    try {
      final bill = await getBill(billId);
      if (bill == null){ return false;}

      final double currentBalance = bill.balanceDue;
      final double paymentAmount = payment.amount;

      final double newBalance = currentBalance - paymentAmount;
      bill.balanceDue = newBalance < 0 ? 0 : newBalance;
      bill.paymentIds.add(payment.refId);

      if (bill.balanceDue <= 0) {
        bill.status = BillStatus.BILL_STATUS_PAID;
      } else {
        bill.status = BillStatus.BILL_STATUS_PARTIALLY_PAID;
      }

      return await updateBill(bill);
    } on Exception catch (e) {
      _logger.severe('applyPayment Error: $e');
      return false;
    }
  }
}
