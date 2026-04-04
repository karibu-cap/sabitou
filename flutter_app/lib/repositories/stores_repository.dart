import 'dart:convert';

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
  Future<bool> addStoreMember({
    required String storeId,
    required String userId,
    required StorePermissions permissions,
  }) async {
    try {
      await dataSource.createRecord(
        table: CollectionName.storeMembers,
        record: fromStoreMembersToRaw(
          StoreMember(
            userId: userId,
            storeId: storeId,
            permissions: permissions,
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
  Future<bool> updateStoreMember({
    required String storeId,
    required String userId,
    StoreMemberStatus? status,
    StorePermissions? permissions,
  }) async {
    try {
      await dataSource.updateWhere(
        table: CollectionName.storeMembers,
        fields: {
          if (permissions != null)
            StoreMembersFields.permissions: jsonEncode(
              permissions.toProto3Json(),
            ),
          if (status != null) StoreMembersFields.status: status.name,
        },
        filters: [
          SqlQuery.equals(StoreMembersFields.userId, userId),
          SqlQuery.equals(StoreMembersFields.storeId, storeId),
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
  Future<bool> removeUserFromStore(String storeId, String userId) async {
    try {
      await dataSource.deleteWhere(
        table: CollectionName.storeMembers,
        filters: [
          SqlQuery.equals(StoreMembersFields.userId, userId),
          SqlQuery.equals(StoreMembersFields.storeId, storeId),
        ],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('removeUserFromStore Error: $e');

      return false;
    }
  }

  /// Stream store members with user data fetched via gRPC.
  Stream<List<({StoreMember storeMember, User user})>> streamStoreMembers(
    String storeId,
  ) {
    try {
      return dataSource
          .watchCollection(
            CollectionName.storeMembers,
            filters: [SqlQuery.equals(StoreMembersFields.storeId, storeId)],
          )
          .asyncMap((rows) async {
            final storeMembers = rows.map(fromRowToStoreMembers).toList();
            if (storeMembers.isEmpty) {
              return <({StoreMember storeMember, User user})>[];
            }

            final userIds = storeMembers.map((m) => m.userId).toList();
            final users = await getUsersByIds(userIds);
            final userMap = {for (final u in users) u.refId: u};

            final combined = storeMembers
                .map((member) {
                  final user = userMap[member.userId];
                  if (user == null) {
                    _logger.warning(
                      'User ${member.userId} not found for store member',
                    );

                    return null;
                  }

                  return (storeMember: member, user: user);
                })
                .whereType<({StoreMember storeMember, User user})>()
                .toList();

            return combined;
          });
    } on Exception catch (e) {
      _logger.severe('streamStoreMembers Error: $e');

      return Stream.value([]);
    }
  }

  /// Gets users by their IDs from local database.
  Future<List<User>> getUsersByIds(List<String> userIds) async {
    try {
      if (userIds.isEmpty) return [];

      final rows = await dataSource.getCollection(
        CollectionName.users,
        filters: [SqlQuery.whereIn(UsersFields.refId, userIds)],
      );

      return rows.map(fromRowToUser).toList();
    } on Exception catch (e) {
      _logger.severe('getUsersByIds Error: $e');

      return [];
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
