import 'package:flutter/foundation.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../users_controller.dart';

/// Controller for managing user permissions modal state and operations.
class UserPermissionsModalController extends ChangeNotifier {
  final UsersController _usersController;
  final StoreMember _originalStoreMember;

  List<StorePermission> _permissions = [];
  bool _isLoading = false;
  String _errorMessage = '';

  /// Constructs a new UserPermissionsModalController.
  UserPermissionsModalController({
    required UsersController usersController,
    required StoreMember storeMember,
  }) : _usersController = usersController,
       _originalStoreMember = storeMember {
    _permissions = List.from(storeMember.permissions);
  }

  /// Current permissions list
  List<StorePermission> get permissions => List.unmodifiable(_permissions);

  /// Whether the modal is currently loading
  bool get isLoading => _isLoading;

  /// Current error message, if any
  String get errorMessage => _errorMessage;

  /// Original store member data
  StoreMember get originalStoreMember => _originalStoreMember;

  /// Whether there are unsaved changes
  bool get hasChanges {
    if (_permissions.length != _originalStoreMember.permissions.length) {
      return true;
    }

    for (final permission in _permissions) {
      if (!_originalStoreMember.permissions.any(
        (p) =>
            p.resourceType == permission.resourceType &&
            p.actionType == permission.actionType,
      )) {
        return true;
      }
    }

    return false;
  }

  /// Number of selected permissions
  int get selectedPermissionsCount => _permissions.length;

  /// Whether a specific permission is selected
  bool isPermissionSelected(
    StoreResourceType resourceType,
    ResourceActionType actionType,
  ) {
    return _permissions.any(
      (p) => p.resourceType == resourceType && p.actionType == actionType,
    );
  }

  /// Toggle a permission on/off
  void togglePermission(
    StoreResourceType resourceType,
    ResourceActionType actionType,
  ) {
    final existingIndex = _permissions.indexWhere(
      (p) => p.resourceType == resourceType && p.actionType == actionType,
    );

    if (existingIndex >= 0) {
      _permissions.removeAt(existingIndex);
    } else {
      _permissions.add(
        StorePermission(resourceType: resourceType, actionType: actionType),
      );
    }

    notifyListeners();
  }

  /// Save permissions changes
  Future<bool> savePermissions() async {
    if (!hasChanges) return true;

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    // Calculate permissions to add and remove
    final addPermissions = _permissions
        .where(
          (permission) => !_originalStoreMember.permissions.any(
            (p) =>
                p.resourceType == permission.resourceType &&
                p.actionType == permission.actionType,
          ),
        )
        .toList();

    final removePermissions = _originalStoreMember.permissions
        .where(
          (permission) => !_permissions.any(
            (p) =>
                p.resourceType == permission.resourceType &&
                p.actionType == permission.actionType,
          ),
        )
        .toList();

    final result = await _usersController.updateUserPermissions(
      userId: _originalStoreMember.user.refId,
      addPermissions: addPermissions.isEmpty ? null : addPermissions,
      removePermissions: removePermissions.isEmpty ? null : removePermissions,
    );

    if (!result) {
      _errorMessage =
          AppInternationalizationService.to.errorUpdatingPermissions;
    }

    _isLoading = false;
    notifyListeners();

    return result;
  }

  /// Changes user status
  Future<bool> changeUserStatus(StoreMemberStatus newStatus) async {
    if (_originalStoreMember.status == newStatus) {
      return true;
    }

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await _usersController.updateUserStatus(
      userId: _originalStoreMember.user.refId,
      newStatus: newStatus,
    );

    if (!result) {
      _errorMessage = AppInternationalizationService.to.errorUpdatingStatus;
    }
    _isLoading = false;
    notifyListeners();

    return result;
  }

  /// Clear any error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
