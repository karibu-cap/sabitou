import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const forgotPasswordRouteTitle = 'Forgot Password';

/// The forgot password page.
const forgotPasswordPage = BeamPage(
  key: ValueKey('forgotPassword'),
  title: forgotPasswordRouteTitle,
  child: Scaffold(body: Center(child: Text('Forgot Password Route'))),
);

/// The name of the current route.
const forgotPasswordRoutePath = '/auth/forgot-password';
