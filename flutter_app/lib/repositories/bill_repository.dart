import 'dart:async';

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

  /// The instance of [BillRepository].
  static BillRepository get instance => GetIt.I.get<BillRepository>();

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.bills;

  @override
  Bill fromRow(RawRow row) => fromRowToBill(row);

  @override
  RawRow toRow(Bill entity) => fromBillToRaw(entity);

  /// Constructs a new [BillRepository].
  BillRepository({required this.dataSource});

  /// Lists all bills for the given [storeId], optionally filtered by [purchaseOrderId].
  Future<List<Bill>> listBills({
    required String storeId,
    String? purchaseOrderId,
  }) async {
    try {
      _logger.log(
        'Fetching bills for storeId: $storeId, purchaseOrderId: $purchaseOrderId',
      );

      final result = await findWhere([
        SqlQuery.equals(BillsFields.storeId, storeId),
        if (purchaseOrderId != null)
          SqlQuery.equals(BillsFields.relatedPurchaseOrderId, purchaseOrderId),
      ]);

      _logger.log('Found ${result.length} bills');

      for (final item in result) {
        try {
          final billItems = await filterBillItems([
            SqlQuery.equals(BillLineItemsFields.billId, item.refId),
            SqlQuery.equals(BillLineItemsFields.storeId, item.storeId),
          ]);
          item.items.clear();
          item.items.addAll(billItems);
        } catch (e) {
          _logger.warning('Failed to load items for bill ${item.refId}: $e');
          // Continue with empty items rather than failing the entire operation
        }
      }

      return result;
    } on FormatException catch (e) {
      _logger.severe('JSON parsing error in listBills: $e');
      // This might indicate corrupted data - try to continue with empty results

      return [];
    } on Exception catch (e) {
      _logger.severe('listBills Error: $e');

      return [];
    }
  }

  /// Gets a single bill by [billId].
  Future<Bill?> getBill(String billId) async {
    try {
      final results = await findWhere([
        SqlQuery.equals(BillsFields.refId, billId),
      ]);

      final items = await filterBillItems([
        SqlQuery.equals(BillLineItemsFields.billId, billId),
      ]);

      return results.first..items.addAll(items);
    } on Exception catch (e) {
      _logger.severe('getBill Error: $e');

      return null;
    }
  }

  /// Watches a single bill by [billId] with its line items.
  Stream<Bill?> watchBill(String billId) {
    try {
      final billStream = watchOne(billId);
      final itemsStream = dataSource.watchCollection(
        CollectionName.billLineItems,
        filters: [SqlQuery.equals(BillLineItemsFields.billId, billId)],
      );

      return Rx.combineLatest2(billStream, itemsStream, (
        bill,
        itemsRows,
      ) async {
        if (bill == null) return null;
        final items = itemsRows.map(fromRowToBillLineItem).toList();
        bill.items.clear();
        bill.items.addAll(items);

        return bill;
      }).asyncMap((future) => future);
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
      for (var e in items) {
        await dataSource.updateWhere(
          table: CollectionName.billLineItems,
          fields: fromBillLineItemToRaw(e, bill.refId, bill.storeId),
          filters: [
            SqlQuery.equals(BillLineItemsFields.billId, bill.refId),
            SqlQuery.equals(BillLineItemsFields.productId, e.productId),
          ],
        );
      }

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
  /// Returns `false` if the bill has payments and cannot be deleted.
  Future<bool> deleteBill(String billId) async {
    try {
      // First, get the bill to check if it has payments
      final bill = await getBill(billId);
      if (bill == null) {
        _logger.warning('Bill $billId not found for deletion');

        return false;
      }

      // Check if the bill has any payments
      if (bill.paymentIds.isNotEmpty) {
        _logger.warning(
          'Cannot delete bill $billId: it has ${bill.paymentIds.length} payment(s)',
        );

        return false;
      }

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
        final result = await filterBillItems([
          SqlQuery.equals(BillLineItemsFields.billId, item.refId),
          SqlQuery.equals(BillLineItemsFields.storeId, item.storeId),
        ]);
        item.items.clear();
        item.items.addAll(result);
      }

      return po;
    });
  }

  /// Returns all line items for the given purchase order.
  Future<List<BillLineItem>> filterBillItems(List<dynamic> filters) async {
    try {
      final result = await dataSource.getCollection(
        CollectionName.billLineItems,
        filters: filters,
      );

      return result.map(fromRowToBillLineItem).toList();
    } on Exception catch (e) {
      _logger.severe('filterBillItems Error: $e');

      return [];
    }
  }

  /// Returns all bill for the given purchase order.
  Future<List<Bill>> filteBills(List<SqlQuery> filters) async {
    try {
      if (filters.isEmpty) {
        return [];
      }
      final result = await findWhere(filters);

      for (final item in result) {
        final result = await filterBillItems([
          SqlQuery.equals(BillLineItemsFields.billId, item.refId),
          SqlQuery.equals(BillLineItemsFields.storeId, item.storeId),
        ]);
        item.items.clear();
        item.items.addAll(result);
      }

      return result;
    } on Exception catch (e) {
      _logger.severe('filteBills Error: $e');

      return [];
    }
  }

  /// Applies a given payment to the bill, updating the balance due and status.
  ///
  /// The amount applied to this specific bill is resolved from
  /// [payment.relatedDocs] — if an entry exists for [billId], its `amount`
  /// is used. Falls back to the full [payment.amount] for backwards
  /// compatibility (e.g. payments created before relatedDocs was added).
  Future<bool> applyPayment(String billId, Payment payment) async {
    try {
      final bill = await getBill(billId);
      if (bill == null) {
        return false;
      }

      // Look up the specific amount applied to this bill in relatedDocs.
      final relatedDoc = payment.relatedDocs.firstWhere(
        (d) => d.docId == billId,
        orElse: () => PaymentRelatedDoc(amount: payment.amount),
      );

      final double currentBalance = bill.balanceDue;
      final double paymentAmount = relatedDoc.amount;

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

  /// Reverses a previously applied payment, restoring the bill's balance and status.
  ///
  /// The amount reversed is resolved from [payment.relatedDocs] (same as
  /// [applyPayment]) so the two operations are always symmetric.
  Future<bool> revertPayment(String billId, Payment payment) async {
    try {
      final bill = await getBill(billId);
      if (bill == null) {
        return false;
      }

      // Look up the specific amount that was applied to this bill.
      final relatedDoc = payment.relatedDocs.firstWhere(
        (d) => d.docId == billId,
        orElse: () => PaymentRelatedDoc(amount: payment.amount),
      );

      final double paymentAmount = relatedDoc.amount;
      final double restoredBalance = bill.balanceDue + paymentAmount;

      // Cap at totalAmount so rounding never exceeds the original bill value.
      bill.balanceDue = restoredBalance > bill.totalAmount
          ? bill.totalAmount
          : restoredBalance;

      bill.paymentIds.remove(payment.refId);

      // Recalculate status.
      if (bill.balanceDue <= 0) {
        bill.status = BillStatus.BILL_STATUS_PAID;
      } else if (bill.balanceDue < bill.totalAmount) {
        bill.status = BillStatus.BILL_STATUS_PARTIALLY_PAID;
      } else {
        bill.status = BillStatus.BILL_STATUS_OPEN;
      }

      return await updateBill(bill);
    } on Exception catch (e) {
      _logger.severe('revertPayment Error: $e');

      return false;
    }
  }
}
