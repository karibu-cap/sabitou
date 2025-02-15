import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/dashboard/dasboard.dart';
import '../providers/sign_up/sign_up.dart';
import '../providers/sing_in/sign_in.dart';
import '../screens/dashboard/dashboard_view.dart';
import '../screens/middleware_page.dart';
import '../screens/profile/profile_view.dart';
import '../screens/sign_in/sign_view.dart';
import '../screens/sign_up/sign_up_view.dart';
import '../screens/stores/stores_view.dart';
import '../utils/user_preference.dart';
import 'pages_routes.dart';

/// The app routes.
final class AppRouter {
  /// The list of app routes.
  static List<GetPage<dynamic>> get pageRoutes => [
        GetPage(
          name: PagesRoutes.dashboard.pattern,
          preventDuplicates: false,
          transition: Transition.noTransition,
          binding: DashboardBinding(),
          page: () => const MiddlewarePage(
            child: DashboardView(),
          ),
        ),
        GetPage(
          name: PagesRoutes.stores.pattern,
          transition: Transition.noTransition,
          page: () {
            return const MiddlewarePage(
              child: StoresView(),
            );
          },
        ),
        GetPage(
          name: PagesRoutes.signIn.pattern,
          binding: SignInBinding(),
          page: () => const MiddlewarePage(
            child: SignInView(),
          ),
        ),
        GetPage(
          name: PagesRoutes.signUp.pattern,
          binding: SignUpBinding(),
          page: () => const MiddlewarePage(
            child: SignUpView(),
          ),
        ),
        GetPage(
          name: PagesRoutes.profile.pattern,
          transition: Transition.noTransition,
          page: () {
            return const MiddlewarePage(
              child: ProfileView(),
            );
          },
        ),
      ];

  /// Gets the current route name.
  static String get getCurrentLocation {
    return Get.currentRoute;
  }

  /// Checks if there are routes to pop.
  static bool get canPop {
    return Get.key.currentState?.canPop() ?? false;
  }

  /// Navigates to nex page.
  static void push(
    String uri, {
    Object? extra,
    Map<String, String>? parameters,
  }) {
    Get.toNamed(
      uri,
      arguments: extra,
      preventDuplicates: false,
      parameters: parameters,
    );
  }

  /// Navigates to next page and replace all the stack page.
  static void go(String uri, {Object? extra}) {
    Get.offAllNamed(uri, arguments: extra);
  }

  /// Navigates to next page and replace the previous page.
  static void pushReplacementNamed(
    String uri, {
    Object? extra,
  }) {
    Get.offNamed(uri, arguments: extra);
  }

  /// Pops the current route.
  static void onPop() {
    Get.back();
  }
}

/// The first open time middleware.
class HomeMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final bool isUserRegistered = UserPreferences.instance.user != null;

    if (!isUserRegistered) {
      return RouteSettings(name: PagesRoutes.signIn.pattern);
    }

    /// [TODO] verify whether the user is registered or not.
    return null;
  }
}

/// The sign up binding.
class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignUpProvider>(SignUpProvider());
  }
}

/// The sign in binding.
class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignInProvider>(SignInProvider());
  }
}

/// The dashboard binding.
class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardProvider>(DashboardProvider());
  }
}
