import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/responsive_utils.dart';
import '../../widgets/app_header/app_header.dart';
import '../../widgets/sidebar/sidebar.dart';
import 'components/auth_gate_view.dart';
import 'home_controller.dart';

/// The home screen.
class HomeScreen extends StatelessWidget {
  /// The navigation shell.
  final StatefulNavigationShell navigationShell;

  /// Constructs the new home screen.
  const HomeScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final cs = ShadTheme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.background,
      drawer: SafeArea(child: SidebarWidget(navigationShell: navigationShell)),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => HomeController(),
          child: UserAuthGatePage(
            child: Consumer<HomeController>(
              builder: (context, homeController, _) => Row(
                children: [
                  if (!isMobile)
                    SidebarWidget(navigationShell: navigationShell),
                  Expanded(
                    child: Column(
                      children: [
                        HeaderWidget(
                          onMenuClick: Scaffold.of(context).openDrawer,
                          isSidebarOpen: homeController.isSidebarOpen,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 1280),
                              child: ColoredBox(
                                color: cs.background,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 16.0 : 24.0,
                                    vertical: 18,
                                  ),
                                  child: navigationShell,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
