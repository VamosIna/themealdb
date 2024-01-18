// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $foodListRoute,
    ];

RouteBase get $foodListRoute => GoRouteData.$route(
      path: '/food-list',
      parentNavigatorKey: FoodListRoute.$parentNavigatorKey,
      factory: $FoodListRouteExtension._fromState,
    );

extension $FoodListRouteExtension on FoodListRoute {
  static FoodListRoute _fromState(GoRouterState state) => FoodListRoute();

  String get location => GoRouteData.$location(
        '/food-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
