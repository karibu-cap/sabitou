import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/auth/auth_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/user_preference.dart';

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
              child: _NoBusinessView(key: ValueKey('noBusiness')),
            );
          }

          final store = userPreferences.store;
          if (store == null) {
            return const _NoBusinessView(key: ValueKey('noBusiness'));
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
  final bool showLogout;
  final VoidCallback? onLogout;
  const _TopBar({this.showLogout = false, this.onLogout});

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
          if (showLogout)
            GestureDetector(
              onTap: onLogout,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: ShadTheme.of(context).colorScheme.card,
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: ShadTheme.of(context).colorScheme.border),
                  ),
                ),
                child: Icon(
                  Icons.logout_rounded,
                  size: 17,
                  color: ShadTheme.of(context).colorScheme.mutedForeground,
                ),
              ),
            ),
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

class _NoBusinessView extends StatefulWidget {
  const _NoBusinessView({super.key});
  @override
  State<_NoBusinessView> createState() => _NoBusinessViewState();
}

class _NoBusinessViewState extends State<_NoBusinessView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 680),
    )..forward();
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.07),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Column(
          children: [
            _TopBar(
              showLogout: true,
              onLogout: context.read<AuthProvider>().logout,
            ),
            Expanded(
              child: _BP.isDesktop(context)
                  ? const _NoBusinessDesktop()
                  : const _NoBusinessMobile(),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoBusinessMobile extends StatelessWidget {
  const _NoBusinessMobile();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 48),
        _NBIllustration(),
        SizedBox(height: 28),
        _NBText(),
        SizedBox(height: 32),
        _NBContactCard(),
        SizedBox(height: 24),
        _NBActions(),
        SizedBox(height: 32),
      ],
    );
  }
}

class _NoBusinessDesktop extends StatelessWidget {
  const _NoBusinessDesktop();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NBIllustration(size: 112),
            SizedBox(height: 32),
            _NBText(large: true),
            SizedBox(height: 40),
            _NBContactCard(),
            SizedBox(height: 28),
            _NBActions(row: true),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _NBIllustration extends StatelessWidget {
  final double size;
  const _NBIllustration({this.size = 88});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final bgColor = theme.colorScheme.destructive.withValues(alpha: 0.08);
    final iconColor = theme.colorScheme.destructive.withValues(alpha: 0.75);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(
        child: Icon(
          Icons.domain_disabled_rounded,
          size: size * 0.44,
          color: iconColor,
        ),
      ),
    );
  }
}

// ── Headline + body copy ──────────────────────────────────────────────────────
//
// Uses ShadTheme text styles so font family, weight, and line-height
// stay in sync with the rest of the app automatically.

class _NBText extends StatelessWidget {
  final bool large;
  const _NBText({this.large = false});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        Text(
          Intls.to.yourAreNotAssociatedWithAnyBusiness,
          textAlign: TextAlign.center,
          style: (large ? theme.textTheme.h2 : theme.textTheme.h3).copyWith(
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          Intls.to.yourAreNotAssociatedWithAnyBusinessMessage,
          textAlign: TextAlign.center,
          style: theme.textTheme.muted.copyWith(
            fontSize: large ? 15.5 : 14,
            height: 1.65,
          ),
        ),
      ],
    );
  }
}

class _NBContactCard extends StatelessWidget {
  const _NBContactCard();

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(20),
      radius: const BorderRadius.all(Radius.circular(20)),
      border: ShadBorder.all(color: ShadTheme.of(context).colorScheme.border),
      shadows: [
        BoxShadow(
          color: ShadTheme.of(
            context,
          ).colorScheme.primary.withValues(alpha: 0.04),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ContactRow(
            icon: LucideIcons.mail,
            label: Intls.to.support,
            value: 'support@sabitou.cm',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ShadSeparator.horizontal(),
          ),
          _ContactRow(
            icon: LucideIcons.phone,
            label: Intls.to.phone,
            value: '+237 6XX XXX XXX',
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: const BoxDecoration(
            color: SabitouColors.accentSoft,
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
          child: Icon(icon, size: 16, color: SabitouColors.accent),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.muted.copyWith(
                fontSize: 11,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NBActions extends StatelessWidget {
  final bool row;
  const _NBActions({this.row = false});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    final primaryBtn = ShadButton(
      width: row ? 220 : double.infinity,
      onPressed: () {},
      leading: const Padding(
        padding: EdgeInsets.only(right: 6),
        child: Icon(LucideIcons.mail, size: 16),
      ),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: const BorderRadius.all(Radius.circular(20)),
        ),
      ),
      child: Text(Intls.to.contactAdmin),
    );

    final logoutBtn = ShadButton.ghost(
      onPressed: authProvider.logout,
      child: Text(Intls.to.logout),
    );

    if (row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [primaryBtn, const SizedBox(width: 12), logoutBtn],
      );
    }

    return Column(children: [primaryBtn, const SizedBox(height: 4), logoutBtn]);
  }
}
