import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/user_preference.dart';
import '../../widgets/no_business_view.dart';
import 'components/users_header.dart';
import 'components/users_list.dart';
import 'components/users_stats_grid.dart';
import 'users_controller.dart';
import 'users_view_model.dart';

/// Content widget for users view using Provider pattern.
class UsersView extends StatelessWidget {
  /// Creates a new [UsersView].
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final currentStore = userPreferences.store;
    final business = userPreferences.business;

    if (currentStore == null || business == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              UsersController(UsersViewModel(storeId: currentStore.refId)),
        ),
      ],
      child: const UsersContent(),
    );
  }
}

/// Main view for team management functionality.
///
/// Provides a comprehensive interface for managing team members,
/// their roles, permissions, and access levels.
class UsersContent extends StatelessWidget {
  /// Creates a new [UsersContent].
  const UsersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UsersHeader(),
          SizedBox(height: 32),
          UsersStatsGrid(),
          SizedBox(height: 32),
          UsersList(),
        ],
      ),
    );
  }
}
