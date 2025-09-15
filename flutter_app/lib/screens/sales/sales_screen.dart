import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
import 'components/header.dart';
import 'components/inentory_stats.dart';
import 'components/sales_table.dart';
import 'sales_controller.dart';
import 'sales_view_model.dart';

/// Sales screen.
class SalesScreen extends StatelessWidget {
  /// Constructs of new [SalesScreen].
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I.registerSingletonIfAbsent<SalesViewModel>(
      SalesViewModel.new,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = ResponsiveUtils.isDesktop(context);

        return ChangeNotifierProvider(
          create: (context) => SalesController(viewModel),
          child: Consumer<SalesController>(
            builder: (context, controller, child) {
              return FutureBuilder<bool>(
                future: controller.completer.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Loading();
                  }

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(isDesktop ? 24 : 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InventoryHeader(),
                        SizedBox(height: isDesktop ? 32 : 24),
                        const InventoryStats(),
                        SizedBox(height: isDesktop ? 32 : 24),
                        const SalesTable(),
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
