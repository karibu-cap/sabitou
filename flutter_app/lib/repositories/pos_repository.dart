import 'package:clock/clock.dart';
import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:uuid/uuid.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/pos_exceptions.dart';
import '../utils/utils.dart';

/// The POS repository.
final class PosRepository extends BaseRepository<CashReceipt> {
  final _logger = LoggerApp('PosRepository');

  /// The POS service client.
  final CashReceiptServiceClient cashReceiptServiceClient;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.cashReceipts;

  /// The instance of [PosRepository].
  static PosRepository get instance => GetIt.I.get<PosRepository>();

  @override
  CashReceipt fromRow(Map<String, dynamic> row) => fromRowToCashReceipt(row);

  @override
  RawRow toRow(CashReceipt entity) => fromCashReceiptToRaw(entity);

  /// Constructs a new [PosRepository].
  PosRepository({required this.dataSource, connect.Transport? transport})
    : cashReceiptServiceClient = CashReceiptServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  Future<void> saveDraftReceipt(
    CashReceipt receipt, {
    CashReceiptStatus status = CashReceiptStatus.CASH_RECEIPT_STATUS_DRAFT,
  }) async {
    try {
      final existingReceipt = await findById(receipt.refId);
      receipt..status = status;

      if (existingReceipt != null) {
        await updateWhere(
          fields: fromCashReceiptToRaw(receipt),
          filters: [SqlQuery.equals(CashReceiptsFields.refId, receipt.refId)],
        );
      }

      receipt..refId = AppUtils.generateSmartDatabaseId('CASH_RECEIPT');

      await create(receipt);
      _logger.info('Draft receipt saved: ${receipt.refId}');

      return;
    } on Exception catch (e) {
      _logger.severe('saveDraftReceipt failed: $e');

      return;
    }
  }

  /// Returns all DRAFT receipts for [storeId], ordered by most recent first.
  Future<List<CashReceipt>> getDraftReceipts(String storeId) async {
    try {
      final rows = await findWhere([
        SqlQuery.equals(
          CashReceiptsFields.status,
          CashReceiptStatus.CASH_RECEIPT_STATUS_DRAFT,
        ),
        SqlQuery.equals(CashReceiptsFields.storeId, storeId),
      ]);

      return rows;
    } on Exception catch (e) {
      _logger.severe('getDraftReceipts failed: $e');

      return [];
    }
  }

  /// Creates a cash receipt with its items.
  Future<CreateCashReceiptResponse?> createCashReceipt(
    CreateCashReceiptRequest request,
  ) async {
    try {
      final response = await cashReceiptServiceClient.createCashReceipt(
        request,
      );

      if (response.success && request.receipt.hasRefId()) {
        await save(request.receipt);

        // Save items separately to cash_receipt_items table
        for (final item in request.receipt.items) {
          final itemRaw = fromCashReceiptItemToRaw(
            item,
            request.receipt.refId,
            request.receipt.storeId,
          );
          await dataSource.createRecord(
            table: CollectionName.cashReceiptItems,
            record: {...itemRaw},
          );
        }
      }

      return response;
    } on Exception catch (e) {
      _logger.severe('createCashReceipt Error: $e');

      return null;
    }
  }

  /// Deletes a draft receipt from local SQLite (e.g. after resuming).
  Future<void> deleteDraftReceipt(String refId) async {
    try {
      final CashReceipt? receipt = await findById(refId);
      if (receipt == null) {
        return;
      }

      if (receipt.status != CashReceiptStatus.CASH_RECEIPT_STATUS_DRAFT) {
        _logger.info('Receipt is not draft, cannot delete: $refId');

        return;
      }

      await delete(refId);
      _logger.info('Draft receipt deleted: $refId');
    } on Exception catch (e) {
      _logger.severe('deleteDraftReceipt Error: $e');
    }
  }

