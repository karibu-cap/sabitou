import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/app_theme_service.dart';
import '../../../services/internationalization/internationalization.dart';
import '../settings_controller.dart';

/// The [SystemSettings] widget.
class SystemSettings extends StatelessWidget {
  /// Constructs of new [SystemSettings].
  const SystemSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SystemSettings(),
        Divider(color: ShadTheme.of(context).colorScheme.border, thickness: 1),
        const _ApplicationSettings(),
        Divider(color: ShadTheme.of(context).colorScheme.border, thickness: 1),
        Row(
          spacing: 12,
          children: [
            Flexible(
              child: ShadButton(
                onPressed: () {},
                leading: const Icon(LucideIcons.save400),
                child: Flexible(
                  child: Text(
                    Intls.to.saveChanges,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            ShadButton.ghost(onPressed: () {}, child: Text(Intls.to.cancel)),
          ],
        ),
      ],
    );
  }
}

class _SystemSettings extends StatelessWidget {
  const _SystemSettings();

  @override
  Widget build(BuildContext context) {
    final themeService = context.watch<AppThemeService>();
    final internationalizationService = context
        .watch<AppInternationalizationService>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          Intls.to.systemSettings,
          style: ShadTheme.of(
            context,
          ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading: Icon(
            LucideIcons.moon400,
            color: ShadTheme.of(context).colorScheme.primary,
          ),
          subtitle: Text(
            Intls.to.darkModeDescription,
            style: ShadTheme.of(context).textTheme.muted,
          ),
          title: Text(
            Intls.to.darkMode,
            style: ShadTheme.of(context).textTheme.p,
          ),
          trailing: ShadSwitch(
            value: themeService.isDarkMode,
            onChanged: (value) {
              themeService.switchTheme();
            },
          ),
        ),
        ListTile(
          leading: Icon(
            LucideIcons.languages400,
            color: ShadTheme.of(context).colorScheme.primary,
          ),
          subtitle: Text(
            Intls.to.languageDescription,
            style: ShadTheme.of(context).textTheme.muted,
          ),
          title: Text(
            Intls.to.language,
            style: ShadTheme.of(context).textTheme.p,
          ),
          trailing: ShadSelect<Locale>(
            placeholder: Text(Intls.to.allCategories),
            initialValue: internationalizationService.locale,
            options: Intls.supportedLocales.map(
              (e) => ShadOption(value: e, child: Text(e.languageCode)),
            ),
            selectedOptionBuilder: (context, value) => Text(value.languageCode),
            onChanged: internationalizationService.changeLocale,
          ),
        ),
      ],
    );
  }
}

class _ApplicationSettings extends StatelessWidget {
  const _ApplicationSettings();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          Intls.to.applicationSettings,
          style: ShadTheme.of(
            context,
          ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading: Icon(
            LucideIcons.building400,
            color: ShadTheme.of(context).colorScheme.primary,
          ),
          subtitle: Text(
            Intls.to.switchBusiness,
            style: ShadTheme.of(context).textTheme.muted,
          ),
          title: Text(
            Intls.to.business,
            style: ShadTheme.of(context).textTheme.p,
          ),
          trailing: ShadSelect<Business>(
            placeholder: Text(Intls.to.allBusiness),
            initialValue: controller.selectedBusiness,
            options: controller.userBusinessesStore.map(
              (e) => ShadOption<Business>(
                value: e.business,
                child: Text(e.business.name),
              ),
            ),
            selectedOptionBuilder: (context, value) => Text(value.name),
            onChanged: controller.setSelectedBusiness,
          ),
        ),
        ListTile(
          leading: Icon(
            LucideIcons.store400,
            color: ShadTheme.of(context).colorScheme.primary,
          ),
          subtitle: Text(
            Intls.to.switchStore,
            style: ShadTheme.of(context).textTheme.muted,
          ),
          title: Text(Intls.to.store, style: ShadTheme.of(context).textTheme.p),
          trailing: ShadSelect<Store>(
            placeholder: Text(Intls.to.allStores),
            initialValue: controller.selectedStore,
            options: controller.userBusinessesStore
                .where(
                  (e) => e.business.refId == controller.selectedBusiness?.refId,
                )
                .map((e) => e.stores)
                .expand((e) => e)
                .map((e) => ShadOption<Store>(value: e, child: Text(e.name))),
            selectedOptionBuilder: (context, value) => Text(value.name),
            onChanged: controller.setSelectedStore,
          ),
        ),
      ],
    );
  }
}
