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
      final result =  await findWhere([
        SqlQuery.equals(ReceivingNotesFields.storeId, storeId),
        if (purchaseOrderId != null)
          SqlQuery.equals(
            ReceivingNotesFields.relatedPurchaseOrderId,
            purchaseOrderId,
          ),
      ]);

      for (final item in result) {
        final result = await findItemsByReceiveNoteId(item.refId, item.storeId);
        item.items.clear();
        item.items.addAll(result);
        
      }

      return result;

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

  /// Watches a single receiving note by [refId] with its line items.
  Stream<ReceivingNote?> watchReceivingNote(String refId) {
    try {
      // Watch both the receiving note and its items, then combine them
      final noteStream = dataSource.watchDocument(
        CollectionName.receivingNotes,
        refId,
        primaryKey: ReceivingNotesFields.refId,
      ).map((row) => row != null ? fromRow(row) : null);
      
      final itemsStream = dataSource.watchCollection(
        CollectionName.receivingNoteLineItems,
        filters: [SqlQuery.equals(ReceivingNoteLineItemsFields.receivingNoteId, refId)],
      );
      
      return Rx.combineLatest2(
        noteStream,
        itemsStream,
        (note, itemsRows) async {
          if (note == null) return null;
          final items = itemsRows.map(fromRowToReceivingNoteLineItem).toList();
          note.items.clear();
          note.items.addAll(items);

          return note;
        },
      ).asyncMap((future) => future);
    } on Exception catch (e) {
      _logger.severe('watchReceivingNote Error: $e');

      return Stream.value(null);
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

     final result = watchWhere([
      SqlQuery.equals(ReceivingNotesFields.storeId, storeId),
      if (purchaseOrderId != null)
        SqlQuery.equals(ReceivingNotesFields.relatedPurchaseOrderId, purchaseOrderId),
    ]);

    return result.asyncMap((po) async {
      for (final item in po) {
        final result = await findItemsByReceiveNoteId(item.refId, item.storeId);
        item.items.clear();
        item.items.addAll(result);
        
      }

      return po;
    });

  }


  /// Returns all line items for the given receive note order.
  Future<List<ReceivingNoteLineItem>> findItemsByReceiveNoteId(
    String receivingNoteId,
    String storeId,
  ) async {
    try {
      final result = await dataSource.getCollection(
        CollectionName.receivingNoteLineItems,
        filters: [
          SqlQuery.equals(ReceivingNoteLineItemsFields.receivingNoteId, receivingNoteId),
          SqlQuery.equals(BillLineItemsFields.storeId, storeId),
        ],
      );

      return result.map(fromRowToReceivingNoteLineItem).toList();
    } on Exception catch (e) {
      _logger.severe('findItemsByReceiveNoteId Error: $e');

      return [];
    }
  }
}
