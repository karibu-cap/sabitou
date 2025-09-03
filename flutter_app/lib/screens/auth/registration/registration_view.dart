import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/auth/auth_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_scaffold.dart';
import '../../../utils/responsive_utils.dart';
import 'registration_controller.dart';
import 'registration_view_model.dart';

/// Registration view.
class RegistrationView extends StatelessWidget {
  /// Constructs the registration view.
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    // Helper method extracted for registration button callback.
    Future<void> onRegisterPressed(
      BuildContext context,
      RegistrationController controller,
    ) async {
      final validateResult = controller.validateAll();
      if (!validateResult) {
        return;
      }

      final result = await controller.registerUser();
      final appIntl = AppInternationalizationService.to;

      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(result ? appIntl.success : appIntl.failed),
            content: Text(
              result ? appIntl.registrationSuccess : appIntl.registrationFailed,
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

    final controller = Get.put(
      RegistrationController(viewModel: RegistrationViewModel()),
      permanent: true,
    );
    final appIntl = AppInternationalizationService.to;

    /// Login button.
    Widget buildRegistrationButton(BuildContext context) {
      final auth = AuthProvider.instance;
      final appIntl = AppInternationalizationService.to;
      final controller = RegistrationController.instance;

      return ShadButton(
        onPressed: auth.status == AuthStatus.authenticating
            ? null
            : () => onRegisterPressed(context, controller),
        width: double.infinity,
        child: auth.status == AuthStatus.authenticating
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(appIntl.registrationSubmit),
      );
    }

    return CommonScaffold(
      displayAppBar: false,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF10B981), Color(0xFF059669), Color(0xFF047857)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Flex(
                direction: ResponsiveUtils.isDesktop(context)
                    ? Axis.horizontal
                    : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (ResponsiveUtils.isDesktop(context))
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Image.asset(
                          'assets/images/signup.png',
                          fit: BoxFit.contain,
                          height: 400,
                        ),
                      ),
                    ),
                  Flexible(
                    child: ShadCard(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Logo/Icon.
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF10B981),
                                    Color(0xFF059669),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: const Icon(
                                Icons.person_add_alt_1,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              appIntl.registrationTitle,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Builder(
                              builder: (context) {
                                final theme = ShadTheme.of(context);

                                return Text(
                                  appIntl.registrationSubtitle,
                                  style: theme.textTheme.p,
                                );
                              },
                            ),
                            const SizedBox(height: 32),
                            // User Name.
                            ShadInputFormField(
                              controller: controller.userNameController,
                              placeholder: Text(appIntl.userName),
                              trailing: const Icon(LucideIcons.user400),
                            ),
                            Obx(
                              () => controller.userNameError.value.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        left: 4,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Builder(
                                          builder: (context) {
                                            final theme = ShadTheme.of(context);

                                            return Text(
                                              controller.userNameError.value,
                                              style: theme.textTheme.p.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .destructive,
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 16),
                            // Email.
                            ShadInputFormField(
                              controller: controller.emailController,
                              placeholder: Text(appIntl.email),
                              keyboardType: TextInputType.emailAddress,
                              trailing: const Icon(LucideIcons.mail400),
                            ),
                            Obx(
                              () => controller.emailError.value.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        left: 4,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Builder(
                                          builder: (context) {
                                            final theme = ShadTheme.of(context);

                                            return Text(
                                              controller.emailError.value,
                                              style: theme.textTheme.p.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .destructive,
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 16),
                            // Phone Number.
                            ShadInputFormField(
                              controller: controller.phoneNumberController,
                              placeholder: Text(appIntl.phoneNumber),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              trailing: const Icon(LucideIcons.phone400),
                            ),
                            Obx(
                              () => controller.phoneNumberError.value.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        left: 4,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Builder(
                                          builder: (context) {
                                            final theme = ShadTheme.of(context);

                                            return Text(
                                              controller.phoneNumberError.value,
                                              style: theme.textTheme.p.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .destructive,
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 16),
                            // First Name.
                            ShadInputFormField(
                              controller: controller.firstNameController,
                              placeholder: Text(appIntl.firstName),
                              trailing: const Icon(LucideIcons.contact400),
                            ),
                            Obx(
                              () => controller.firstNameError.value.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        left: 4,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Builder(
                                          builder: (context) {
                                            final theme = ShadTheme.of(context);

                                            return Text(
                                              controller.firstNameError.value,
                                              style: theme.textTheme.p.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .destructive,
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 16),
                            // Last Name.
                            ShadInputFormField(
                              controller: controller.lastNameController,
                              placeholder: Text(appIntl.lastName),
                              trailing: const Icon(LucideIcons.contact400),
                            ),
                            Obx(
                              () => controller.lastNameError.value.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        left: 4,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Builder(
                                          builder: (context) {
                                            final theme = ShadTheme.of(context);

                                            return Text(
                                              controller.lastNameError.value,
                                              style: theme.textTheme.p.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .destructive,
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 16),
                            // Password.
                            Obx(
                              () => ShadInputFormField(
                                controller: controller.passwordController,
                                placeholder: Text(appIntl.password),
                                obscureText:
                                    !controller.isPasswordVisible.value,
                                trailing: GestureDetector(
                                  onTap: controller.togglePasswordVisibility,
                                  child: Icon(
                                    controller.isPasswordVisible.value
                                        ? LucideIcons.eye400
                                        : LucideIcons.eyeOff400,
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => controller.passwordError.value.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        left: 4,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Builder(
                                          builder: (context) {
                                            final theme = ShadTheme.of(context);

                                            return Text(
                                              controller.passwordError.value,
                                              style: theme.textTheme.p.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .destructive,
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 16),
                            // Confirm Password.
                            Obx(
                              () => ShadInputFormField(
                                controller:
                                    controller.confirmPasswordController,
                                placeholder: Text(appIntl.confirmPassword),
                                obscureText:
                                    !controller.isConfirmPasswordVisible.value,
                                trailing: GestureDetector(
                                  onTap: controller
                                      .toggleConfirmPasswordVisibility,
                                  child: Icon(
                                    controller.isConfirmPasswordVisible.value
                                        ? LucideIcons.eye400
                                        : LucideIcons.eyeOff400,
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () =>
                                  controller
                                      .confirmPasswordError
                                      .value
                                      .isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        left: 4,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Builder(
                                          builder: (context) {
                                            final theme = ShadTheme.of(context);

                                            return Text(
                                              controller
                                                  .confirmPasswordError
                                                  .value,
                                              style: theme.textTheme.p.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .destructive,
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 24),
                            // Login Button.
                            Obx(() => buildRegistrationButton(context)),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(appIntl.alreadyHaveAnAccount),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(appIntl.signIn),
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
