import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const storeDetailsRouteTitle = 'Store Details';

/// The store details page.
const storeDetailsPage = BeamPage(
  key: ValueKey('storeDetails'),
  title: storeDetailsRouteTitle,
  child: Scaffold(
    body: Center(
      child: Text('Store Details Route'),
    ),
  ),
);

/// The name of the current route.
const storeDetailsRoutePath = '/store/:id/details';
