part of 'detail_bloc.dart';

enum DetailStatus {
  initial,
  loading,
  failed,
  loaded,
}

class DetailState extends Equatable {
  final DetailStatus pageStatus;
  final List<MealsData> mealDetail;
  final String mealsId;
  final bool isFavorite;

  const DetailState({
    this.pageStatus = DetailStatus.initial,
    this.mealDetail = const [],
    this.mealsId = '',
    this.isFavorite = false,
  });

  factory DetailState.createDefault() => const DetailState();

  DetailState copyWith({
    DetailStatus? pageStatus,
    List<MealsData>? mealDetail,
    String? mealsId,
    bool? isFavorite,
  }) =>
      DetailState(
        pageStatus: pageStatus ?? this.pageStatus,
        mealDetail: mealDetail ?? this.mealDetail,
        mealsId: mealsId ?? this.mealsId,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  bool get canRefresh =>
      [DetailStatus.failed, DetailStatus.loaded].contains(pageStatus);

  @override
  List<Object?> get props => [
        pageStatus,
        mealDetail,
        mealsId,
        isFavorite,
      ];
}
