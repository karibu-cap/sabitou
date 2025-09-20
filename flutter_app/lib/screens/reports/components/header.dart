import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';

/// The new order header
class Header extends StatelessWidget {
  /// Constructs of new [Header].
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final theme = ShadTheme.of(context);

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Intls.to.reportAndAnalytics, style: theme.textTheme.h4),
            const SizedBox(height: 4),
            Text(
              Intls.to.reportAndAnalyticsDescription,
              style: theme.textTheme.muted,
            ),
          ],
        ),
        const _DateRangeFilter(),
      ],
    );
  }
}

class _DateRangeFilter extends StatelessWidget {
  const _DateRangeFilter();

  @override
  Widget build(BuildContext context) {
    return ShadDatePicker.range(
      height: 32,
      expands: true,
      placeholder: AutoSizeText(
        Intls.to.dateRange,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 8,
      ),
      allowDeselection: true,
      closeOnSelection: false,
      closeOnTapOutside: false,
    );
  }
}
