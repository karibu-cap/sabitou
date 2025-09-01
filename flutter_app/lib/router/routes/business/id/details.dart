import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const businessDetailsRouteTitle = 'Business Details';

/// The business details page.
const businessDetailsPage = BeamPage(
  key: ValueKey('businessDetails'),
  title: businessDetailsRouteTitle,
  child: Scaffold(body: Center(child: Text('Business Details Route'))),
);

/// The name of the current route.
const businessDetailsRoutePath = '/business/:id/details';
