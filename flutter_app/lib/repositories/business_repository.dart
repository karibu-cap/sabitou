import 'dart:async';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// Repository for business operations and member management
class BusinessRepository {
  final _logger = LoggerApp('BusinessRepository');

  /// The business service client.
  final BusinessServiceClient businessServiceClient;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// Constructs a new [BusinessRepository].
  BusinessRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : businessServiceClient = BusinessServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// The instance of [BusinessRepository].
  static final instance = GetIt.I.get<BusinessRepository>();

  /// Gets a business
  Future<Business?> getBusinessDetails(
    GetBusinessDetailsRequest request,
  ) async {
    try {
      final response = await businessServiceClient.getBusinessDetails(request);

      return response.business;
    } on Exception catch (e) {
      _logger.severe('getBusiness Error: $e');

      return null;
    }
  }

  /// Gets all business members for a business
  Future<List<BusinessMember>> getBusinessMembers(
    GetBusinessMembersRequest request,
  ) async {
    try {
      final response = await businessServiceClient.getBusinessMembers(request);

      return response.businessMembers;
    } on Exception catch (e) {
      _logger.severe('getBusinessMembers Error: $e');

      return [];
    }
  }

  /// Gets a specific business member by user ID and business ID
  Future<BusinessMember?> getBusinessMember(
    String userId,
    String businessId,
  ) async {
    try {
      final response = await businessServiceClient.getBusinessMember(
        GetBusinessMemberRequest()
          ..userId = userId
          ..businessId = businessId,
      );

      return response.businessMember;
    } on Exception catch (e) {
      _logger.severe('getBusinessMember Error: $e');

      return null;
    }
  }

  /// Adds a user to a business
  Future<BusinessMember?> createUserToBusiness(
    CreateUserToBusinessRequest request,
  ) async {
    try {
      final response = await businessServiceClient.createUserToBusiness(
        request,
      );

      return response.businessMember;
    } on Exception catch (e) {
      _logger.severe('addUserToBusiness Error: $e');

      return null;
    }
  }

  /// Removes a user from a business
  Future<bool> removeUserFromBusiness(
    RemoveUserFromBusinessRequest request,
  ) async {
    try {
      final response = await businessServiceClient.removeUserFromBusiness(
        request,
      );

      return response.success;
    } on Exception catch (e) {
      _logger.severe('removeUserFromBusiness Error: $e');

      return false;
    }
  }

  /// Stream business members.
  Stream<List<BusinessMember>> streamBusinessMembers(
    StreamBusinessMembersRequest request,
  ) {
    try {
      // Use the native gRPC streaming service
      final grpcStream = businessServiceClient.streamBusinessMembers(request);

      // Transform the gRPC stream to return List<User>
      return grpcStream.map((response) => response.businessMembers);
    } on Exception catch (e) {
      _logger.severe('streamBusinessMembers Error: $e');

      // Return null stream on error
      return Stream.value([]);
    }
  }

  /// Gets all businesses for a user
  Future<List<Business>> getMyBusinesses(String userId) async {
    try {
      final response = await businessServiceClient.getMyBusinesses(
        GetMyBusinessesRequest(ownerId: userId),
      );

      return response.businesses;
    } on Exception catch (e) {
      _logger.severe('getMyBusinesses Error: $e');

      return [];
    }
  }

  /// Updates a business
  Future<bool> updateBusiness(Business business) async {
    try {
      final response = await businessServiceClient.updateBusiness(
        UpdateBusinessRequest()..business = business,
      );

      return response.success;
    } on Exception catch (e) {
      _logger.severe('updateBusiness Error: $e');

      return false;
    }
  }
}
