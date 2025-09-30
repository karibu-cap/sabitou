import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart' as protobuf;
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../users_controller.dart';

/// Controller for managing user permissions modal state and operations.
class UserPermissionsModalController extends ChangeNotifier {
  final UsersController _usersController;
  final StoreMember _originalStoreMember;

  /// Snapshot of the permissions when the modal was opened.
  StorePermissions _baselinePermissions;

  /// The editable permissions object.
  StorePermissions _permissions;

  bool _isLoading = false;
  String _errorMessage = '';

  /// Constructs a new UserPermissionsModalController.
  UserPermissionsModalController({
    required UsersController usersController,
    required StoreMember storeMember,
  }) : _usersController = usersController,
       _baselinePermissions = _clonePermissions(
         storeMember.hasPermissions()
             ? storeMember.permissions
             : StorePermissions(),
       ),
       _permissions = _clonePermissions(
         storeMember.hasPermissions()
             ? storeMember.permissions
             : StorePermissions(),
       ),
       _originalStoreMember = storeMember;

  /// Current permissions object (immutable from outside).
  StorePermissions get permissions => _permissions;

  /// Whether the modal is currently loading.
  bool get isLoading => _isLoading;

  /// Current error message, if any.
  String get errorMessage => _errorMessage;

  /// Original store member data.
  StoreMember get originalStoreMember => _originalStoreMember;

  /// Whether there are unsaved changes.
  bool get hasChanges =>
      !_arePermissionsEqual(_permissions, _baselinePermissions);

  /// Number of selected permissions (total booleans set to true).
  int get selectedPermissionsCount => _countSelectedPermissions();

  /// Helper that counts all true boolean fields inside StorePermissions.
  int _countSelectedPermissions() {
    return _allPermissionFlags(
      _permissions,
    ).where((isEnabled) => isEnabled).length;
  }

  /// Whether a specific permission is selected.
  bool isPermissionSelected(bool Function(StorePermissions) path) {
    return path(_permissions);
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

  /// Save permissions changes.
  Future<bool> savePermissions() async {
    if (!hasChanges) return true;

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await _usersController.updateUserPermissions(
      userId: _originalStoreMember.user.refId,
      permissions: _permissions,
    );

    if (!result) {
      _errorMessage =
          AppInternationalizationService.to.errorUpdatingPermissions;
    }

    if (result) {
      _baselinePermissions = _clonePermissions(_permissions);
    }

    _isLoading = false;
    notifyListeners();

    return result;
  }

  /// Changes user status.
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

  /// Clear any error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Creates a deep copy of permissions ensuring every section is present.
  static StorePermissions _clonePermissions(StorePermissions source) {
    return StorePermissions(
      product: _copyMessage(
        hasValue: source.hasProduct(),
        getter: () => source.product,
        create: StoreProductPermission.new,
      ),
      member: _copyMessage(
        hasValue: source.hasMember(),
        getter: () => source.member,
        create: StoreMemberPermission.new,
      ),
      report: _copyMessage(
        hasValue: source.hasReport(),
        getter: () => source.report,
        create: StoreReportPermission.new,
      ),
      order: _copyMessage(
        hasValue: source.hasOrder(),
        getter: () => source.order,
        create: StoreOrderPermission.new,
      ),
      invoice: _copyMessage(
        hasValue: source.hasInvoice(),
        getter: () => source.invoice,
        create: StoreInvoicePermission.new,
      ),
      supplier: _copyMessage(
        hasValue: source.hasSupplier(),
        getter: () => source.supplier,
        create: StoreSupplierPermission.new,
      ),
      transaction: _copyMessage(
        hasValue: source.hasTransaction(),
        getter: () => source.transaction,
        create: StoreTransactionPermission.new,
      ),
    );
  }

  /// Returns all boolean flags contained in the permissions object.
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

  /// Compares two permissions objects field by field.
  bool _arePermissionsEqual(StorePermissions a, StorePermissions b) {
    final iteratorA = _allPermissionFlags(a).iterator;
    final iteratorB = _allPermissionFlags(b).iterator;

    while (true) {
      final hasNextA = iteratorA.moveNext();
      final hasNextB = iteratorB.moveNext();

      if (hasNextA != hasNextB) {
        return false;
      }

      if (!hasNextA) {
        break;
      }

      if (iteratorA.current != iteratorB.current) {
        return false;
      }
    }

    return true;
  }

  static T _copyMessage<T extends protobuf.GeneratedMessage>({
    required bool hasValue,
    required T Function() getter,
    required T Function() create,
  }) {
    final copy = create();
    if (hasValue) {
      copy.mergeFromMessage(getter());
    }

    return copy;
  }
}
