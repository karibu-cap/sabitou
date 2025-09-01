import 'package:sabitou_rpc/models.dart';

import '../repositories/business_repository.dart';
import 'user_preference.dart';

/// Checks user permissions.
Future<bool> hasPermission(
  ResourceType resourceType,
  ResourceActionType actionType,
) async {
  final userId = UserPreferences.instance.user?.refId;
  final businessId = UserPreferences.instance.business?.refId;

  if (userId == null || businessId == null) return false;
  final businessMemberRepository = BusinessRepository.instance;
  final member = await businessMemberRepository
      .getBusinessMembersByBusinessRefId(businessId, userId);
  if (member == null) return false;

  return member.permissions.any(
    (p) => p.resourceType == resourceType && p.actionType == actionType,
  );
}
