import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'registration_view_model.dart';

/// Registration controller.
class RegistrationController extends GetxController {
  final RegistrationViewModel _viewModel;

  /// Construct a new RegistrationController.
  RegistrationController({required RegistrationViewModel viewModel})
    : _viewModel = viewModel;

  /// The instance.
  static RegistrationController get instance => Get.find();

  /// Provides access to the registration view model.
  RegistrationViewModel get viewModel => _viewModel;

  /// Controller for the user name input field.
  TextEditingController get userNameController => _viewModel.userNameController;

  /// Controller for the email input field.
  TextEditingController get emailController => _viewModel.emailController;

  /// Controller for the phone number input field.
  TextEditingController get phoneNumberController =>
      _viewModel.phoneNumberController;

  /// Controller for the first name input field.
  TextEditingController get firstNameController =>
      _viewModel.firstNameController;

  /// Controller for the last name input field.
  TextEditingController get lastNameController => _viewModel.lastNameController;

  /// Controller for the password input field.
  TextEditingController get passwordController => _viewModel.passwordController;

  /// Controller for the confirm password input field.
  TextEditingController get confirmPasswordController =>
      _viewModel.confirmPasswordController;

  /// Error message for the user name field.
  RxString get userNameError => _viewModel.userNameError;

  /// Error message for the email field.
  RxString get emailError => _viewModel.emailError;

  /// Error message for the phone number field.
  RxString get phoneNumberError => _viewModel.phoneNumberError;

  /// Error message for the first name field.
  RxString get firstNameError => _viewModel.firstNameError;

  /// Error message for the last name field.
  RxString get lastNameError => _viewModel.lastNameError;

  /// Error message for the password field.
  RxString get passwordError => _viewModel.passwordError;

  /// Error message for the confirm password field.
  RxString get confirmPasswordError => _viewModel.confirmPasswordError;

  /// Observable for password visibility toggle.
  RxBool get isPasswordVisible => _viewModel.isPasswordVisible;

  /// Observable for confirm password visibility toggle.
  RxBool get isConfirmPasswordVisible => _viewModel.isConfirmPasswordVisible;

  /// Toggle password visibility.
  void togglePasswordVisibility() {
    _viewModel.isPasswordVisible.value = !_viewModel.isPasswordVisible.value;
  }

  /// Toggle confirm password visibility.
  void toggleConfirmPasswordVisibility() {
    _viewModel.isConfirmPasswordVisible.value =
        !_viewModel.isConfirmPasswordVisible.value;
  }

  /// Initializes the registration view model and starts the animation.
  @override
  void onInit() {
    super.onInit();
  }

  /// Validates all registration form fields.
  bool validateAll() => _viewModel.validateAll();

  /// Clears all error messages in the registration form.
  void clearErrors() => _viewModel.clearErrors();

  /// Disposes all controllers and resources used by the registration view model.
  void disposeFields() => _viewModel.dispose();

  /// Handles user registration, validation.
  Future<bool> registerUser() => _viewModel.registerUser();
}
