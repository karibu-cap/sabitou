import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/formatters.dart';

/// History tab showing audit logs for the inventory item.
class HistoryTab extends StatelessWidget {
  /// The inventory item.
  final InventoryLevelWithProduct item;

  /// Constructs a new [HistoryTab].
  const HistoryTab({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    // --- Data Logic (Preserved) ---
    final auditLogs = <Map<String, String>>[
      {
        'action': Intls.to.created,
        'date': Formatters.formatDate(
          item.product.hasCreatedAt()
              ? item.product.createdAt.toDateTime()
              : DateTime.now(),
        ),
        'user': item.level.lastUpdatedByUserId.isNotEmpty
            ? item.level.lastUpdatedByUserId
            : Intls.to.system,
      },
      if (item.level.hasLastUpdated())
        {
          'action': Intls.to.lastUpdated,
          'date': Formatters.formatDate(item.level.lastUpdated.toDateTime()),
          'user': item.level.lastUpdatedByUserId.isNotEmpty
              ? item.level.lastUpdatedByUserId
              : Intls.to.system,
        },
    ];

    if (auditLogs.isEmpty) {
      return Center(
        child: Text(
          Intls.to.noHistoryAvailable,
          style: theme.textTheme.p.copyWith(
            color: theme.colorScheme.ring.withValues(alpha: 0.5),
          ),
        ),
      );
    }

    // --- Timelines Implementation ---
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.spacingM),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          // Global styling for the timeline
          nodePosition: 0, // Aligns the line to the far left
          color: theme.colorScheme.muted, // Default color for connectors
          indicatorTheme: const IndicatorThemeData(
            position: 0,
            size: 24.0, // Match the visual weight of your original Avatar
          ),
          connectorTheme: const ConnectorThemeData(thickness: 2.0),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: auditLogs.length,
          // 1. The Connector (The Line)
          connectorBuilder: (_, index, __) {
            return SolidLineConnector(color: theme.colorScheme.muted);
          },

          // 2. The Indicator (The Dot/Icon)
          indicatorBuilder: (_, index) {
            return DotIndicator(
              color: theme.colorScheme.muted,
              child: Icon(
                LucideIcons.history400,
                size: 14, // Smaller icon to fit inside the dot
                color: theme.colorScheme.ring,
              ),
            );
          },

          // 3. The Content (Text)
          contentsBuilder: (context, index) {
            final log = auditLogs[index];

            return Padding(
              // Add padding to separate text from the line
              padding: const EdgeInsets.only(
                left: AppConstants.spacingM,
                bottom: AppConstants.spacingM,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: AppConstants.spacingXS,
                children: [
                  Text(
                    log['action'] ?? '',
                    style: theme.textTheme.h4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${Intls.to.date}: ${log['date']}',
                    style: theme.textTheme.small,
                  ),
                  Text(
                    '${Intls.to.user}: ${log['user']}',
                    style: theme.textTheme.small,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
