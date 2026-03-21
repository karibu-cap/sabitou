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

/// Repository for business operations and member management
final class BusinessRepository extends BaseRepository<Business> {
  final _logger = LoggerApp('BusinessRepository');

  /// The [BusinessServiceClient] implementation.
  final BusinessServiceClient businessServiceClient;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.businesses;

  /// Buisness repo instence.
  static BusinessRepository get instance => GetIt.I.get<BusinessRepository>();

  @override
  Business fromRow(RawRow row) => fromRowToBusiness(row);

  @override
  RawRow toRow(Business entity) => fromBusinessToRaw(entity);

  /// Constructs an [BusinessRepository].
  BusinessRepository({required this.dataSource})
    : businessServiceClient = BusinessServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets a business from cache.
  Future<Business?> getBusinessDetails(
    GetBusinessDetailsRequest request,
  ) async {
    try {
      final response = await findById(request.businessId);

      return response;
    } on Exception catch (e) {
      _logger.severe('Error fetching business from server: $e');

      return null;
    }
  }

  /// Gets all business members for a business
  Future<List<BusinessMember>> getBusinessMembers(
    GetBusinessMembersRequest request,
  ) async {
    try {
      final members = await dataSource.getCollection(
        CollectionName.businessMembers,
        filters: [
          SqlQuery.equals(BusinessMembersFields.businessId, request.businessId),
        ],
      );

      return members.map(fromRowToBusinessMembers).toList();
    } on Exception catch (e) {
      _logger.severe('Error getting business members: $e');

      return [];
    }
  }

  /// Gets all businesses for a user
  Future<List<Business>> getMyBusinesses(String userId) async {
    try {
      final response = await findWhere([
        SqlQuery.equals(BusinessesFields.ownerId, userId),
      ]);

      return response;
    } on Exception catch (e) {
      _logger.severe('Error getting my businesses: $e');

      return [];
    }
  }

  /// Updates a business
  Future<bool> updateBusiness(Business business) async {
    try {
      await updateWhere(
        fields: fromBusinessToRaw(business),
        filters: [SqlQuery.equals(BusinessesFields.refId, business.refId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateBusiness Error: $e');

      return false;
    }
  }
}
