import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';

import '../../utils/app_constants.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/custom_grid.dart';
import '../../widgets/loading.dart';
import 'cash_recipe_controller.dart';
import 'components/cash_receipt_card.dart';
import 'components/empty_cash_recipe.dart';
import 'components/error_widget.dart';
import 'components/header.dart';
import 'components/search_and_filter.dart';

/// Screen for displaying cash receipts in a beautiful grid layout
class CashRecipeScreen extends StatelessWidget {
  /// Constructor for CashRecipeScreen
  const CashRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CashRecipeController _controller = CashRecipeController();
    final isMobile = ResponsiveUtils.isMobile(context);

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => _controller)],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: isMobile ? AppConstants.spacingM : AppConstants.spacingL,
          children: [
            const Header(),
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
                  return const Loading();
                }

                final receipts = snapshot.data ?? [];

                if (receipts.isEmpty) {
                  return const EmptyCashRecipe();
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
