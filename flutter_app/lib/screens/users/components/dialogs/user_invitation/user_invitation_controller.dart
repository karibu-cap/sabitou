import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../users_controller.dart';

/// Onboarding type chosen by the admin.
enum OnboardingType {
  /// Admin sets credentials directly — user is ACTIVE immediately.
  direct,

  /// Admin supplies only email — invitation email is sent, user is PENDING.
  invite,
}

/// Controller for managing user invitation/creation modal state and operations.
class UserInvitationModalController extends ChangeNotifier {
  final UsersController _usersController;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The permissions object for the new user.
  StorePermissions _permissions = _createEmptyPermissions();

  bool _isLoading = false;
  String _errorMessage = '';

  /// Selected onboarding mode.
  OnboardingType _onboardingType = OnboardingType.direct;

  /// Controller for the email input field (both flows).
  final TextEditingController emailController = TextEditingController();

  /// Controller for the username field (Direct flow only).
  final TextEditingController userNameController = TextEditingController();

  /// Controller for the temporary password field (Direct flow only).
  final TextEditingController temporaryPasswordController =
      TextEditingController();

  /// Whether the admin wants to force a password change on first login (Direct).
  bool forcePasswordChange = false;

  /// Constructs a new [UserInvitationModalController].
  UserInvitationModalController({required UsersController usersController})
    : _usersController = usersController {
    emailController.addListener(_onFieldChanged);
    userNameController.addListener(_onFieldChanged);
    temporaryPasswordController.addListener(_onFieldChanged);
  }

  /// Whether the form can be submitted.
  bool get canSubmit {
    if (_isLoading) return false;
    if (!_hasAnyPermissionSelected()) return false;
    final email = emailController.text.trim();
    if (email.isEmpty) return false;
    if (isDirect) {
      final userName = userNameController.text.trim();
      final password = temporaryPasswordController.text;
      return userName.isNotEmpty && password.length >= 8;
    }

    return true;
  }

  /// Current error message, if any.
  String get errorMessage => _errorMessage;

  /// Whether the Direct mode is selected.
  bool get isDirect => _onboardingType == OnboardingType.direct;

  /// Whether the modal is currently loading.
  bool get isLoading => _isLoading;

  /// Currently selected onboarding type.
  OnboardingType get onboardingType => _onboardingType;

  /// Current permissions object.
  StorePermissions get permissions => _permissions;

  /// Number of permissions selected.
  int get selectedPermissionsCount => _countSelectedPermissions();

  /// Clear any error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  @override
  void dispose() {
    emailController
      ..removeListener(_onFieldChanged)
      ..dispose();
    userNameController
      ..removeListener(_onFieldChanged)
      ..dispose();
    temporaryPasswordController
      ..removeListener(_onFieldChanged)
      ..dispose();
    super.dispose();
  }

  /// Whether all permissions in a group are selected.
  bool isGroupSelected(List<bool Function(StorePermissions)> paths) {
    return paths.every((path) => path(_permissions));
  }

  /// Whether a specific permission is selected.
  bool isPermissionSelected(bool Function(StorePermissions) path) {
    return path(_permissions);
  }

  /// Reset form to initial state.
  void resetForm() {
    emailController.clear();
    userNameController.clear();
    temporaryPasswordController.clear();
    forcePasswordChange = true;
    _permissions = _createEmptyPermissions();
    _errorMessage = '';
    notifyListeners();
  }

  /// Switches the onboarding type and notifies listeners.
  void selectOnboardingType(OnboardingType type) {
    if (_onboardingType == type) return;
    _onboardingType = type;
    notifyListeners();
  }

  /// Submit the form — dispatches to the right flow based on [_onboardingType].
  Future<bool> submit() async {
    if (formKey.currentState?.validate() != true) return false;
    if (!canSubmit) return false;

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final success = isDirect
        ? await _usersController.createUserDirect(
            email: emailController.text.trim(),
            userName: userNameController.text.trim(),
            temporaryPassword: temporaryPasswordController.text,
            permissions: _permissions,
            forcePasswordChange: forcePasswordChange,
          )
        : await _usersController.inviteUser(
            email: emailController.text.trim(),
            permissions: _permissions,
          );

    if (!success) {
      _errorMessage = isDirect
          ? AppInternationalizationService.to.errorCreatingUser
          : AppInternationalizationService.to.errorSendingInvitation;
      _isLoading = false;
      notifyListeners();

      return false;
    }

    resetForm();
    _isLoading = false;
    notifyListeners();

    return true;
  }

  /// Toggles the forcePasswordChange checkbox (Direct flow only).
  void toggleForcePasswordChange() {
    forcePasswordChange = !forcePasswordChange;
    notifyListeners();
  }

  /// Toggle all permissions in a group on/off.
  void toggleGroup(
    List<
      (
        bool Function(StorePermissions) path,
        void Function(StorePermissions, bool) set,
      )
    >
    items,
    bool value,
  ) {
    for (final (_, set) in items) {
      set(_permissions, value);
    }
    notifyListeners();
  }

  /// Toggle a specific permission on/off.
  void togglePermission(
    bool Function(StorePermissions) path,
    void Function(StorePermissions, bool) set,
  ) {
    final current = path(_permissions);
    set(_permissions, !current);
    notifyListeners();
  }

  Iterable<bool> _allPermissionFlags(StorePermissions permissions) sync* {
    final product = permissions.product;
    yield product.readProductInInventory;
    yield product.createProductInInventory;
    yield product.updateProductInInventory;
    yield product.deleteProductInInventory;

    final member = permissions.member;
    yield member.readInformation;
    yield member.inviteMember;
    yield member.updateMember;
    yield member.deleteMember;

    yield permissions.report.readReport;

    final order = permissions.order;
    yield order.readOrder;
    yield order.createOrder;

    final invoice = permissions.invoice;
    yield invoice.readInvoice;
    yield invoice.createInvoice;

    final supplier = permissions.supplier;
    yield supplier.readSupplier;
    yield supplier.createSupplier;
    yield supplier.updateSupplier;
    yield supplier.deleteSupplier;

    final transaction = permissions.transaction;
    yield transaction.readTransaction;
    yield transaction.createTransaction;
    yield transaction.updateTransaction;
  }

  int _countSelectedPermissions() =>
      _allPermissionFlags(_permissions).where((v) => v).length;

  bool _hasAnyPermissionSelected() => selectedPermissionsCount > 0;

  void _onFieldChanged() => notifyListeners();

  static StorePermissions _createEmptyPermissions() {
    return StorePermissions(
      product: StoreProductPermission(),
      member: StoreMemberPermission(),
      report: StoreReportPermission(),
      order: StoreOrderPermission(),
      invoice: StoreInvoicePermission(),
      supplier: StoreSupplierPermission(),
      transaction: StoreTransactionPermission(),
    );
  }
}
