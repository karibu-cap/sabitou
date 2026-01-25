import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
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
    return ChangeNotifierProvider<RegistrationController>(
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
            padding: EdgeInsets.all(ResponsiveUtils.isMobile(context) ? 0 : 24),
            child: Flex(
              direction:
                  ResponsiveUtils.isTablet(context) ||
                      ResponsiveUtils.isDesktop(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: ResponsiveUtils.isMobile(context) ? 0 : 24,
              children: [
                ShadResponsiveBuilder(
                  builder: (context, breakpoint) {
                    final sm =
                        context.breakpoint >=
                        ShadTheme.of(context).breakpoints.md;

                    if (sm) {
                      return Flexible(
                        child: Image.asset(
                          'assets/images/signup.png',
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
                    radius: BorderRadius.all(
                      Radius.circular(
                        ResponsiveUtils.isMobile(context) ? 0 : 18,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 24,
                      children: [
                        const RegistrationLogo(),
                        Text(
                          appIntl.registrationTitle,
                          style: theme.textTheme.h3,
                        ),
                        const RegistrationForm(),
                        const RegistrationButton(),
                        const RegistrationLinks(),
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
