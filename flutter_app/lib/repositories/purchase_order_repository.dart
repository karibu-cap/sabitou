import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/utils.dart';

/// The purchase order repository.
final class PurchaseOrderRepository extends BaseRepository<PurchaseOrder> {
  final _logger = LoggerApp('PurchaseOrderRepository');

  /// The purchase order service client.
  final PurchaseOrderServiceClient purchaseOrderServiceClient;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.purchaseOrders;

  @override
  String get primaryKey => PurchaseOrdersFields.refId;

  /// The instance of [PurchaseOrderRepository].
  static PurchaseOrderRepository get instance =>
      GetIt.I.get<PurchaseOrderRepository>();

  @override
  PurchaseOrder fromRow(RawRow row) => fromRowToPurchaseOrder(row);

  @override
  RawRow toRow(PurchaseOrder entity) => fromPurchaseOrderToRaw(entity);

  /// Constructs a new [PurchaseOrderRepository].
  PurchaseOrderRepository({required this.dataSource})
    : purchaseOrderServiceClient = PurchaseOrderServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Creates a purchase order.
  ///
  /// Returns the generated [PurchaseOrder.refId] on success, or `null` on
  /// failure.
  Future<String?> createPurchaseOrder(PurchaseOrder purchaseOrder) async {
    try {
      if (purchaseOrder.refId.isEmpty) {
        purchaseOrder.refId = AppUtils.generateSmartDatabaseId('PO');
      }

      await dataSource.runTransaction((tx) async {
        await tx.createRecord(
          table: CollectionName.purchaseOrders,
          record: fromPurchaseOrderToRaw(purchaseOrder),
        );

        for (var i = 0; i < purchaseOrder.items.length; i++) {
          final item = purchaseOrder.items[i];
          await tx.createRecord(
            table: CollectionName.purchaseOrderItems,
            record: fromPurchaseOrderItemsToRow(item, purchaseOrder.refId),
          );
        }
      });

      return purchaseOrder.refId;
    } on Exception catch (e) {
      _logger.severe('createPurchaseOrder Error: $e');

      return null;
    }
  }

  /// Returns a reactive stream of purchase orders, with optional filtering.
  Stream<List<PurchaseOrder>> watchPurchaseOrders({
    String? storeId,
    String? supplierId,
    PurchaseOrderStatus? status,
  }) {
    try {
      final List<SqlQuery> filters = [];

      if (storeId != null) {
        filters.add(SqlQuery.equals(PurchaseOrdersFields.storeId, storeId));
      }
      if (supplierId != null) {
        filters.add(
          SqlQuery.equals(PurchaseOrdersFields.supplierId, supplierId),
        );
      }
      if (status != null) {
        filters.add(SqlQuery.equals(PurchaseOrdersFields.status, status.name));
      }

      final Stream<List<PurchaseOrder>> result = filters.isEmpty
          ? watchAll()
          : watchWhere(filters);

      return result.asyncMap((po) async {
        for (final item in po) {
          final result = await findItemsByPurchaseOrderId(
            item.refId,
            item.storeId,
          );
          item.items.clear();
          item.items.addAll(result);
        }

        return po;
      });
    } on Exception catch (e) {
      _logger.severe('listPurchaseOrders Error: $e');

      return Stream.value([]);
    }
  }

  /// Returns all line items for the given purchase order.
  Future<List<PurchaseOrderLineItems>> findItemsByPurchaseOrderId(
    String purchaseOrderId,
    String storeId,
  ) async {
    try {
      final result = await dataSource.getCollection(
        CollectionName.purchaseOrderItems,
        filters: [
          SqlQuery.equals(
            PurchaseOrderItemsFields.purchaseOrderId,
            purchaseOrderId,
          ),
          SqlQuery.equals(PurchaseOrderItemsFields.storeId, storeId),
        ],
      );

      return result.map(fromRowToPurchaseOrderItems).toList();
    } on Exception catch (e) {
      _logger.severe('findItemsByPurchaseOrderId Error: $e');

      return [];
    }
  }

