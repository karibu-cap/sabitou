import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/internationalization/internationalization.dart';
import '../../services/themes/app_themes.dart';
import '../../themes/app_colors.dart';

/// A beautiful language selection component.
final class CPLanguageSelection extends StatelessWidget {
  /// Constructor for [CPLanguageSelection].
  const CPLanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () => AppInternationalizationService.to.changeLocale(),
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
            alignment:
                AppInternationalizationService.to.locale.languageCode == 'en'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 35,
                maxHeight: 35,
              ),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppThemeService.to.isDarkMode
                    ? AppColors.grey800
                    : AppColors.grey50,
              ),
              child: Center(
                child: Text(
                  AppInternationalizationService.to.locale.languageCode == 'en'
                      ? 'en'
                      : 'fr',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
