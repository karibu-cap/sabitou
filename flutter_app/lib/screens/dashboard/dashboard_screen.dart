import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_theme.dart';
import '../../utils/formatters.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/loading.dart';
import 'components/dashboard_stats.dart';
import 'components/expiry_alert.dart';
import 'components/low_stock_alert.dart';
import 'components/recent_activity.dart';
import 'dashboard_controller.dart';
import 'dashboard_view_model.dart';

/// Main dashboard screen.
class DashboardScreen extends StatelessWidget {
  /// Constructs the new [DashboardScreen].
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final currentStore = userPreferences.store;

    if (currentStore == null) return const SizedBox.shrink();

    return ChangeNotifierProvider(
      create: (_) =>
          DashboardController(DashboardViewModel(store: currentStore)),
      child: const _DashboardBody(),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, _) {
        return FutureBuilder(
          future: controller.completer.future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            }
            if (snapshot.hasError || controller.initErrorMessage.isNotEmpty) {
              return _ErrorState(message: controller.initErrorMessage);
            }

            return _DashboardContent(controller: controller);
          },
        );
      },
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: cs.destructive.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              LucideIcons.circleAlert,
              size: 24,
              color: cs.destructive,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message.isNotEmpty ? message : Intls.to.genericErrorMessage,
            style: theme.textTheme.p.copyWith(color: cs.mutedForeground),
          ),
        ],
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final DashboardController controller;
  const _DashboardContent({required this.controller});

  static const _gap = SizedBox(height: 24);

  @override
  Widget build(BuildContext context) {
    final isWide = !ResponsiveUtils.isMobile(context);
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageHeader(theme: theme, cs: cs, isWide: isWide),
          _gap,

          const DashboardStats(),
          _gap,

          LayoutBuilder(
            builder: (context, constraints) {
              if (isWide && constraints.maxWidth > 800) {
                return const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: RecentActivity()),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          LowStockAlert(),
                          SizedBox(height: 20),
                          ExpiryAlert(),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const Column(
                children: [
                  RecentActivity(),
                  SizedBox(height: 20),
                  LowStockAlert(),
                  SizedBox(height: 20),
                  ExpiryAlert(),
                ],
              );
            },
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  final ShadThemeData theme;
  final ShadColorScheme cs;
  final bool isWide;

  const _PageHeader({
    required this.theme,
    required this.cs,
    required this.isWide,
  });

  @override
  Widget build(BuildContext context) {
    final now = clock.now();
    final subtitle =
        '${Intls.to.lastUpdated} · ${Formatters.formatDate(now)} ${Formatters.formatTime(now)}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Intls.to.dashboard,
                style: theme.textTheme.h2.copyWith(letterSpacing: -0.4),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: theme.textTheme.muted),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: cs.muted,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: SabitouColors.success,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                Intls.to.online,
                style: theme.textTheme.muted.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
