import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

/// The title of the current route.
const storeListRouteTitle = 'Store List';

/// The store list page.
const storeListPage = BeamPage(
  key: ValueKey('storeList'),
  title: storeListRouteTitle,
  child: Scaffold(body: Center(child: Text('Store List Route'))),
);

/// The name of the current route.
const storeListRoutePath = '/store/list';
