import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../widgets/grid/responsitive_grid.dart';
import '../users_controller.dart';
import 'list_components/user_shimmer_widgets.dart';

/// Grid component for displaying team/users statistics.
///
/// Shows key metrics like total members, active members, pending members,
/// and banned members in a responsive grid layout.
class UsersStatsGrid extends StatelessWidget {
  /// Constructs a new UsersStatsGrid.
  const UsersStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UsersController>(context, listen: false);

    return StreamBuilder<List<StoreMember>>(
      stream: controller.storeMembersStream,
      builder: (context, usersSnapshot) {
        if (usersSnapshot.connectionState == ConnectionState.waiting) {
          return UserShimmerWidgets.buildStatsShimmer();
        }

        final storeMembers = usersSnapshot.data ?? [];
        final stats = controller.calculateUserStats(storeMembers);

        final statsCards = [
          UserStatCard(
            title: AppInternationalizationService.to.totalMembers,
            value: stats.total.toString(),
            subtitle:
                '${stats.active} ${AppInternationalizationService.to.active.toLowerCase()}',
            icon: LucideIcons.users,
            color: Colors.blue,
            showBadge: true,
            badgeText:
                '${stats.active} ${AppInternationalizationService.to.active}',
            badgeColor: Colors.blue,
          ),
          UserStatCard(
            title: AppInternationalizationService.to.inactiveMembers,
            value: stats.inactive.toString(),
            subtitle: AppInternationalizationService.to.inactive,
            icon: LucideIcons.pause400,
            color: Colors.grey,
          ),
          UserStatCard(
            title: AppInternationalizationService.to.pendingMembers,
            value: stats.pending.toString(),
            subtitle: AppInternationalizationService.to.awaitingResponse,
            icon: LucideIcons.clock,
            color: Colors.orange,
          ),
          UserStatCard(
            title: AppInternationalizationService.to.bannedMembers,
            value: stats.banned.toString(),
            subtitle: AppInternationalizationService.to.restrictedAccess,
            icon: LucideIcons.userX,
            color: Colors.red,
          ),
        ];

        return ResponsiveGrid(
          mainAxisExtent: 150,
          minItemWidth: 230,
          // crossAxisCount: columns,
          children: statsCards,
        );
      },
    );
  }
}

/// Individual stat card widget for user statistics.
class UserStatCard extends StatelessWidget {
  /// The title of the stat card.
  final String title;

  /// The value of the stat card.
  final String value;

  /// The subtitle of the stat card.
  final String subtitle;

  /// The icon of the stat card.
  final IconData icon;

  /// The color of the stat card.
  final Color color;

  /// Whether to show a status badge.
  final bool showBadge;

  /// The text for the status badge.
  final String? badgeText;

  /// The color for the status badge.
  final Color? badgeColor;

  /// Whether to show an online indicator.
  final bool showOnlineIndicator;

  /// Constructs a new UserStatCard.
  const UserStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.showOnlineIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  title,
                  style: theme.textTheme.muted.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                value,
                style: theme.textTheme.p.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showBadge && badgeText != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor ?? Colors.green,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    badgeText ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              if (showOnlineIndicator) ...[
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(height: 4),
          AutoSizeText(
            subtitle,
            style: theme.textTheme.muted.copyWith(fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
