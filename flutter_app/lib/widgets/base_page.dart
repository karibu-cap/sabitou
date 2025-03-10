import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../routes/pages_routes.dart';
import '../services/internationalization/internationalization.dart';
import '../themes/app_colors.dart';
import '../utils/app_layout.dart';
import '../utils/user_preference.dart';
import 'components/sb_container.dart';
import 'drawer.dart';

/// The base page view.
final class BasePageView extends StatelessWidget {
  /// The item page.
  final String itemPage;

  /// The dashboard child.
  final Widget child;

  /// Constructor of the base page view.
  const BasePageView({
    super.key,
    required this.itemPage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppLayout(context).isMobile;
    final bool isTablet = AppLayout(context).isTablet;
    final bool isDesktop = AppLayout(context).isDesktop;

    return Scaffold(
      drawer: AppDrawer(
        selectedItem: itemPage,
      ),
      body: Obx(
        () => Row(
          children: [
            switch ((isDesktop, isTablet)) {
              (true, _) => NavDrawer(
                  selectedItem: itemPage,
                ),
              (_, true) => NavDrawer(
                  isLarge: false,
                  selectedItem: itemPage,
                ),
              (_, _) => const SizedBox.shrink(),
            },
            Expanded(
              child: SbContainer(
                level: 5,
                endBlurOffset: -const Offset(
                  2,
                  2,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isMobile ? 0 : 40),
                  bottomLeft: Radius.circular(
                    isMobile ? 0 : 40,
                  ),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: _BodyPage(child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _BodyPage extends StatelessWidget {
  const _BodyPage({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(pinned: true, delegate: _LabelsHeader()),
        SliverToBoxAdapter(
          child: child,
        ),
      ],
    );
  }
}

final class _LabelsHeader extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent = 90;

  @override
  final double maxExtent = 90;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final Color? borderColor =
        shrinkOffset > 10 ? Theme.of(context).highlightColor : null;
    final AppLayout appLayout = AppLayout(context);
    final user = UserPreferences.instance.user;

    return SbContainer(
      level: shrinkOffset > 10 ? 1 : null,
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: borderColor == null
          ? null
          : Border.all(
              color: Theme.of(context).highlightColor,
            ),
      child: Row(
        children: [
          if (appLayout.isMobile)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: AppInternationalizationService.to.searchForProduct,
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const _NotificationIcon(
                    notificationCount: 2,
                  ),
                  _UserAvatar(
                    name: user?.firstName ?? 'user',
                    isOnline: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _NotificationIcon extends StatelessWidget {
  final int notificationCount;

  const _NotificationIcon({required this.notificationCount});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 35,
      icon: Badge.count(
        offset: const Offset(-2, 0),
        count: notificationCount,
        child: const Icon(Icons.notifications),
      ),
      onPressed: () {},
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String name;
  final bool isOnline;

  const _UserAvatar({
    required this.name,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout = AppLayout(context);

    return InkWell(
      onTap: () => AppRouter.go(
        PagesRoutes.profile.create(),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SbContainer(
            level: 5,
            height: 35,
            width: 35,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: Badge(
              label: const SizedBox.shrink(),
              offset: const Offset(3, -15),
              alignment: Alignment.bottomRight,
              smallSize: 15,
              backgroundColor:
                  isOnline ? AppColors.success500 : AppColors.error500,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).cardColor,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          if (!appLayout.isMobile)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
