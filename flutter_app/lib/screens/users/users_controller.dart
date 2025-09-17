import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'users_view_model.dart';

/// The users controller.
///
/// Manages the state and business logic for the Team Management module.
/// Uses ChangeNotifier for state management with Provider pattern.
class UsersController extends ChangeNotifier {
  /// The view model that handles data operations for users
  final UsersViewModel _viewModel;

  /// Constructs a new UsersController.
  UsersController(UsersViewModel viewModel) : _viewModel = viewModel;

  /// Gets store members stream for reactive UI updates
  Stream<List<StoreMember>> get storeMembersStream =>
      _viewModel.storeMembersStream;

  /// Gets filtered store members stream for reactive UI updates
  Stream<List<StoreMember>> get filteredStoreMembersStream =>
      _viewModel.filteredStoreMembersStream;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Gets the selected category.
  BehaviorSubject<StoreMemberStatus?> get selectedStatus =>
      _viewModel.selectedStatus;

  /// Gets the filtered status.
  bool get isFiltered => _viewModel.isFiltered;

  /// Gets user stream for reactive UI updates
  Stream<User?> userStream(String userId) => _viewModel.userStream(userId);

  /// Gets initiale.
  String getInitials(User user) {
    final firstName = user.firstName.trim();
    final lastName = user.lastName.trim();

    if (firstName.isEmpty && lastName.isEmpty) {
      return user.userName.isNotEmpty ? user.userName[0].toUpperCase() : '?';
    }

    final firstInitial = firstName.isNotEmpty ? firstName[0] : '';
    final lastInitial = lastName.isNotEmpty ? lastName[0] : '';

    return '$firstInitial$lastInitial'.toUpperCase();
  }

  /// Updates user permissions for the current business.
  Future<bool> updateUserPermissions({
    required String userId,
    List<StorePermission>? addPermissions,
    List<StorePermission>? removePermissions,
  }) async {
    final result = await _viewModel.updateStoreMemberPermissions(
      userId: userId,
      addPermissions: addPermissions,
      removePermissions: removePermissions,
    );
    notifyListeners();

    return result;
  }

  /// Gets store members stream.
  Stream<List<StoreMember>> getStoreMembersStream() {
    return _viewModel.storeMembersStream;
  }

  /// Invites a user to join the store.
  Future<bool> addUserToStore(
    String email,
    List<StorePermission> permissions,
  ) async {
    return await _viewModel.addUserToStore(email, permissions);
  }

  /// Removes a user from the store.
  Future<bool> removeUserFromStore(String userId) async {
    return await _viewModel.removeUserFromStore(userId);
  }

  /// Toggles the status of a user.
  Future<bool> toggleUserStatus(String userId, StoreMemberStatus status) async {
    return await _viewModel.setStoreMemberStatus(userId, status);
  }

  /// Updates the status of a user (alias for toggleUserStatus).
  Future<bool> updateUserStatus({
    required String userId,
    required StoreMemberStatus newStatus,
  }) async {
    return await toggleUserStatus(userId, newStatus);
  }

  /// Disposes the controller.
  @override
  void dispose() {
    super.dispose();
  }

  /// Calculates user statistics.
  UsersStatsData calculateUserStats(List<StoreMember> storeMembers) {
    return (
      total: storeMembers.length,
      active: storeMembers
          .where(
            (toreMember) =>
                toreMember.status ==
                StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE,
          )
          .length,
      pending: storeMembers
          .where(
            (toreMember) =>
                toreMember.status ==
                StoreMemberStatus.STORE_MEMBER_STATUS_PENDING,
          )
          .length,
      banned: storeMembers
          .where(
            (toreMember) =>
                toreMember.status ==
                StoreMemberStatus.STORE_MEMBER_STATUS_BANNED,
          )
          .length,
      inactive: storeMembers
          .where(
            (toreMember) =>
                toreMember.status ==
                StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE,
          )
          .length,
    );
  }

  /// Clears filters.
  void clearFilters() {
    searchQuery.add('');
    selectedStatus.add(null);
  }
}
