import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const businessIamRouteTitle = 'Business IAM';

/// The IAM page.
const businessIamPage = BeamPage(
  key: ValueKey('businessIam'),
  title: businessIamRouteTitle,
  child: Scaffold(body: Center(child: Text('Business IAM Route'))),
);

/// The name of the current route.
const businessIamRoutePath = '/business/:id/iam';
