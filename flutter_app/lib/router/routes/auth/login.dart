import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const loginRouteTitle = 'Login';

/// The login page.
const loginPage = BeamPage(
  key: ValueKey('login'),
  title: loginRouteTitle,
  child: Scaffold(
    body: Center(
      child: Text('Login Route'),
    ),
  ),
);

/// The name of the current route.
const loginRoutePath = '/auth/login';
