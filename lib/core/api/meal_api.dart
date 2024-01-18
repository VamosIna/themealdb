import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:mealmisg/core/api/response/get_meals.dart';
import 'package:retrofit/retrofit.dart';

import '../client/api_dio.dart';
part 'meal_api.g.dart';

@RestApi()
abstract class MealsApi {
  @factoryMethod
  factory MealsApi(ApiDio dio, {String baseUrl}) = _MealsApi;

  @GET('/v1/1/search.php?s=')
  Future<GetMealsListResponse> getMealsList();

  @GET('/v1/1/lookup.php')
  Future<GetMealsListResponse> getMealsDetail({
    @Query('i') required String i,
  });
}
