import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';

/// Empty cash receipt widget.
class EmptyCashRecipe extends StatelessWidget {
  /// Constructs of new [EmptyCashRecipe].
  const EmptyCashRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            LucideIcons.receipt,
            size: 64,
            color: ShadTheme.of(context).colorScheme.mutedForeground,
          ),
          const SizedBox(height: 16),
          Text(
            Intls.to.noCashReceiptsFound,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            Intls.to.cashReceiptsWillAppearHereOnceTheyAreCreated,
            style: ShadTheme.of(context).textTheme.muted,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
