import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const businessSummaryRouteTitle = 'Business Summary';

/// The summary page.
const businessSummaryPage = BeamPage(
  key: ValueKey('businessSummary'),
  title: businessSummaryRouteTitle,
  child: Scaffold(
    body: Center(
      child: Text('Business Summary Route'),
    ),
  ),
);

/// The name of the current route.
const businessSummaryRoutePath = '/business/:id/summary';
