import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/formatters.dart';
import '../../users_controller.dart';
import '../dialogs/user_deletion/user_deletion_view.dart';
import '../dialogs/user_permissions/user_permissions_view.dart';
import 'store_permissions_widget.dart';

/// A modern card widget that displays comprehensive user information.
///
/// Features a rich layout with header, contact info, permissions, and actions
/// matching the provided design mockup for enhanced user experience.
class UserCard extends StatelessWidget {
  /// The store member to display.
  final StoreMember storeMember;

  /// Creates a new UserCard.
  const UserCard({super.key, required this.storeMember});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UsersController>(context, listen: false);
    final theme = ShadTheme.of(context);

    return StreamBuilder<User?>(
      stream: controller.userStream(storeMember.user.refId),
      builder: (context, snapshot) {
        final user = snapshot.data;

        if (user == null) {
          return const SizedBox.shrink();
        }

        return ShadCard(
          padding: EdgeInsets.zero,
          child: Container(
            height: 500, // Fixed height for consistent card size
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section with avatar, name, and quick actions
                _UserCardHeader(user: user, storeMember: storeMember),

                const SizedBox(height: 16),

                // Contact information
                _ContactInfo(user: user),

                const SizedBox(height: 16),

                Text(
                  AppInternationalizationService.to.permissions,
                  style: theme.textTheme.h4.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: theme.textTheme.p.color,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: _PermissionsContainer(
                    permissions: storeMember.permissions,
                  ),
                ),

                const SizedBox(height: 20),

                // Footer with dates and main actions (always at bottom)
                _UserCardFooter(user: user, storeMember: storeMember),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Header section with user avatar, name, and action buttons.
class _UserCardHeader extends StatelessWidget {
  /// The user to display.
  final User user;

  /// The store member information.
  final StoreMember storeMember;

  /// Creates a new _UserCardHeader.
  const _UserCardHeader({required this.user, required this.storeMember});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = Provider.of<UsersController>(context, listen: false);

    return Row(
      children: [
        // Avatar with initials
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.primary,
          ),
          child: Center(
            child: Text(
              controller.getInitials(user),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // User name
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: theme.textTheme.h4.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              _StatusBadge(status: storeMember.status),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => ShadDialog(
                  child: UserPermissionsModal(
                    storeMember: storeMember,
                    usersController: controller,
                  ),
                ),
              ),
              icon: const Icon(LucideIcons.eye, size: 16),
              style: IconButton.styleFrom(
                backgroundColor: theme.colorScheme.primary.withValues(
                  alpha: 0.1,
                ),
                foregroundColor: theme.colorScheme.primary,
                minimumSize: const Size(32, 32),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => ShadDialog(
                  child: UserDeletionModal(
                    storeMember: storeMember,
                    usersController: controller,
                  ),
                ),
              ),
              icon: const Icon(LucideIcons.trash, size: 16),
              style: IconButton.styleFrom(
                backgroundColor: theme.colorScheme.primary.withValues(
                  alpha: 0.1,
                ),
                foregroundColor: theme.colorScheme.primary,
                minimumSize: const Size(32, 32),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Contact information section.
class _ContactInfo extends StatelessWidget {
  /// The user whose contact info to display.
  final User user;

  /// Creates a new _ContactInfo.
  const _ContactInfo({required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email
        Row(
          children: [
            Icon(
              LucideIcons.mail,
              size: 16,
              color: theme.textTheme.muted.color,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                user.email,
                style: theme.textTheme.muted.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Phone
        Row(
          children: [
            Icon(
              LucideIcons.phone,
              size: 16,
              color: theme.textTheme.muted.color,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                user.phoneNumber,
                style: theme.textTheme.muted.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Footer section with dates and main action buttons.
class _UserCardFooter extends StatelessWidget {
  /// The user to display.
  final User user;

  /// The store member.
  final StoreMember storeMember;

  /// Creates a new _UserCardFooter.
  const _UserCardFooter({required this.user, required this.storeMember});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = Provider.of<UsersController>(context, listen: false);

    return Column(
      children: [
        Row(
          children: [
            Text(
              '${AppInternationalizationService.to.joined} :',
              style: theme.textTheme.muted.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 2),
            Text(
              Formatters.formatDate(storeMember.memberSince.toDateTime()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.muted.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Action buttons
        Row(
          children: [
            // Manage Access button
            Expanded(
              child: ShadButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => ShadDialog(
                    child: UserPermissionsModal(
                      storeMember: storeMember,
                      usersController: controller,
                    ),
                  ),
                ),
                backgroundColor: const Color(0xFF8B5CF6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      LucideIcons.settings,
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppInternationalizationService.to.manageAccess,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Container for permissions with fade overflow effect.
class _PermissionsContainer extends StatelessWidget {
  /// The list of store permissions to display.
  final List<StorePermission> permissions;

  /// Creates a new PermissionsContainer.
  const _PermissionsContainer({required this.permissions});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StorePermissionsWidget(permissions: permissions),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final StoreMemberStatus status;

  const _StatusBadge({required this.status});

  _StatusInfo _getStatusInfo(StoreMemberStatus status) {
    switch (status) {
      case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
        return _StatusInfo(
          label: AppInternationalizationService.to.active,
          color: Colors.green,
          icon: LucideIcons.userCheck,
        );
      case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
        return _StatusInfo(
          label: AppInternationalizationService.to.pending,
          color: Colors.orange,
          icon: LucideIcons.clock,
        );
      case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
        return _StatusInfo(
          label: AppInternationalizationService.to.inactive,
          color: Colors.grey,
          icon: LucideIcons.pause400,
        );
      case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
        return _StatusInfo(
          label: AppInternationalizationService.to.cancelled,
          color: Colors.red,
          icon: LucideIcons.userX,
        );
      case StoreMemberStatus.STORE_MEMBER_STATUS_UNSPECIFIED:
      default:
        return _StatusInfo(
          label: AppInternationalizationService.to.unspecified,
          color: Colors.grey,
          icon: LucideIcons.triangleAlert,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final statusInfo = _getStatusInfo(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusInfo.color.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: statusInfo.color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusInfo.icon, size: 12, color: statusInfo.color),
          const SizedBox(width: 4),
          Text(
            statusInfo.label,
            style: theme.textTheme.small.copyWith(
              color: statusInfo.color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusInfo {
  final String label;
  final Color color;
  final IconData icon;

  const _StatusInfo({
    required this.label,
    required this.color,
    required this.icon,
  });
}
