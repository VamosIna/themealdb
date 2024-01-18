part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  failed,
  loaded,
}

class HomeState extends Equatable {
  final HomeStatus pageStatus;
  final List<MealsData> categories;

  const HomeState({
    this.pageStatus = HomeStatus.initial,
    this.categories = const [],
  });

  factory HomeState.createDefault() => const HomeState();

  HomeState copyWith({
    HomeStatus? pageStatus,
    List<MealsData>? categories,
  }) =>
      HomeState(
        pageStatus: pageStatus ?? this.pageStatus,
        categories: categories ?? this.categories,
      );

  bool get canRefresh =>
      [HomeStatus.failed, HomeStatus.loaded].contains(pageStatus);

  @override
  List<Object?> get props => [
        pageStatus,
        categories,
      ];
}
