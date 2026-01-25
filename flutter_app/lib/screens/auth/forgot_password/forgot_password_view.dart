import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../router/app_router.dart';
import '../../../router/page_routes.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_scaffold.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/input/form_fields.dart';
import 'forgot_password_controller.dart';

/// Forgot password view.
class ForgotPasswordView extends StatelessWidget {
  /// Constructs a new Forgot passsword view.
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ForgotPasswordController(),
      builder: (_, __) => CommonScaffold(
        displayAppBar: false,
        child: Container(
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
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final appIntl = AppInternationalizationService.to;

    Future<void> onForgotPasswordPressed() async {
      final controller = context.read<ForgotPasswordController>();
      if (controller.formKey.currentState?.validate() ?? false) {
        final result = await controller.sendResetLink(
          controller.emailController.text.trim(),
        );
        if (context.mounted) {
          await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(result ? appIntl.success : appIntl.failed),
              content: Text(
                result
                    ? appIntl.forgotPasswordSuccess
                    : appIntl.forgotPasswordFailed,
              ),
              actions: [
                ShadButton.link(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(appIntl.ok),
                ),
              ],
            ),
          );
        }
      }
    }

    return SafeArea(
      child: Center(
        child: ShadForm(
          key: context.read<ForgotPasswordController>().formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Flex(
                direction:
                    ResponsiveUtils.isTablet(context) ||
                        ResponsiveUtils.isDesktop(context)
                    ? Axis.horizontal
                    : Axis.vertical,
                spacing: 24,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShadResponsiveBuilder(
                    builder: (context, breakpoint) {
                      final sm =
                          context.breakpoint >=
                          ShadTheme.of(context).breakpoints.md;

                      if (sm) {
                        return Flexible(
                          child: Image.asset(
                            'assets/images/forgot_password.png',
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
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.success800,
                                  AppColors.success700,
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Icon(
                              LucideIcons.mail400,
                              size: 40,
                              color: theme.colorScheme.primaryForeground,
                            ),
                          ),

                          const SizedBox(height: 24),
                          Text(
                            appIntl.forgotPassword,
                            style: theme.textTheme.h3,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            appIntl.forgotPasswordSubtitle,
                            style: theme.textTheme.p,
                          ),
                          const SizedBox(height: 32),
                          InputField(
                            id: appIntl.email,
                            label: appIntl.email,
                            controller: context
                                .read<ForgotPasswordController>()
                                .emailController,
                            placeholder: appIntl.enterValidEmail,
                            keyboardType: TextInputType.emailAddress,
                            icon: LucideIcons.mail400,
                            validator: context
                                .read<ForgotPasswordController>()
                                .validateEmail,
                          ),
                          const SizedBox(height: 24),
                          ShadButton(
                            onPressed: onForgotPasswordPressed,
                            width: double.infinity,
                            child: Text(appIntl.forgotPasswordSubmit),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(appIntl.forgotPasswordRememberPassword),
                              ShadButton.link(
                                onPressed: () => AppRouter.pushReplacement(
                                  context,
                                  PagesRoutes.login.create(),
                                ),
                                child: Text(appIntl.forgotPasswordSignIn),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
