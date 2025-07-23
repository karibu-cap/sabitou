import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// App theme.
class AppThemeProvider {
  /// Convert OKLCH colors to Flutter Colors.
  static const Color _backgroundLight = Color(0xFFFEFEFE);
  static const Color _foregroundLight = Color(0xFF000000);
  static const Color _cardLight = Color(0xFFFFFFFF);
  static const Color _primaryLight = Color(0xFF000000);
  static const Color _primaryForegroundLight = Color(0xFFFFFFFF);
  static const Color _secondaryLight = Color(0xFFF0F0F0);
  static const Color _mutedLight = Color(0xFFF7F7F7);
  static const Color _mutedForegroundLight = Color(0xFF707070);
  static const Color _accentLight = Color(0xFFF0F0F0);
  static const Color _destructiveLight = Color(0xFFDC2626);
  static const Color _destructiveForegroundLight = Color(0xFFFFFFFF);
  static const Color _borderLight = Color(0xFFEBEBEB);
  static const Color _inputLight = Color(0xFFF0F0F0);
  static const Color _ringLight = Color(0xFF000000);

  /// Dark theme colors.
  static const Color _backgroundDark = Color(0xFF000000);
  static const Color _foregroundDark = Color(0xFFFFFFFF);
  static const Color _cardDark = Color.fromARGB(255, 9, 9, 9);
  static const Color _primaryDark = Color(0xFFFFFFFF);
  static const Color _primaryForegroundDark = Color(0xFF000000);
  static const Color _secondaryDark = Color.fromARGB(255, 16, 16, 16);
  static const Color _mutedDark = Color(0xFF3A3A3A);
  static const Color _mutedForegroundDark = Color(0xFFB8B8B8);
  static const Color _accentDark = Color(0xFF525252);
  static const Color _destructiveForegroundDark = Color(0xFF000000);
  static const Color _borderDark = Color(0xFF424242);
  static const Color _inputDark = Color(0xFF525252);
  static const Color _ringDark = Color(0xFFB8B8B8);

  /// Danger color.
  static const Color dangerColor = Color.fromARGB(255, 217, 10, 10);

  /// Warning color.
  static const Color warningColor = Color(0xFFF59E0B);

  /// Success color.
  static const Color successColor = Color(0xFF10B981);

  static const TextTheme _geistTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w400,
      fontSize: 57,
      height: 1.12,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w400,
      fontSize: 45,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w400,
      fontSize: 36,
      height: 1.22,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w600,
      fontSize: 32,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w600,
      fontSize: 28,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 1.33,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.4,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Geist',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Geist',
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
      background: _backgroundLight,
      foreground: _foregroundLight,
      cardForeground: _foregroundLight,
      popover: _backgroundLight,
      popoverForeground: _foregroundLight,
      primary: _primaryLight,
      primaryForeground: _primaryForegroundLight,
      secondary: _secondaryLight,
      secondaryForeground: _foregroundLight,
      muted: _mutedLight,
      mutedForeground: _mutedForegroundLight,
      accent: _accentLight,
      accentForeground: _foregroundLight,
      destructive: _destructiveLight,
      destructiveForeground: _destructiveForegroundLight,
      border: _borderLight,
      input: _inputLight,
      ring: _ringLight,
    ),
    radius: const BorderRadius.all(Radius.circular(8.0)),
    textTheme: ShadTextTheme(
      family: 'Geist',
      h1Large: _geistTextTheme.displayLarge,
      h1: _geistTextTheme.displayMedium,
      h2: _geistTextTheme.displaySmall,
      h3: _geistTextTheme.headlineLarge,
      h4: _geistTextTheme.headlineMedium,
      p: _geistTextTheme.bodyLarge,
      blockquote: _geistTextTheme.bodyLarge?.copyWith(
        fontStyle: FontStyle.italic,
      ),
      table: _geistTextTheme.bodyMedium,
      list: _geistTextTheme.bodyMedium,
      lead: _geistTextTheme.titleLarge,
      large: _geistTextTheme.titleMedium,
      small: _geistTextTheme.bodySmall,
      muted: _geistTextTheme.bodySmall?.copyWith(color: _mutedForegroundLight),
    ),
    cardTheme: const ShadCardTheme(
      backgroundColor: _cardLight,
      border: Border.fromBorderSide(BorderSide(color: _borderLight)),
      shadows: [
        BoxShadow(
          color: Color(0x16000000),
          offset: Offset(0, 1),
          blurRadius: 2,
        ),
        BoxShadow(
          color: Color(0x2E000000),
          offset: Offset(0, 1),
          blurRadius: 2,
          spreadRadius: -1,
        ),
      ],
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
      primary: _primaryDark,
      primaryForeground: _primaryForegroundDark,
      secondary: _secondaryDark,
      secondaryForeground: _foregroundDark,
      muted: _mutedDark,
      mutedForeground: _mutedForegroundDark,
      accent: _accentDark,
      accentForeground: _foregroundDark,
      destructiveForeground: _destructiveForegroundDark,
      border: _borderDark,
      input: _inputDark,
      ring: _ringDark,
    ),
    radius: const BorderRadius.all(Radius.circular(8.0)),
    textTheme: ShadTextTheme(
      family: 'Geist',
      h1Large: _geistTextTheme.displayLarge?.copyWith(color: _foregroundDark),
      h1: _geistTextTheme.displayMedium?.copyWith(color: _foregroundDark),
      h2: _geistTextTheme.displaySmall?.copyWith(color: _foregroundDark),
      h3: _geistTextTheme.headlineLarge?.copyWith(color: _foregroundDark),
      h4: _geistTextTheme.headlineMedium?.copyWith(color: _foregroundDark),
      p: _geistTextTheme.bodyLarge?.copyWith(color: _foregroundDark),
      blockquote: _geistTextTheme.bodyLarge?.copyWith(
        fontStyle: FontStyle.italic,
        color: _foregroundDark,
      ),
      table: _geistTextTheme.bodyMedium?.copyWith(color: _foregroundDark),
      list: _geistTextTheme.bodyMedium?.copyWith(color: _foregroundDark),
      lead: _geistTextTheme.titleLarge?.copyWith(color: _foregroundDark),
      large: _geistTextTheme.titleMedium?.copyWith(color: _foregroundDark),
      small: _geistTextTheme.bodySmall?.copyWith(color: _foregroundDark),
      muted: _geistTextTheme.bodySmall?.copyWith(color: _mutedForegroundDark),
    ),
    cardTheme: const ShadCardTheme(
      backgroundColor: _cardDark,
      border: Border.fromBorderSide(BorderSide(color: _borderDark)),
      shadows: [
        BoxShadow(
          color: Color(0x16000000),
          offset: Offset(0, 1),
          blurRadius: 2,
        ),
        BoxShadow(
          color: Color(0x2E000000),
          offset: Offset(0, 1),
          blurRadius: 2,
          spreadRadius: -1,
        ),
      ],
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
