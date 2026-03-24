import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';

/// Types of error pages available.
enum ErrorPageType {
  /// 404 - Page not found.
  notFound,

  /// 500 - Server error.
  serverError,

  /// Network connection error.
  networkError,

  /// Permission denied / Unauthorized.
  unauthorized,

  /// Generic error fallback.
  generic,
}

/// Builder for creating modern, smooth and beautiful error pages.
///
/// Features:
/// - Animated error icons with smooth transitions
/// - Multiple error type presets (404, 500, network, etc.)
/// - Customizable actions and callbacks
/// - Gradient backgrounds and modern styling
/// - Responsive design for all screen sizes
class ErrorPageBuilder extends StatefulWidget {
  /// The type of error page to display.
  final ErrorPageType type;

  /// Custom title text (overrides default for type).
  final String? title;

  /// Custom message text (overrides default for type).
  final String? message;

  /// Callback when primary action button is pressed.
  final VoidCallback? onPrimaryAction;

  /// Callback when secondary action button is pressed.
  final VoidCallback? onSecondaryAction;

  /// Text for primary action button.
  final String? primaryActionText;

  /// Text for secondary action button.
  final String? secondaryActionText;

  /// Whether to show a decorative background gradient.
  final bool showBackgroundGradient;

  /// Whether to enable animations.
  final bool enableAnimations;

  /// Custom icon widget (overrides default for type).
  final Widget? customIcon;

  /// Error details to display in an expandable section.
  final Object? errorDetails;

  /// Creates a new [ErrorPageBuilder].
  const ErrorPageBuilder({
    super.key,
    this.type = ErrorPageType.generic,
    this.title,
    this.message,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.primaryActionText,
    this.secondaryActionText,
    this.showBackgroundGradient = true,
    this.enableAnimations = true,
    this.customIcon,
    this.errorDetails,
  });

  /// Convenience constructor for 404 Not Found error.
  const ErrorPageBuilder.notFound({
    super.key,
    this.title,
    this.message,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.primaryActionText,
    this.secondaryActionText,
    this.showBackgroundGradient = true,
    this.enableAnimations = true,
    this.customIcon,
    this.errorDetails,
  }) : type = ErrorPageType.notFound;

  /// Convenience constructor for 500 Server Error.
  const ErrorPageBuilder.serverError({
    super.key,
    this.title,
    this.message,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.primaryActionText,
    this.secondaryActionText,
    this.showBackgroundGradient = true,
    this.enableAnimations = true,
    this.customIcon,
    this.errorDetails,
  }) : type = ErrorPageType.serverError;

  /// Convenience constructor for Network Error.
  const ErrorPageBuilder.networkError({
    super.key,
    this.title,
    this.message,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.primaryActionText,
    this.secondaryActionText,
    this.showBackgroundGradient = true,
    this.enableAnimations = true,
    this.customIcon,
    this.errorDetails,
  }) : type = ErrorPageType.networkError;

  /// Convenience constructor for Unauthorized/Permission Denied.
  const ErrorPageBuilder.unauthorized({
    super.key,
    this.title,
    this.message,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.primaryActionText,
    this.secondaryActionText,
    this.showBackgroundGradient = true,
    this.enableAnimations = true,
    this.customIcon,
    this.errorDetails,
  }) : type = ErrorPageType.unauthorized;

  @override
  State<ErrorPageBuilder> createState() => _ErrorPageBuilderState();
}

