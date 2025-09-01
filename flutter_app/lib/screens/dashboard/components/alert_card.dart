import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/app_constants.dart';

/// A reusable alert card widget with a title, icon, and child content.
class AlertCard extends StatelessWidget {
  /// Constructor of new [AlertCard].
  const AlertCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.child,
  });

  /// The title.
  final String title;

  /// The icon.
  final IconData icon;

  /// The icon color.
  final Color iconColor;

  /// The child content.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      title: Row(
        children: [
          Icon(icon, color: iconColor, size: AppConstants.iconSize),
          const SizedBox(width: AppConstants.smallPadding),
          Flexible(
            child: AutoSizeText(
              title,
              style: ShadTheme.of(context).textTheme.h4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              minFontSize: 8,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.contentPadding),
        child: child,
      ),
    );
  }
}
