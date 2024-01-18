part of 'food_list_bloc.dart';

enum FoodListStatus {
  initial,
  loading,
  failed,
  loaded,
}

class FoodListState extends Equatable {
  final FoodListStatus pageStatus;
  final List<MealsData> mealsList;

  const FoodListState({
    this.pageStatus = FoodListStatus.initial,
    this.mealsList = const [],
  });

  factory FoodListState.createDefault() => const FoodListState();

  FoodListState copyWith({
    FoodListStatus? pageStatus,
    List<MealsData>? mealsList,
  }) =>
      FoodListState(
        pageStatus: pageStatus ?? this.pageStatus,
        mealsList: mealsList ?? this.mealsList,
      );

  bool get canRefresh =>
      [FoodListStatus.failed, FoodListStatus.loaded].contains(pageStatus);

  @override
  List<Object?> get props => [
        pageStatus,
        mealsList,
      ];
}
