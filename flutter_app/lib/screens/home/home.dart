import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/responsive_utils.dart';
import '../../widgets/app_header/app_header.dart';
import '../../widgets/sidebar/sidebar.dart';
import '../dashboard/dashboard_screen.dart';
import '../suppliers/suppliers_view.dart';
import 'home_controller.dart';

/// The home screen.
class HomeScreen extends StatelessWidget {
  /// Constructs the new home screen.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabletBreakpoint = ResponsiveUtils.isTablet(context);

    return Scaffold(
      backgroundColor: ShadTheme.of(context).colorScheme.secondary,
      body: ChangeNotifierProvider(
        create: (context) => HomeController(),
        child: Consumer<HomeController>(
          builder: (context, homeController, child) => Stack(
            children: [
              Row(
                children: [
                  if (!tabletBreakpoint)
                    SidebarWidget(
                      activeTab: homeController.activeTab,
                      onTabChange: homeController.changeTab,
                      isOpen: true,
                    ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: tabletBreakpoint ? 0 : 20),
                      decoration: BoxDecoration(
                        color: ShadTheme.of(context).colorScheme.background,
                        borderRadius: tabletBreakpoint
                            ? null
                            : const BorderRadius.only(
                                topLeft: Radius.circular(
                                  AppConstants.cardRadius,
                                ),
                                bottomLeft: Radius.circular(
                                  AppConstants.cardRadius,
                                ),
                              ),
                      ),
                      child: Column(
                        children: [
                          HeaderWidget(
                            onMenuClick: homeController.toggleSidebar,
                            isSidebarOpen: homeController.isSidebarOpen,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(
                                tabletBreakpoint ? 16.0 : 24.0,
                              ),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 1280,
                                ),
                                child: GestureDetector(
                                  onTap: !tabletBreakpoint
                                      ? null
                                      : () => homeController.toggleSidebar(
                                          value: false,
                                        ),
                                  child: switch (homeController.activeTab) {
                                    DashboardItem.dashboard =>
                                      const Dashboard(),
                                    DashboardItem.inventory => const SizedBox(),
                                    DashboardItem.sales => const SizedBox(),
                                    DashboardItem.reports => const SizedBox(),
                                    DashboardItem.users => const SizedBox(),
                                    DashboardItem.suppliers => const SuppliersView(),
                                    DashboardItem.settings => const SizedBox(),
                                    _ => const SizedBox(),
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Mobile sidebar
              if (tabletBreakpoint)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: homeController.isSidebarOpen ? 0 : -280,
                  top: 0,
                  bottom: 0,
                  child: SidebarWidget(
                    activeTab: homeController.activeTab,
                    onTabChange: homeController.changeTab,
                    isOpen: homeController.isSidebarOpen,
                  ),
                ),

              if (homeController.isSidebarOpen && tabletBreakpoint)
                GestureDetector(
                  onTap: homeController.toggleSidebar,
                  child: const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
