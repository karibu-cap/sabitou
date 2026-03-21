import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// Only colors that live OUTSIDE the ShadColorScheme semantic slots belong here.
// Everything with a theme slot (background, foreground, card, border, muted…)
// is defined once in AppTheme below and accessed via ShadTheme.of(context).

abstract final class SabitouColors {
  // ── Amber accent — the Sabitou brand color ──
  static const accent = Color(0xFFF4A826);
  static const accentSoft = Color(0xFFFFF3D6);
  static const accentForeground = Color(0xFF7A4F00); // text on accentSoft bg

  // ── Semantic status (used on badges, stat cards, etc.) ──
  static const success = Color(0xFF10B981);
  static const successSoft = Color(0xFFECFDF5);
  static const successForeground = Color(0xFF065F46);

  static const warning = Color(0xFFF59E0B);
  static const warningSoft = Color(0xFFFFFBEB);
  static const warningForeground = Color(0xFF92400E);

  // ── Shimmer skeleton (loading state only) ──
  static const shimmerBase = Color(0xFFEDEBE7);
  static const shimmerHighlight = Color(0xFFFAF9F7);

  // ── Semantic colors — no AppColors dependency ──────────────────────────────────
  static const dangerSoft = Color(0xFFFFF1F0);
  static const dangerText = Color(0xFF9B1C1C);

  static const danger = Color(0xFFE53E3E);
  static const orange = Color(0xFFF97316);
  static const orangeSoft = Color(0xFFFFF7ED);
  static const orangeText = Color(0xFF9A3412);
  static const infoSoft = Color(0xFFEFF6FF);
  static const infoText = Color(0xFF1E40AF);

  static const purpleSoft = Color(0xFFF5F3FF);
  static const purpleText = Color(0xFF4C1D95);
}

// ─────────────────────────────────────────────────────────────────────────────
// COLOR SCHEME EXTENSION
//
// Access via: ShadTheme.of(context).colorScheme.accent
// ─────────────────────────────────────────────────────────────────────────────

extension SabitouColorSchemeX on ShadColorScheme {
  Color get brandAccent => custom['brandAccent'] ?? SabitouColors.accent;
  Color get brandAccentSoft =>
      custom['brandAccentSoft'] ?? SabitouColors.accentSoft;
  Color get brandSuccess => custom['brandSuccess'] ?? SabitouColors.success;
  Color get brandSuccessSoft =>
      custom['brandSuccessSoft'] ?? SabitouColors.successSoft;
  Color get brandWarning => custom['brandWarning'] ?? SabitouColors.warning;
}

// ─────────────────────────────────────────────────────────────────────────────
// PALETTE — light only (as requested)
// Every _T token from the original page code maps to a slot here.
// ─────────────────────────────────────────────────────────────────────────────

abstract final class _Palette {
  // Background & surfaces
  static const bg = Color(0xFFF5F4F2); // warm off-white page bg
  static const surface = Color(0xFFFFFFFF); // card / popover surface
  static const surfaceRaised = Color(0xFFFCFCFD); // slightly off-white card

  // Primary (deep navy)
  static const primary = Color(0xFF1C1F36);
  static const primaryForeground = Color(0xFFFFFFFF);

  // Secondary (warm muted bg for chips, secondary buttons)
  static const secondary = Color(0xFFF0EEE9);
  static const secondaryForeground = Color(0xFF1C1F36);

  // Muted (skeleton / subtle bg)
  static const muted = Color(0xFFEDEBE7);
  static const mutedForeground = Color(0xFF6B7080); // _T.textSecondary

  // Accent — reuse accentSoft as the shadcn "accent" bg slot
  // (the amber color itself lives in custom{})
  static const accentBg = Color(0xFFFFF3D6);
  static const accentFg = Color(0xFF1C1F36);

  // Text
  static const foreground = Color(0xFF1C1F36); // _T.textPrimary
  static const hintForeground = Color(0xFFADB2C0); // _T.textMuted

  // Border / input
  static const border = Color(0xFFE8E6E1); // _T.border
  static const input = Color(0xFFE8E6E1);

  // Ring (focus)
  static const ring = Color(0xFF1C1F36);

