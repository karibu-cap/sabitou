import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'forgot_password_view_model.dart';

/// Forgot password controller.
class ForgotPasswordController extends GetxController
    with GetTickerProviderStateMixin {
  late ForgotPasswordViewModel _viewModel;

  /// Provides singleton access to the forgot password controller.
  static ForgotPasswordController get instance => Get.find();

  /// Provides access to the forgot password view model.
  ForgotPasswordViewModel get viewModel => _viewModel;

  /// Controller for the email input field.
  TextEditingController get emailController => _viewModel.emailController;

  /// Error message for the email field.
  RxString get emailError => _viewModel.emailError;

  /// Animation controller for forgot password screen transitions.
  AnimationController get animationController => _viewModel.animationController;

  /// Fade animation for forgot password transitions.
  Animation<double> get fadeAnimation => _viewModel.fadeAnimation;

  /// Slide animation for forgot password transitions.
  Animation<Offset> get slideAnimation => _viewModel.slideAnimation;

  /// Initializes the forgot password view model and starts the animation.
  @override
  void onInit() {
    super.onInit();
    _viewModel = ForgotPasswordViewModel(vsync: this);
    _viewModel.animationController.forward();
  }

  /// Validates the email field.
  bool validateEmail() => _viewModel.validateEmail();

  /// Clears all error messages in the forgot password form.
  void clearErrors() => _viewModel.clearErrors();

  /// Sends a password reset link and returns true if successful.
  Future<bool> sendResetLink() async {
    return await _viewModel.sendResetLink();
  }

  /// Disposes all controllers and resources used by the forgot password view model.
  void disposeFields() => _viewModel.dispose();
}
