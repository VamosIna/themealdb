// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsResponse _$MealsResponseFromJson(Map<String, dynamic> json) =>
    MealsResponse(
      idMeal: json['idMeal'] as String?,
      strMeal: json['strMeal'] as String?,
      strCategory: json['strCategory'] as String?,
      strArea: json['strArea'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
      strInstructions: json['strInstructions'] as String?,
      strYoutube: json['strYoutube'] as String?,
      strTags: json['strTags'] as String?,
    );

Map<String, dynamic> _$MealsResponseToJson(MealsResponse instance) =>
    <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strCategory': instance.strCategory,
      'strArea': instance.strArea,
      'strMealThumb': instance.strMealThumb,
      'strInstructions': instance.strInstructions,
      'strTags': instance.strTags,
      'strYoutube': instance.strYoutube,
    };