  // Destructive
  static const destructive = Color(0xFFE53E3E); // _T.error
  static const destructiveFg = Color(0xFFFFFFFF);

  // Popover
  static const popover = Color(0xFFFFFFFF);
  static const popoverFg = Color(0xFF1C1F36);
}

// ─────────────────────────────────────────────────────────────────────────────
// TYPOGRAPHY
//
// Inter throughout — sizes trimmed to practical inventory-app scale.
// Mapping to ShadTextTheme slots:
//   h1Large → page headers  (32px)
//   h1      → section headers (26px)
//   h2      → card titles / dialog titles (20px)
//   h3      → sub-section labels (16px)
//   h4      → overline / tag text (12px uppercase)
//   p       → body (14px)
//   large   → emphasized body (15px)
//   small   → secondary text (12px)
//   muted   → hint / caption (12px, mutedForeground)
//   lead    → description / subtitle under a title (13px)
// ─────────────────────────────────────────────────────────────────────────────

abstract final class _Type {
  static const _family = 'Inter';

  static const h1Large = TextStyle(
    fontFamily: _family,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.6,
    height: 1.2,
  );
  static const h1 = TextStyle(
    fontFamily: _family,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    height: 1.25,
  );
  static const h2 = TextStyle(
    fontFamily: _family,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.3,
  );
  static const h3 = TextStyle(
    fontFamily: _family,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
    height: 1.4,
  );
  static const h4 = TextStyle(
    fontFamily: _family,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.7,
    height: 1.45,
  );
  static const p = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.1,
  );
  static const large = TextStyle(
    fontFamily: _family,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.1,
  );
  static const small = TextStyle(
    fontFamily: _family,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.1,
  );
  static final muted = small.copyWith(color: _Palette.mutedForeground);
  static const lead = TextStyle(
    fontFamily: _family,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.1,
  );
  static const blockquote = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    fontStyle: FontStyle.italic,
    height: 1.6,
  );
  static const table = TextStyle(
    fontFamily: _family,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static const list = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  // Input-specific
  static final inputStyle = small.copyWith(color: _Palette.foreground);
  static final placeholderStyle = small.copyWith(
    color: _Palette.hintForeground,
    fontSize: 12,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// APP THEME
// ─────────────────────────────────────────────────────────────────────────────

abstract final class AppTheme {
  // ── Semantic shortcuts — use these in widgets, not _Palette directly ──
  static const Color dangerColor = _Palette.destructive;
  static const Color warningColor = SabitouColors.warning;
  static const Color successColor = SabitouColors.success;

  // ── Radius shortcut matching _T.radius ──
  // Use AppTheme.radius in manual Container/BoxDecoration.
  // ShadTheme components use the radius from ShadThemeData automatically.
  static const double radiusSm = 8.0;
  static const double radius = 12.0;
  static const double radiusLg = 20.0;
  static const double radiusXl = 28.0;

  // ── Light theme ───────────────────────────────────────────────────────────
  static final ShadThemeData lightTheme = ShadThemeData(
    brightness: Brightness.light,

    // All color roles mapped directly to the Sabitou warm palette.
    colorScheme: const ShadSlateColorScheme.light(
      background: _Palette.bg,
      foreground: _Palette.foreground,
      card: _Palette.surfaceRaised,
      cardForeground: _Palette.foreground,
      popoverForeground: _Palette.popoverFg,
      primary: _Palette.primary,
      primaryForeground: _Palette.primaryForeground,
      secondary: _Palette.secondary,
      secondaryForeground: _Palette.secondaryForeground,
      muted: _Palette.muted,
      mutedForeground: _Palette.mutedForeground,
      // shadcn "accent" slot → used for hover highlight bg, tooltips, etc.
      accent: _Palette.accentBg,
      accentForeground: _Palette.accentFg,
      destructive: _Palette.destructive,
      destructiveForeground: _Palette.destructiveFg,
      border: _Palette.border,
      input: _Palette.input,
      ring: _Palette.ring,
      // Brand-specific colors injected via the custom map.
      custom: {
        'brandAccent': SabitouColors.accent,
        'brandAccentSoft': SabitouColors.accentSoft,
        'brandSuccess': SabitouColors.success,
        'brandSuccessSoft': SabitouColors.successSoft,
        'brandWarning': SabitouColors.warning,
      },
    ),

    // Generous but not pill-like — matches _T.radiusSm for cards.
    radius: const BorderRadius.all(Radius.circular(radiusSm)),

    // ── Typography ──
    textTheme: ShadTextTheme(
      family: 'Inter',
      h1Large: _Type.h1Large,
      h1: _Type.h1,
      h2: _Type.h2,
      h3: _Type.h3,
      h4: _Type.h4,
      p: _Type.p,
      blockquote: _Type.blockquote,
      table: _Type.table,
      list: _Type.list,
      lead: _Type.lead,
      large: _Type.large,
      small: _Type.small,
      muted: _Type.muted,
    ),

    // ── Input ──
    inputTheme: ShadInputTheme(
      style: _Type.inputStyle,
      placeholderStyle: _Type.placeholderStyle,
    ),

    // ── Card — matches ShadCard used in _NBContactCard ──
    cardTheme: const ShadCardTheme(
      backgroundColor: _Palette.surfaceRaised,
      border: ShadBorder.fromBorderSide(ShadBorderSide(color: _Palette.border)),
      radius: BorderRadius.all(Radius.circular(radiusSm)),
      padding: EdgeInsets.all(20),
    ),

    // ── Primary button — deep navy, no purple gradient ──
    // Subtle gradient gives depth without straying from the brand.
    primaryButtonTheme: const ShadButtonTheme(
      backgroundColor: _Palette.primary,
      gradient: LinearGradient(
        colors: [Color(0xFF1C1F36), Color(0xFF2D3160)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      foregroundColor: _Palette.primaryForeground,
    ),

    // ── Outline button — clean border, no background ──
    outlineButtonTheme: ShadButtonTheme(
      hoverBackgroundColor: _Palette.primary.withOpacity(0.04),
      decoration: ShadDecoration(
        border: ShadBorder.all(color: _Palette.border),
      ),
    ),

    // ── Ghost button — minimal, used for logout / secondary actions ──
    ghostButtonTheme: ShadButtonTheme(
      hoverBackgroundColor: _Palette.primary.withOpacity(0.05),
      foregroundColor: _Palette.mutedForeground,
    ),

    // ── Secondary button ──
    secondaryButtonTheme: const ShadButtonTheme(
      backgroundColor: _Palette.secondary,
      foregroundColor: _Palette.secondaryForeground,
    ),

    // ── Destructive button ──
    destructiveButtonTheme: ShadButtonTheme(
      backgroundColor: _Palette.destructive,
      foregroundColor: _Palette.destructiveFg,
      gradient: LinearGradient(
        colors: [_Palette.destructive, _Palette.destructive.withOpacity(0.85)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),

    // ── Link button ──
    linkButtonTheme: const ShadButtonTheme(foregroundColor: _Palette.primary),

    // ── Date picker height ──
    datePickerTheme: const ShadDatePickerTheme(height: 32),
  );

  // ── Dark theme ────────────────────────────────────────────────────────────
  //
  // Dark uses a true near-black background with the same primary navy and
  // amber accent. The foreground flips to a warm near-white.

  static const Color _darkBg = Color(0xFF0F1117);
  static const Color _darkSurface = Color(0xFF161921);
  static const Color _darkCard = Color(0xFF1C1F2B);
  static const Color _darkForeground = Color(0xFFD8DAE5);
  static const Color _darkMutedFg = Color(0xFF8B92A9);
  static const Color _darkBorder = Color(0xFF272C3F);
  static const Color _darkSecondary = Color(0xFF1E2130);
  static const Color _darkMuted = Color(0xFF13151E);
  static const Color _darkPrimary = Color(
    0xFFFFFFFF,
  ); // buttons become white on dark
  static const Color _darkPrimaryFg = Color(0xFF0F1117);

  static final ShadThemeData darkTheme = ShadThemeData(
    brightness: Brightness.dark,

    colorScheme: const ShadSlateColorScheme.dark(
      background: _darkBg,
      foreground: _darkForeground,
      card: _darkCard,
      cardForeground: _darkForeground,
      popover: _darkCard,
      popoverForeground: _darkForeground,
      primary: _darkPrimary,
      primaryForeground: _darkPrimaryFg,
      secondary: _darkSecondary,
      secondaryForeground: _darkForeground,
      muted: _darkMuted,
      mutedForeground: _darkMutedFg,
      accent: Color(0xFF1E2130),
      accentForeground: _darkForeground,
      destructiveForeground: Colors.white,
      border: _darkBorder,
      input: _darkBorder,
      ring: _darkForeground,
      custom: {
        'brandAccent': SabitouColors.accent,
        'brandAccentSoft': Color(0xFF2C2208),
        'brandSuccess': SabitouColors.success,
        'brandSuccessSoft': Color(0xFF052E1C),
        'brandWarning': SabitouColors.warning,
      },
    ),

    radius: const BorderRadius.all(Radius.circular(radiusSm)),

    textTheme: ShadTextTheme(
      family: 'Inter',
      h1Large: _Type.h1Large.copyWith(color: _darkForeground),
      h1: _Type.h1.copyWith(color: _darkForeground),
      h2: _Type.h2.copyWith(color: _darkForeground),
      h3: _Type.h3.copyWith(color: _darkForeground),
      h4: _Type.h4.copyWith(color: _darkForeground),
      p: _Type.p.copyWith(color: _darkForeground),
      blockquote: _Type.blockquote.copyWith(color: _darkForeground),
      table: _Type.table.copyWith(color: _darkForeground),
      list: _Type.list.copyWith(color: _darkForeground),
      lead: _Type.lead.copyWith(color: _darkMutedFg),
      large: _Type.large.copyWith(color: _darkForeground),
      small: _Type.small.copyWith(color: _darkForeground),
      muted: _Type.small.copyWith(color: _darkMutedFg),
    ),

    inputTheme: ShadInputTheme(
      style: _Type.inputStyle.copyWith(color: _darkForeground),
      placeholderStyle: _Type.placeholderStyle.copyWith(color: _darkMutedFg),
    ),

    cardTheme: const ShadCardTheme(
      backgroundColor: _darkCard,
      border: ShadBorder.fromBorderSide(ShadBorderSide(color: _darkBorder)),
      radius: BorderRadius.all(Radius.circular(radiusSm)),
      padding: EdgeInsets.all(20),
    ),

    primaryButtonTheme: const ShadButtonTheme(
      backgroundColor: _darkPrimary,
      foregroundColor: _darkPrimaryFg,
    ),

    outlineButtonTheme: ShadButtonTheme(
      hoverBackgroundColor: _darkForeground.withOpacity(0.06),
      decoration: ShadDecoration(border: ShadBorder.all(color: _darkBorder)),
    ),

    ghostButtonTheme: ShadButtonTheme(
      hoverBackgroundColor: _darkForeground.withOpacity(0.07),
      foregroundColor: _darkMutedFg,
    ),

    secondaryButtonTheme: const ShadButtonTheme(
      backgroundColor: _darkSecondary,
      foregroundColor: _darkForeground,
    ),

    destructiveButtonTheme: const ShadButtonTheme(
      backgroundColor: Color(0xFFEF4444),
      foregroundColor: Colors.white,
    ),

    linkButtonTheme: const ShadButtonTheme(foregroundColor: _darkForeground),

    datePickerTheme: const ShadDatePickerTheme(height: 32),
  );

  // ── Chart colors ──────────────────────────────────────────────────────────
  // Kept for data-visualisation widgets.

  static const List<Color> chartColorsLight = [
    SabitouColors.accent, // amber — primary series
    Color(0xFF1C1F36), // navy — secondary series
    Color(0xFF10B981), // green — positive / success
    Color(0xFFE53E3E), // red — negative / error
    Color(0xFFADB2C0), // muted — neutral / other
  ];

  static const List<Color> chartColorsDark = [
    SabitouColors.accent,
    Color(0xFF7C82FF),
    Color(0xFF10B981),
    Color(0xFFEF4444),
    Color(0xFF6B7280),
  ];
}
