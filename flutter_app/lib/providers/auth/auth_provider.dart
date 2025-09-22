import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/auth_repository.dart';
import '../../repositories/business_repository.dart';
import '../../repositories/stores_repository.dart';
import '../../services/data_sync/data_sync_service.dart';
import '../../services/rpc/fake_transport/auth.dart';
import '../../utils/user_preference.dart';

/// Auth status.
enum AuthStatus {
  /// Unauthenticated status.
  unauthenticated,

  /// Authenticating status.
  authenticating,

  /// Authenticated status.
  authenticated,

  /// Authentication failed status.
  authenticationFailed,
}

/// Auth provider.
class AuthProvider extends ChangeNotifier {
  /// Reactive state.
  User? _currentUser;
  AuthStatus _status = AuthStatus.unauthenticated;
  String? _errorMessage;
  final AuthRepository _authRepository = AuthRepository(
    transport: authFakeTransport,
  );
  final _dataSyncService = GetIt.I.get<DataSyncService>();
  final _businessRepository = GetIt.I.get<BusinessRepository>();
  final _storesRepository = GetIt.I.get<StoresRepository>();

  /// Singleton access.
  static AuthProvider get instance => GetIt.I.get<AuthProvider>();

  /// Current user.
  User? get currentUser => _currentUser;

  /// The status.
  AuthStatus get status => _status;

  /// The error message (for direct value access).
  String? get errorMessage => _errorMessage;

  /// The error message as an observable (for Obx).
  String? get errorMessageRx => _errorMessage;

  /// Whether user is authenticated.
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  /// Login logic.
  Future<bool> login(String email, String password) async {
    _setStatus(AuthStatus.authenticating);
    _errorMessage = null;

    _setStatus(AuthStatus.authenticating);
    final loginRequest = LoginRequest()
      ..email = email
      ..password = password;
    final response = await _authRepository.login(request: loginRequest);
    _currentUser = response;
    if (response != null) {
      await UserPreferences.instance.saveUserPreferences(user: response);
      _setStatus(AuthStatus.authenticated);

      // Save business and store after successful login
      await saveBusinessAndStore(response);

      /// Initialize data sync after successful login.
      await initializeDataSync();

      return true;
    }
    _setStatus(AuthStatus.authenticationFailed);

    return false;
  }

  /// Logout logic.
  Future<void> logout() async {
    // Stop and dispose data sync on logout.
    _dataSyncService
      ..stopSync()
      ..dispose();

    _currentUser = null;
    _errorMessage = null;

    _setStatus(AuthStatus.unauthenticated);
  }

  /// Register logic.
  Future<bool> register({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    required String firstName,
    required String lastName,
  }) async {
    _setStatus(AuthStatus.authenticating);
    final registerRequest = RegisterRequest()
      ..userName = userName
      ..password = password
      ..email = email;
    final response = await _authRepository.register(request: registerRequest);

    _currentUser = response;
    if (response != null) {
      await UserPreferences.instance.saveUserPreferences(user: response);
      _setStatus(AuthStatus.authenticated);

      // Save business and store after successful register
      await saveBusinessAndStore(response);

      /// Initialize data sync after successful register.
      await initializeDataSync();

      return true;
    }
    _setStatus(AuthStatus.authenticationFailed);

    return false;
  }

  /// Forgot password logic.
  Future<bool> forgetPassword(String email) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      // Simulate always success; replace with real API call.

      return true;
    } catch (e) {
      _setError('Forgot password failed: $e');

      return false;
    }
  }

  /// Change password.
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return true;
    } catch (e) {
      _setError('Password change failed: $e');

      return false;
    }
  }

  /// Internal helpers.
  void _setStatus(AuthStatus status) {
    _status = status;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _status = AuthStatus.authenticationFailed;
    notifyListeners();
  }

  /// Saves business and store in user preference.
  Future<void> saveBusinessAndStore(User currentUser) async {
    // Fetch user's businesses
    final businesses = await _businessRepository.getMyBusinesses(
      currentUser.refId,
    );
    if (businesses.isEmpty) {
      // No businesses, skip sync init
      return;
    }

    // Take first business
    final firstBusiness = businesses.first;
    await UserPreferences.instance.saveBusinessPreferences(
      newBusiness: firstBusiness,
    );

    // Fetch stores for the first business
    final stores = await _storesRepository.getStoresByBusinessId(
      firstBusiness.refId,
    );
    if (stores.isEmpty) {
      // No stores, skip sync init
      return;
    }

    await UserPreferences.instance.saveStorePreferences(newStore: stores.first);
  }

  /// Initializes data sync by fetching businesses and stores
  Future<void> initializeDataSync() async {
    final currentStore = UserPreferences.instance.store;

    // Start sync with initial store
    _dataSyncService.startSync(initialStoreId: currentStore?.refId);
  }
}
