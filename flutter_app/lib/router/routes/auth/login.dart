import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../screens/auth/login/login_view.dart';

/// The title of the current route.
const loginRouteTitle = 'Login';

/// The login page.
const loginPage = BeamPage(
  key: ValueKey('login'),
  title: loginRouteTitle,
  child: LoginView(),
);

/// The name of the current route.
const loginRoutePath = '/auth/login';
