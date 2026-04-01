import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// The custom menu.
class CustomMenu extends StatelessWidget {
  /// Constructor of new [CustomMenu].
  CustomMenu({Key? key, required this.childrens}) : super(key: key);

  /// The menu children.
  final List<MenuTile> childrens;

  /// [ShadPopoverController].
  final popoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    return ShadPopover(
      controller: popoverController,
      child: ShadButton.ghost(
        size: ShadButtonSize.sm,
        onPressed: popoverController.toggle,
        leading: const Icon(LucideIcons.ellipsisVertical),
        child: const SizedBox.shrink(),
      ),
      popover: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: childrens,
      ),
    );
  }
}

/// The menu title.
class MenuTile extends StatelessWidget {
  /// Constructor of new [MenuTile].
  const MenuTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  /// The icon to display.
  final IconData icon;

  /// The label to display.
  final String label;

  /// The callback to invoke when the tile is tapped.
  final VoidCallback onTap;

  /// Whether the tile is destructive (e.g. a delete button).
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    final color = isDestructive ? cs.destructive : cs.foreground;

    return ShadButton.link(
      child: Text(label),
      leading: Icon(icon, size: 15, color: color),
      onPressed: onTap,
    );
  }
}
