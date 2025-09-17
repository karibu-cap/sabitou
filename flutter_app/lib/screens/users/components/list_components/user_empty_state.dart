import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Widget displayed when there are no users to show.
///
/// Provides different messages for empty state vs filtered results,
/// with appropriate actions for each scenario.
class UserEmptyState extends StatelessWidget {
  /// Whether this empty state is due to filtering.
  final bool isFiltered;

  /// Creates a new [UserEmptyState].
  const UserEmptyState({super.key, this.isFiltered = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Icon(
            isFiltered ? LucideIcons.searchX : LucideIcons.users,
            size: 64,
            color: Colors.grey[400],
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            isFiltered
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
            isFiltered
                ? AppInternationalizationService.to.tryAdjustingFilters
                : AppInternationalizationService.to.inviteFirstTeamMember,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Action button
          if (!isFiltered) ...[
            ShadButton(
              onPressed: () {
                // TODO: Implement invite member functionality
              },
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
              onPressed: () {
                // TODO: Clear filters
              },
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
