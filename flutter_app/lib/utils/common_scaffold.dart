import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Common scaffold used throughout th app.
class CommonScaffold extends StatelessWidget {
  /// The title of the app bar.
  final String? title;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// The child widget of the scaffold.
  final Widget child;

  /// The action widgets of the app bar.
  final List<Widget>? actions;

  /// Whether to display a separator after the app bar.
  final bool displaySeparator;

  /// Whether to display an app bar.
  final bool displayAppBar;

  /// The app bar bottom.
  final PreferredSizeWidget? tabBar;

  /// The bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// Constructs a [CommonScaffold].
  const CommonScaffold({
    super.key,
    required this.child,
    this.title,
    this.backgroundColor,
    this.displaySeparator = false,
    this.displayAppBar = true,
    this.bottomNavigationBar,
    this.actions,
    this.tabBar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final appBarTitle = title;

    final appBarTitleWidget = appBarTitle == null
        ? null
        : Text(appBarTitle.toUpperCase(), style: const TextStyle(fontSize: 20));
    final double appBarElevation = displaySeparator ? 1 : 0;

    final appBarWidget = AppBar(
      centerTitle: true,
      elevation: appBarElevation,
      bottom: tabBar,
      title: appBarTitleWidget,
    );

    return SelectionArea(
      child: Scaffold(
        appBar: displayAppBar ? appBarWidget : null,
        backgroundColor: backgroundColor ?? theme.colorScheme.background,
        body: FadedSlideAnimation(
          beginOffset: const Offset(0, -0.3),
          endOffset: Offset.zero,
          slideCurve: Curves.linearToEaseOut,
          child: Column(children: [Expanded(child: child)]),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
