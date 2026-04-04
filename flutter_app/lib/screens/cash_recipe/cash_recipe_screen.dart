import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../utils/app_constants.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/custom_grid.dart';
import '../../widgets/loading.dart';
import '../../widgets/no_business_view.dart';
import 'cash_recipe_controller.dart';
import 'cash_recipe_view_model.dart';
import 'components/cash_receipt_card.dart';
import 'components/empty_cash_recipe.dart';
import 'components/error_widget.dart';
import 'components/search_and_filter.dart';

/// Screen for displaying cash receipts in a beautiful grid layout
class CashRecipeScreen extends StatelessWidget {
  /// Constructor for CashRecipeScreen
  const CashRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<UserPreferences>();
    final store = prefs.store;
    final business = prefs.business;

    if (store == null || business == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }
    final CashRecipeController _controller = CashRecipeController(
      viewModel: CashRecipeViewModel(store: store),
    );
    final isMobile = ResponsiveUtils.isMobile(context);

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => _controller)],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: isMobile ? AppConstants.spacingM : AppConstants.spacingL,
          children: [
            Text(
              Intls.to.cashReceipts,
              style: ShadTheme.of(context).textTheme.h4,
            ),
            const CashRecipeSearchAndFilter(),
            _CashRecipeBody(),
          ],
        ),
      ),
    );
  }
}

class _CashRecipeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = context.watch<CashRecipeController>();

    return StreamBuilder<bool>(
      stream: _controller.isLoadingStream,
      initialData: false,
      builder: (context, loadingSnapshot) {
        final isLoading = loadingSnapshot.data ?? false;

        return StreamBuilder<String?>(
          stream: _controller.errorStream,
          builder: (context, errorSnapshot) {
            final error = errorSnapshot.data;

            if (error != null && error.isNotEmpty) {
              return ErrorWidget(error: error);
            }

            return StreamBuilder<List<CashReceipt>>(
              stream: _controller.filteredCashReceiptsStream,
              builder: (context, snapshot) {
                if (isLoading && snapshot.data?.isEmpty != false) {
                  return const Center(child: Loading());
                }

                final receipts = snapshot.data ?? [];

                if (receipts.isEmpty) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [EmptyCashRecipe()],
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomGrid<CashReceiptCard>(
                    children: receipts
                        .map(
                          (receipt) => CashReceiptCard(
                            cashReceipt: receipt,
                            onTap: () =>
                                _controller.onCashReceiptTap(context, receipt),
                          ),
                        )
                        .toList(),
                    minItemWidth: 300,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 16,
                    crossSpacing: 16,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
