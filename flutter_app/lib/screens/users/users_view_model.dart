import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/stores_repository.dart';
import '../../repositories/users_repository.dart';

/// ViewModel for users management.
/// Handles business logic for user operations including CRUD operations,
/// role management, and user status updates.
class UsersViewModel {
  /// Business ID for scoping operations
  final String storeId;

  /// The users repository instance.
  final UserRepository _usersRepository = UserRepository.instance;

  /// The store repository instance.
  final StoresRepository _storeRepository = StoresRepository.instance;

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected status subject.
  final _selectedStatusSubject = BehaviorSubject<StoreMemberStatus?>.seeded(
    null,
  );

  /// Gets the filtered status.
  bool isFiltered = false;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected category.
  BehaviorSubject<StoreMemberStatus?> get selectedStatus =>
      _selectedStatusSubject;

  /// Gets the filtered products stream.
  Stream<List<({StoreMember storeMember, User user})>>
  get filteredStoreMembersStream => Rx.combineLatest3(
    storeMembersStream,
    _searchQuerySubject.stream,
    _selectedStatusSubject.stream,
    (storeMembers, searchQuery, status) {
      var filtered = storeMembers.toList();
      if (searchQuery.isNotEmpty) {
        isFiltered = true;
        filtered = filtered
            .where(
              (s) =>
                  s.user.lastName.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ||
                  s.user.firstName.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ||
                  s.user.userName.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ||
                  s.user.email.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
            )
            .toList();
      }
      if (status != null) {
        isFiltered = true;
        filtered = filtered
            .where(
              (s) => switch (status) {
                StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE =>
                  s.storeMember.status ==
                      StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE,
                StoreMemberStatus.STORE_MEMBER_STATUS_PENDING =>
                  s.storeMember.status ==
                      StoreMemberStatus.STORE_MEMBER_STATUS_PENDING,
                StoreMemberStatus.STORE_MEMBER_STATUS_BANNED =>
                  s.storeMember.status ==
                      StoreMemberStatus.STORE_MEMBER_STATUS_BANNED,
                StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE =>
                  s.storeMember.status ==
                      StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE,
                _ => false,
              },
            )
            .toList();
      }
      if (status == null && searchQuery.isEmpty) {
        isFiltered = false;
      }

      return filtered;
    },
  );

  /// Stream of store members with user data for reactive UI updates.
  Stream<List<({StoreMember storeMember, User user})>> get storeMembersStream =>
      _storeRepository.streamStoreMembers(storeId);

  /// Stream of user for reactive UI updates
  Stream<User?> userStream(String userId) =>
      _usersRepository.streamUser(userId);

  /// Constructor
  UsersViewModel({required this.storeId});

  /// Requests deletion of a user account
  Future<String?> requestDeleteUser(String userId, String password) async {
    final request = RequestDeleteUserRequest(
      userId: userId,
      password: password,
    );

    return await _usersRepository.requestDeleteUser(request);
  }

  /// Processes the deletion of a user account
  Future<bool> deleteUser(String requestToken, String verificationCode) async {
    final request = DeleteUserRequest(
      requestToken: requestToken,
      verificationCode: verificationCode,
    );

    return await _usersRepository.deleteUser(request);
  }

  /// Updates member permissions
  Future<bool> updateStoreMemberPermissions({
    required String userId,
    StorePermissions? permissions,
  }) async {
    return await _storeRepository.updateStoreMember(
      userId: userId,
      storeId: storeId,
      permissions: permissions,
    );
  }

  /// Removes an user from the store.
  Future<bool> removeUserFromStore(String storeId, String userId) async {
    return await _storeRepository.removeUserFromStore(storeId, userId);
  }

  /// Sets an user status from the store.
  Future<bool> setStoreMemberStatus(
    String userId,
    StoreMemberStatus status,
  ) async {
    return await _storeRepository.updateStoreMember(
      userId: userId,
      storeId: storeId,
      status: status,
    );
  }

  /// Invites a user to join the store.
  Future<bool> addUserToStore(
    String userId,
    StorePermissions permissions,
  ) async {
    return await _storeRepository.addStoreMember(
      userId: userId,
      storeId: storeId,
      permissions: permissions,
    );
  }

  /// Creates a user directly with a temporary password (Direct onboarding flow).
  /// Calls [CreateUserDirect] RPC which atomically creates the user + StoreMember.
  Future<bool> createUserDirect({
    required String email,
    required String userName,
    required String temporaryPassword,
    required StorePermissions permissions,
    bool forcePasswordChange = true,
  }) async {
    final user = await _usersRepository.createUserDirect(
      CreateUserDirectRequest(
        email: email,
        userName: userName,
        password: temporaryPassword,
        storeId: storeId,
        permissions: permissions,
        forcePasswordChangeOnFirstLogin: forcePasswordChange,
      ),
    );

    return user != null;
  }

  /// Invites a user via email (Invite onboarding flow).
  /// Calls [InviteUser] RPC which creates a PENDING user + StoreMember + Invitation.
  Future<bool> inviteUser({
    required String email,
    required StorePermissions permissions,
  }) async {
    final invitation = await _usersRepository.inviteUser(
      InviteUserRequest(
        email: email,
        storeId: storeId,
        permissions: permissions,
      ),
    );

    return invitation != null;
  }

  /// Disposes the view model.
  void dispose() {
    _searchQuerySubject.close();
    _selectedStatusSubject.close();
  }
}

/// The users stats data.
typedef UsersStatsData = ({
  int total,
  int active,
  int pending,
  int banned,
  int inactive,
});
