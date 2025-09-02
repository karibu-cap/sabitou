import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';

/// The business repository.
final class BusinessRepository extends GetxService {
  /// The business service client.
  final BusinessServiceClient businessServiceClient;

  /// Constructs a new [BusinessRepository].
  BusinessRepository()
    : businessServiceClient = BusinessServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// The instance of [BusinessRepository].
  static final instance = Get.find<BusinessRepository>();

  /// Gets the business by ref.
  Future<Business?> getBusinessByRefId(String refId) async {
    try {
      final response = await businessServiceClient.getBusinessDetails(
        GetBusinessDetailsRequest(businessId: refId),
      );

      return response.business;
    } catch (e) {
      debugPrint(e.toString());

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
    } catch (e) {
      debugPrint(e.toString());
      print(e);

      return null;
    }
  }
}
