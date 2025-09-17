import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';
import '../users_controller.dart';
import 'dialogs/user_invitation/user_invitation_view.dart';

/// Header widget for the users/team management page.
///
/// Displays the page title, description, and primary action buttons
/// for managing team members.
class UsersHeader extends StatelessWidget {
  /// Creates a new [UsersHeader].
  const UsersHeader({super.key});

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
    final controller = Provider.of<UsersController>(context, listen: false);
    final isDesktop = ResponsiveUtils.isDesktop(context);

    final theme = ShadTheme.of(context);

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppInternationalizationService.to.teamManagement,
                style: theme.textTheme.h4,
              ),
              const SizedBox(height: 8),
              Text(
                AppInternationalizationService
                    .to
                    .manageTeamMembersRolesPermissions,
                style: theme.textTheme.muted,
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        ShadButton(
          onPressed: () => _showAddUserDialog(context, controller),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LucideIcons.plus, size: 16),
              const SizedBox(width: 8),
              Text(AppInternationalizationService.to.addUser),
            ],
          ),
        ),
      ],
    );
  }
}
