import 'package:flutter/material.dart';

import '../../../../themes/app_colors.dart';

/// Widget for the login logo/icon
class LoginLogo extends StatelessWidget {
  /// Constructs a [LoginLogo] widget
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.success800, AppColors.success600],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Icon(Icons.login, size: 40, color: Colors.white),
    );
  }
}
