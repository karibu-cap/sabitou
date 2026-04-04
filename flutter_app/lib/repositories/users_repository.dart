import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/network_utils.dart';

/// The [UserRepository] class.
final class UserRepository extends BaseRepository<User> {
  final _logger = LoggerApp('UserRepository');

  /// The [UserServiceClient] implementation.
  final UserServiceClient userClientService;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.users;

  /// Singleton accessor.
  static UserRepository get instance => GetIt.I.get<UserRepository>();

  /// Constructs an [UserRepository].
  UserRepository({required this.dataSource})
    : userClientService = UserServiceClient(ConnectRPCService.to.clientChannel);

  @override
  User fromRow(RawRow row) => fromRowToUser(row);

  @override
  RawRow toRow(User user) => fromUsertoRaw(user);

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

  /// Get user from cache.
  Future<User?> getUser(String userId) async {
    try {
      return await findById(userId);
    } on Exception catch (e) {
      _logger.severe('Error getting user: $e');

      return null;
    }
  }

  /// Stream active users.
  Stream<User?> streamUser(String userId) {
    return watchOne(userId);
  }

  /// Update the current authenticated user.
  Future<User?> updateMe(UpdateMeRequest request) async {
    try {
      // Écriture optimiste locale
      await updateWhere(
        fields: fromUsertoRaw(request.user),
        filters: [SqlQuery.equals(UsersFields.refId, request.user.refId)],
      );

      _logger.log('Updated me locally: ${request.user.writeToJson()}.');

      return request.user;
    } on Exception catch (e) {
      _logger.severe('Error updating me: $e');

      return null;
    }
  }

  /// Update any user (admin).
  Future<User?> update(UpdateRequest request) async {
    try {
      await updateWhere(
        fields: fromUsertoRaw(request.user),
        filters: [SqlQuery.equals(UsersFields.refId, request.user.refId)],
      );
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

  /// Find by email.
  Future<User?> findByEmail(String email) async {
    final results = await findWhere(limit: 1, [
      SqlQuery.equals(UsersFields.email, email),
    ]);

    return results.firstOrNull;
  }

  /// Stream active users.
  Stream<List<User>> watchActiveUsers() {
    return watchWhere([
      SqlQuery.equals(
        UsersFields.accountStatus,
        AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE.value,
      ),
    ]);
  }

  /// Creates a user with an immediate ACTIVE status (internal/cashier flow).
  /// The admin sets the password directly. No invitation sent.
  Future<User?> createUserDirect(CreateUserDirectRequest request) async {
    try {
      final result = await userClientService.createUserDirect(request);
      _logger.log('User created directly: ${result.user.refId}');

      return result.user;
    } on Exception catch (e) {
      _logger.severe('Error creating user directly: $e');
      return null;
    }
  }

  // ── Admin: invite external user (INVITE flow) ─────────────────────────────

  /// Creates a PENDING user and sends an invitation email.
  /// The invited user sets their own password via the token link.
  Future<Invitation?> inviteUser(InviteUserRequest request) async {
    try {
      final result = await userClientService.inviteUser(request);
      _logger.log('Invitation sent: ${result.invitation.refId}');

      return result.invitation;
    } on Exception catch (e) {
      _logger.severe('Error inviting user: $e');

      return null;
    }
  }

  /// Cancels a pending invitation (admin only).
  Future<bool> cancelInvitation(String invitationId) async {
    try {
      // Gets the invitation.
      final invitationRow = await dataSource.getDocument(
        CollectionName.invitations,
        invitationId,
        primaryKey: InvitationsFields.refId,
      );

      if (invitationRow == null) {
        return false;
      }

      final invitation = fromRowToInvitation(invitationRow);

      // Cancels the invitation.
      await dataSource.updateWhere(
        table: CollectionName.invitations,
        fields: {
          InvitationsFields.status:
              InvitationStatus.INVITATION_STATUS_CANCELLED.name,
        },
        filters: [SqlQuery.equals(InvitationsFields.refId, invitation.refId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('Error cancelling invitation: $e');

      return false;
    }
  }

  /// Resends an expired or pending invitation with a fresh token.
  Future<Invitation?> resendInvitation(ResendInvitationRequest request) async {
    try {
      final result = await userClientService.resendInvitation(request);

      return result.invitation;
    } on Exception catch (e) {
      _logger.severe('Error resending invitation: $e');

      return null;
    }
  }

  /// Called by the invited user to set their password and activate their account.
  /// The token comes from the invitation link URL.
  Future<bool> acceptInvitation(AcceptInvitationRequest request) async {
    try {
      final result = await userClientService.acceptInvitation(request);

      return result.success;
    } on Exception catch (e) {
      _logger.severe('Error accepting invitation: $e');

      return false;
    }
  }

  /// Stream all invitations for a store (admin dashboard view).
  Stream<List<Invitation>> watchStoreInvitations(String storeId) {
    return dataSource
        .watchCollection(
          CollectionName.invitations,
          filters: [SqlQuery.equals(InvitationsFields.storeId, storeId)],
        )
        .map((rows) => rows.map(fromRowToInvitation).toList());
  }
}