  /// Gets a cash receipt by ID with its items.
  Future<CashReceipt?> getCashReceiptWithItems(String receiptId) async {
    try {
      final receipt = await findById(receiptId);
      if (receipt == null) return null;

      final items = await filterCashReceiptItems([
        SqlQuery.equals(CashReceiptItemsFields.receiptId, receiptId),
      ]);
      receipt.items.addAll(items);

      return receipt;
    } on Exception catch (e) {
      _logger.severe('getCashReceiptWithItems Error: $e');

      return null;
    }
  }

  /// Returns all line items for the given cash receipt.
  Future<List<InvoiceLineItem>> filterCashReceiptItems(
    List<dynamic> filters,
  ) async {
    try {
      final result = await dataSource.getCollection(
        CollectionName.cashReceiptItems,
        filters: filters,
      );

      return result.map(fromRowToCashReceiptItem).toList();
    } on Exception catch (e) {
      _logger.severe('filterCashReceiptItems Error: $e');

      return [];
    }
  }

  /// Find cash receipts by store with their items.
  Future<List<CashReceipt>?> findCashReceiptsByStore(String storeId) async {
    try {
      final receipts = await findWhere([
        SqlQuery.equals(CashReceiptsFields.storeId, storeId),
      ]);

      for (final receipt in receipts) {
        final items = await filterCashReceiptItems([
          SqlQuery.equals(CashReceiptItemsFields.receiptId, receipt.refId),
          SqlQuery.equals(CashReceiptItemsFields.storeId, storeId),
        ]);
        receipt.items.addAll(items);
      }

      return receipts;
    } on Exception catch (e) {
      _logger.severe('findCashReceiptsByStore Error: $e');

      return null;
    }
  }

  /// Streams cash receipts for a specific store (without items).
  Stream<List<CashReceipt>> watchCashReceiptsByStore(String storeId) {
    return watchWhere([SqlQuery.equals(CashReceiptsFields.storeId, storeId)]);
  }

  /// Watches a single cash receipt by [receiptId] with its line items.
  Stream<CashReceipt?> watchCashReceiptWithItems(String receiptId) {
    try {
      final receiptStream = watchOne(receiptId);
      final itemsStream = dataSource.watchCollection(
        CollectionName.cashReceiptItems,
        filters: [SqlQuery.equals(CashReceiptItemsFields.receiptId, receiptId)],
      );

      return Rx.combineLatest2(receiptStream, itemsStream, (
        receipt,
        itemsRows,
      ) async {
        if (receipt == null) return null;
        final items = itemsRows.map(fromRowToCashReceiptItem).toList();
        receipt.items.clear();
        receipt.items.addAll(items);

        return receipt;
      }).asyncMap((future) => future);
    } on Exception catch (e) {
      _logger.severe('watchCashReceiptWithItems Error: $e');

      return Stream.value(null);
    }
  }

