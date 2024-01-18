// Flutter imports:
// Package imports:
// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealmisg/route/app_routes.dart';


//Routes
import 'package:mealmisg/features/views/home/route.dart' as homeRoute;
import 'package:mealmisg/features/views/favorites/route.dart' as favoriteRoute;
import 'package:mealmisg/features/views/food_list/route.dart' as foodListRoute;
import 'package:mealmisg/features/views/detail/route.dart' as detailRoute;

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter goRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.homeScreen,
  routes: [
    ...homeRoute.$appRoutes,
    ...favoriteRoute.$appRoutes,
    ...foodListRoute.$appRoutes,
    ...detailRoute.$appRoutes,
  ],
  observers: <NavigatorObserver>[
    GoRouterNavigationObserver(),
  ],
);

class GoRouterNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateRoute();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateRoute();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateRoute();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _updateRoute();
  }

  void _updateRoute() {
    print('update route');
  }
}
