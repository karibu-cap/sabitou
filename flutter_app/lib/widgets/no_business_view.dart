import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/auth/auth_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../utils/responsive_utils.dart';

/// The [NoBusinessView].
class NoBusinessView extends StatefulWidget {
  /// Constructor of new [NoBusinessView].
  const NoBusinessView({super.key});
  @override
  State<NoBusinessView> createState() => _NoBusinessViewState();
}

class _NoBusinessViewState extends State<NoBusinessView>
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
              child: ResponsiveUtils.isDesktop(context)
                  ? const _NoBusinessDesktop()
                  : const _NoBusinessMobile(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final bool showLogout;
  final VoidCallback? onLogout;
  const _TopBar({this.showLogout = false, this.onLogout});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

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
