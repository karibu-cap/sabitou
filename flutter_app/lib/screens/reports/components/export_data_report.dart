import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';

/// The export data report.
final class ExportDataReport extends StatelessWidget {
  /// Constructor of new [ExportDataReport].
  const ExportDataReport({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return ShadCard(
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        spacing: 12,
        children: [
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  Intls.to.exportReports,
                  style: ShadTheme.of(context).textTheme.list,
                ),
                Text(
                  Intls.to.downloadAndExportReportData,
                  style: ShadTheme.of(context).textTheme.muted,
                ),
              ],
            ),
          ),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 12,
              children: [
                ShadButton.ghost(
                  child: Text(Intls.to.pdf),
                  leading: const Icon(LucideIcons.fileText400),
                  onPressed: () {},
                ),
                ShadButton.ghost(
                  child: Text(Intls.to.excel),
                  leading: const Icon(LucideIcons.download400),
                  onPressed: () {},
                ),
                ShadButton.ghost(
                  child: Text(Intls.to.csv),
                  leading: const Icon(LucideIcons.download400),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
