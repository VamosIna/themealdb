import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mealmisg/core/feature/domain/list_meals.dart';

import '../../api/meal_api.dart';
import '../../client/api_call.dart';
import '../../failure/failure.dart';

@injectable
class MealsRepository {
  final MealsApi _api;

  MealsRepository({
    required MealsApi api,
  }) : _api = api;

  Future<Either<Failure, ListCategoriesData>> getMealsList() async {
    final call = await apiCall(
      _api.getMealsList(),
    );

    return call.fold(left, (r) {
      print("CHECKTAG ${right(ListCategoriesData.fromResponse(r).meals.length)}");
      print("CHECK ${right(ListCategoriesData.fromResponse(r).meals.map((e) => e.strYoutube))}");
      return right(ListCategoriesData.fromResponse(r));
    });
  }

  Future<Either<Failure, ListCategoriesData>> getMealsDetail(
      {required String i}) async {
    final call = await apiCall(
      _api.getMealsDetail(i: i),
    );

    return call.fold(left, (r) {
      print("CHECKTAG ${right(ListCategoriesData.fromResponse(r).meals.length)}");
      print("CHECKTAG ${right(ListCategoriesData.fromResponse(r).meals.first.strYoutube)}");
      return right(ListCategoriesData.fromResponse(r));
    });
  }
}
