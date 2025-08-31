import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../../router/app_router.dart' as app_router;

import '../../repositories/user_repository.dart';
import '../../utils/user_preference.dart';
import '../../widgets/atoms/loading_button.dart';

/// The sign in provider.
final class SignInProvider extends GetxController {
  /// The email of the user.
  String email = '';

  /// The password of the user.
  String password = '';

  /// The from key.
  final formKey = GlobalKey<FormState>();

  /// Signs in the user.
  Future<bool> signIn(
    LoadingButtonController controller,
    BuildContext context,
  ) async {
    if (controller.state.value == LoadingButtonState.loading) {
      return false;
    }
    controller.state.value = LoadingButtonState.loading;
    final currentState = formKey.currentState;

    if (currentState == null) {
      controller.state.value = LoadingButtonState.initialStatus;

      return false;
    }

    if (!currentState.validate()) {
      controller.state.value = LoadingButtonState.failedStatus;
      await Future.delayed(const Duration(seconds: 2), () {
        controller.state.value = LoadingButtonState.initialStatus;
      });

      return false;
    }

    final User? user = await UserRepository.to.getMe(request: GetMeRequest());

    await Future.delayed(const Duration(seconds: 4));

    if (user != null) {
      controller.state.value = LoadingButtonState.successStatus;
      await Future.delayed(const Duration(seconds: 3), () {
        controller.state.value = LoadingButtonState.initialStatus;
      });
      await UserPreferences.instance.saveUserPreferences(user: user);
      app_router.pushReplacement(context, app_router.defaultRoutePath);

      return true;
    }

    controller.state.value = LoadingButtonState.initialStatus;

    return false;
  }
}
