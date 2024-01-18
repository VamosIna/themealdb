
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meals.dart';

part 'get_meals.g.dart';

@JsonSerializable()
class GetMealsListResponse extends Equatable {
  @JsonKey(name: 'meals')
  final List<MealsResponse>? meals;

  const GetMealsListResponse({
    this.meals,
  });

  @override
  List<Object?> get props => [
    meals,
  ];

  factory GetMealsListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMealsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMealsListResponseToJson(this);
}
