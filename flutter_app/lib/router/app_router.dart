import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../utils/user_preference.dart';
import 'routes/auth/login.dart';
import 'routes/auth/register.dart';
import 'routes/auth/user.dart';
import 'routes/business/id/details.dart';
import 'routes/business/id/iam.dart';
import 'routes/business/id/summary.dart';
import 'routes/business/list.dart';
import 'routes/store/id/details.dart';
import 'routes/store/list.dart';

export 'routes/auth/login.dart';
export 'routes/auth/register.dart';
export 'routes/auth/user.dart';
export 'routes/business/id/details.dart';
export 'routes/business/id/iam.dart';
export 'routes/business/id/summary.dart';
export 'routes/business/list.dart';
export 'routes/store/id/details.dart';
export 'routes/store/list.dart';

/// The default fallback route.
const defaultRoutePath = businessListRoutePath;

/// The list of authenticated routes.
const List<String> authenticatedRoutes = [
  businessListRoutePath,
  businessDetailsRoutePath,
  businessIamRoutePath,
  businessSummaryRoutePath,
  storeListRoutePath,
  storeDetailsRoutePath,
  userRoutePath,
];

/// The list of unauthenticated routes.
const List<String> unauthenticatedRoutes = [
  loginRoutePath,
  registerRoutePath,
];

/// The list of app routes.
final Map<Pattern, dynamic Function(BuildContext, BeamState, Object?)> routes =
    {
  loginRoutePath: (context, state, extra) => loginPage,
  registerRoutePath: (context, state, extra) => registerPage,
  businessListRoutePath: (context, state, extra) => businessListPage,
  businessDetailsRoutePath: (context, state, extra) => businessDetailsPage,
  businessIamRoutePath: (context, state, extra) => businessIamPage,
  storeListRoutePath: (context, state, extra) => storeListPage,
  storeDetailsRoutePath: (context, state, extra) => storeDetailsPage,
  userRoutePath: (context, state, extra) => userPage,
  businessSummaryRoutePath: (context, state, extra) => businessSummaryPage,
};

final routeGuards = [
  BeamGuard(
    pathPatterns: authenticatedRoutes,
    check: (context, location) {
      final bool isUserRegistered = UserPreferences.instance.user != null;
      debugPrint('isUserRegistered: $isUserRegistered');

      return isUserRegistered;
    },
    beamToNamed: (_, __) => unauthenticatedRoutes.first,
  ),
  BeamGuard(
    pathPatterns: unauthenticatedRoutes,
    check: (context, location) {
      final bool isUserRegistered = UserPreferences.instance.user != null;
      debugPrint('isUserRegistered: $isUserRegistered');

      return !isUserRegistered;
    },
    beamToNamed: (_, __) => authenticatedRoutes.first,
  ),
];

/// Gets the current route name.
BeamState getCurrentLocation(BuildContext context) {
  final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;

  return beamState;
}

/// Pops the current route.
void onPop(BuildContext context) {
  Beamer.of(context).beamBack();
}

/// Navigates to nex page.
void push(
  BuildContext context,
  String path, {
  Object? extra,
  Map<String, String>? parameters,
}) {
  final uri = Uri(path: path, queryParameters: parameters);
  Beamer.of(context).beamToNamed(
    uri.toString(),
    data: extra,
  );
}

/// Navigates to next page and replace the previous page.
void pushReplacement(
  BuildContext context,
  String uri, {
  Object? extra,
}) {
  Beamer.of(context).beamToReplacementNamed(
    uri,
    data: extra,
  );
}
