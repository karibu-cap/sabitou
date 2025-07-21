import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../providers/sing_in/sign_in.dart';
import '../../router/app_router.dart' as app_router;

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';
import '../../utils/app_layout.dart';
import '../../utils/constants.dart';
import '../../widgets/atoms/input_textfield.dart';
import '../../widgets/atoms/loading_button.dart';

/// The sign in screen.
final class SignInView extends GetView<SignInProvider> {
  /// The sign in screen.
  const SignInView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout = AppLayout(context);

    return Scaffold(
      body: Row(
        children: [
          if (!appLayout.isMobile) const _LargeLogo(),
          const _RightSectionView(),
        ],
      ),
    );
  }
}

class _LargeLogo extends StatelessWidget {
  const _LargeLogo();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            StaticImages.largeLogo,
            width: 300,
            height: 300,
          ),
        ],
      ),
    );
  }
}

class _RightSectionView extends StatelessWidget {
  const _RightSectionView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width *
                (AppLayout(context).isMobile ? 0.9 : 0.4),
          ),
          child: ListView(
            shrinkWrap: true,
            children: const [
              _SignInHeader(),
              SizedBox(height: 20),
              _SignInForm(),
              SizedBox(height: 10),
              _SignInFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

final class _SignInHeader extends StatelessWidget {
  const _SignInHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          StaticImages.logo,
        ),
        const SizedBox(height: 10),
        Text(
          AppInternationalizationService.to.createAccount,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}

final class _SignInForm extends GetView<SignInProvider> {
  const _SignInForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          InputWAtom(
            labelText: AppInternationalizationService.to.email,
            validator: (value) => !GetUtils.isEmail(value ?? '')
                ? AppInternationalizationService.to.enterValidEmail
                : null,
            onChanged: (value) => controller.email = value ?? '',
          ),
          InputWAtom(
            labelText: AppInternationalizationService.to.password,
            obscureText: true,
            validator: (value) => (value ?? '').length < 6
                ? AppInternationalizationService
                    .to.passwordMustBeAtLeast6Characters
                : null,
            onChanged: (value) => controller.password = value ?? '',
          ),
          const SizedBox(height: 20),
          LoadingButtonWAtom(
            label: AppInternationalizationService.to.signIn,
            onSubmit: (buttonController) => controller.signIn(
              buttonController,
              context,
            ),
            failedText: AppInternationalizationService.to.failed,
            successText: AppInternationalizationService.to.success,
            successColor: AppColors.success600,
            failedColor: AppColors.error600,
            buttonColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(
              color: AppColors.grey0,
            ),
            initialWidth: MediaQuery.sizeOf(context).width,
          ),
        ],
      ),
    );
  }
}

final class _SignInFooter extends StatelessWidget {
  const _SignInFooter();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppInternationalizationService.to.dontHaveAnAccount,
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: AppInternationalizationService.to.signIn,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.lightPrimary),
            recognizer: TapGestureRecognizer()
              ..onTap = () => app_router.pushReplacement(
                    context,
                    app_router.registerRoutePath,
                  ),
          ),
        ],
      ),
    );
  }
}