  /// Processes a complete cash receipt payment.
  ///
  /// Executes the following steps inside a single SQLite write-transaction:
  ///
  /// **Step A — Financial validation**
  /// - Sums all [payments].
  /// - Throws [IncompletePaymentException] if total paid < receipt total.
  ///
  /// **Step B — Change management**
  /// - If [issueVoucherOnChange] and `owed_to_customer > 0`, creates and
  ///   persists a [GiftVoucher] for the overpayment amount.
  /// - Otherwise the overpayment is treated as cash change.
  ///
  /// **Step C — Inventory update (optimistic local write)**
  /// - Decrements `quantity_available` and `quantity_on_hand` for every
  ///   item in the receipt.
  /// - Inserts one [InventoryTransaction] audit row per item.
  ///
  /// **Step D — Receipt finalisation**
  /// - Sets the receipt status to [CashReceiptStatus.completed].
  /// - Updates `amount_paid`, `change_given`, `owed_to_customer`.
  ///
  /// Returns a [PaymentResult] on success. Re-throws on any failure so the
  /// caller can surface the error to the UI.
  Future<PaymentResult> processCashReceiptPayment({
    required String receiptId,
    required List<Payment> payments,
    required String cashierUserId,
    required String storeId,
    bool issueVoucherOnChange = false,
  }) async {
    return dataSource.runTransaction<PaymentResult>((tx) async {
      // ── Step A: Financial validation ──────────────────────────────────────
      final cashReceipe = await getCashReceiptWithItems(receiptId);
      if (cashReceipe == null) {
        throw ReceiptNotFoundException(receiptId);
      }

      if (cashReceipe.status ==
          CashReceiptStatus.CASH_RECEIPT_STATUS_COMPLETED) {
        throw ReceiptAlreadyCompletedException(receiptId);
      }

      final totalPaid = payments.fold(
        0.0,
        (sum, p) => sum + p.amount.toDouble(),
      );

      if (totalPaid < cashReceipe.totalAmount) {
        throw IncompletePaymentException(
          totalDue: cashReceipe.totalAmount,
          totalPaid: totalPaid,
        );
      }

      final owedToCustomer = totalPaid - cashReceipe.totalAmount;

      // ── Step B: Change management ─────────────────────────────────────────
      GiftVoucher? issuedVoucher;

      if (issueVoucherOnChange && owedToCustomer > 0) {
        issuedVoucher = await _issueVoucher(
          tx: tx,
          owedAmount: owedToCustomer,
          customerId: cashReceipe.customerId,
          cashierUserId: cashierUserId,
          storeId: storeId,
        );
      }

      // ── Step C: Inventory update ──────────────────────────────────────────
      await _decrementInventoryForItems(
        tx: tx,
        items: cashReceipe.items,
        receiptRefId: cashReceipe.refId,
        cashierUserId: cashierUserId,
        storeId: storeId,
      );

      // ── Step D: Finalise receipt ──────────────────────────────────────────
      final paymentIds = payments
          .where((p) => p.refId.isNotEmpty)
          .map((p) => p.refId)
          .toList();

      cashReceipe
        ..amountPaid = totalPaid
        ..changeGiven = owedToCustomer > 0 && !issueVoucherOnChange
            ? owedToCustomer
            : 0.0
        ..owedToCustomer = owedToCustomer
        ..transactionTime = Timestamp.fromDateTime(clock.now());

      await tx.updateWhere(
        table: CollectionName.cashReceipts,
        filters: [SqlQuery.equals(CashReceiptsFields.refId, cashReceipe.refId)],
        fields: {
          CashReceiptsFields.totalAmount: totalPaid,
          CashReceiptsFields.changeGiven: cashReceipe.changeGiven,
          CashReceiptsFields.owedToCustomer: cashReceipe.owedToCustomer,
          CashReceiptsFields.status:
              CashReceiptStatus.CASH_RECEIPT_STATUS_COMPLETED,
          CashReceiptsFields.transactionTime: cashReceipe.transactionTime,
          CashReceiptsFields.voucherIssuedCode: issuedVoucher?.voucherCode,
          CashReceiptsFields.paymentIds: paymentIds,
        },
      );

      _logger.info('Receipt $receiptId completed — paid: $totalPaid');

      if (issuedVoucher != null) {
        cashReceipe.voucherIssuedCode = issuedVoucher.voucherCode;
      }

      return PaymentResult(
        receipt: cashReceipe,
        issuedVoucher: issuedVoucher,
        changeGiven: cashReceipe.changeGiven,
      );
    });
  }

