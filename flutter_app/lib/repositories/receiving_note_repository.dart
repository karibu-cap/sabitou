import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';

/// Repository for reading receiving notes from the local PowerSync database.
/// Creation of receiving notes is done via [PurchaseOrderRepository.createReceivingNote]
/// which triggers the server-side flow (inventory update, batch creation, etc.)
final class ReceivingNoteRepository extends BaseRepository<ReceivingNote> {
  final _logger = LoggerApp('ReceivingNoteRepository');

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.receivingNotes;

  @override
  String get primaryKey => ReceivingNotesFields.refId;

  @override
  ReceivingNote fromRow(RawRow row) => fromRowToReceivingNote(row);

  @override
  RawRow toRow(ReceivingNote entity) => fromReceivingNoteToRaw(entity);

  /// The instance of [ReceivingNoteRepository].
  static ReceivingNoteRepository get instance =>
      GetIt.I.get<ReceivingNoteRepository>();

  /// Constructs a new [ReceivingNoteRepository].
  ReceivingNoteRepository({required this.dataSource});

  /// Lists receiving notes for the given [storeId], optionally filtered
  /// by [purchaseOrderId].
  Future<List<ReceivingNote>> listReceivingNotes({
    required String storeId,
    String? purchaseOrderId,
  }) async {
    try {
      return await findWhere([
        SqlQuery.equals(ReceivingNotesFields.storeId, storeId),
        if (purchaseOrderId != null)
          SqlQuery.equals(
            ReceivingNotesFields.relatedPurchaseOrderId,
            purchaseOrderId,
          ),
      ]);
    } on Exception catch (e) {
      _logger.severe('listReceivingNotes Error: $e');

      return [];
    }
  }

  /// Create a receive note.

  /// Gets a single receiving note by [refId].
  Future<ReceivingNote?> getReceivingNote(String refId) async {
    try {
      final results = await findWhere(limit: 1, [
        SqlQuery.equals(ReceivingNotesFields.refId, refId),
      ]);

      return results.isNotEmpty ? results.first : null;
    } on Exception catch (e) {
      _logger.severe('getReceivingNote Error: $e');

      return null;
    }
  }

  /// Loads the line items for a receiving note by [receivingNoteId].
  Future<List<ReceivingNoteLineItem>> getLineItems(
    String receivingNoteId,
  ) async {
    try {
      final rows = await dataSource.getCollection(
        CollectionName.receivingNoteLineItems,
        filters: [
          SqlQuery.equals(
            ReceivingNoteLineItemsFields.receivingNoteId,
            receivingNoteId,
          ),
        ],
      );

      return rows.map(fromRowToReceivingNoteLineItem).toList();
    } on Exception catch (e) {
      _logger.severe('getLineItems Error: $e');

      return [];
    }
  }

  /// Watches receiving notes for the given [storeId], optionally filtered
  /// by [purchaseOrderId].
  Stream<List<ReceivingNote>> watchReceivingNotes({
    required String storeId,
    String? purchaseOrderId,
  }) {
    return watchWhere([
      SqlQuery.equals(ReceivingNotesFields.storeId, storeId),
      if (purchaseOrderId != null)
        SqlQuery.equals(
          ReceivingNotesFields.relatedPurchaseOrderId,
          purchaseOrderId,
        ),
    ]);
  }
}
