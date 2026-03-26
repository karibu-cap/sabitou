import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/no_business_view.dart';

class _BP {
  static const mobile = 600.0;
  static const desktop = 1200.0;

  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).width >= desktop;

  /// Fluid horizontal padding: tighter on mobile, generous on desktop.
  static double hPad(BuildContext ctx) {
    final w = MediaQuery.sizeOf(ctx).width;
    if (w < mobile) return 20;
    if (w < desktop) return 40;

    return 64;
  }

  /// Maximum content width — keeps desktop from stretching too wide.
  static double maxContent(BuildContext ctx) {
    final w = MediaQuery.sizeOf(ctx).width;
    if (w < mobile) return double.infinity;
    if (w < desktop) return 720;

    return 1100;
  }
}

/// The [UserAuthGatePage] widget.
class UserAuthGatePage extends StatefulWidget {
  /// The child widget.
  final Widget child;

  /// Constructs the [UserAuthGatePage].
  const UserAuthGatePage({super.key, required this.child});

  @override
  State<UserAuthGatePage> createState() => _UserAuthGatePageState();
}

class _UserAuthGatePageState extends State<UserAuthGatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserPreferences userPreferences = context.watch<UserPreferences>();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 520),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.04),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: FutureBuilder(
        future: userPreferences.initializationComplete.future,
        builder: (context, asyncSnapshot) {
          final _state = asyncSnapshot.data;
          final user = userPreferences.user;
          if (_state != true || user == null) {
            return const _PageFrame(
              child: _LoadingView(key: ValueKey('loading')),
            );
          }
          final business = userPreferences.business;

          if (business == null) {
            return const _PageFrame(
              child: NoBusinessView(key: ValueKey('noBusiness')),
            );
          }

          final store = userPreferences.store;
          if (store == null) {
            return const NoBusinessView(key: ValueKey('noStore'));
          }

          return widget.child;
        },
      ),
    );
  }
}

class _PageFrame extends StatelessWidget {
  final Widget child;
  const _PageFrame({required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = _BP.maxContent(context);
        final hPad = _BP.hPad(context);

        return Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxW == double.infinity ? constraints.maxWidth : maxW,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hPad),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final isDesktop = _BP.isDesktop(context);

    return Padding(
      padding: EdgeInsets.only(top: isDesktop ? 28 : 20),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: ShadTheme.of(context).colorScheme.card,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.fromBorderSide(
                BorderSide(color: ShadTheme.of(context).colorScheme.border),
              ),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              size: 18,
              color: ShadTheme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Sabitou',
            style: TextStyle(
              fontSize: isDesktop ? 19 : 17,
              fontWeight: FontWeight.w700,
              color: ShadTheme.of(context).colorScheme.foreground,
              letterSpacing: -0.3,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _LoadingView extends StatefulWidget {
  const _LoadingView({super.key});
  @override
  State<_LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<_LoadingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _shimmer;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
    _shimmer = Tween<double>(
      begin: -1.5,
      end: 2.5,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOutSine));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = _BP.isDesktop(context);

    return AnimatedBuilder(
      animation: _shimmer,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _TopBar(),
            SizedBox(height: isDesktop ? 36 : 28),

            // Desktop: two-column skeleton
            if (isDesktop)
              _DesktopLoadingSkeleton(sv: _shimmer.value)
            else
              _MobileLoadingSkeleton(sv: _shimmer.value),

            const Spacer(),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _PulsingDot(delay: 0, sv: _shimmer.value),
                  const SizedBox(width: 6),
                  _PulsingDot(delay: 0.33, sv: _shimmer.value),
                  const SizedBox(width: 6),
                  _PulsingDot(delay: 0.66, sv: _shimmer.value),
                  const SizedBox(width: 14),
                  Text(
                    Intls.to.loadingProlile,
                    style: TextStyle(
                      color: ShadTheme.of(
                        context,
                      ).colorScheme.mutedForeground.withValues(alpha: 0.7),
                      fontSize: isDesktop ? 14 : 13,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
          ],
        );
      },
    );
  }
}

class _MobileLoadingSkeleton extends StatelessWidget {
  final double sv;
  const _MobileLoadingSkeleton({required this.sv});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Bone(w: double.infinity, h: 140, r: 24, sv: sv),
        const SizedBox(height: 22),
        _Bone(w: 130, h: 11, r: 6, sv: sv),
        const SizedBox(height: 14),
        for (var i = 0; i < 3; i++) ...[
          _Bone(w: double.infinity, h: 68, r: 18, sv: sv),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 10),
        _Bone(w: 160, h: 11, r: 6, sv: sv),
        const SizedBox(height: 14),
        Row(
          children: [
            for (var i = 0; i < 3; i++) ...[
              Expanded(
                child: _Bone(w: double.infinity, h: 84, r: 18, sv: sv),
              ),
              if (i < 2) const SizedBox(width: 10),
            ],
          ],
        ),
      ],
    );
  }
}

class _DesktopLoadingSkeleton extends StatelessWidget {
  final double sv;
  const _DesktopLoadingSkeleton({required this.sv});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column
        SizedBox(
          width: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Bone(w: double.infinity, h: 200, r: 24, sv: sv),
              const SizedBox(height: 18),
              _Bone(w: 160, h: 11, r: 6, sv: sv),
              const SizedBox(height: 12),
              for (var i = 0; i < 4; i++) ...[
                _Bone(w: double.infinity, h: 56, r: 16, sv: sv),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
        const SizedBox(width: 28),
        // Right column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Bone(w: double.infinity, h: 136, r: 24, sv: sv),
              const SizedBox(height: 18),
              _Bone(w: 160, h: 11, r: 6, sv: sv),
              const SizedBox(height: 12),
              Row(
                children: [
                  for (var i = 0; i < 3; i++) ...[
                    Expanded(
                      child: _Bone(w: double.infinity, h: 100, r: 18, sv: sv),
                    ),
                    if (i < 2) const SizedBox(width: 12),
                  ],
                ],
              ),
              const SizedBox(height: 18),
              _Bone(w: double.infinity, h: 80, r: 18, sv: sv),
            ],
          ),
        ),
      ],
    );
  }
}

class _Bone extends StatelessWidget {
  final double w, h, r, sv;
  const _Bone({
    required this.w,
    required this.h,
    required this.r,
    required this.sv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w == double.infinity ? null : w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r),
        gradient: LinearGradient(
          colors: const [
            SabitouColors.shimmerBase,
            SabitouColors.shimmerHighlight,
            SabitouColors.shimmerBase,
          ],
          stops: [
            math.max(0.0, sv - 0.4).clamp(0.0, 1.0),
            sv.clamp(0.0, 1.0),
            math.min(1.0, sv + 0.4).clamp(0.0, 1.0),
          ],
        ),
      ),
    );
  }
}

class _PulsingDot extends StatelessWidget {
  final double delay, sv;
  const _PulsingDot({required this.delay, required this.sv});

  @override
  Widget build(BuildContext context) {
    final scale = (0.6 + 0.4 * math.sin(((sv + delay) % 1.0) * math.pi)).clamp(
      0.5,
      1.0,
    );

    return Transform.scale(
      scale: scale,
      child: Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: SabitouColors.accent.withValues(alpha: 0.5 + 0.5 * scale),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

