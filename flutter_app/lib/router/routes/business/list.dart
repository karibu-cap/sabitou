import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const businessListRouteTitle = 'Business List';

/// The business list page.
const businessListPage = BeamPage(
  key: ValueKey('businessList'),
  title: businessListRouteTitle,
  child: Scaffold(
    body: Center(
      child: Text('Business List Route'),
    ),
  ),
);

/// The name of the current route.
const businessListRoutePath = '/business/list';
