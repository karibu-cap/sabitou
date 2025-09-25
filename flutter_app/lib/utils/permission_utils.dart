import 'package:sabitou_rpc/models.dart';

import 'user_preference.dart';

/// Utility class for checking user permissions on resources using StorePermission data.
class PermissionChecker {
  /// Checks if the user can read the given store resource.
  static bool canReadResourceFromStore(StoreResourceType resource) {
    return _hasStorePermission(
      resource,
      ResourceActionType.RESOURCE_ACTION_TYPE_READ,
    );
  }

  /// Checks if the user can update the given store resource.
  static bool canUpdateResourceFromStore(StoreResourceType resource) {
    return _hasStorePermission(
      resource,
      ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
    );
  }

  /// Checks if the user can add to the given store resource.
  static bool canAddResourceFromStore(StoreResourceType resource) {
    return _hasStorePermission(
      resource,
      ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
    );
  }

  /// Checks if the user can remove the given store resource.
  static bool canRemoveResourceFromStore(StoreResourceType resource) {
    return _hasStorePermission(
      resource,
      ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
    );
  }

  /// Internal method to check store permissions.
  static bool _hasStorePermission(
    StoreResourceType resource,
    ResourceActionType action,
  ) {
    final storeMember = UserPreferences.instance.storeMember;
    if (storeMember == null ||
        storeMember.permissions.isEmpty ||
        storeMember.status != StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE) {
      return false;
    }

    final higherActions = _getHigherActions(action);

    for (final permission in storeMember.permissions) {
      if (permission.resourceType == resource &&
          higherActions.contains(permission.actionType)) {
        return true;
      }
    }

    return false;
  }

  /// Checks if the user can read the given business resource.
  static bool canReadResourceFromBusiness(BusinessResourceType resource) {
    return _hasBusinessPermission(
      resource,
      ResourceActionType.RESOURCE_ACTION_TYPE_READ,
    );
  }

  /// Checks if the user can update the given business resource.
  static bool canUpdateResourceFromBusiness(BusinessResourceType resource) {
    return _hasBusinessPermission(
      resource,
      ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
    );
  }

  /// Checks if the user can add to the given business resource.
  static bool canAddToResourceFromBusiness(BusinessResourceType resource) {
    return _hasBusinessPermission(
      resource,
      ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
    );
  }

  /// Checks if the user can remove the given business resource.
  static bool canRemoveResourceFromBusiness(BusinessResourceType resource) {
    return _hasBusinessPermission(
      resource,
      ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
    );
  }

  /// Internal method to check business permissions.
  static bool _hasBusinessPermission(
    BusinessResourceType resource,
    ResourceActionType action,
  ) {
    final businessMember = UserPreferences.instance.businessMember;
    if (businessMember == null ||
        businessMember.permissions.isEmpty ||
        businessMember.status !=
            BusinessMemberStatus.BUSINESS_MEMBER_STATUS_ACTIVE) {
      return false;
    }

    final higherActions = _getHigherActions(action);

    for (final permission in businessMember.permissions) {
      if (permission.resourceType == resource &&
          higherActions.contains(permission.actionType)) {
        return true;
      }
    }

    return false;
  }
}

/// Extension on StoreMember for easier permission checks.
extension StoreMemberPermission on StoreMember {
  /// Checks if the store member can read the given resource (implicit if higher permission granted).
  bool canReadResource(StoreResourceType resource) {
    return permissions.any(
      (p) =>
          p.resourceType == resource &&
          _getHigherActions(
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ).contains(p.actionType),
    );
  }

  /// Checks if the store member can update the given resource (implicit if REMOVE granted).
  bool canUpdateResource(StoreResourceType resource) {
    return permissions.any(
      (p) =>
          p.resourceType == resource &&
          _getHigherActions(
            ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ).contains(p.actionType),
    );
  }

  /// Checks if the store member can add to the given resource (implicit if UPDATE or REMOVE granted).
  bool canAddResource(StoreResourceType resource) {
    return permissions.any(
      (p) =>
          p.resourceType == resource &&
          _getHigherActions(
            ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
          ).contains(p.actionType),
    );
  }

  /// Checks if the store member can remove the given resource.
  bool canRemoveResource(StoreResourceType resource) {
    return permissions.any(
      (p) =>
          p.resourceType == resource &&
          p.actionType == ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
    );
  }

  /// Checks if the store member has any permission for the resource.
  bool storeMemberHasAnyPermissionForResource(StoreResourceType resource) {
    return permissions.any((p) => p.resourceType == resource);
  }
}

/// Extension on BusinessMember for easier permission checks.
extension BusinessMemberPermission on BusinessMember {
  /// Checks if the business member can read the given business resource (implicit if higher permission granted).
  bool canReadResource(BusinessResourceType resource) {
    return permissions.any(
      (p) =>
          p.resourceType == resource &&
          _getHigherActions(
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ).contains(p.actionType),
    );
  }

  /// Checks if the business member can update the given business resource (implicit if REMOVE granted).
  bool canUpdateResource(BusinessResourceType resource) {
    return permissions.any(
      (p) =>
          p.resourceType == resource &&
          _getHigherActions(
            ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ).contains(p.actionType),
    );
  }

  /// Checks if the business member can add to the given business resource (implicit if UPDATE or REMOVE granted).
  bool canAddResource(BusinessResourceType resource) {
    return permissions.any(
      (p) =>
          p.resourceType == resource &&
          _getHigherActions(
            ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
          ).contains(p.actionType),
    );
  }

  /// Checks if the business member can remove the given business resource.
  bool canRemoveResource(BusinessResourceType resource) {
    return permissions.any(
      (p) =>
          p.resourceType == resource &&
          p.actionType == ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
    );
  }

  /// Checks if the business member has any permission for the business resource.
  bool businessMemberHasAnyPermissionForResource(
    BusinessResourceType resource,
  ) {
    return permissions.any((p) => p.resourceType == resource);
  }
}

/// Gets higher actions for hierarchy.
List<ResourceActionType> _getHigherActions(ResourceActionType action) {
  switch (action) {
    case ResourceActionType.RESOURCE_ACTION_TYPE_READ:
      return [
        ResourceActionType.RESOURCE_ACTION_TYPE_READ,
        ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
        ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
        ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
      ];
    case ResourceActionType.RESOURCE_ACTION_TYPE_ADD:
      return [
        ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
        ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
        ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
      ];
    case ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE:
      return [
        ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
        ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
      ];
    case ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE:
      return [ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE];
    default:
      return [];
  }
}
