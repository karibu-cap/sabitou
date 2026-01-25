import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A custom reusable AppBar widget that follows the app's design system.
class ShadScaffold extends StatelessWidget implements PreferredSizeWidget {
  /// The title widget to display in the AppBar.
  final Widget? title;

  /// Actions to display at the end of the AppBar.
  final List<Widget>? actions;

  /// Whether to automatically add a back button.
  final bool automaticallyImplyLeading;

  /// The height of the AppBar.
  final double? toolbarHeight;

  /// Whether to show the bottom border.
  final bool showBorder;

  /// Custom bottom widget.
  final PreferredSizeWidget? bottom;

  /// Background color override.
  final Color? backgroundColor;

  /// The body widget to display in the Scaffold.
  final Widget body;

  /// Constructs a new [ShadScaffold].
  const ShadScaffold({
    this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.toolbarHeight,
    this.showBorder = true,
    this.bottom,
    this.backgroundColor,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final canPop = Navigator.canPop(context);

    final leadingWidget = (canPop
        ? IconButton(
            icon: const Icon(LucideIcons.arrowLeft),
            onPressed: () => Navigator.of(context).pop(),
          )
        : null);

    return Scaffold(
      backgroundColor: backgroundColor ?? theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor ?? theme.colorScheme.background,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: automaticallyImplyLeading && canPop,
        toolbarHeight: toolbarHeight,
        leading: leadingWidget,
        title: title != null
            ? DefaultTextStyle(
                style: theme.textTheme.h4.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.foreground,
                ),
                child: title ?? const SizedBox.shrink(),
              )
            : null,
        actions: actions,
        iconTheme: IconThemeData(color: theme.colorScheme.foreground),
        bottom:
            bottom ??
            (showBorder
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: Container(
                      color: theme.colorScheme.border,
                      height: 1,
                    ),
                  )
                : null),
      ),
      body: SafeArea(child: body),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    (toolbarHeight ?? kToolbarHeight) +
        (bottom?.preferredSize.height ?? (showBorder ? 1 : 0)),
  );
}
