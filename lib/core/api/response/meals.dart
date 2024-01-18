
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals.g.dart';

@JsonSerializable()
class MealsResponse extends Equatable {
  @JsonKey(name: 'idMeal')
  final String? idMeal;

  @JsonKey(name: 'strMeal')
  final String? strMeal;

  @JsonKey(name: 'strCategory')
  final String? strCategory;

  @JsonKey(name: 'strArea')
  final String? strArea;

  @JsonKey(name: 'strMealThumb')
  final String? strMealThumb;

  @JsonKey(name: 'strInstructions')
  final String? strInstructions;

  @JsonKey(name: 'strTags')
  final String? strTags;

  @JsonKey(name: 'strYoutube')
  final String? strYoutube;

  const MealsResponse({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strMealThumb,
    this.strInstructions,
    this.strYoutube,
    this.strTags
  });

  @override
  List<Object?> get props => [
    idMeal,
    strMeal,
    strCategory,
    strArea,
    strMealThumb,
    strInstructions,
    strTags,
    strYoutube,
  ];

  factory MealsResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsResponseToJson(this);
}
