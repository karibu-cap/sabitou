import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const userRouteTitle = 'User';

/// The user page.
const userPage = BeamPage(
  key: ValueKey('user'),
  title: userRouteTitle,
  child: Scaffold(body: Center(child: Text('User Route'))),
);

/// The name of the current route.
const userRoutePath = '/auth/user';
