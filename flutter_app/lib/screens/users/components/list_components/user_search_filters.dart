import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../users_controller.dart';

/// Widget for search and filtering functionality in the users list.
///
/// Provides search input and status filter for managing the team members display.
class UserSearchFilters extends StatefulWidget {
  /// Creates a new [UserSearchFilters].
  const UserSearchFilters({super.key});

  @override
  State<UserSearchFilters> createState() => _UserSearchFiltersState();
}

class _UserSearchFiltersState extends State<UserSearchFilters> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UsersController>(context);
    final theme = ShadTheme.of(context);

    final communStyle = theme.textTheme.muted.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String getStatusLabel(StoreMemberStatus status) {
      switch (status) {
        case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
          return AppInternationalizationService.to.active;
        case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
          return AppInternationalizationService.to.pending;
        case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
          return AppInternationalizationService.to.inactive;
        case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
          return AppInternationalizationService.to.banned;
        default:
          return AppInternationalizationService.to.allStatus;
      }
    }

    IconData getStatusIcon(StoreMemberStatus status) {
      switch (status) {
        case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
          return Icons.check_circle;
        case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
          return Icons.schedule;
        case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
          return Icons.pause_circle;
        case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
          return Icons.block;
        default:
          return Icons.circle;
      }
    }

    Color getStatusColor(StoreMemberStatus status) {
      switch (status) {
        case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
          return Colors.green;
        case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
          return Colors.orange;
        case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
          return Colors.grey;
        case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Row(
      children: [
        // Search input
        Expanded(
          child: ShadInput(
            controller: _searchController,
            placeholder: Text(
              AppInternationalizationService
                  .to
                  .searchTeamMembersByNameEmailStatus,
            ),
            trailing: const Icon(LucideIcons.search, size: 16),
            onChanged: (value) => controller.searchQuery.add(value),
          ),
        ),

        const SizedBox(width: 16),

        // Status filter dropdown
        ShadSelect<StoreMemberStatus>(
          placeholder: Text(
            AppInternationalizationService.to.allStatus,
            style: communStyle,
          ),
          options: [
            ShadOption(
              value: StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    getStatusIcon(StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE),
                    size: 16,
                    color: getStatusColor(
                      StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppInternationalizationService.to.active,
                    style: communStyle,
                  ),
                ],
              ),
            ),
            ShadOption(
              value: StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    getStatusIcon(
                      StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE,
                    ),
                    size: 16,
                    color: getStatusColor(
                      StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppInternationalizationService.to.inactive,
                    style: communStyle,
                  ),
                ],
              ),
            ),
            ShadOption(
              value: StoreMemberStatus.STORE_MEMBER_STATUS_PENDING,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    getStatusIcon(
                      StoreMemberStatus.STORE_MEMBER_STATUS_PENDING,
                    ),
                    size: 16,
                    color: getStatusColor(
                      StoreMemberStatus.STORE_MEMBER_STATUS_PENDING,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppInternationalizationService.to.pending,
                    style: communStyle,
                  ),
                ],
              ),
            ),
            ShadOption(
              value: StoreMemberStatus.STORE_MEMBER_STATUS_BANNED,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    getStatusIcon(StoreMemberStatus.STORE_MEMBER_STATUS_BANNED),
                    size: 16,
                    color: getStatusColor(
                      StoreMemberStatus.STORE_MEMBER_STATUS_BANNED,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppInternationalizationService.to.cancelled,
                    style: communStyle,
                  ),
                ],
              ),
            ),
          ],
          selectedOptionBuilder: (context, value) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                getStatusIcon(value),
                size: 16,
                color: getStatusColor(value),
              ),
              const SizedBox(width: 8),
              Text(getStatusLabel(value), style: communStyle),
            ],
          ),
          allowDeselection: true,
          onChanged: (value) {
            controller.selectedStatus.add(value);
          },
        ),
      ],
    );
  }
}
