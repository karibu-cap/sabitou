/// The preferences keys.
final class PreferencesKey {
  /// Whether the user has opened the app for the first time.
  static const String isFirstOpenTime = 'isFirstOpenTime';

  /// Whether the app is in dark mode.
  static const String isDartMode = 'isDarkMode';

  /// The language of the app.
  static const String language = 'language';
}

/// The static images.
final class StaticImages {
  /// The logo image.
  static const String logo = 'assets/images/logo.png';

  /// The large logo image.
  static const String largeLogo = 'assets/images/large-logo.png';
}

/// The app constants.
class AppConstants {
  /// The UI constants.
  static const double maxWidth = 1200.0;
  static const double headerPadding = 50.0;
  static const double contentPadding = 16.0;
  static const double cardRadius = 28.0;
  static const double iconSize = 25.0;
  static const double headerIconSize = 64.0;
  static const double cardIconSize = 80.0;
  static const double smallIconSize = 48.0;

  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 8.0;
  static const double largeIconSize = 48.0;
  static const int expiryDaysThreshold = 30;

  /// The spacing constants.
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 12.0;
  static const double spacingL = 16.0;
  static const double spacingXL = 24.0;
  static const double spacingXXL = 32.0;
  static const double spacingLarge = 40.0;

  /// The breakpoints.
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 800.0;
  static const double desktopBreakpoint = 1200.0;

  /// The animation duration.
  static const Duration animationDuration = Duration(milliseconds: 200);

  static const double sidebarWidth = 256.0;
  static const double headerHeight = 64.0;
}
