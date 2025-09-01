import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Forgot password view model.
import '../../../providers/auth/auth_provider.dart';
import '../../../services/internationalization/internationalization.dart';

/// Forgot password view model.
class ForgotPasswordViewModel {
  final _appIntl = AppInternationalizationService.to;

  /// Controller for the email input field.
  final TextEditingController emailController = TextEditingController();

  /// Error message for the email field.
  final RxString emailError = ''.obs;

  /// Animation controller for forgot password screen transitions.
  final AnimationController animationController;

  /// Fade animation for forgot password transitions.
  late final Animation<double> fadeAnimation;

  /// Slide animation for forgot password transitions.
  late final Animation<Offset> slideAnimation;

  /// Constructs the forgot password view model and initializes animations.
  ForgotPasswordViewModel({required TickerProvider vsync})
    : animationController = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: vsync,
      ) {
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        );
  }

  /// Disposes all controllers and animation resources used by the view model.
  void dispose() {
    animationController.dispose();
    emailController.dispose();
  }

  /// Validates the email field.
  bool validateEmail() {
    final value = emailController.text.trim();
    if (value.isEmpty) {
      emailError.value = _appIntl.forgotPasswordEmailRequired;

      return false;
    }
    if (!GetUtils.isEmail(value)) {
      emailError.value = _appIntl.forgotPasswordEmailInvalid;

      return false;
    }
    emailError.value = '';

    return true;
  }

  /// Clears all error messages in the forgot password form.
  void clearErrors() {
    emailError.value = '';
  }

  /// Sends a password reset link using the AuthProvider.
  Future<bool> sendResetLink() async {
    final auth = AuthProvider.instance;
    try {
      final result = await auth.forgetPassword(emailController.text.trim());

      return result;
    } catch (e) {
      return false;
    }
  }
}
