import 'package:flutter/foundation.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../users_controller.dart';

/// Controller for managing user deletion confirmation modal state and operations.
class UserDeletionModalController extends ChangeNotifier {
  final UsersController _usersController;
  final StoreMember _storeMember;

  bool _isLoading = false;
  String _errorMessage = '';
  String _confirmationText = '';

  /// Constructs a new UserDeletionModalController.
  UserDeletionModalController({
    required UsersController usersController,
    required StoreMember storeMember,
  }) : _usersController = usersController,
       _storeMember = storeMember;

  /// Whether the modal is currently loading
  bool get isLoading => _isLoading;

  /// Current error message, if any
  String get errorMessage => _errorMessage;

  /// Store member to be deleted
  StoreMember get storeMember => _storeMember;

  /// Confirmation text entered by user
  String get confirmationText => _confirmationText;

  /// Expected confirmation text
  String get expectedConfirmationText =>
      AppInternationalizationService.to.delete.toUpperCase();

  /// Whether the confirmation text is correct
  bool get isConfirmationValid =>
      _confirmationText.trim().toUpperCase() == expectedConfirmationText;

  /// Whether the deletion can be performed
  bool get canDelete => isConfirmationValid && !_isLoading;

  /// Update confirmation text
  void updateConfirmationText(String value) {
    _confirmationText = value;
    notifyListeners();
  }

  /// Delete the user from the business
  Future<bool> deleteUser() async {
    if (!canDelete) return false;

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final sucess = await _usersController.removeUserFromStore(
      _storeMember.user.refId,
    );

    if (!sucess) {
      _isLoading = false;
      notifyListeners();
      _errorMessage = AppInternationalizationService.to.errorDuringDeletion;

      return false;
    }

    _isLoading = false;
    _errorMessage = '';
    notifyListeners();

    return sucess;
  }

  /// Clear any error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
