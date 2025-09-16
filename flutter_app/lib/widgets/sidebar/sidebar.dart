import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/responsive_utils.dart';
import '../../providers/auth/auth_provider.dart';
import '../../services/internationalization/internationalization.dart';
import '../../utils/user_preference.dart';
import '../../utils/utils.dart';
import '../app_header/current_user_view.dart';
import 'sidebar_menu_item.dart';

/// The sidebar widget.
class SidebarWidget extends StatelessWidget {
  /// The active tab.
  final DashboardItem activeTab;

  /// The on tab change callback.
  final Function(DashboardItem) onTabChange;

  /// The is open.
  final bool isOpen;

  /// Constructs the new [SidebarWidget].
  const SidebarWidget({
    super.key,
    required this.activeTab,
    required this.onTabChange,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveUtils.isTablet(context);
    final theme = ShadTheme.of(context);
    final user = UserPreferences.instance.user;

    final List<SideBarItem> menuItems = [
      SideBarItem(
        id: DashboardItem.dashboard,
        label: Intls.to.dashboard,
        icon: LucideIcons.house400,
      ),
      SideBarItem(
        id: DashboardItem.inventory,
        label: Intls.to.inventory,
        icon: LucideIcons.package400,
      ),
      SideBarItem(
        id: DashboardItem.sales,
        label: Intls.to.sales,
        icon: LucideIcons.shoppingCart400,
        children: [
          SideBarItem(
            id: DashboardItem.salesReports,
            label: Intls.to.reports,
            icon: LucideIcons.chartColumn400,
          ),
          SideBarItem(
            id: DashboardItem.salesOrders,
            label: Intls.to.newOrders,
            icon: LucideIcons.plus400,
          ),
        ],
      ),
      SideBarItem(
        id: DashboardItem.reports,
        label: Intls.to.reports,
        icon: LucideIcons.chartColumn400,
      ),
      SideBarItem(
        id: DashboardItem.suppliers,
        label: Intls.to.suppliers,
        icon: LucideIcons.truck400,
      ),
      SideBarItem(
        id: DashboardItem.users,
        label: Intls.to.users,
        icon: LucideIcons.users400,
      ),
      SideBarItem(
        id: DashboardItem.settings,
        label: Intls.to.settings,
        icon: LucideIcons.settings500,
      ),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(
        isTablet && !isOpen ? -AppConstants.sidebarWidth : 0,
        0,
        0,
      ),
      child: Container(
        width: AppConstants.sidebarWidth,
        decoration: BoxDecoration(
          color: ShadTheme.of(context).colorScheme.secondary,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primaryForeground.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            _BusinessInfo(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: menuItems
                      .map(
                        (item) => SidebarMenuItem(
                          item: item,
                          activeTab: activeTab,
                          onTabChange: onTabChange,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            if (user != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ShadTheme.of(context).colorScheme.secondary,
                  border: Border(
                    top: BorderSide(
                      color: ShadTheme.of(context).colorScheme.card,
                    ),
                  ),
                ),
                child: CurrentUserView(
                  user: user,
                  onLogout: AuthProvider.instance.logout,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final class _BusinessInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final business = UserPreferences.instance.business;

    if (business == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ShadTheme.of(context).colorScheme.card),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.fromBorderSide(
                BorderSide(color: ShadTheme.of(context).colorScheme.card),
              ),
              color: ShadTheme.of(context).colorScheme.muted,
            ),
            child:
                business.hasLogoLinkId() && AppUtils.isURL(business.logoLinkId)
                ? FutureBuilder(
                    future: precacheImage(
                      NetworkImage(business.logoLinkId),
                      context,
                      onError: (error, stackTrace) {
                        throw error;
                      },
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.error == null) {
                        return FadeInImage.assetNetwork(
                          placeholder: StaticImages.placeholder,
                          image: business.logoLinkId,
                          fit: BoxFit.contain,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return const Icon(LucideIcons.store400, size: 24);
                          },
                          placeholderErrorBuilder:
                              (context, error, stackTrace) {
                                return const Icon(
                                  LucideIcons.store400,
                                  size: 24,
                                );
                              },
                        );
                      }

                      return const Icon(LucideIcons.store400, size: 24);
                    },
                  )
                : const Icon(LucideIcons.store400, size: 24),
          ),

          const SizedBox(width: 12),
          Flexible(
            child: AutoSizeText(
              business.hasName() ? business.name : Intls.to.sabitu,
              style: ShadTheme.of(context).textTheme.h4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              minFontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
