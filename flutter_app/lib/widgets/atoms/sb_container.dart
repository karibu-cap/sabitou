import 'package:flutter/material.dart';

import '../../services/app_theme_service.dart';
import '../../themes/app_colors.dart';

/// The custom container.
class ContainerWAtom extends Container {
  /// Constructors of new SbContainer.
  ContainerWAtom({
    super.key,
    super.child,
    super.alignment,
    super.padding,
    super.margin,
    super.width,
    super.height,
    super.constraints,
    Color? color,
    Gradient? gradient,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    double? level,
    Offset startBlurOffset = const Offset(1, 1),
    Offset? endBlurOffset,
    Color? startShadowColor,
    Color? endShadowColor,
  }) : super(
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
            border: border,
            gradient: gradient,
            boxShadow: level == null
                ? null
                : [
                    BoxShadow(
                      blurRadius: level,
                      offset: startBlurOffset,
                      color: switch ((
                        startShadowColor,
                        AppThemeService.to.isDarkMode
                      )) {
                        (Color startShadowColor, _) => startShadowColor,
                        (null, true) => AppColors.darkMutedForeground,
                        (_, _) => AppColors.lightMutedForeground,
                      },
                    ),
                    if (endBlurOffset != null)
                      BoxShadow(
                        blurRadius: level,
                        offset: endBlurOffset,
                        color: switch ((
                          endShadowColor,
                          AppThemeService.to.isDarkMode
                        )) {
                          (Color endShadowColor, _) => endShadowColor,
                          (null, true) => AppColors.darkBorder,
                          (_, _) => AppColors.lightBorder,
                        },
                      ),
                  ],
          ),
        );
}
