import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../screens/auth/registration/registration_view.dart';

/// The title of the current route.
const registrationRouteTitle = 'Registration';

/// The registration page.
const registrationPage = BeamPage(
  key: ValueKey('registration'),
  title: registrationRouteTitle,
  child: RegistrationView(),
);

/// The name of the current route.
const registrationRoutePath = '/auth/registration';
