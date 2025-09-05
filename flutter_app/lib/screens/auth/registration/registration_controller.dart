import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/button_state.dart';
import '../../../utils/utils.dart';
import 'registration_view_model.dart';

/// Registration controller.
class RegistrationController {
  final RegistrationViewModel _viewModel;
  final _appIntl = AppInternationalizationService.to;

  /// Construct a new RegistrationController.
  RegistrationController({required RegistrationViewModel viewModel})
    : _viewModel = viewModel;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The button state.
  final ValueNotifier<ButtonState> buttonState = ValueNotifier(
    ButtonState.initial,
  );

  /// Controller for the user name input field.
  final TextEditingController userNameController = TextEditingController();

  /// Controller for the email input field.
  final TextEditingController emailController = TextEditingController();

  /// Controller for the phone number input field.
  final TextEditingController phoneNumberController = TextEditingController();

  /// Controller for the first name input field.
  final TextEditingController firstNameController = TextEditingController();

  /// Controller for the last name input field.
  final TextEditingController lastNameController = TextEditingController();

  /// Controller for the password input field.
  final TextEditingController passwordController = TextEditingController();

  /// Controller for the confirm password input field.
  final TextEditingController confirmPasswordController =
      TextEditingController();

  /// Observable for password visibility toggle.
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);

  /// Observable for confirm password visibility toggle.
  final ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(false);

  // @override
  // void onClose() {
  //   userNameController.dispose();
  //   emailController.dispose();
  //   phoneNumberController.dispose();
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   passwordController.dispose();
  //   confirmPasswordController.dispose();
  //   super.onClose();
  // }

  /// Toggle password visibility.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Toggle confirm password visibility.
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  /// Validates the user name field.
  String? validateUserName([String? value]) {
    final userName = value ?? userNameController.text.trim();
    if (userName.isEmpty) {
      return _appIntl.userNameRequired;
    }

    return null;
  }

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

  /// Validates the phone number field.
  String? validatePhoneNumber([String? value]) {
    final phoneNumber = value ?? phoneNumberController.text.trim();
    if (phoneNumber.isEmpty) {
      return _appIntl.phoneNumberRequired;
    }

    // Validate using GetUtils for phone number format.
    if (!AppUtils.isPhoneNumber(phoneNumber)) {
      return _appIntl.phoneNumberInvalidFormat;
    }

    // Additional validation for Cameroon phone numbers (9 digits starting with 6).
    if (phoneNumber.length != 9 || !phoneNumber.startsWith('6')) {
      return _appIntl.phoneNumberInvalidCameroon;
    }

    return null;
  }

  /// Validates the first name field.
  String? validateFirstName([String? value]) {
    final firstName = value ?? firstNameController.text.trim();
    if (firstName.isEmpty) {
      return _appIntl.firstNameRequired;
    }

    return null;
  }

  /// Validates the last name field.
  String? validateLastName([String? value]) {
    final lastName = value ?? lastNameController.text.trim();
    if (lastName.isEmpty) {
      return _appIntl.lastNameRequired;
    }

    return null;
  }

  /// Validates the password field.
  String? validatePassword([String? value]) {
    final password = value ?? passwordController.text;
    if (password.isEmpty) {
      return _appIntl.passwordRequired;
    }
    if (password.length < 6) {
      return _appIntl.passwordLength;
    }

    return null;
  }

  /// Validates the confirm password field.
  String? validateConfirmPassword([String? value]) {
    final confirmPassword = value ?? confirmPasswordController.text;
    if (confirmPassword.isEmpty) {
      return _appIntl.confirmPasswordRequired;
    }
    if (confirmPassword != passwordController.text) {
      return _appIntl.passwordsDoNotMatch;
    }

    return null;
  }

  /// Validates all registration form fields.
  bool validateAll() {
    final validate = formKey.currentState?.validate();

    return validate == true;
  }

  /// Handles user registration by delegating to ViewModel after validation.
  Future<bool> registerUser() async {
    if (!validateAll()) {
      return false;
    }

    return await _viewModel.registerUser(
      userName: userNameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      password: passwordController.text,
    );
  }
}
