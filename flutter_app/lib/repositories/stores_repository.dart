import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';

/// Repository for store operations and member management
final class StoresRepository extends BaseRepository<Store> {
  final _logger = LoggerApp('StoresRepository');

  /// The store service client.
  final StoreServiceClient storeServiceClient;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.stores;

  /// The instance of [StoresRepository].
  static StoresRepository get instance => GetIt.I.get<StoresRepository>();

  @override
  Store fromRow(RawRow row) => fromRowToStore(row);

  @override
  RawRow toRow(Store entity) => fromStoreToRaw(entity);

  /// Constructs a new [StoresRepository].
  StoresRepository({required this.dataSource})
    : storeServiceClient = StoreServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets all stores base on business Id.
  Future<List<Store>> getStoresByBusinessId(String businessId) async {
    try {
      final response = await findWhere([
        SqlQuery.equals(StoresFields.businessId, businessId),
      ]);

      return response;
    } on Exception catch (e) {
      _logger.severe('getStoresByBusinessId Error: $e');

      return [];
    }
  }

  /// Get the store by ref.
  Future<Store?> getStoreByRefId(String refId) async {
    try {
      final response = await findById(refId);

      return response;
    } on Exception catch (e) {
      _logger.severe('getStoreByRefId Error: $e');

      return null;
    }
  }

  /// Adds a new store member.
  Future<bool> addStoreMember(AddUserToStoreRequest request) async {
    try {
      await dataSource.createRecord(
        table: CollectionName.storeMembers,
        record: fromStoreMembersToRaw(
          StoreMember(
            userId: request.userId,
            storeId: request.storeId,
            permissions: request.permissions,
            memberSince: Timestamp.fromDateTime(DateTime.now()),
          ),
        ),
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('addStoreMember Error: $e');

      return false;
    }
  }

  /// Updates an user from a store.
  Future<bool> updateStoreMember(UpdateStoreMemberRequest request) async {
    try {
      await dataSource.updateWhere(
        table: CollectionName.storeMembers,
        fields: fromStoreMembersToRaw(
          StoreMember(
            userId: request.userId,
            storeId: request.storeId,
            permissions: request.permissions,
            status: request.status,
          ),
        ),
        filters: [
          SqlQuery.equals(StoreMembersFields.userId, request.userId),
          SqlQuery.equals(StoreMembersFields.storeId, request.storeId),
        ],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateStoreMember Error: $e');

      return false;
    }
  }

  /// Removes an user from a business.
  /// NOTE: This action can be perform with [storeServiceClient].
  Future<bool> removeUserFromStore(RemoveUserFromStoreRequest request) async {
    try {
      await dataSource.deleteWhere(
        table: CollectionName.storeMembers,
        filters: [
          SqlQuery.equals(StoreMembersFields.userId, request.userId),
          SqlQuery.equals(StoreMembersFields.storeId, request.storeId),
        ],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('removeUserFromStore Error: $e');

      return false;
    }
  }

  /// Gets the members of a store.
  Future<List<StoreMember>> getStoreMembers(
    GetStoreMembersRequest request,
  ) async {
    try {
      final rows = await dataSource.getCollection(
        CollectionName.storeMembers,
        filters: [SqlQuery.equals(StoreMembersFields.storeId, request.storeId)],
      );

      return rows.map(fromRowToStoreMembers).toList();
    } on Exception catch (e) {
      _logger.severe('getStoreMembers Error: $e');

      return [];
    }
  }

  /// Stream store members.
  Stream<List<StoreMember>> streamStoreMembers(
    StreamStoreMembersRequest request,
  ) {
    try {
      return dataSource
          .watchCollection(
            CollectionName.storeMembers,
            filters: [
              SqlQuery.equals(StoreMembersFields.storeId, request.storeId),
            ],
          )
          .map((rows) => rows.map(fromRowToStoreMembers).toList());
    } on Exception catch (e) {
      _logger.severe('streamStoreMembers Error: $e');
      // Return null stream on error

      return Stream.value([]);
    }
  }

  /// Updates a store.
  Future<bool> updateStore(Store store) async {
    try {
      await updateWhere(
        fields: fromStoreToRaw(store),
        filters: [SqlQuery.equals(StoresFields.refId, store.refId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateStore Error: $e');

      return false;
    }
  }
}
