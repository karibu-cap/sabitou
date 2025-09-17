import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../settings_controller.dart';
import '../settings_screen.dart';
import 'account_security.dart';
import 'business_settings_view.dart';
import 'store_settings_view.dart';
import 'system_settings.dart';

/// The [SettingsContents] widget.
class SettingsContents extends StatelessWidget {
  /// Constructs of new [SettingsContents].
  const SettingsContents({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            spacing: 12,
            children: [
              Icon(
                color: ShadTheme.of(context).colorScheme.primary,
                switch (controller.selectedTab) {
                  SettingsTab.businessInfo => LucideIcons.building400,
                  SettingsTab.storeInfo => LucideIcons.store400,
                  SettingsTab.security => LucideIcons.shield400,
                  SettingsTab.system => LucideIcons.settings400,
                },
              ),
              Flexible(
                child: AutoSizeText(
                  controller.selectedTab.title,
                  style: ShadTheme.of(context).textTheme.h4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                ),
              ),
            ],
          ),
          Text(
            controller.selectedTab.subtitle(context),
            style: ShadTheme.of(context).textTheme.muted,
          ),

          switch (controller.selectedTab) {
            SettingsTab.businessInfo => const BusinessSettingsView(),
            SettingsTab.storeInfo => const StoreSettingsView(),
            SettingsTab.security => const AccountSecurity(),
            SettingsTab.system => const SystemSettings(),
          },
        ],
      ),
    );
  }
}
