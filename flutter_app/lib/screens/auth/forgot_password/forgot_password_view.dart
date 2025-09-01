import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/common_scaffold.dart';
import 'forgot_password_controller.dart';

/// Forgot password view.
class ForgotPasswordView extends StatelessWidget {
  /// Constructs a new Forgot passsword view.
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController(), permanent: true);
    final appIntl = AppInternationalizationService.to;
    Future<void> onForgotPasswordPressed() async {
      if (controller.validateEmail()) {
        final result = await controller.sendResetLink();
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

    return CommonScaffold(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF59E0B), Color(0xFFEAB308), Color(0xFFCA8A04)],
          ),
        ),
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
                    Expanded(child: Image.asset('assets/images/signup.png')),
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
                                  icon: const Icon(LucideIcons.arrowLeft400),
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
                            ShadInputFormField(
                              controller: controller.emailController,
                              placeholder: Text(appIntl.forgotPasswordEmail),
                              keyboardType: TextInputType.emailAddress,
                              trailing: const Icon(LucideIcons.mail400),
                            ),
                            const SizedBox(height: 24),
                            // Error Message.
                            const Obx(_BuildErrorMessage.new),
                            // Reset Button.
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
                                Text(appIntl.forgotPasswordRememberPassword),
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
    );
  }
}

class _BuildErrorMessage extends StatelessWidget {
  const _BuildErrorMessage();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();
    final theme = ShadTheme.of(context);
    if (controller.emailError.value.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.destructive.withOpacity(0.08),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: theme.colorScheme.destructive.withOpacity(0.5),
          ),
        ),
        child: Row(
          children: [
            Icon(
              LucideIcons.circleAlert400,
              color: theme.colorScheme.destructive,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                controller.emailError.value,
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.destructive,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
