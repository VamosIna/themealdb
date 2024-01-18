import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../api/response/get_meals.dart';
import 'meals.dart';

@immutable
class ListCategoriesData {
  final List<MealsData> meals;

  const ListCategoriesData({
    required this.meals,
  });

  factory ListCategoriesData.fromResponse(
    GetMealsListResponse? response,
  ) =>
      ListCategoriesData(
        meals: (response?.meals ?? []).map(MealsData.fromResponse).toList(),
      );
}
