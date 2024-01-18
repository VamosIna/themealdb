// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_meals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMealsListResponse _$GetMealsListResponseFromJson(
        Map<String, dynamic> json) =>
    GetMealsListResponse(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => MealsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMealsListResponseToJson(
        GetMealsListResponse instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };
