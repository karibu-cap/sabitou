import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// App theme.
class AppTheme {
  /// Convert OKLCH colors to Flutter Colors.
  static const Color _foregroundLight = Color(0xFF21232C);
  static const Color _cardLight = Color(0xFFFCFCFD);
  static const Color _primaryLight = Color(0xFF21232C);
  static const Color _primaryForegroundLight = Color(0xFFFFFFFF);
  static const Color _secondaryLight = Color(0xFFF4F4F6);
  static const Color _mutedForegroundLight = Color(0xFF626A84);
  static const Color _destructiveLight = Color(0xFFDC2626);
  static const Color _destructiveForegroundLight = Color(0xFFFFFFFF);
  static const Color _borderLight = Color(0xFFE2E4E9);

  /// Dark theme colors.
  static const Color _backgroundDark = Color(0xFF0F121A);
  static const Color _foregroundDark = Color(0xFFD3D6DE);
  static const Color _cardDark = Color(0xFF131620);
  static const Color _primaryDark = Color(0xFF401AFF);
  static const Color _primaryForegroundDark = Color(0xFFD3D6DE);
  static const Color _secondaryDark = Color(0xFF1A1C23);
  static const Color _mutedDark = Color(0xFF111317);
  static const Color _mutedForegroundDark = Color(0xFF989FB3);
  static const Color _destructiveForegroundDark = Color(0xFF000000);
  static const Color _borderDark = Color(0xFF272A35);

  /// Danger color.
  static const Color dangerColor = Color.fromARGB(255, 217, 10, 10);

  /// Warning color.
  static const Color warningColor = Color(0xFFF59E0B);

  /// Success color.
  static const Color successColor = Color(0xFF10B981);

