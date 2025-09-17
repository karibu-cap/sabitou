import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../users_controller.dart';
import '../dialogs/user_invitation/user_invitation_view.dart';

/// Widget displayed when there are no users to show.
///
/// Provides different messages for empty state vs filtered results,
/// with appropriate actions for each scenario.
class UserEmptyState extends StatelessWidget {
  /// Creates a new [UserEmptyState].
  const UserEmptyState({super.key});

  void _showAddUserDialog(BuildContext context, UsersController controller) {
    showDialog(
      context: context,
      builder: (dialogContext) => ChangeNotifierProvider.value(
        value: controller,
        child: ShadDialog(
          child: UserInvitationModal(usersController: controller),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UsersController>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Icon(
            controller.isFiltered ? LucideIcons.searchX : LucideIcons.users,
            size: 64,
            color: Colors.grey[400],
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            controller.isFiltered
                ? AppInternationalizationService.to.noMembersMatchFilters
                : AppInternationalizationService.to.noTeamMembersYet,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Description
          Text(
            controller.isFiltered
                ? AppInternationalizationService.to.tryAdjustingFilters
                : AppInternationalizationService.to.inviteFirstTeamMember,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Action button
          if (!controller.isFiltered) ...[
            ShadButton(
              onPressed: () => _showAddUserDialog(context, controller),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(LucideIcons.userPlus, size: 16),
                  const SizedBox(width: 8),
                  Text(AppInternationalizationService.to.inviteMember),
                ],
              ),
            ),
          ] else ...[
            ShadButton.outline(
              onPressed: controller.clearFilters,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(LucideIcons.x, size: 16),
                  const SizedBox(width: 8),
                  Text(AppInternationalizationService.to.clearFilters),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
