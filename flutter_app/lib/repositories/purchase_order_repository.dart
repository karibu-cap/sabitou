import 'package:get_it/get_it.dart';
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
  Future<String?> createPurchaseOrder(PurchaseOrder purchaseOrder) async {
    try {
      if (purchaseOrder.refId.isEmpty) {
        purchaseOrder.refId = AppUtils.generateSmartDatabaseId('PO');
      }

      await create(purchaseOrder);

      return purchaseOrder.refId;
    } on Exception catch (e) {
      _logger.severe('createPurchaseOrder Error: $e');

      return null;
    }
  }

  /// Gets a purchase order.
  Future<PurchaseOrder?> getPurchaseOrder(String purchaseOrderId) async {
    try {
      return await findById(purchaseOrderId);
    } on Exception catch (e) {
      _logger.severe('getPurchaseOrder Error: $e');

      return null;
    }
  }

  /// Lists purchase orders.
  Future<List<PurchaseOrder>> listPurchaseOrders({
    String? storeId,
    String? supplierId,
    PurchaseOrderStatus? status,
  }) async {
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

      if (filters.isEmpty) {
        return await findAll();
      }

      return await findWhere(filters);
    } on Exception catch (e) {
      _logger.severe('listPurchaseOrders Error: $e');

      return [];
    }
  }

  /// Stream purchase orders.
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

      if (filters.isEmpty) {
        return watchAll();
      }

      return watchWhere(filters);
    } on Exception catch (e) {
      _logger.severe('listPurchaseOrders Error: $e');

      return Stream.value([]);
    }
  }

  /// Stream purchase order.
  Stream<PurchaseOrder?> watchPurchaseOrder(String id) {
    try {
      return watchOne(id);
    } on Exception catch (e) {
      _logger.severe('listPurchaseOrders Error: $e');

      return Stream.value(null);
    }
  }

  /// Updates purchase order status.
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

  /// Cancels a purchase order.
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

  /// Creates a receiving note.
  Future<String?> createReceivingNote(ReceivingNote receivingNote) async {
    try {
      if (receivingNote.refId.isEmpty) {
        receivingNote.refId = AppUtils.generateSmartDatabaseId('RN');
      }

      await dataSource.setRecord(
        table: CollectionName.receivingNotes,
        record: fromReceivingNoteToRaw(receivingNote),
      );

      return receivingNote.refId;
    } on Exception catch (e) {
      _logger.severe('createReceivingNote Error: $e');

      return null;
    }
  }

  /// Creates a receiving note.
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
          .map((e) => e.map(fromRowToReceivingNote).toList());
    } on Exception catch (e) {
      _logger.severe('createReceivingNote Error: $e');

      return Stream.value([]);
    }
  }
}
