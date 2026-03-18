import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// The sidebar item.
class SideBarItem<T> {
  /// The sidebar item id.
  final T id;

  /// The sidebar item label.
  final String label;

  /// The sidebar item icon.
  final IconData icon;

  /// The sidebar item description.
  final String? description;

  /// The sidebar item path.
  final String? path;

  /// The sidebar item children.
  final List<SideBarItem<T>>? children;

  /// Constructs the new sidebar item.
  SideBarItem({
    required this.id,
    required this.label,
    required this.icon,
    this.description,
    this.path,
    this.children,
  });
}

/// The sidebar menu item.
class SidebarMenuItem<T> extends StatelessWidget {
  /// The sidebar menu item.
  final SideBarItem<T> item;

  /// The active tab.
  final T activeTab;

  /// The on tab change callback.
  final Function(SideBarItem<T>) onTabChange;

  /// The is child.
  final bool isChild;

  /// The minimum height.
  final double? minHeight;

  /// The variant.
  final ShadButtonVariant variant;

  /// Constructs the new [SidebarMenuItem].
  const SidebarMenuItem({
    super.key,
    required this.item,
    required this.activeTab,
    required this.onTabChange,
    this.isChild = false,
    this.minHeight,
    this.variant = ShadButtonVariant.ghost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ItemWidget<T>(
          onTabChange: item.children?.isNotEmpty == true ? null : onTabChange,
          item: item,
          isChild: isChild,
          isActive: activeTab == item.id,
          theme: ShadTheme.of(context),
          minHeight: minHeight,
          variant: variant,
          hasAChild: item.children?.isNotEmpty == true,
        ),
        if (item.children != null) ...[
          const SizedBox(height: 4),
          ...(item.children ?? []).map(
            (child) => SidebarMenuItem(
              item: child,
              activeTab: activeTab,
              onTabChange: onTabChange,
              isChild: true,
            ),
          ),
        ],
      ],
    );
  }
}

class _ItemWidget<T> extends StatelessWidget {
  const _ItemWidget({
    required this.onTabChange,
    required this.item,
    required this.isChild,
    required this.isActive,
    required this.theme,
    this.minHeight,
    this.hasAChild = false,
    required this.variant,
  });

  final Function(SideBarItem<T>)? onTabChange;
  final SideBarItem<T> item;
  final bool isChild;
  final bool hasAChild;
  final bool isActive;
  final ShadThemeData theme;
  final double? minHeight;
  final ShadButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadButton.raw(
          width: constraints.maxWidth,
          mainAxisAlignment: MainAxisAlignment.start,
          variant: isActive ? ShadButtonVariant.primary : variant,
          onPressed: () => onTabChange?.call(item),
          enabled: !hasAChild,

          padding: EdgeInsets.symmetric(
            horizontal: isChild ? 28.0 : 12.0,
            vertical: 10.0,
          ),

          height:
              minHeight ?? (!isActive && item.description != null ? 64 : 40),

          leading: hasAChild
              ? Icon(
                  LucideIcons.chevronRight,
                  size: 13,
                  color: theme.colorScheme.mutedForeground,
                )
              : Icon(item.icon, size: 16),

          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  item.label,
                  maxLines: 1,
                  minFontSize: 8,
                  overflow: TextOverflow.ellipsis,
                  style: hasAChild
                      ? theme.textTheme.h4.copyWith(
                          color: theme.colorScheme.mutedForeground,
                        )
                      : theme.textTheme.small,
                ),
                if (!isActive && item.description?.isNotEmpty == true)
                  AutoSizeText(
                    item.description ?? '',
                    minFontSize: 8,
                    style: theme.textTheme.muted,
                    textAlign: TextAlign.left,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