class _ErrorPageBuilderState extends State<ErrorPageBuilder>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;
  final bool _showDetails = false;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOutQuart,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOutSine),
    );

    if (widget.enableAnimations) {
      _fadeController.forward();
      _slideController.forward();
      _pulseController.repeat(reverse: true);
    } else {
      _fadeController.value = 1.0;
      _slideController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  /// Gets the error configuration based on type.
  _ErrorConfig _getErrorConfig(AppInternationalizationService intl) {
    return switch (widget.type) {
      ErrorPageType.notFound => _ErrorConfig(
        icon: LucideIcons.fileX,
        iconColor: AppColors.warning500,
        gradientColors: const [Color(0xFFFEF3C7), Color(0xFFFEE2E2)],
        title: widget.title ?? intl.errorLoadingSuppliers,
        message: widget.message ?? intl.somethingWentWrong,
        defaultPrimaryText: intl.cancel,
        defaultSecondaryText: intl.home,
        code: '404',
      ),
      ErrorPageType.serverError => _ErrorConfig(
        icon: LucideIcons.serverOff,
        iconColor: AppColors.error500,
        gradientColors: const [Color(0xFFFEE2E2), Color(0xFFF3E8FF)],
        title: widget.title ?? intl.errorLoadingSuppliers,
        message: widget.message ?? intl.serverErrorMessage,
        defaultPrimaryText: intl.retryText,
        defaultSecondaryText: intl.contactSupportText,
        code: '500',
      ),
      ErrorPageType.networkError => _ErrorConfig(
        icon: LucideIcons.wifiOff,
        iconColor: AppColors.warning500,
        gradientColors: const [Color(0xFFDBEAFE), Color(0xFFFEF3C7)],
        title: widget.title ?? intl.errorLoadingSuppliers,
        message: widget.message ?? intl.networkErrorMessage,
        defaultPrimaryText: intl.retryText,
        defaultSecondaryText: intl.cancel,
        code: 'NET',
      ),
      ErrorPageType.unauthorized => _ErrorConfig(
        icon: LucideIcons.shieldAlert,
        iconColor: AppColors.error500,
        gradientColors: const [Color(0xFFFEE2E2), Color(0xFFFECACA)],
        title: widget.title ?? intl.errorLoadingSuppliers,
        message: widget.message ?? intl.authErrorMessage,
        defaultPrimaryText: intl.signIn,
        defaultSecondaryText: intl.cancel,
        code: '403',
      ),
      ErrorPageType.generic => _ErrorConfig(
        icon: LucideIcons.circleAlert,
        iconColor: AppColors.error500,
        gradientColors: const [Color(0xFFF3F4F6), Color(0xFFE5E7EB)],
        title: widget.title ?? intl.errorLoadingSuppliers,
        message: widget.message ?? intl.genericErrorMessage,
        defaultPrimaryText: intl.retryText,
        defaultSecondaryText: intl.cancel,
        code: 'ERR',
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final config = _getErrorConfig(intl);
    final theme = ShadTheme.of(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Scaffold(
      body: Container(
        decoration: widget.showBackgroundGradient
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: config.gradientColors,
                ),
              )
            : null,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 24 : 48,
                  vertical: 32,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 640),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Large Status Code - GitHub style
                      _StatusCodeDisplay(
                        code: config.code,
                        isSmallScreen: isSmallScreen,
                      ),

                      const SizedBox(height: 24),

                      // Animated Icon (smaller, above text)
                      _AnimatedErrorIcon(
                        config: config,
                        isSmallScreen: isSmallScreen,
                        customIcon: widget.customIcon,
                        enableAnimations: widget.enableAnimations,
                        pulseAnimation: _pulseAnimation,
                      ),

                      const SizedBox(height: 32),

                      // Title
                      Text(
                        config.title,
                        style: theme.textTheme.h3.copyWith(
                          color: AppColors.grey900,
                          fontWeight: FontWeight.w700,
                          fontSize: isSmallScreen ? 24 : 28,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),

                      // Message
                      Text(
                        config.message,
                        style: theme.textTheme.p.copyWith(
                          color: AppColors.grey600,
                          fontSize: 16,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 40),

                      // Action Buttons
                      _ErrorActionButtons(
                        config: config,
                        intl: intl,
                        isSmallScreen: isSmallScreen,
                        primaryActionText: widget.primaryActionText,
                        secondaryActionText: widget.secondaryActionText,
                        onPrimaryAction: widget.onPrimaryAction,
                        onSecondaryAction: widget.onSecondaryAction,
                        errorType: widget.type,
                      ),

                      // Error Details Expandable
                      if (widget.errorDetails != null) ...[
                        const SizedBox(height: 32),
                        _ErrorDetailsSection(
                          errorDetails: widget.errorDetails,
                          intl: intl,
                          theme: theme,
                        ),
                      ],

                      const SizedBox(height: 48),

                      // Helpful links footer
                      _ErrorHelpfulLinks(intl: intl),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Displays the large status code with styling.
class _StatusCodeDisplay extends StatelessWidget {
  final String code;
  final bool isSmallScreen;

  const _StatusCodeDisplay({required this.code, required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 24 : 32,
        vertical: isSmallScreen ? 12 : 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.8),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.grey200.withValues(alpha: 0.5)),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        code,
        style: TextStyle(
          fontSize: isSmallScreen ? 56 : 72,
          fontWeight: FontWeight.w800,
          color: AppColors.grey800,
          letterSpacing: -2,
          fontFamily: 'GeistMono',
        ),
      ),
    );
  }
}

/// Animated error icon with pulsing effect.
class _AnimatedErrorIcon extends StatelessWidget {
  final _ErrorConfig config;
  final bool isSmallScreen;
  final Widget? customIcon;
  final bool enableAnimations;
  final Animation<double> pulseAnimation;

  const _AnimatedErrorIcon({
    required this.config,
    required this.isSmallScreen,
    required this.customIcon,
    required this.enableAnimations,
    required this.pulseAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = isSmallScreen ? 48.0 : 56.0;
    final containerPadding = isSmallScreen ? 16.0 : 20.0;
    final iconWidget =
        customIcon ??
        Icon(config.icon, size: iconSize, color: config.iconColor);

    if (!enableAnimations) {
      return Container(
        padding: EdgeInsets.all(containerPadding),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.5),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: config.iconColor.withValues(alpha: 0.2),
              blurRadius: 30,
              spreadRadius: 8,
            ),
          ],
        ),
        child: iconWidget,
      );
    }

    return AnimatedBuilder(
      animation: pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: pulseAnimation.value,
          child: Container(
            padding: EdgeInsets.all(containerPadding),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.5),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: config.iconColor.withValues(alpha: 0.2),
                  blurRadius: 30,
                  spreadRadius: 8,
                ),
              ],
            ),
            child: iconWidget,
          ),
        );
      },
    );
  }
}

