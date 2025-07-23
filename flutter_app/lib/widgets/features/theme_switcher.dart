import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/app_theme_service.dart';
import '../../themes/app_colors.dart';

/// The theme switcher.
class ThemeSwitcherWFeat extends StatelessWidget {
  /// Constructor for [ThemeSwitcherWFeat].
  const ThemeSwitcherWFeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: AppThemeService.to.switchTheme,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 70,
            maxHeight: 35,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: AppThemeService.to.isDarkMode
                ? AppColors.grey900
                : AppColors.grey100,
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: AppThemeService.to.isDarkMode
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppThemeService.to.isDarkMode
                    ? AppColors.grey800
                    : AppColors.grey50,
              ),
              child: Icon(
                AppThemeService.to.isDarkMode
                    ? Icons.nightlight_round
                    : Icons.wb_sunny,
                color: AppThemeService.to.isDarkMode
                    ? AppColors.grey50
                    : AppColors.warning400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