  static const TextTheme _geistTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 57,
      height: 1.12,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 45,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 36,
      height: 1.22,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 32,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 28,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 1.33,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.4,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
    ),
  );

  /// Light theme data.
  static final ShadThemeData lightTheme = ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadSlateColorScheme.light(
      foreground: _foregroundLight,
      cardForeground: _foregroundLight,
      popoverForeground: _foregroundLight,
      primary: _primaryLight,
      primaryForeground: _primaryForegroundLight,
      secondary: _secondaryLight,
      secondaryForeground: _foregroundLight,
      mutedForeground: _mutedForegroundLight,
      accentForeground: _foregroundLight,
      destructive: _destructiveLight,
      destructiveForeground: _destructiveForegroundLight,
    ),
    radius: const BorderRadius.all(Radius.circular(8.0)),
    textTheme: ShadTextTheme(
      family: 'Inter',
      h1Large: _geistTextTheme.displayLarge,
      h1: _geistTextTheme.displayMedium,
      h2: _geistTextTheme.displaySmall,
      h3: _geistTextTheme.headlineLarge,
      h4: _geistTextTheme.labelLarge,
      p: _geistTextTheme.bodyLarge,
      blockquote: _geistTextTheme.bodyLarge?.copyWith(
        fontStyle: FontStyle.italic,
      ),
      table: _geistTextTheme.bodyMedium,
      list: _geistTextTheme.bodyMedium,
      lead: _geistTextTheme.titleSmall,
      large: _geistTextTheme.titleMedium,
      small: _geistTextTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
      muted: _geistTextTheme.bodySmall?.copyWith(color: _mutedForegroundLight),
    ),
    inputTheme: ShadInputTheme(
      placeholderStyle: _geistTextTheme.bodySmall?.copyWith(
        color: _mutedForegroundLight,
        fontSize: 11,
      ),
      style: _geistTextTheme.bodySmall,
    ),
    cardTheme: const ShadCardTheme(
      backgroundColor: _cardLight,
      border: ShadBorder.fromBorderSide(ShadBorderSide(color: _borderLight)),
      radius: BorderRadius.all(Radius.circular(8)),
      padding: EdgeInsets.all(16),
    ),
    primaryButtonTheme: const ShadButtonTheme(
      gradient: LinearGradient(
        colors: [Color(0xFF5533ff), Color(0xFFcc66ff)],
        stops: [0, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    linkButtonTheme: const ShadButtonTheme(foregroundColor: _primaryDark),
    datePickerTheme: const ShadDatePickerTheme(height: 32),
    ghostButtonTheme: ShadButtonTheme(
      hoverBackgroundColor: _primaryLight.withValues(alpha: 0.05),
    ),
    destructiveButtonTheme: ShadButtonTheme(
      gradient: LinearGradient(
        colors: [_destructiveLight, _destructiveLight.withValues(alpha: 0.8)],
        stops: const [0, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );

  /// Dark theme data.
  static final ShadThemeData darkTheme = ShadThemeData(
    brightness: Brightness.dark,
    colorScheme: const ShadSlateColorScheme.dark(
      background: _backgroundDark,
      foreground: _foregroundDark,
      card: _cardDark,
      cardForeground: _foregroundDark,
      popover: Color(0xFF2E2E2E),
      popoverForeground: _foregroundDark,
      primary: _primaryForegroundDark,
      primaryForeground: _primaryForegroundDark,
      secondary: _secondaryDark,
      secondaryForeground: _foregroundDark,
      mutedForeground: _mutedForegroundDark,
      accentForeground: _foregroundDark,
    ),
    radius: const BorderRadius.all(Radius.circular(8.0)),
    textTheme: ShadTextTheme(
      family: 'Inter',
      h1Large: _geistTextTheme.displayLarge?.copyWith(color: _foregroundDark),
      h1: _geistTextTheme.displayMedium?.copyWith(color: _foregroundDark),
      h2: _geistTextTheme.displaySmall?.copyWith(color: _foregroundDark),
      h3: _geistTextTheme.headlineLarge?.copyWith(color: _foregroundDark),
      h4: _geistTextTheme.labelLarge?.copyWith(color: _foregroundDark),
      p: _geistTextTheme.bodyLarge?.copyWith(color: _foregroundDark),
      blockquote: _geistTextTheme.bodyLarge?.copyWith(
        fontStyle: FontStyle.italic,
      ),
      table: _geistTextTheme.bodyMedium?.copyWith(color: _foregroundDark),
      list: _geistTextTheme.bodyMedium?.copyWith(color: _foregroundDark),
      lead: _geistTextTheme.titleSmall?.copyWith(color: _foregroundDark),
      large: _geistTextTheme.titleMedium?.copyWith(color: _foregroundDark),
      small: _geistTextTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w400,
        color: _foregroundDark,
      ),
      muted: _geistTextTheme.bodySmall?.copyWith(color: _mutedForegroundLight),
    ),
    inputTheme: ShadInputTheme(
      placeholderStyle: _geistTextTheme.bodySmall?.copyWith(
        color: _mutedForegroundLight,
        fontSize: 11,
      ),
      style: _geistTextTheme.bodySmall,
    ),
    cardTheme: const ShadCardTheme(
      backgroundColor: _cardDark,
      border: ShadBorder.fromBorderSide(ShadBorderSide(color: _borderDark)),
      radius: BorderRadius.all(Radius.circular(8)),
      padding: EdgeInsets.all(16),
    ),
    primaryButtonTheme: const ShadButtonTheme(
      gradient: LinearGradient(
        colors: [Color(0xFF5533ff), Color(0xFFcc66ff)],
        stops: [0, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    linkButtonTheme: const ShadButtonTheme(foregroundColor: _primaryDark),
    outlineButtonTheme: ShadButtonTheme(
      hoverBackgroundColor: _primaryDark.withValues(alpha: 0.05),
      decoration: ShadDecoration(border: ShadBorder.all(color: _borderDark)),
    ),
  );

  /// Chart colors for data visualization.
  static const List<Color> chartColorsLight = [
    Color(0xFFCFE047),
    Color(0xFF8B5CF6),
    Color(0xFFB8B8B8),
    Color(0xFFEBEBEB),
    Color(0xFF8F8F8F),
  ];

  /// Chart colors for data visualization.
  static const List<Color> chartColorsDark = [
    Color(0xFFCFE047),
    Color(0xFF9333EA),
    Color(0xFF8F8F8F),
    Color(0xFF707070),
    Color(0xFFEBEBEB),
  ];
}
