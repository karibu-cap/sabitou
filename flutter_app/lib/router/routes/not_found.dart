import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const notFoundRouteTitle = 'Not Found';

/// The not found page.
const notFoundPage = BeamPage(
  key: ValueKey('notFound'),
  title: notFoundRouteTitle,
  child: Scaffold(body: Center(child: Text('Not Found Route'))),
);

/// The name of the current route.
const notFoundRoutePath = '/not-found';