  /// Returns all line items for the given receiving note.
  Future<List<ReceivingNoteLineItem>> findItemsByReceivingNoteId(
    String receivingNoteId,
    String storeId,
  ) async {
    try {
      final result = await dataSource.getCollection(
        CollectionName.receivingNoteLineItems,
        filters: [
          SqlQuery.equals(
            ReceivingNoteLineItemsFields.receivingNoteId,
            receivingNoteId,
          ),
          SqlQuery.equals(ReceivingNoteLineItemsFields.storeId, storeId),
        ],
      );

      return result.map(fromRowToReceivingNoteLineItem).toList();
    } on Exception catch (e) {
      _logger.severe('findItemsByReceivingNoteId Error: $e');

      return [];
    }
  }

  /// Returns a reactive stream for a single purchase order (with its line
  /// items loaded).
  Stream<PurchaseOrder?> watchPurchaseOrder(String id) {
    try {
      _logger.info('watchPurchaseOrder: Starting watch for PO ID: $id');

      // Watch both the PO and its items, then combine them
      final poStream = watchOne(id);
      final itemsStream = dataSource.watchCollection(
        CollectionName.purchaseOrderItems,
        filters: [
          SqlQuery.equals(PurchaseOrderItemsFields.purchaseOrderId, id),
        ],
      );

      return Rx.combineLatest2(poStream, itemsStream, (po, itemsRows) async {
        _logger.info(
          'watchPurchaseOrder: PO stream emitted: po=${po?.refId}, itemsCount=${itemsRows.length}',
        );
        if (po == null) {
          _logger.warning('watchPurchaseOrder: PO is null for ID: $id');

          return null;
        }
        final items = itemsRows.map(fromRowToPurchaseOrderItems).toList();
        po.items.clear();
        po.items.addAll(items);

        return po;
      }).asyncMap((future) => future);
    } on Exception catch (e) {
      _logger.severe('watchPurchaseOrder Error: $e');

      return Stream.value(null);
    }
  }

