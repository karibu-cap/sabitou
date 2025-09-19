import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../widgets/grid/responsitive_grid.dart';
import '../users_controller.dart';
import 'list_components/user_card.dart';
import 'list_components/user_empty_state.dart';
import 'list_components/user_error_widget.dart';
import 'list_components/user_search_filters.dart';
import 'list_components/user_shimmer_widgets.dart';

/// Widget for displaying the list of team members/users.
///
/// Provides a comprehensive interface for managing team members including
/// search, filtering, and user management actions.
class UsersList extends StatelessWidget {
  /// Creates a new [UsersList].
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UsersController>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search and filters
        const ShadCard(child: UserSearchFilters()),
        const SizedBox(height: 16),

        // Users content
        StreamBuilder<List<StoreMember>>(
          stream: controller.filteredStoreMembersStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return UserShimmerWidgets.buildTableShimmer();
            }

            final error = snapshot.error;
            if (snapshot.hasError && error != null) {
              return UserErrorWidget(error: error);
            }

            final storeMembers = snapshot.data ?? [];
            if (storeMembers.isEmpty) {
              return const UserEmptyState();
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                return ResponsiveGrid(
                  mainAxisExtent: 500,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                  children: [
                    ...storeMembers.map(
                      (storeMember) => UserCard(storeMember: storeMember),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
