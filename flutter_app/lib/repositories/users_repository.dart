import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The user repository.
///
/// Handles all user-related operations including user management,
/// authentication, and business user operations.
final class UserRepository {
  final _logger = LoggerApp('UserRepository');

  /// The user service client.
  final UserServiceClient userClientService;

  /// Access the singleton instance.
  static UserRepository get instance => GetIt.I.get<UserRepository>();

  /// Constructs a new [UserRepository].
  UserRepository([connect.Transport? transport])
    : userClientService = UserServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Gets the current authenticated user.
  Future<User?> getCurrentUser(GetCurrentUserRequest request) async {
    try {
      final result = await userClientService.getCurrentUser(request);
      _logger.log('Retrieved current user: ${result.me.writeToJson()}.');

      return result.me;
    } on Exception catch (e) {
      _logger.severe('Error getting current user: $e');

      return null;
    }
  }

  /// Gets a user by their ID.
  Future<User?> getUser(GetUserRequest request) async {
    try {
      final result = await userClientService.getUser(request);
      _logger.log('Retrieved user: ${result.user.writeToJson()}.');

      return result.user;
    } on Exception catch (e) {
      _logger.severe('Error getting user: $e');

      return null;
    }
  }

  /// Updates the current authenticated user.
  Future<User?> updateMe(UpdateMeRequest request) async {
    try {
      final result = await userClientService.updateMe(request);
      _logger.log('Updated user: ${result.user.writeToJson()}.');

      return result.user;
    } on Exception catch (e) {
      _logger.severe('Error updating user: $e');

      return null;
    }
  }

  /// Updates an user.
  Future<User?> update(UpdateRequest request) async {
    try {
      final result = await userClientService.update(request);
      _logger.log('Updated user: ${result.user.writeToJson()}.');

      return result.user;
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

  /// Gets all users for a business.
  /// TODO: Uncomment when proto files are regenerated with GetBusinessUsersRequest
  // Future<List<User>> getBusinessUsers(GetBusinessUsersRequest request) async {
  //   try {
  //     final result = await userClientService.getBusinessUsers(request);
  //     _logger.log('Retrieved ${result.users.length} business users.');
  //
  //     return result.users;
  //   } on Exception catch (e) {
  //     _logger.severe('Error getting business users: $e');
  //
  //     return [];
  //   }
  // }

  /// Streams all users for a business with real-time updates.
  /// TODO: Uncomment when proto files are regenerated with StreamBusinessUsersRequest
  // Stream<List<User>> streamBusinessUsers(StreamBusinessUsersRequest request) {
  //   try {
  //     return userClientService.streamBusinessUsers(request).map((response) {
  //       _logger.log('Streamed ${response.users.length} business users.');
  //
  //       return response.users;
  //     });
  //   } on Exception catch (e) {
  //     _logger.severe('Error streaming business users: $e');
  //
  //     return Stream.value([]);
  //   }
  // }
}
