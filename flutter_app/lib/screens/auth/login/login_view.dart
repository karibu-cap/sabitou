import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_scaffold.dart';
import '../../../utils/responsive_utils.dart';
import 'components/auth_links.dart';
import 'components/login_button.dart';
import 'components/login_form.dart';
import 'components/login_logo.dart';
import 'login_controller.dart';
import 'login_view_model.dart';

/// Login view.
class LoginView extends StatelessWidget {
  /// Constructs login view.
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<LoginController>(
      create: (context) => LoginController(viewModel: LoginViewModel()),
      child: const CommonScaffold(displayAppBar: false, child: LoginContent()),
    );
  }
}

/// Login content.
class LoginContent extends StatelessWidget {
  /// Constructs content view.
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final appIntl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.success800,
            AppColors.success700,
            AppColors.success600,
            AppColors.success600,
          ],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Flex(
              direction:
                  ResponsiveUtils.isTablet(context) ||
                      ResponsiveUtils.isDesktop(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                ShadResponsiveBuilder(
                  builder: (context, breakpoint) {
                    final sm =
                        context.breakpoint >=
                        ShadTheme.of(context).breakpoints.md;

                    if (sm) {
                      return Flexible(
                        child: Image.asset(
                          'assets/images/login.png',
                          fit: BoxFit.contain,
                          height: clampDouble(
                            MediaQuery.sizeOf(context).width * 0.25,
                            250,
                            400,
                          ),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
                Flexible(
                  child: ShadCard(
                    width: double.infinity.clamp(0, 500),
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const LoginLogo(),

                        const SizedBox(height: 24),
                        Text(appIntl.welcomeBack, style: theme.textTheme.h3),
                        const SizedBox(height: 8),
                        Text(
                          appIntl.signInToYourAccount,
                          style: theme.textTheme.p,
                        ),
                        const SizedBox(height: 32),
                        const LoginForm(),
                        const SizedBox(height: 24),
                        const LoginButton(),
                        const AuthLinks(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
