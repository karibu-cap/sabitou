import 'dart:math';

import 'package:flutter/material.dart';

import '../../router/app_router.dart' as app_router;

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';
import '../../utils/user_preference.dart';
import '../features/language_selection.dart';
import '../atoms/sb_container.dart';
import '../features/theme_switcher.dart';

/// The navbar item.
final class NavbarItem {
  /// The navbar label item.
  final String label;

  /// The navbar icon item.
  final IconData activeIcon;

  /// The navbar icon item.
  final IconData icon;

  /// The navbar action on press.
  final VoidCallback onPressed;

  /// The dashboard identification.
  final String dashboardLabelPage;

  /// Constructor of new [NavbarItem].
  const NavbarItem({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.dashboardLabelPage,
    IconData? activeIcon,
  }) : activeIcon = activeIcon ?? icon;
}

/// The navbar drawer.
class NavDrawer extends StatelessWidget {
  /// The selected navbar item.
  final String selectedItem;

  /// Whether the navbar is large or not.
  final bool isLarge;

  /// Constructor of new [NavDrawer].
  const NavDrawer({
    super.key,
    required this.selectedItem,
    this.isLarge = true,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width =
        isLarge ? min(200.0, size.width * 0.15) : min(90.0, size.width * 0.09);
    final userPreference = UserPreferences.instance;

    /// The navbar items.
    final List<NavbarItem> firstNavbarSection = [
      NavbarItem(
        label: AppInternationalizationService.to.dashboard,
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard,
        dashboardLabelPage: 'Dashboard',
        onPressed: () => app_router.pushReplacement(
          context,
          app_router.businessSummaryRoutePath,
        ),
      ),
      if (userPreference.business != null)
        NavbarItem(
          label: AppInternationalizationService.to.stores,
          icon: Icons.store_outlined,
          activeIcon: Icons.store,
          dashboardLabelPage: 'Stores',
          onPressed: () => app_router.pushReplacement(
            context,
            app_router.storeListRoutePath,
          ),
        ),
    ];

    /// The second nav bar items.
    final List<NavbarItem> secondNavbarSection = [
      NavbarItem(
        label: AppInternationalizationService.to.setting,
        dashboardLabelPage: 'Settings',
        icon: Icons.settings_outlined,
        onPressed: () => {},
      ),
      NavbarItem(
        label: AppInternationalizationService.to.signOut,
        icon: Icons.logout_outlined,
        dashboardLabelPage: 'Dashboard',
        onPressed: () => {},
      ),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            const _NavDrawerHeader(),
            _NavSection(
              items: firstNavbarSection,
              selectedItem: selectedItem,
              isLarge: isLarge,
              height: max(300, MediaQuery.sizeOf(context).height * 0.5),
              isFooterSection: false,
            ),
            _NavSection(
              items: secondNavbarSection,
              selectedItem: selectedItem,
              isLarge: isLarge,
              height: max(200, MediaQuery.sizeOf(context).height * 0.3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavSection extends StatelessWidget {
  final List<NavbarItem> items;
  final String selectedItem;
  final bool isLarge;
  final bool isFooterSection;
  final double height;

  const _NavSection({
    required this.items,
    required this.selectedItem,
    required this.isLarge,
    required this.height,
    this.isFooterSection = true,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height),
      child: Container(
        decoration: isFooterSection
            ? null
            : const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: AppColors.grey100, width: 0.5),
                ),
              ),
        child: Column(
          mainAxisAlignment: isFooterSection
              ? MainAxisAlignment.end
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...items.map(
              (item) => _NavItemWidget(
                navItem: item,
                selectedItem: selectedItem,
                isLarge: isLarge,
              ),
            ),
            const SizedBox(height: 20),
            if (isFooterSection) const ThemeSwitcherWFeat(),
            const SizedBox(height: 20),
            if (isFooterSection) const LanguageSelectionWFeat(),
          ],
        ),
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  final NavbarItem navItem;
  final String selectedItem;
  final bool isLarge;

  const _NavItemWidget({
    required this.navItem,
    required this.selectedItem,
    required this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLarge
            ? _NavbarItemLarge(
                navItem: navItem,
                selectedItem: selectedItem,
              )
            : _NavbarItemSmall(
                navItem: navItem,
                selectedItem: selectedItem,
              ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class _NavbarItemLarge extends StatelessWidget {
  final NavbarItem navItem;
  final String selectedItem;

  const _NavbarItemLarge({
    required this.navItem,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = navItem.dashboardLabelPage == selectedItem;

    return InkWell(
      onTap: navItem.onPressed,
      child: ContainerWAtom(
        level: isSelected ? 7 : null,
        startBlurOffset: const Offset(5, 2),
        padding: const EdgeInsets.all(5.0),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: isSelected ? AppColors.grey0 : AppColors.transparent,
        child: Row(
          children: [
            ContainerWAtom(
              level: 10,
              padding: const EdgeInsets.all(5.0),
              gradient: isSelected ? AppColors.gradientButton : null,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: !isSelected ? AppColors.grey0 : null,
              child: Icon(
                navItem.icon,
                color: isSelected ? AppColors.primary50 : AppColors.grey900,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                navItem.label,
                maxLines: 2,
                style: TextStyle(
                  color: isSelected ? AppColors.lightForeground : null,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavbarItemSmall extends StatelessWidget {
  final NavbarItem navItem;
  final String selectedItem;

  const _NavbarItemSmall({
    required this.navItem,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = navItem.dashboardLabelPage == selectedItem;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: navItem.onPressed,
        child: ContainerWAtom(
          padding: const EdgeInsets.all(7.0),
          gradient: isSelected ? AppColors.gradientButton : null,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          color: !isSelected ? AppColors.grey0 : null,
          child: Icon(
            navItem.icon,
            color: isSelected ? AppColors.primary50 : AppColors.grey900,
          ),
        ),
      ),
    );
  }
}

class _NavDrawerHeader extends StatelessWidget {
  const _NavDrawerHeader();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: max(120, MediaQuery.sizeOf(context).height * 0.15),
      ),
      child: Column(
        children: [Text(AppInternationalizationService.to.setting)],
      ),
    );
  }
}

/// The app drawer.
class AppDrawer extends StatelessWidget {
  /// The selected navbar item.
  final String selectedItem;

  /// Constructor of new [AppDrawer].
  const AppDrawer({
    super.key,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: NavDrawer(
        selectedItem: selectedItem,
      ),
    );
  }
}
