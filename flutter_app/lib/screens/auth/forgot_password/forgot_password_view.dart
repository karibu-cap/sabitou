import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/common_scaffold.dart';
import '../../../widgets/input/form_fields.dart';
import 'forgot_password_controller.dart';

/// Forgot password view.
class ForgotPasswordView extends StatelessWidget {
  /// Constructs a new Forgot passsword view.
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
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
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(appIntl.ok),
                ),
              ],
            ),
          );
        }
      }
    }

    return Provider(
      create: (context) => ForgotPasswordController(),
      child: CommonScaffold(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF59E0B), Color(0xFFEAB308), Color(0xFFCA8A04)],
            ),
          ),
          child: ShadForm(
            key: context.read<ForgotPasswordController>().formKey,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Flex(
                    direction: AppLayout(context).isDesktop
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      if (AppLayout(context).isDesktop)
                        Expanded(
                          child: Image.asset('assets/images/signup.png'),
                        ),
                      Expanded(
                        child: ShadCard(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Back Button.
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(
                                        LucideIcons.arrowLeft400,
                                      ),
                                    ),
                                  ],
                                ),
                                // Logo Icon.
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFF59E0B),
                                        Color(0xFFEAB308),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: const Icon(
                                    LucideIcons.mail400,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                // Title.
                                Builder(
                                  builder: (context) {
                                    final theme = ShadTheme.of(context);

                                    return Text(
                                      appIntl.forgotPasswordTitle,
                                      style: theme.textTheme.h4,
                                    );
                                  },
                                ),
                                const SizedBox(height: 8),
                                Builder(
                                  builder: (context) {
                                    final theme = ShadTheme.of(context);

                                    return Text(
                                      appIntl.forgotPasswordSubtitle,
                                      style: theme.textTheme.p,
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                ),
                                const SizedBox(height: 32),
                                // Email Field.
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

                                ShadButton(
                                  onPressed: onForgotPasswordPressed,
                                  width: double.infinity,
                                  child: Text(appIntl.forgotPasswordSubmit),
                                ),
                                const SizedBox(height: 24),
                                // Back to Login Link.
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      appIntl.forgotPasswordRememberPassword,
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(appIntl.forgotPasswordSignIn),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
