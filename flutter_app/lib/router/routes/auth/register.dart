import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const registerRouteTitle = 'Register';

/// The register page.
const registerPage = BeamPage(
  key: ValueKey('register'),
  title: registerRouteTitle,
  child: Scaffold(
    body: Center(
      child: Text('Register Route'),
    ),
  ),
);

/// The name of the current route.
const registerRoutePath = '/auth/register';
