import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_view_model.dart';

/// Login controller.
class LoginController extends GetxController with GetTickerProviderStateMixin {
  final LoginViewModel _viewModel;

  /// Constructs login controller.
  LoginController({required LoginViewModel viewModel}) : _viewModel = viewModel;

  /// Singleton access.
  static LoginController get instance => Get.find();

  /// The email controller.
  TextEditingController get emailController => _viewModel.emailController;

  /// The password controller.
  TextEditingController get passwordController => _viewModel.passwordController;

  /// Email validation error message.
  RxString get emailError => _viewModel.emailError;

  /// Password validation error message.
  RxString get passwordError => _viewModel.passwordError;

  /// Observable for password visibility toggle.
  RxBool get isPasswordVisible => _viewModel.isPasswordVisible;

  /// Toggle password visibility.
  void togglePasswordVisibility() {
    _viewModel.isPasswordVisible.value = !_viewModel.isPasswordVisible.value;
  }

  /// Validates email field.
  bool validateEmail() => _viewModel.validateEmail();

  /// Validates password field.
  bool validatePassword() => _viewModel.validatePassword();

  /// Validates all fields.
  bool validateAll() => _viewModel.validateAll();

  /// Clears all validation errors.
  void clearErrors() => _viewModel.clearErrors();

  /// Clears email form.
  void clearEmailForm() => _viewModel.clearEmailForm();

  /// Clears password form.
  void clearPasswordForm() => _viewModel.clearPasswordForm();

  /// Validates all fields and calls AuthProvider.login.
  Future<bool> loginUser() => _viewModel.loginUser();
}
