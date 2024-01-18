import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mealmisg/features/bloc/favorites/favorite_bloc.dart';
import 'package:mealmisg/features/views/favorites/ui.dart';

import '../../../di/di_core.dart';
import '../../../route/app_routes.dart';
import '../../../route/router.dart';

part 'route.g.dart';

@TypedGoRoute<FavoriteRoute>(
  path: AppRoutes.favoriteScreen,
)
class FavoriteRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<FavoriteBloc>(),
      child: const FavoriteScreen(),
    );
  }

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
