import 'package:flutter/material.dart';

import '../../routes/pages_routes.dart';
import '../../widgets/base_page.dart';

/// The store view screen.
final class StoresView extends StatelessWidget {
  /// Constructor of new [StoresView].
  const StoresView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasePageView(
      itemPage: DashboardLabelPage.stores.name,
      child: const Center(
        child: Text('Stores'),
      ),
    );
  }
}
