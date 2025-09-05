import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/auth/auth_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/utils.dart';

/// Forgot password controller.
class ForgotPasswordController {
  final _appIntl = AppInternationalizationService.to;

  /// The form key.
  final GlobalKey<ShadFormState> formKey = GlobalKey<ShadFormState>();

  /// Controller for the email input field.
  final TextEditingController emailController = TextEditingController();

  /// Validates the email field.
  String? validateEmail([String? value]) {
    final email = value ?? emailController.text.trim();
    if (email.isEmpty) {
      return _appIntl.emailRequired;
    }
    if (!AppUtils.isEmail(email)) {
      return _appIntl.emailInvalid;
    }

    return null;
  }

  /// Sends a password reset link and returns true if successful.
  Future<bool> sendResetLink(String email) async {
    final auth = AuthProvider.instance;
    try {
      final result = await auth.forgetPassword(email);

      return result;
    } catch (e) {
      return false;
    }
  }
}
