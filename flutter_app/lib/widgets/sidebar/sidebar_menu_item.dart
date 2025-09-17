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

  /// The sidebar item children.
  final List<SideBarItem<T>>? children;

  /// Constructs the new sidebar item.
  SideBarItem({
    required this.id,
    required this.label,
    required this.icon,
    this.description,
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
  final Function(T) onTabChange;

  /// The is child.
  final bool isChild;

  /// Constructs the new [SidebarMenuItem].
  const SidebarMenuItem({
    super.key,
    required this.item,
    required this.activeTab,
    required this.onTabChange,
    this.isChild = false,
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
  });

  final Function(T)? onTabChange;
  final SideBarItem<T> item;
  final bool isChild;
  final bool isActive;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadButton.raw(
          mainAxisAlignment: MainAxisAlignment.start,
          width: constraints.maxWidth,
          height: !isActive && item.description != null ? 70 : null,
          variant: isActive
              ? ShadButtonVariant.primary
              : ShadButtonVariant.ghost,
          onPressed: () => onTabChange?.call(item.id),
          padding: EdgeInsets.symmetric(
            horizontal: isChild ? 32 : 16,
            vertical: 12,
          ),
          leading: Icon(item.icon, size: 15),

          child: Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    item.label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    minFontSize: 8,
                  ),
                  if (!isActive &&
                      (item.description != null ||
                          item.description?.isNotEmpty == true))
                    AutoSizeText(
                      item.description ?? '',
                      minFontSize: 8,
                      style: theme.textTheme.muted,
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
