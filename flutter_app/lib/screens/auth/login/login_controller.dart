import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/button_state.dart';
import 'login_view_model.dart';

/// Login controller.
class LoginController extends GetxController {
  final LoginViewModel _viewModel;
  final _appIntl = AppInternationalizationService.to;

  /// Constructs login controller.
  LoginController({required LoginViewModel viewModel}) : _viewModel = viewModel;

  /// The form key.
  final GlobalKey<ShadFormState> formKey = GlobalKey<ShadFormState>();

  /// The button state.
  final Rx<ButtonState> buttonState = ButtonState.initial.obs;

  /// The email controller.
  final emailController = TextEditingController();

  /// The password controller.
  final passwordController = TextEditingController();

  /// Observable for password visibility toggle.
  final RxBool isPasswordVisible = false.obs;

  /// Singleton access.
  static LoginController get instance => Get.find();

  /// Disposes all controllers resources used by the controller.
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  /// Validates email field.
  String? validateEmail([String? value]) {
    final email = value ?? emailController.text.trim();
    if (email.isEmpty) {
      return _appIntl.emailRequired;
    }
    if (!GetUtils.isEmail(email)) {
      return _appIntl.emailInvalid;
    }

    return null;
  }

  /// Validates password field.
  String? validatePassword([String? value]) {
    final password = value ?? passwordController.text.trim();
    if (password.isEmpty) {
      return _appIntl.passwordRequired;
    }
    if (password.length < 6) {
      return _appIntl.passwordLength;
    }

    return null;
  }

  /// Validates all fields on form.
  bool _validateForm() {
    final formValidator = formKey.currentState?.validate();

    return formValidator == true;
  }

  /// Toggle password visibility.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Validates all fields and calls AuthProvider.login.
  Future<bool> loginUser() async {
    if (!_validateForm()) {
      return false;
    }

    return await _viewModel.loginUser(
      login: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
