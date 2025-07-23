// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class AppColors {
  static const Color transparent = Colors.transparent;
  static const Color black = Colors.black;
  static const Color cobalt = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF3B82F6);
  static const Color red = Color.fromARGB(255, 217, 10, 10);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color lightGreen = Color(0xFF10B981);
  static const Color dartGreen = Color(0xFF16A34A);
  static const Color lightOrange = Color(0xFFFB923C);
  static const Color orange700 = Color(0xFF9A3412);
  static const Color orange600 = Color(0xFFC2410C);
  static const Color orange500 = Color(0xFFEA580C);
  static const Color purple = Color(0xFF8B5CF6);

  // Grey.
  static const Color grey0 = Color.fromARGB(255, 255, 255, 255);
  static const Color grey50 = Color(0xFFF4F5FC);
  static const Color grey100 = Color(0xFFd0d3d9);
  static const Color grey200 = Color(0xFFb9bdc7);
  static const Color grey300 = Color(0xFF858d9d);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF667085);
  static const Color grey600 = Color(0xFF5d6679);
  static const Color grey700 = Color(0xFF48505e);
  static const Color grey800 = Color(0xFF1e293b);
  static const Color grey900 = Color(0xFF0f172a);

  // Primary.
  static const Color primary50 = Color(0xFFe8f1fd);
  static const Color primary100 = Color(0xFFb6d3fa);
  static const Color primary200 = Color(0xFF93bdf8);
  static const Color primary300 = Color(0xFF629ff4);
  static const Color primary400 = Color(0xFF448df2);
  static const Color primary500 = Color(0xFF2563eb);
  static const Color primary600 = Color(0xFF1366d9);
  static const Color primary700 = Color(0xFF0f50aa);
  static const Color primary800 = Color(0xFF0c3e83);
  static const Color primary900 = Color(0xFF020817);

  // Error.
  static const Color error50 = Color(0xFFfeeceb);
  static const Color error100 = Color(0xFFfac5c1);
  static const Color error200 = Color(0xFFf8a9a3);
  static const Color error300 = Color(0xFFf5827a);
  static const Color error400 = Color(0xFFf36960);
  static const Color error500 = Color(0xFFf04438);
  static const Color error600 = Color(0xFFda3e33);
  static const Color error700 = Color(0xFFaa3028);
  static const Color error800 = Color(0xFF84251f);
  static const Color error900 = Color(0xFF651d18);

  // Warning.
  static const Color warning50 = Color(0xFFfef4e6);
  static const Color warning100 = Color(0xFFfdddb3);
  static const Color warning200 = Color(0xFFfbcc8e);
  static const Color warning300 = Color(0xFFfab55a);
  static const Color warning400 = Color(0xFFf9a63a);
  static const Color warning500 = Color(0xFFf79009);
  static const Color warning600 = Color(0xFFe18308);
  static const Color warning700 = Color(0xFFaf6606);
  static const Color warning800 = Color(0xFF884f05);
  static const Color warning900 = Color(0xFF683c04);

  // Success.
  static const Color success50 = Color(0xFFe7f8f0);
  static const Color success100 = Color(0xFFb6e9d1);
  static const Color success200 = Color(0xFF92deba);
  static const Color success300 = Color(0xFF60cf9b);
  static const Color success400 = Color(0xFF41c588);
  static const Color success500 = Color(0xFF12b76a);
  static const Color success600 = Color(0xFF10a760);
  static const Color success700 = Color(0xFF0d824b);
  static const Color success800 = Color(0xFF0a653a);
  static const Color success900 = Color(0xFF084d2d);

  static const lightBackground = grey50;
  static const lightForeground = Color(0xFF030712);
  static const lightMuted = Color(0xFFf3f4f6);
  static const lightMutedForeground = Color(0xFF6b7280);
  static const lightPopover = grey50;
  static const lightPopoverForeground = Color(0xFF030712);
  static const lightCard = grey50;
  static const lightCardForeground = Color(0xFF030712);
  static const lightBorder = grey100;
  static const lightInput = grey100;
  static const lightPrimary = Color(0xFF7c3aed);
  static const lightPrimaryForeground = grey50;
  static const lightSecondary = grey50;
  static const lightSecondaryForeground = Color(0xFF111827);
  static const lightAccent = grey50;
  static const lightAccentForeground = Color(0xFF111827);
  static const lightDestructive = Color(0xFFEF4444);
  static const lightDestructiveForeground = Color(0xFFF8FAFC);
  static const lightRing = Color(0xFF7c3aed);

  static const darkBackground = Color(0xFF030712);
  static const darkForeground = grey50;
  static const darkMuted = Color(0xFF1f2937);
  static const darkMutedForeground = Color(0xFF9ca3af);
  static const darkPopover = Color(0xFF030712);
  static const darkPopoverForeground = grey50;
  static const darkCard = Color(0xFF030712);
  static const darkCardForeground = grey50;
  static const darkBorder = Color(0xFF1f2937);
  static const darkInput = Color(0xFF1f2937);
  static const darkPrimary = Color(0xFF6d28d9);
  static const darkPrimaryForeground = grey50;
  static const darkSecondary = Color(0xFF1f2937);
  static const darkSecondaryForeground = grey50;
  static const darkAccent = Color(0xFF1E293B);
  static const darkAccentForeground = grey50;
  static const darkDestructive = Color(0xFF7f1d1d);
  static const darkDestructiveForeground = grey50;
  static const darkRing = Color(0xFF6d28d9);

  static const darkBackgroundGradient = LinearGradient(
    colors: [
      Color(0xFF030712),
      darkSecondary,
    ],
  );
  static const lightBackgroundGradient = LinearGradient(
    colors: [
      Color(0xFF7928CA),
      Color(0xFFFF0080),
    ],
  );

  /// The gradient button.
  static const gradientButton = LinearGradient(
    colors: [
      Color(0xFF7928CA),
      Color(0xFFFF0080),
    ],
  );
}
