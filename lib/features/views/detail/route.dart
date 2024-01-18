import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mealmisg/features/views/detail/ui.dart';

import '../../../di/di_core.dart';
import '../../../route/app_routes.dart';
import '../../../route/router.dart';
import '../../bloc/detail/detail_bloc.dart';

part 'route.g.dart';

@TypedGoRoute<DetailRoute>(
  path: AppRoutes.detailScreen,
)
class DetailRoute extends GoRouteData {
  DetailRoute({
    required this.mealsId,
  });
  final String mealsId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    DetailState state = const DetailState();
    state = state.copyWith(mealsId: mealsId);

    return BlocProvider(
      create: (context) => getIt<DetailBloc>(
        param1: state,
      ),
      child: const DetailScreen(),
    );
  }

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
