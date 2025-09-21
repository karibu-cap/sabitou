import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
import 'components/header.dart';
import 'components/search_and_filter.dart';
import 'components/transactions_stats.dart';
import 'components/transactions_tables.dart';
import 'transactions_controller.dart';
import 'transactions_view_model.dart';

/// Transactions screen.
class TransactionsScreen extends StatelessWidget {
  /// Constructs of new [TransactionsScreen].
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I.registerSingletonIfAbsent<TransactionsViewModel>(
      TransactionsViewModel.new,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = ResponsiveUtils.isDesktop(context);

        return ChangeNotifierProvider(
          create: (context) => TransactionsController(viewModel),
          child: Consumer<TransactionsController>(
            builder: (context, controller, child) {
              return FutureBuilder<bool>(
                future: controller.completer.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Loading();
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: isDesktop ? 32 : 24,
                      children: const [
                        TransactionsHeader(),
                        TransactionsStats(),
                        SearchAndFilterCard(),
                        TransactionsTable(),
                      ],
                    ),
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
