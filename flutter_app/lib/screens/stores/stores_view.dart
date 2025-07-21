import 'package:flutter/material.dart';

import '../../widgets/layouts/base_page.dart';

/// The store view screen.
final class StoresView extends StatelessWidget {
  /// Constructor of new [StoresView].
  const StoresView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BasePageView(
      itemPage: 'Store',
      child: Center(
        child: Text('Stores'),
      ),
    );
  }
}
