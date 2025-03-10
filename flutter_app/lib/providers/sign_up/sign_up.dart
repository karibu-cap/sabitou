import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sabitou_rpc/';

import '../../routes/app_routes.dart';
import '../../routes/pages_routes.dart';
import '../../services/user_service_client.dart';
import '../../utils/user_preference.dart';
import '../../widgets/components/loading_button.dart';

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
  Future<bool> signUp(LoadingButtonController controller) async {
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

    final String? id = await UserClientService.to.createUser(
      request: CreateUserRequest()
        ..firstName = firstName
        ..lastName = lastName
        ..email = email
        ..password = password
        ..connectionType = ConnectionType.EMAIL.name,
    );
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
          id: id,
          email: email,
          password: password,
          connectionType: ConnectionType.EMAIL.name,
        ),
      );

      AppRouter.go(PagesRoutes.dashboard.pattern);

      return true;
    }
    controller.state.value = LoadingButtonState.initialStatus;

    return false;
  }
}
