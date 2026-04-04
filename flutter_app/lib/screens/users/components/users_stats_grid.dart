import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
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

    return StreamBuilder<List<({StoreMember storeMember, User user})>>(
      stream: controller.storeMembersStream,
      builder: (context, usersSnapshot) {
        if (usersSnapshot.connectionState == ConnectionState.waiting) {
          return UserShimmerWidgets.buildStatsShimmer();
        }

        final storeMembers = usersSnapshot.data ?? [];
        final stats = controller.calculateUserStats(
          storeMembers.map((e) => e.storeMember).toList(),
        );

        final statsCards = [
          StatCard(
            title: AppInternationalizationService.to.totalMembers,
            value: stats.total.toString(),
            changeWidget: ShadBadge(
              backgroundColor: SabitouColors.infoText,
              child: Text(
                '${stats.active} ${AppInternationalizationService.to.active.toLowerCase()}',
              ),
            ),
            icon: LucideIcons.users,
            color: SabitouColors.infoText,
          ),
          StatCard(
            title: AppInternationalizationService.to.inactiveMembers,
            value: stats.inactive.toString(),
            change: AppInternationalizationService.to.inactive,
            icon: LucideIcons.pause400,
            color: SabitouColors.neutral,
          ),
          StatCard(
            title: AppInternationalizationService.to.pendingMembers,
            value: stats.pending.toString(),
            change: AppInternationalizationService.to.awaitingResponse,
            icon: LucideIcons.clock,
            color: SabitouColors.warning,
          ),
          StatCard(
            title: AppInternationalizationService.to.bannedMembers,
            value: stats.banned.toString(),
            change: AppInternationalizationService.to.restrictedAccess,
            icon: LucideIcons.userX,
            color: SabitouColors.danger,
          ),
        ];

        return CustomGrid(
          minItemWidth: 250,
          mainAxisExtent: 110,
          crossSpacing: 20,
          children: statsCards,
        );
      },
    );
  }
}
