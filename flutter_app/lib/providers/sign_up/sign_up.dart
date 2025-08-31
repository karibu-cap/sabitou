import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../../router/app_router.dart' as app_router;

import '../../repositories/user_repository.dart';
import '../../utils/user_preference.dart';
import '../../widgets/atoms/loading_button.dart';

/// The sign up provider.
final class SignUpProvider extends GetxController {
  /// The first name of the user.
  String firstName = '';

  /// The last name of the user.
  String lastName = '';

  /// The email of the user.
  String email = '';

  /// The password of the user.
  String password = '';

  /// The confirm password of the user.
  String confirmPassword = '';

  /// The from key.
  final formKey = GlobalKey<FormState>();

  /// Signs up the user.
  Future<bool> signUp(
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
/*
    final String? id = await UserClientService.to.getMe(
      request: CreateUserRequest()
        ..firstName = firstName
        ..lastName = lastName
        ..email = email
        ..password = password
        ..connectionType = ConnectionType.EMAIL.name,
    );*/
    String? id;
    await Future.delayed(const Duration(seconds: 4));

    if (id != null) {
      controller.state.value = LoadingButtonState.successStatus;
      await Future.delayed(const Duration(seconds: 3), () {
        controller.state.value = LoadingButtonState.initialStatus;
      });
      await UserPreferences.instance.saveUserPreferences(
        user: User(
          firstName: firstName,
          lastName: lastName,
          refId: id,
          email: email,
        ),
      );

      app_router.pushReplacement(context, app_router.defaultRoutePath);

      return true;
    }
    controller.state.value = LoadingButtonState.initialStatus;

    return false;
  }
}
