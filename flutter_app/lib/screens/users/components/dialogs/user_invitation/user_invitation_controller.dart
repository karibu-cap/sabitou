import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../users_controller.dart';

/// Controller for managing user invitation modal state and operations.
class UserInvitationModalController extends ChangeNotifier {
  final UsersController _usersController;

  /// The permissions object for the invited user.
  StorePermissions _permissions = _createEmptyPermissions();

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  bool _isLoading = false;
  String _errorMessage = '';

  /// Controller for the email input field.
  final TextEditingController emailController = TextEditingController();

  /// Constructs a new UserInvitationModalController.
  UserInvitationModalController({required UsersController usersController})
    : _usersController = usersController {
    emailController.addListener(_onEmailChanged);
  }

  /// Current permissions object (immutable from outside).
  StorePermissions get permissions => _permissions;

  /// Whether the modal is currently loading.
  bool get isLoading => _isLoading;

  /// Current error message, if any.
  String get errorMessage => _errorMessage;

  /// Number of selected permissions (total booleans set to true across all groups).
  int get selectedPermissionsCount => _countSelectedPermissions();

  /// Whether the form can be submitted.
  bool get canSubmit {
    final hasEmail = emailController.text.trim().isNotEmpty;
    final hasPermissions = _hasAnyPermissionSelected();
    final isLoading = _isLoading;

    return hasEmail && hasPermissions && !isLoading;
  }

  /// Returns true if at least one permission is selected.
  bool _hasAnyPermissionSelected() => selectedPermissionsCount > 0;

  /// Helper that counts all true boolean fields inside StorePermissions.
  int _countSelectedPermissions() {
    return _allPermissionFlags(
      _permissions,
    ).where((isEnabled) => isEnabled).length;
  }

  void _onEmailChanged() {
    notifyListeners();
  }

  /// Returns all boolean flags contained in StorePermissions.
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

  /// Whether a specific permission is selected.
  /// [path] is a function that returns the boolean field inside StorePermissions.
  bool isPermissionSelected(bool Function(StorePermissions) path) {
    return path(_permissions);
  }

  /// Toggle a specific permission on/off.
  /// [path] is used to read the current value, [set] applies the new value.
  void togglePermission(
    bool Function(StorePermissions) path,
    void Function(StorePermissions, bool) set,
  ) {
    final current = path(_permissions);
    set(_permissions, !current);
    notifyListeners();
  }

  /// Send invitation to user.
  Future<bool> sendInvitation() async {
    // Validate form first
    if (formKey.currentState?.validate() != true) {
      return false;
    }

    if (emailController.text.trim().isEmpty || !_hasAnyPermissionSelected()) {
      return false;
    }

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final success = await _usersController.addUserToStore(
      emailController.text.trim(),
      _permissions,
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

  /// Clear any error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Reset form to initial state.
  void resetForm() {
    emailController.clear();
    _permissions = _createEmptyPermissions();
    _errorMessage = '';
    notifyListeners();
  }

  @override
  void dispose() {
    emailController
      ..removeListener(_onEmailChanged)
      ..dispose();
    super.dispose();
  }

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