/// Error action buttons widget.
class _ErrorActionButtons extends StatelessWidget {
  final _ErrorConfig config;
  final AppInternationalizationService intl;
  final bool isSmallScreen;
  final String? primaryActionText;
  final String? secondaryActionText;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onSecondaryAction;
  final ErrorPageType errorType;

  const _ErrorActionButtons({
    required this.config,
    required this.intl,
    required this.isSmallScreen,
    required this.primaryActionText,
    required this.secondaryActionText,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
    required this.errorType,
  });

  IconData _getPrimaryIcon() {
    return switch (errorType) {
      ErrorPageType.notFound => LucideIcons.arrowLeft,
      ErrorPageType.serverError => LucideIcons.refreshCw,
      ErrorPageType.networkError => LucideIcons.refreshCw,
      ErrorPageType.unauthorized => LucideIcons.logIn,
      ErrorPageType.generic => LucideIcons.refreshCw,
    };
  }

  IconData _getSecondaryIcon() {
    return switch (errorType) {
      ErrorPageType.notFound => LucideIcons.house,
      ErrorPageType.serverError => LucideIcons.headset,
      ErrorPageType.networkError => LucideIcons.settings,
      ErrorPageType.unauthorized => LucideIcons.mail,
      ErrorPageType.generic => LucideIcons.house,
    };
  }

  @override
  Widget build(BuildContext context) {
    final primaryText = primaryActionText ?? config.defaultPrimaryText;
    final secondaryText = secondaryActionText ?? config.defaultSecondaryText;

    if (isSmallScreen) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: ShadButton(
              size: ShadButtonSize.lg,
              onPressed: onPrimaryAction,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_getPrimaryIcon(), size: 18),
                  const SizedBox(width: 8),
                  Text(primaryText),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ShadButton.outline(
              size: ShadButtonSize.lg,
              onPressed: onSecondaryAction,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_getSecondaryIcon(), size: 18),
                  const SizedBox(width: 8),
                  Text(secondaryText),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShadButton(
          size: ShadButtonSize.lg,
          onPressed: onPrimaryAction,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getPrimaryIcon(), size: 18),
              const SizedBox(width: 8),
              Text(primaryText),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ShadButton.outline(
          size: ShadButtonSize.lg,
          onPressed: onSecondaryAction,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getSecondaryIcon(), size: 18),
              const SizedBox(width: 8),
              Text(secondaryText),
            ],
          ),
        ),
      ],
    );
  }
}

/// Error details expandable section.
class _ErrorDetailsSection extends StatefulWidget {
  final Object? errorDetails;
  final AppInternationalizationService intl;
  final ShadThemeData theme;

  const _ErrorDetailsSection({
    required this.errorDetails,
    required this.intl,
    required this.theme,
  });

  @override
  State<_ErrorDetailsSection> createState() => _ErrorDetailsSectionState();
}

class _ErrorDetailsSectionState extends State<_ErrorDetailsSection> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.6),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: const Border.fromBorderSide(
          BorderSide(color: AppColors.grey200),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => setState(() => _showDetails = !_showDetails),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(
                    LucideIcons.terminal,
                    size: 16,
                    color: AppColors.grey600,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Technical details / Détails techniques',
                    style: widget.theme.textTheme.small.copyWith(
                      color: AppColors.grey700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: _showDetails ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      LucideIcons.chevronDown,
                      size: 16,
                      color: AppColors.grey600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _showDetails
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.grey900,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.errorDetails.toString(),
                    style: const TextStyle(
                      fontFamily: 'GeistMono',
                      fontSize: 12,
                      color: Color(0xFF10B981),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShadButton.outline(
                        size: ShadButtonSize.sm,
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(LucideIcons.copy, size: 14),
                            const SizedBox(width: 6),
                            Text(widget.intl.closeText),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Helpful links footer for error page.
class _ErrorHelpfulLinks extends StatelessWidget {
  final AppInternationalizationService intl;

  const _ErrorHelpfulLinks({required this.intl});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 24,
      runSpacing: 12,
      children: [
        _HelpfulLink(
          icon: LucideIcons.house,
          label: intl.home,
          onTap: () => AppRouter.go(context, PagesRoutes.home.pattern),
        ),
        _HelpfulLink(
          icon: LucideIcons.headset,
          label: intl.contactSupportText,
          onTap: () {},
        ),
      ],
    );
  }
}

/// A helpful link button for the error page footer.
class _HelpfulLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _HelpfulLink({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.grey600),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.small.copyWith(
                color: AppColors.grey600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Configuration for each error type.
class _ErrorConfig {
  final IconData icon;
  final Color iconColor;
  final List<Color> gradientColors;
  final String title;
  final String message;
  final String defaultPrimaryText;
  final String defaultSecondaryText;
  final String code;

  const _ErrorConfig({
    required this.icon,
    required this.iconColor,
    required this.gradientColors,
    required this.title,
    required this.message,
    required this.defaultPrimaryText,
    required this.defaultSecondaryText,
    required this.code,
  });
}
