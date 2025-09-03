import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/internationalization/internationalization.dart';
import 'registration_view_model.dart';

/// Registration controller.
class RegistrationController extends GetxController {
  final RegistrationViewModel _viewModel;
  final _appIntl = AppInternationalizationService.to;

  /// Construct a new RegistrationController.
  RegistrationController({required RegistrationViewModel viewModel})
    : _viewModel = viewModel;

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
  final TextEditingController confirmPasswordController = TextEditingController();

  /// Error message for the user name field.
  final RxString userNameError = ''.obs;

  /// Error message for the email field.
  final RxString emailError = ''.obs;

  /// Error message for the phone number field.
  final RxString phoneNumberError = ''.obs;

  /// Error message for the first name field.
  final RxString firstNameError = ''.obs;

  /// Error message for the last name field.
  final RxString lastNameError = ''.obs;

  /// Error message for the password field.
  final RxString passwordError = ''.obs;

  /// Error message for the confirm password field.
  final RxString confirmPasswordError = ''.obs;

  /// Observable for password visibility toggle.
  final RxBool isPasswordVisible = false.obs;

  /// Observable for confirm password visibility toggle.
  final RxBool isConfirmPasswordVisible = false.obs;

  /// Singleton access.
  static RegistrationController get instance => Get.find();

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  /// Toggle password visibility.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Toggle confirm password visibility.
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  /// Validates the user name field.
  bool validateUserName() {
    final value = userNameController.text.trim();
    if (value.isEmpty) {
      userNameError.value = _appIntl.userNameRequired;
      
      return false;
    }
    userNameError.value = '';
    
    return true;
  }

  /// Validates the email field.
  bool validateEmail() {
    final value = emailController.text.trim();
    if (value.isEmpty) {
      emailError.value = _appIntl.emailRequired;
      
      return false;
    }
    if (!GetUtils.isEmail(value)) {
      emailError.value = _appIntl.emailInvalid;
      
      return false;
    }
    emailError.value = '';
    
    return true;
  }

  /// Validates the phone number field.
  bool validatePhoneNumber() {
    final value = phoneNumberController.text.trim();
    if (value.isEmpty) {
      phoneNumberError.value = _appIntl.phoneNumberRequired;
      
      return false;
    }

    // Validate using GetUtils for phone number format.
    if (!GetUtils.isPhoneNumber(value)) {
      phoneNumberError.value = _appIntl.phoneNumberInvalidFormat;
      
      return false;
    }

    // Additional validation for Cameroon phone numbers (9 digits starting with 6).
    if (value.length != 9 || !value.startsWith('6')) {
      phoneNumberError.value = _appIntl.phoneNumberInvalidCameroon;
      
      return false;
    }

    phoneNumberError.value = '';
    
    return true;
  }

  /// Validates the first name field.
  bool validateFirstName() {
    final value = firstNameController.text.trim();
    if (value.isEmpty) {
      firstNameError.value = _appIntl.firstNameRequired;
      
      return false;
    }
    firstNameError.value = '';
    
    return true;
  }

  /// Validates the last name field.
  bool validateLastName() {
    final value = lastNameController.text.trim();
    if (value.isEmpty) {
      lastNameError.value = _appIntl.lastNameRequired;
      
      return false;
    }
    lastNameError.value = '';
    
    return true;
  }

  /// Validates the password field.
  bool validatePassword() {
    final value = passwordController.text;
    if (value.isEmpty) {
      passwordError.value = _appIntl.passwordRequired;
      
      return false;
    }
    if (value.length < 6) {
      passwordError.value = _appIntl.passwordLength;
      
      return false;
    }
    passwordError.value = '';
    
    return true;
  }

  /// Validates the confirm password field.
  bool validateConfirmPassword() {
    final value = confirmPasswordController.text;
    if (value.isEmpty) {
      confirmPasswordError.value = _appIntl.confirmPasswordRequired;
      
      return false;
    }
    if (value != passwordController.text) {
      confirmPasswordError.value = _appIntl.passwordsDoNotMatch;
      
      return false;
    }
    confirmPasswordError.value = '';
    
    return true;
  }

  /// Validates all registration form fields.
  bool validateAll() {
    final userNameValid = validateUserName();
    final emailValid = validateEmail();
    final phoneValid = validatePhoneNumber();
    final firstNameValid = validateFirstName();
    final lastNameValid = validateLastName();
    final passwordValid = validatePassword();
    final confirmPasswordValid = validateConfirmPassword();

    return userNameValid &&
        emailValid &&
        phoneValid &&
        firstNameValid &&
        lastNameValid &&
        passwordValid &&
        confirmPasswordValid;
  }

  /// Clears all error messages in the registration form.
  void clearErrors() {
    userNameError.value = '';
    emailError.value = '';
    phoneNumberError.value = '';
    firstNameError.value = '';
    lastNameError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';
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
