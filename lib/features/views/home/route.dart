import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealmisg/features/views/home/ui.dart';

import '../../../route/app_routes.dart';
import '../../../route/router.dart';

part 'route.g.dart';

@TypedGoRoute<HomeRoute>(
  path: AppRoutes.homeScreen,
)
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
