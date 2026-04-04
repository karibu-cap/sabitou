import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constants.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/loading.dart';
import '../../widgets/no_business_view.dart';
import 'audits_controller.dart';
import 'audits_view_model.dart';
import 'components/transaction_filters.dart';
import 'components/transaction_header.dart';
import 'components/transaction_tabs.dart';

/// Modern audits screen displaying inventory and voucher transactions
class AuditsScreen extends StatelessWidget {
  /// Constructs a new [AuditsScreen]
  const AuditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final currentStore = userPreferences.store;
    final business = userPreferences.business;

    if (currentStore == null || business == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    final viewModel = AuditsViewModel(currentStore: currentStore);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveUtils.isMobile(context);

        return ChangeNotifierProvider(
          create: (context) => AuditsController(viewModel),
          child: Consumer<AuditsController>(
            builder: (context, controller, child) {
              return FutureBuilder<bool>(
                future: controller.completer?.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Loading();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: isMobile
                        ? AppConstants.spacingM
                        : AppConstants.spacingL,
                    children: const [
                      TransactionHeader(),
                      TransactionFilters(),
                      TransactionTabs(),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
