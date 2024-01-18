import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mealmisg/features/views/food_list/ui.dart';

import '../../../di/di_core.dart';
import '../../../route/app_routes.dart';
import '../../../route/router.dart';
import '../../bloc/food_list/food_list_bloc.dart';

part 'route.g.dart';

@TypedGoRoute<FoodListRoute>(
  path: AppRoutes.foodListScreen,
)
class FoodListRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<FoodListBloc>(),
      child: const FoodListScreen(),
    );
  }

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
