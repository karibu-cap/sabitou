import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../widgets/sidebar/sidebar_menu_item.dart';
import '../settings_controller.dart';
import '../settings_screen.dart';

/// The [SettingsTabsView] widget.
class SettingsTabsView extends StatelessWidget {
  /// Constructs of new [SettingsTabsView].
  const SettingsTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();

    return ShadCard(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        spacing: 12,
        children: SettingsTab.values
            .map(
              (tab) => SidebarMenuItem<SettingsTab>(
                item: SideBarItem<SettingsTab>(
                  id: tab,
                  label: tab.title,
                  icon: switch (tab) {
                    SettingsTab.businessInfo => LucideIcons.building400,
                    SettingsTab.storeInfo => LucideIcons.store400,
                    SettingsTab.security => LucideIcons.shield400,
                    SettingsTab.system => LucideIcons.settings400,
                  },
                  description: tab.subtitle(context),
                ),
                activeTab: controller.selectedTab,
                onTabChange: controller.setSelectedTab,
              ),
            )
            .toList(),
      ),
    );
  }
}
