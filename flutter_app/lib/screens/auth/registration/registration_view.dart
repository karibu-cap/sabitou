import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return Provider<RegistrationController>(
      create: (context) =>
          RegistrationController(viewModel: RegistrationViewModel()),
      child: const CommonScaffold(
        displayAppBar: false,
        child: RegistrationContent(),
      ),
    );
  }
}

/// Registration content.
class RegistrationContent extends StatelessWidget {
  /// Constructs the registration content.
  const RegistrationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final appIntl = AppInternationalizationService.to;

    return Container(
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
                          const RegistrationButton(),
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
    );
  }
}
