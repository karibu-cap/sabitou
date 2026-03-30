import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../providers/auth/auth_provider.dart';
import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../services/internationalization/internationalization.dart';
import '../../services/storage/app_storage.dart';
import '../../themes/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../widgets/loading.dart';

/// The welcome screen.
class WelcomeScreen extends StatefulWidget {
  /// Constructor of new [WelcomeScreen].
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late StreamController<int> _slideController;
  late Timer _autoAdvanceTimer;
  int _currentIndex = 0;

  void _startAutoAdvance() {
    _autoAdvanceTimer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % 3;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _slideController = StreamController<int>.broadcast();
    _startAutoAdvance();
  }

  SlideData _getSlideData(int index) {
    switch (index) {
      case 0:
        return SlideData(
          title: AppInternationalizationService.to.welcomeScreenFirstMessage,
          imagePath: 'assets/images/inventory_mangement.png',
        );
      case 1:
        return SlideData(
          title: AppInternationalizationService.to.welcomeScreenSecondMessage,
          imagePath: 'assets/images/product_management.png',
        );
      case 2:
        return SlideData(
          title: AppInternationalizationService.to.welcomeScreenThirdMessage,
          imagePath: 'assets/images/track_product.png',
        );
      default:
        return SlideData(
          title: AppInternationalizationService.to.welcomeScreenFirstMessage,
          imagePath: 'assets/images/inventory_mangement.png',
        );
    }
  }

  void _changeSlide(int index) {
    setState(() {
      _currentIndex = index;
    });

    _autoAdvanceTimer.cancel();
    _startAutoAdvance();
  }

  @override
  void dispose() {
    _autoAdvanceTimer.cancel();
    _slideController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final slideData = _getSlideData(_currentIndex);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 5,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ),
                            ),
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        key: ValueKey(_currentIndex),
                        width: double.infinity,
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          slideData.imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  // Bottom Section: Content
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),

                          // Title
                          FadedSlideAnimation(
                            beginOffset: const Offset(0, 0.2),
                            endOffset: const Offset(0, 0),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                slideData.title,
                                key: ValueKey(_currentIndex),
                                style: theme.textTheme.h3.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Indicators
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => InkWell(
                                onTap: () => _changeSlide(index),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width: index == _currentIndex ? 32 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: index == _currentIndex
                                        ? theme.colorScheme.primary
                                        : AppColors.grey200,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          const _BottomSheetView(),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

final class _BottomSheetView extends StatefulWidget {
  const _BottomSheetView({Key? key}) : super(key: key);

  @override
  State<_BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<_BottomSheetView> {
  bool? _isFirstOpen;
  bool _isLoading = true;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final isFirstOpen = await AppStorage.of<bool>().read(
      PreferencesKey.isFirstOpenTime,
    );
    if (mounted) {
      setState(() {
        _isFirstOpen = isFirstOpen ?? true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider auth = context.watch<AuthProvider>();

    return FutureBuilder(
      future: auth.initializationComplete,
      builder: (context, snapshot) {
        final isAuthCompleted =
            snapshot.connectionState == ConnectionState.done;
        final isUserLogged =
            isAuthCompleted && auth.currentUser != null && auth.isAuthenticated;

        // Show loading while checking initial state
        if (_isLoading || !isAuthCompleted) {
          return const _Loading();
        }

        // First time opening app - show auth buttons
        if (_isFirstOpen == true) {
          return const _UnauthenticatedView();
        }

        // Not first time - check auth status
        // If authenticated, navigate to dashboard
        if (isUserLogged && !_hasNavigated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && !_hasNavigated) {
              _hasNavigated = true;
              AppRouter.pushReplacement(
                context,
                PagesRoutes.dashboard.create(),
              );
            }
          });

          return const _Loading();
        }

        // Not authenticated - show auth buttons
        return const _UnauthenticatedView();
      },
    );
  }
}

final class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(children: [SizedBox(height: 20), Loading()]);
  }
}

final class _UnauthenticatedView extends StatelessWidget {
  const _UnauthenticatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    Future<void> confirmFirstOpen() async {
      await AppStorage.of<bool>().write(PreferencesKey.isFirstOpenTime, false);
    }

    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ShadButton(
            expands: true,
            size: ShadButtonSize.lg,
            onPressed: () {
              confirmFirstOpen();
              AppRouter.pushReplacement(context, PagesRoutes.login.create());
            },
            child: Text(
              intl.signIn,
              style: theme.textTheme.p.copyWith(
                color: theme.colorScheme.primaryForeground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            Text(
              intl.dontHaveAnAccount,
              style: theme.textTheme.muted.copyWith(color: AppColors.grey600),
            ),
            ShadButton.link(
              padding: EdgeInsets.zero,
              onPressed: () {
                confirmFirstOpen();
                AppRouter.pushReplacement(
                  context,
                  PagesRoutes.registration.create(),
                );
              },
              child: AutoSizeText(
                intl.signUp,
                maxLines: 1,
                minFontSize: 8,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.muted.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Data class for a slide.
class SlideData {
  /// The title of the slide.
  final String title;

  /// The image path of the slide.
  final String imagePath;

  /// Constructor of new [SlideData].
  SlideData({required this.title, required this.imagePath});
}
