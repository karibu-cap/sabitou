import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
import 'components/settings_contents.dart';
import 'components/settings_tabs_view.dart';
import 'settings_controller.dart';
import 'settings_view_model.dart';

/// The [SettingsScreen] widget.
class SettingsScreen extends StatelessWidget {
  /// Constructs of new [SettingsScreen].
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final viewModel = GetIt.I.registerSingletonIfAbsent<SettingsViewModel>(
      SettingsViewModel.new,
    );

    return ChangeNotifierProvider(
      create: (context) => SettingsController(viewModel: viewModel),
      builder: (context, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(!isMobile ? 24 : 5),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Intls.to.settings,
                style: ShadTheme.of(context).textTheme.h4,
              ),
              Text(
                Intls.to.settingsTitleDescription,
                style: ShadTheme.of(context).textTheme.muted,
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: viewModel.initCompleter.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Loading();
                  }

                  return Flex(
                    direction: !isDesktop ? Axis.vertical : Axis.horizontal,
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: !isDesktop ? 0 : 1,
                        child: const SettingsTabsView(),
                      ),
                      Expanded(
                        flex: !isDesktop ? 0 : 2,
                        child: const SettingsContents(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

/// The settings tab extension.
extension SettingsTabExtension on SettingsTab {
  /// The title of the tab.
  String get title {
    switch (this) {
      case SettingsTab.businessInfo:
        return Intls.to.businessInfo;
      case SettingsTab.storeInfo:
        return Intls.to.storeInfo;
      case SettingsTab.security:
        return Intls.to.securityAndPrivacy;
      case SettingsTab.system:
        return Intls.to.system;
    }
  }

  /// The subtitle of the tab.
  String subtitle(BuildContext context) {
    final intls = context.watch<Intls>();
    switch (this) {
      case SettingsTab.businessInfo:
        return intls.businessInfoSubtitle;
      case SettingsTab.storeInfo:
        return intls.storeInfoSubtitle;
      case SettingsTab.security:
        return intls.securitySubtitle;
      case SettingsTab.system:
        return intls.systemSubtitle;
    }
  }
}
