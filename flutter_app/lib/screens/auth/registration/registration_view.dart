import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_scaffold.dart';
import '../../../utils/responsive_utils.dart';
import 'components/registration_button.dart';
import 'components/registration_form.dart';
import 'components/registration_links.dart';
import 'components/registration_logo.dart';
import 'registration_controller.dart';
import 'registration_view_model.dart';

/// Registration view.
class RegistrationView extends StatelessWidget {
  /// Constructs the registration view.
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      RegistrationController(viewModel: RegistrationViewModel()),
      permanent: true,
    );

    final appIntl = AppInternationalizationService.to;
    
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
                            const RegistrationLogo(),
                            const SizedBox(height: 24),
                            Text(
                              appIntl.registrationTitle,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              appIntl.registrationSubtitle,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 32),
                            const RegistrationForm(),
                            const SizedBox(height: 24),
                            RegistrationButton(
                              onPressed: () => _onRegisterPressed(context, controller),
                            ),
                            const SizedBox(height: 24),
                            const RegistrationLinks(),
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

  Future<void> _onRegisterPressed(
    BuildContext context,
    RegistrationController controller,
  ) async {
    final validateResult = controller.validateAll();
    if (!validateResult) return;

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
}
