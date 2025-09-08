import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/button_state.dart';
import 'login_view_model.dart';

/// Login controller.
class LoginController {
  final LoginViewModel _viewModel;

  /// Constructs login controller.
  LoginController({required LoginViewModel viewModel}) : _viewModel = viewModel;

  /// The form key.
  final GlobalKey<ShadFormState> formKey = GlobalKey<ShadFormState>();

  /// The button state.
  final ValueNotifier<ButtonState> buttonState = ValueNotifier(
    ButtonState.initial,
  );

  /// The email controller.
  final emailController = TextEditingController();

  /// The password controller.
  final passwordController = TextEditingController();

  /// Observable for password visibility toggle.
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);

  /// Validates all fields on form.
  bool validateForm() {
    final formValidator = formKey.currentState?.validate();

    return formValidator == true;
  }

  /// Toggle password visibility.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Validates all fields and calls AuthProvider.login.
  Future<bool> loginUser() async {
    if (!validateForm()) {
      return false;
    }

    return await _viewModel.loginUser(
      login: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
