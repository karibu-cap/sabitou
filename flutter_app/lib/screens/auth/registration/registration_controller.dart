import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/button_state.dart';
import 'registration_view_model.dart';

/// Registration controller.
class RegistrationController extends ChangeNotifier {
  final RegistrationViewModel _viewModel;

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

  /// Validates all registration form fields.
  bool validateForm() {
    final validate = formKey.currentState?.validate();

    return validate == true;
  }

  /// Handles user registration by delegating to ViewModel after validation.
  Future<bool> registerUser() async {
    if (!validateForm()) {
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
