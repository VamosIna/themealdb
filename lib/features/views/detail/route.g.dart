// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $detailRoute,
    ];

RouteBase get $detailRoute => GoRouteData.$route(
      path: '/detail',
      parentNavigatorKey: DetailRoute.$parentNavigatorKey,
      factory: $DetailRouteExtension._fromState,
    );

extension $DetailRouteExtension on DetailRoute {
  static DetailRoute _fromState(GoRouterState state) => DetailRoute(
        mealsId: state.uri.queryParameters['meals-id']!,
      );

  String get location => GoRouteData.$location(
        '/detail',
        queryParams: {
          'meals-id': mealsId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
