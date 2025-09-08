import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../themes/app_colors.dart';

/// The loading widget.
final class Loading extends StatelessWidget {
  /// The color of the loading.
  final Color? color;

  /// The size of the loading.
  final double size;

  /// Constructs of new [Loading].
  const Loading({super.key, this.color, this.size = 40});

  /// The loading widget for the button.
  const Loading.button({
    super.key,
    this.color = AppColors.grey0,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: color ?? ShadTheme.of(context).colorScheme.primary,
        size: size,
      ),
    );
  }
}
