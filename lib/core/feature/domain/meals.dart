import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../api/response/meals.dart';

@immutable
class MealsData {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strMealThumb;
  final String strInstructions;
  final String strYoutube;
  final String strTags;


  const MealsData({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strMealThumb,
    required this.strInstructions,
    required this.strYoutube,
    required this.strTags
  });

  factory MealsData.fromResponse(
    MealsResponse? response,
  ) =>
      MealsData(
        idMeal: response?.idMeal ?? '',
        strMeal: response?.strMeal ?? '',
        strCategory: response?.strCategory ?? '',
        strArea: response?.strArea ?? '',
        strMealThumb: response?.strMealThumb ?? '',
        strInstructions: response?.strInstructions ?? '',
        strYoutube: response?.strYoutube?? '',
        strTags:  response?.strTags??'',
      );
}
