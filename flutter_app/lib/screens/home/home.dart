import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/responsive_utils.dart';
import '../../widgets/app_header/app_header.dart';
import '../../widgets/sidebar/sidebar.dart';
import 'home_controller.dart';

/// The home screen.
class HomeScreen extends StatelessWidget {
  /// The navigation shell.
  final StatefulNavigationShell navigationShell;

  /// Constructs the new home screen.
  const HomeScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final tabletBreakpoint = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Scaffold(
      backgroundColor: ShadTheme.of(context).colorScheme.secondary,
      drawer: SafeArea(child: SidebarWidget(navigationShell: navigationShell)),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => HomeController(),
          child: Consumer<HomeController>(
            builder: (context, homeController, child) => Stack(
              children: [
                Row(
                  children: [
                    if (!tabletBreakpoint)
                      SidebarWidget(navigationShell: navigationShell),
                    Expanded(
                      child: Column(
                        children: [
                          HeaderWidget(
                            onMenuClick: () {
                              Scaffold.of(context).openDrawer();
                            },
                            isSidebarOpen: homeController.isSidebarOpen,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 1280,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 16.0 : 24.0,
                                  ),
                                  child: navigationShell,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
