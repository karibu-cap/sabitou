import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The business repository.
class BusinessRepository {
  final _logger = LoggerApp('BusinessRepository');

  /// The business service client.
  final BusinessServiceClient businessServiceClient;

  /// Constructs a new [BusinessRepository].
  BusinessRepository()
    : businessServiceClient = BusinessServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// The instance of [BusinessRepository].
  static final instance = GetIt.I.get<BusinessRepository>();

  /// Gets the business by ref.
  Future<Business?> getBusinessByRefId(String refId) async {
    try {
      final response = await businessServiceClient.getBusinessDetails(
        GetBusinessDetailsRequest(businessId: refId),
      );

      return response.business;
    } on Exception catch (e) {
      _logger.severe('getBusinessByRefId Error: $e');

      return null;
    }
  }

  /// Gets the business members by business ref.
  Future<BusinessMember?> getBusinessMembersByBusinessRefId(
    String businessId,
    String userId,
  ) async {
    try {
      final response = await businessServiceClient.getBusinessMembers(
        GetBusinessMembersRequest(businessId: businessId),
      );

      return response.businessMembers.firstWhereOrNull(
        (bm) => bm.businessId == businessId && bm.userId == userId,
      );
    } on Exception catch (e) {
      _logger.severe('getBusinessMembersByBusinessRefId Error: $e');

      return null;
    }
  }
}
