import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../widgets/custom_grid.dart';
import '../../../widgets/sidebar/sidebar_menu_item.dart';
import '../reports_controller.dart';

/// The [ReportsTabsView] widget.
class ReportsTabsView extends StatelessWidget {
  /// Constructs of new [ReportsTabsView].
  const ReportsTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    return CustomGrid(
      minItemWidth: 250,
      mainAxisExtent: 80,
      crossSpacing: 16,
      children: ReportsTab.values
          .map(
            (tab) => SidebarMenuItem<ReportsTab>(
              variant: ShadButtonVariant.outline,
              item: SideBarItem<ReportsTab>(
                id: tab,
                label: tab.title,
                icon: switch (tab) {
                  ReportsTab.salesAnalytics => LucideIcons.chartColumn400,
                  ReportsTab.inventoryReport => LucideIcons.package400,
                  ReportsTab.financialSummary => LucideIcons.chartPie400,
                },
              ),
              activeTab: controller.selectedTab,
              onTabChange: controller.setSelectedTab,
              minHeight: 75,
            ),
          )
          .toList(),
    );
  }
}
