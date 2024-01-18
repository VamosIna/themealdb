import 'package:injectable/injectable.dart';
import 'package:mealmisg/core/api/meal_api.dart';

import '../client/api_dio.dart';

@module
abstract class RetrofitInjectableModule {
  MealsApi getMealsApi(ApiDio client) => MealsApi(client);
}