  /// Updates the status of a purchase order.
  Future<bool> updatePurchaseOrderStatus({
    required String purchaseOrderId,
    required PurchaseOrderStatus status,
  }) async {
    try {
      await updateWhere(
        fields: {PurchaseOrdersFields.status: status.name},
        filters: [SqlQuery.equals(PurchaseOrdersFields.refId, purchaseOrderId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updatePurchaseOrderStatus Error: $e');

      return false;
    }
  }

  /// Cancels a purchase order (sets status to [PurchaseOrderStatus.PO_STATUS_CANCELLED]).
  Future<bool> cancelPurchaseOrder(String purchaseOrderId) async {
    try {
      await updateWhere(
        fields: {
          PurchaseOrdersFields.status:
              PurchaseOrderStatus.PO_STATUS_CANCELLED.name,
        },
        filters: [SqlQuery.equals(PurchaseOrdersFields.refId, purchaseOrderId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('cancelPurchaseOrder Error: $e');

      return false;
    }
  }

  /// Creates a receiving note and updates the linked PO items' received
  /// quantities.
  ///
  /// After the transaction completes the PO status is re-evaluated
  /// asynchronously via [_updatePurchaseOrderStatusAfterReceive].
  ///
  /// Returns the generated [ReceivingNote.refId] on success, or `null` on
  /// failure.
  Future<String?> createReceivingNote(ReceivingNote receivingNote) async {
    try {
      receivingNote.refId = AppUtils.generateSmartDatabaseId('RN');

      await dataSource.runTransaction((tx) async {
        await tx.createRecord(
          table: CollectionName.receivingNotes,
          record: fromReceivingNoteToRaw(receivingNote),
        );

        for (var i = 0; i < receivingNote.items.length; i++) {
          final item = receivingNote.items[i];

          await tx.createRecord(
            table: CollectionName.receivingNoteLineItems,
            record: fromReceivingNoteLineItemToRaw(item, receivingNote.refId),
          );

          // Get current inventory level for transaction audit
          final quantityBefore = await _getCurrentQuantityOnHand(
            tx,
            receivingNote.storeId,
            item.productId,
          );

          // Update inventory levels
          await _updateInventoryLevel(tx, receivingNote, item);

          // Create inventory transaction audit
          await _createInventoryTransaction(
            tx,
            receivingNote,
            item,
            quantityBefore,
          );

          // Update the matching PO item's quantityReceived.
          final poItemsResult = await tx.getCollection(
            CollectionName.purchaseOrderItems,
            filters: [
              SqlQuery.equals(
                PurchaseOrderItemsFields.purchaseOrderId,
                receivingNote.relatedPurchaseOrderId,
              ),
              SqlQuery.equals(
                PurchaseOrderItemsFields.productId,
                item.productId,
              ),
            ],
          );

          if (poItemsResult.isNotEmpty) {
            final poItem = fromRowToPurchaseOrderItems(poItemsResult.first);
            final newQuantity =
                poItem.quantityReceived + item.quantityReceived.toInt();
            poItem..quantityReceived = newQuantity;

            await tx.updateWhere(
              table: CollectionName.purchaseOrderItems,
              fields: fromPurchaseOrderItemsToRow(
                poItem,
                receivingNote.relatedPurchaseOrderId,
              ),
              filters: [
                SqlQuery.equals(
                  PurchaseOrderItemsFields.purchaseOrderId,
                  receivingNote.relatedPurchaseOrderId,
                ),
                SqlQuery.equals(
                  PurchaseOrderItemsFields.productId,
                  item.productId,
                ),
              ],
            );
          }
        }
      });

      // Move PO to ISSUED whenever a receive is recorded (partial or full).
      unawaited(
        _updatePurchaseOrderStatusAfterReceive(
          receivingNote.relatedPurchaseOrderId,
        ),
      );

      return receivingNote.refId;
    } on Exception catch (e) {
      _logger.severe('createReceivingNote Error: $e');

      return null;
    }
  }

  /// Re-evaluates PO status after a receiving note is created.
  ///
  /// Rule: any received quantity → [PurchaseOrderStatus.PO_STATUS_ISSUED].
  /// Status is only moved to [PurchaseOrderStatus.PO_STATUS_CLOSED] via
  /// [syncPOStatusFromBills], which is triggered after bill creation /
  /// deletion.
  Future<void> _updatePurchaseOrderStatusAfterReceive(
    String purchaseOrderId,
  ) async {
    final poResult = await dataSource.getDocument(
      CollectionName.purchaseOrders,
      purchaseOrderId,
      primaryKey: PurchaseOrdersFields.refId,
    );

    if (poResult == null) return;

    final po = fromRowToPurchaseOrder(poResult);

    // Don't downgrade a CLOSED or CANCELLED PO.
    if (po.status == PurchaseOrderStatus.PO_STATUS_CLOSED ||
        po.status == PurchaseOrderStatus.PO_STATUS_CANCELLED) {
      return;
    }

    final poItemsResult = await dataSource.getCollection(
      CollectionName.purchaseOrderItems,
      filters: [
        SqlQuery.equals(
          PurchaseOrderItemsFields.purchaseOrderId,
          purchaseOrderId,
        ),
      ],
    );

    if (poItemsResult.isEmpty) return;

    final items = poItemsResult.map(fromRowToPurchaseOrderItems).toList();
    final anyReceived = items.any((i) => i.quantityReceived > 0);

    // Any receipt (partial or full) → ISSUED.
    if (anyReceived && po.status != PurchaseOrderStatus.PO_STATUS_ISSUED) {
      await dataSource.updateWhere(
        table: CollectionName.purchaseOrders,
        fields: {
          PurchaseOrdersFields.status:
              PurchaseOrderStatus.PO_STATUS_ISSUED.name,
        },
        filters: [SqlQuery.equals(PurchaseOrdersFields.refId, purchaseOrderId)],
      );
    }
  }

  /// Synchronises the PO status based on the current state of linked bills.
  ///
  /// Status rules (applied in priority order):
  /// 1. **CANCELLED** — never changed here; the user must explicitly cancel.
  /// 2. **CLOSED** — set when the sum of all active bills covers ≥ 99 % of
  ///    the PO total amount AND at least one bill exists.
  /// 3. **ISSUED** — set when at least one receiving note exists (or when
  ///    partial bills exist).
  /// 4. **PENDING** — set when neither bills nor receives exist.
  ///
  /// Call this after every bill creation or deletion.
  Future<void> syncPOStatusFromBills({
    required String purchaseOrderId,
    required String storeId,
  }) async {
    try {
      _logger.info(
        'syncPOStatusFromBills: Starting sync for PO: $purchaseOrderId, store: $storeId',
      );

      final poResult = await dataSource.getDocument(
        CollectionName.purchaseOrders,
        purchaseOrderId,
        primaryKey: PurchaseOrdersFields.refId,
      );
      if (poResult == null) {
        _logger.warning(
          'syncPOStatusFromBills: PO not found: $purchaseOrderId',
        );

        return;
      }

      final po = fromRowToPurchaseOrder(poResult);
      _logger.info(
        'syncPOStatusFromBills: Current PO status: ${po.status.name}',
      );

      // Never change a cancelled PO status.
      if (po.status == PurchaseOrderStatus.PO_STATUS_CANCELLED) return;

      // ── Collect bill totals ──────────────────────────────────────────────
      final billRows = await dataSource.getCollection(
        CollectionName.bills,
        filters: [
          SqlQuery.equals(BillsFields.relatedPurchaseOrderId, purchaseOrderId),
          SqlQuery.equals(BillsFields.storeId, storeId),
        ],
      );

      final double billedTotal = billRows.fold(
        0.0,
        (sum, row) =>
            sum + ((row[BillsFields.totalAmount] as num?)?.toDouble() ?? 0.0),
      );

      // ── Collect receiving note count ─────────────────────────────────────
      final noteRows = await dataSource.getCollection(
        CollectionName.receivingNotes,
        filters: [
          SqlQuery.equals(
            ReceivingNotesFields.relatedPurchaseOrderId,
            purchaseOrderId,
          ),
        ],
      );

      final bool hasBills = billRows.isNotEmpty;
      final bool hasReceives = noteRows.isNotEmpty;
      // Allow 1 % tolerance for floating-point imprecision.
      final bool allBilled =
          hasBills &&
          po.totalAmount > 0 &&
          billedTotal >= po.totalAmount * 0.99;

      PurchaseOrderStatus newStatus;
      if (allBilled) {
        newStatus = PurchaseOrderStatus.PO_STATUS_CLOSED;
      } else if (hasReceives || hasBills) {
        newStatus = PurchaseOrderStatus.PO_STATUS_ISSUED;
      } else {
        newStatus = PurchaseOrderStatus.PO_STATUS_PENDING;
      }

      if (newStatus != po.status) {
        await dataSource.updateWhere(
          table: CollectionName.purchaseOrders,
          fields: {PurchaseOrdersFields.status: newStatus.name},
          filters: [
            SqlQuery.equals(PurchaseOrdersFields.refId, purchaseOrderId),
          ],
        );
        _logger.info(
          'PO $purchaseOrderId status updated: ${po.status.name} → ${newStatus.name}',
        );
      } else {
        _logger.info('PO $purchaseOrderId status unchanged: ${po.status.name}');
      }
    } on Exception catch (e) {
      _logger.severe('syncPOStatusFromBills Error: $e');
    }
  }

  /// Returns a reactive stream of receiving notes for a given PO.
  Stream<List<ReceivingNote>> streamPurchaseReceivingNotes(
    String storeId,
    String purchaseId,
  ) {
    try {
      return dataSource
          .watchCollection(
            CollectionName.receivingNotes,
            filters: [
              SqlQuery.equals(ReceivingNotesFields.storeId, storeId),
              SqlQuery.equals(
                ReceivingNotesFields.relatedPurchaseOrderId,
                purchaseId,
              ),
            ],
          )
          .asyncMap((noteList) async {
            final receivingNotes = noteList
                .map(fromRowToReceivingNote)
                .toList();

            for (final note in receivingNotes) {
              final result = await findItemsByReceivingNoteId(
                note.refId,
                note.storeId,
              );
              note.items.clear();
              note.items.addAll(result);
            }

            return receivingNotes;
          });
    } on Exception catch (e) {
      _logger.severe('streamPurchaseReceivingNotes Error: $e');

      return Stream.value([]);
    }
  }

  /// Updates inventory level when receiving items
  Future<void> _updateInventoryLevel(
    LocalDataSource tx,
    ReceivingNote receivingNote,
    ReceivingNoteLineItem item,
  ) async {
    // Find existing inventory level
    final existingLevels = await tx.getCollection(
      CollectionName.inventoryLevels,
      filters: [
        SqlQuery.equals(InventoryLevelsFields.storeProductId, item.productId),
        SqlQuery.equals(InventoryLevelsFields.storeId, receivingNote.storeId),
      ],
    );

    final now = DateTime.now();
    final int quantityReceived = item.quantityReceived.toInt();

    if (existingLevels.isNotEmpty) {
      final existingLevel = existingLevels.first;
      final currentQuantityOnHand =
          existingLevel[InventoryLevelsFields.quantityOnHand] as int? ?? 0;
      final newQuantityOnHand = currentQuantityOnHand + quantityReceived;

      await tx.updateWhere(
        table: CollectionName.inventoryLevels,
        fields: {
          InventoryLevelsFields.quantityOnHand: newQuantityOnHand,
          InventoryLevelsFields.quantityAvailable:
              newQuantityOnHand -
              (existingLevel[InventoryLevelsFields.quantityCommitted] as int? ??
                  0),
          InventoryLevelsFields.lastUpdated: now.toIso8601String(),
          InventoryLevelsFields.lastUpdatedByUserId:
              receivingNote.receivedByUserId,
        },
        filters: [
          SqlQuery.equals(InventoryLevelsFields.storeProductId, item.productId),
          SqlQuery.equals(InventoryLevelsFields.storeId, receivingNote.storeId),
        ],
      );
    } else {
      // Create new inventory level
      await tx.createRecord(
        table: CollectionName.inventoryLevels,
        record: {
          InventoryLevelsFields.storeProductId: item.productId,
          InventoryLevelsFields.storeId: receivingNote.storeId,
          InventoryLevelsFields.quantityOnHand: quantityReceived,
          InventoryLevelsFields.quantityAvailable: quantityReceived,
          InventoryLevelsFields.quantityCommitted: 0,
          InventoryLevelsFields.minThreshold: 0,
          InventoryLevelsFields.lastUpdated: now.toIso8601String(),
          InventoryLevelsFields.lastUpdatedByUserId:
              receivingNote.receivedByUserId,
        },
      );
    }
  }

  /// Creates inventory transaction audit record
  Future<void> _createInventoryTransaction(
    LocalDataSource tx,
    ReceivingNote receivingNote,
    ReceivingNoteLineItem item,
    int quantityBefore,
  ) async {
    final int quantityReceived = item.quantityReceived.toInt();
    final int quantityAfter = quantityBefore + quantityReceived;

    await tx.createRecord(
      table: CollectionName.inventoryTransactions,
      record: {
        InventoryTransactionsFields.refId: AppUtils.generateSmartDatabaseId(
          'TXN',
        ),
        InventoryTransactionsFields.storeId: receivingNote.storeId,
        InventoryTransactionsFields.productId: item.productId,
        InventoryTransactionsFields.transactionType:
            TransactionType.TXN_TYPE_PURCHASE.name,
        InventoryTransactionsFields.quantityChange: quantityReceived,
        InventoryTransactionsFields.quantityBefore: quantityBefore,
        InventoryTransactionsFields.quantityAfter: quantityAfter,
        InventoryTransactionsFields.relatedDocumentType: 'ReceivingNote',
        InventoryTransactionsFields.relatedDocumentId: receivingNote.refId,
        InventoryTransactionsFields.performedByUserId:
            receivingNote.receivedByUserId,
        InventoryTransactionsFields.transactionTime: DateTime.now()
            .toIso8601String(),
        InventoryTransactionsFields.notes:
            'Received items from purchase order ${receivingNote.relatedPurchaseOrderId}',
        InventoryTransactionsFields.batchId: item.batchId.isNotEmpty
            ? item.batchId
            : null,
        InventoryTransactionsFields.unitPrice: item.purchasePrice,
        InventoryTransactionsFields.totalAmount:
            item.purchasePrice * item.quantityReceived,
        InventoryTransactionsFields.currency: 'XAF',
      },
    );
  }

  /// Gets current quantity on hand for a product in a store
  Future<int> _getCurrentQuantityOnHand(
    LocalDataSource tx,
    String storeId,
    String productId,
  ) async {
    final existingLevels = await tx.getCollection(
      CollectionName.inventoryLevels,
      filters: [
        SqlQuery.equals(InventoryLevelsFields.storeProductId, productId),
        SqlQuery.equals(InventoryLevelsFields.storeId, storeId),
      ],
    );

    return existingLevels.isNotEmpty
        ? (existingLevels.first[InventoryLevelsFields.quantityOnHand] as int? ??
              0)
        : 0;
  }
}
