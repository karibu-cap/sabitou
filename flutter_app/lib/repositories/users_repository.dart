import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:powersync/powersync.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import '../utils/network_utils.dart';

/// The user repository.
///
/// Handles all user-related operations including user management,
/// authentication, and business user operations.
final class UserRepository {
  final _logger = LoggerApp('UserRepository');

  /// The user service client.
  final UserServiceClient userClientService;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// The power sync service.
  final PowerSyncDatabase _db;

  /// Access the singleton instance.
  static UserRepository get instance => GetIt.I.get<UserRepository>();

  /// Constructs a new [UserRepository].
  UserRepository({NetworkStatusProvider? networkStatusProvider})
    : userClientService = UserServiceClient(ConnectRPCService.to.clientChannel),
      _db = GetIt.I.get<PowerSyncDatabase>(),
      networkStatusProvider =
          networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Gets a user by their ID.
  Future<User?> getUser(GetUserRequest request) async {
    try {
      final rows = await _db.getAll(
        'SELECT * FROM users WHERE ref_id = ? LIMIT 1',
        [request.userId],
      );

      if (rows.isEmpty) return null;

      return _rowToUser(rows.first);
    } on Exception catch (e) {
      _logger.severe('Error getting user: $e');

      return null;
    }
  }

  /// Updates the current authenticated user.
  Future<User?> updateMe(UpdateMeRequest request) async {
    try {
      // Optimistic local write
      await _upsertUserLocally(request.user);
      _logger.log('Updated user locally: ${request.user.writeToJson()}.');

      // If online, also push immediately
      if (await NetworkUtils.isServerReachable()) {
        final result = await userClientService.updateMe(request);

        return result.user;
      }

      return request.user; // return optimistic result
    } on Exception catch (e) {
      _logger.severe('Error updating user: $e');

      return null;
    }
  }

  /// Updates an user.
  Future<User?> update(UpdateRequest request) async {
    try {
      await _upsertUserLocally(request.user);
      _logger.log('Updated user locally: ${request.user.writeToJson()}.');

      if (await NetworkUtils.isServerReachable()) {
        final result = await userClientService.update(request);

        return result.user;
      }

      return request.user;
    } on Exception catch (e) {
      _logger.severe('Error updating user: $e');

      return null;
    }
  }

  /// Requests deletion of a user account.
  Future<String?> requestDeleteUser(RequestDeleteUserRequest request) async {
    try {
      final result = await userClientService.requestDeleteUser(request);
      _logger.log('Delete user request token: ${result.requestToken}');

      return result.requestToken;
    } on Exception catch (e) {
      _logger.severe('Error requesting user deletion: $e');

      return null;
    }
  }

  /// Processes the deletion of a user account.
  Future<bool> deleteUser(DeleteUserRequest request) async {
    try {
      final result = await userClientService.deleteUser(request);
      _logger.log('User deletion success: ${result.success}');

      return result.success;
    } on Exception catch (e) {
      _logger.severe('Error deleting user: $e');

      return false;
    }
  }

  /// Changes the password for the current authenticated user.
  Future<bool> changePassword(ChangePasswordRequest request) async {
    try {
      final result = await userClientService.changePassword(request);
      _logger.log('Password change success: ${result.success}');

      return result.success;
    } on Exception catch (e) {
      _logger.severe('Error changing password: $e');

      return false;
    }
  }

  /// Stream user.
  Stream<User?> streamUser(StreamUserRequest request) {
    return _db
        .watch(
          'SELECT * FROM users WHERE ref_id = ? LIMIT 1',
          parameters: [request.userId],
        )
        .map((rows) => rows.isEmpty ? null : _rowToUser(rows.first));
  }

  /// Fallback: fetch from gRPC when local cache is empty.
  Future<User?> _fetchCurrentUserFromServer(
    GetCurrentUserRequest request,
  ) async {
    try {
      final result = await userClientService.getCurrentUser(request);
      // Cache locally for next time
      await _upsertUserLocally(result.me);

      return result.me;
    } on Exception catch (e) {
      _logger.severe('Error fetching user from server: $e');

      return null;
    }
  }

  /// Upserts a [User] proto into local SQLite.
  Future<void> _upsertUserLocally(User user) async {
    await _db.execute(
      '''
      INSERT OR REPLACE INTO users (
        id, ref_id, user_name, email, phone_number,
        first_name, last_name, account_status,
        connected_accounts, required_actions, profile_link
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''',
      [
        user.refId,
        user.hasRefId() ? user.refId : null,
        user.userName,
        user.hasEmail() ? user.email : null,
        user.hasPhoneNumber() ? user.phoneNumber : null,
        user.hasFirstName() ? user.firstName : null,
        user.hasLastName() ? user.lastName : null,
        user.hasAccountStatus() ? user.accountStatus.value : null,
        jsonEncode(
          user.connectedAccounts.map((a) => a.toProto3Json()).toList(),
        ),
        jsonEncode(user.requiredActions.map((a) => a.value).toList()),
        user.hasProfileLink()
            ? jsonEncode(user.profileLink.toProto3Json())
            : null,
      ],
    );
  }

  /// Converts a raw SQLite row → [User] proto.
  User _rowToUser(Map<String, dynamic> row) {
    final connectedAccountsJson = row['connected_accounts'] as String?;
    final requiredActionsJson = row['required_actions'] as String?;
    final profileLinkJson = row['profile_link'] as String?;

    return User(
      refId: row['ref_id'] as String?,
      userName: row['user_name'] as String? ?? '',
      email: row['email'] as String?,
      phoneNumber: row['phone_number'] as String?,
      firstName: row['first_name'] as String?,
      lastName: row['last_name'] as String?,
      accountStatus: row['account_status'] != null
          ? AccountStatusType.valueOf(row['account_status'] as int)
          : null,
      connectedAccounts: connectedAccountsJson != null
          ? (jsonDecode(connectedAccountsJson) as List)
                .map((e) => ConnectedAccount.create()..mergeFromProto3Json(e))
                .toList()
          : [],
      profileLink: profileLinkJson != null
          ? (ResourceLink.create()
              ..mergeFromProto3Json(jsonDecode(profileLinkJson)))
          : null,
    );
  }
}