  Future<GiftVoucher> _issueVoucher({
    required LocalDataSource tx,
    required double owedAmount,
    required String customerId,
    required String cashierUserId,
    required String storeId,
  }) async {
    try {
      final voucherCode = _generateVoucherCode();
      final refId = AppUtils.generateSmartDatabaseId('GV');
      final now = clock.now();
      // Valid for 1 year from today.
      final validUntil = now.add(const Duration(days: 365));

      final vg = GiftVoucher(
        refId: refId,
        voucherCode: voucherCode,
        initialValue: owedAmount,
        remainingValue: owedAmount,
        currency: 'XAF',
        issuedToCustomerId: customerId.isEmpty ? null : customerId,
        issuedByUserId: cashierUserId,
        warehouseId: storeId,
        status: VoucherStatus.VOUCHER_STATUS_ACTIVE,
        issuedAt: Timestamp.fromDateTime(now),
        validUntil: Timestamp.fromDateTime(validUntil),
      );

      await tx.createRecord(
        table: CollectionName.giftVouchers,
        record: fromGiftVoucherToRaw(vg),
      );

      _logger.info('Voucher issued: $voucherCode — value: $owedAmount XAF');

      return vg;
    } catch (e, stackTrace) {
      _logger.severe('Failed to issue voucher: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Generates a random 8-character uppercase alphanumeric voucher code.
  ///
  /// Example: `GV-K3FP9T2X`
  String _generateVoucherCode() {
    final Uuid _uuid = const Uuid();
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final rng = _uuid.v4().replaceAll('-', '').toUpperCase();
    final code = List.generate(
      8,
      (i) => chars[rng.codeUnitAt(i % rng.length) % chars.length],
    ).join();

    return 'GV-$code';
  }

  Future<void> _decrementInventoryForItems({
    required LocalDataSource tx,
    required List<InvoiceLineItem> items,
    required String receiptRefId,
    required String cashierUserId,
    required String storeId,
  }) async {
    for (final item in items) {
      // Read current levels before decrement.
      final levelRows = await tx.getCollection(
        CollectionName.inventoryLevels,
        limit: 1,
        filters: [
          SqlQuery.equals(InventoryLevelsFields.storeProductId, item.productId),
          SqlQuery.equals(InventoryLevelsFields.storeId, storeId),
        ],
      );

      final invRow = levelRows.firstOrNull;

      if (invRow == null) {
        continue;
      }
      final inv = fromRowToInventoryLevel(invRow);

      final quantityBefore = levelRows.isEmpty
          ? 0
          : (levelRows.first[InventoryLevelsFields.quantityOnHand] as num?)
                    ?.toInt() ??
                0;

      final quantityAfter = (quantityBefore - item.quantity).clamp(0, 999999);

      // Optimistic local decrement.
      await tx.updateWhere(
        table: CollectionName.inventoryLevels,
        fields: {
          InventoryLevelsFields.quantityAvailable:
              inv.quantityAvailable - item.quantity,
          InventoryLevelsFields.quantityOnHand:
              inv.quantityOnHand - item.quantity,
        },
        filters: [
          SqlQuery.equals(InventoryLevelsFields.storeProductId, item.productId),
          SqlQuery.equals(InventoryLevelsFields.storeId, storeId),
        ],
      );

      final transaction = InventoryTransaction(
        refId: AppUtils.generateSmartDatabaseId('TXN'),
        storeId: storeId,
        productId: item.productId,
        transactionType: TransactionType.TXN_TYPE_SALE,
        quantityChange: -item.quantity,
        quantityBefore: quantityBefore,
        quantityAfter: quantityAfter,
        relatedDocumentType: 'CashReceipt',
        relatedDocumentId: receiptRefId,
        performedByUserId: cashierUserId,
        transactionTime: Timestamp.fromDateTime(clock.now()),
        notes: item.batchId.isEmpty ? null : item.batchId,
        unitPrice: item.unitPrice,
        totalAmount: item.total,
        currency: 'XAF',
      );

      await tx.createRecord(
        table: CollectionName.inventoryTransactions,
        record: fromInventoryTransactionToRaw(transaction),
      );
    }
  }
}

/// The payment result of a cash receipt transaction.
class PaymentResult {
  /// Creates a [PaymentResult].
  const PaymentResult({
    required this.receipt,
    required this.changeGiven,
    this.issuedVoucher,
  });

  /// The finalised [CashReceipt] with `status = COMPLETED`.
  final CashReceipt receipt;

  /// A [GiftVoucher] issued for the overpayment amount, or `null` if change
  /// was given in cash.
  final GiftVoucher? issuedVoucher;

  /// Cash change physically handed back to the customer.
  ///
  /// Is `0.0` when the overpayment was converted into a [GiftVoucher].
  final double changeGiven;

  /// Whether a voucher was issued instead of cash change.
  bool get voucherIssued => issuedVoucher != null;
}
