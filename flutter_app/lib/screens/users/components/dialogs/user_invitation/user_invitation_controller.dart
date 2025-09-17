import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../users_controller.dart';

/// Controller for managing user invitation modal state and operations.
class UserInvitationModalController extends ChangeNotifier {
  final UsersController _usersController;

  final List<StorePermission> _selectedPermissions = [];

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  bool _isLoading = false;
  String _errorMessage = '';

  /// Controller for the email input field.
  final TextEditingController emailController = TextEditingController();

  /// Constructs a new UserInvitationModalController.
  UserInvitationModalController({required UsersController usersController})
    : _usersController = usersController;

  /// Current selected permissions list
  List<StorePermission> get selectedPermissions =>
      List.unmodifiable(_selectedPermissions);

  /// Whether the modal is currently loading
  bool get isLoading => _isLoading;

  /// Current error message, if any
  String get errorMessage => _errorMessage;

  /// Number of selected permissions
  int get selectedPermissionsCount => _selectedPermissions.length;

  /// Whether the form can be submitted
  bool get canSubmit =>
      emailController.text.trim().isNotEmpty &&
      _selectedPermissions.isNotEmpty &&
      !_isLoading;

  /// Whether a specific permission is selected
  bool isPermissionSelected(
    StoreResourceType resourceType,
    ResourceActionType actionType,
  ) {
    return _selectedPermissions.any(
      (p) => p.resourceType == resourceType && p.actionType == actionType,
    );
  }

  /// Toggle a permission on/off
  void togglePermission(
    StoreResourceType resourceType,
    ResourceActionType actionType,
  ) {
    final existingIndex = _selectedPermissions.indexWhere(
      (p) => p.resourceType == resourceType && p.actionType == actionType,
    );

    if (existingIndex >= 0) {
      _selectedPermissions.removeAt(existingIndex);
    } else {
      _selectedPermissions.add(
        StorePermission(resourceType: resourceType, actionType: actionType),
      );
    }

    notifyListeners();
  }

  /// Send invitation to user
  Future<bool> sendInvitation() async {
    // Validate form first
    if (formKey.currentState?.validate() != true) {
      return false;
    }

    if (emailController.text.trim().isEmpty || _selectedPermissions.isEmpty) {
      return false;
    }

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final success = await _usersController.addUserToStore(
      emailController.text.trim(),
      _selectedPermissions,
    );

    if (!success) {
      _errorMessage = AppInternationalizationService.to.errorSendingInvitation;
      _isLoading = false;
      notifyListeners();

      return false;
    }

    // Reset form on success
    resetForm();
    _isLoading = false;
    notifyListeners();

    return success;
  }

  /// Clear any error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Reset form to initial state
  void resetForm() {
    emailController.clear();
    _selectedPermissions.clear();
    _errorMessage = '';
    notifyListeners();
  }
}
