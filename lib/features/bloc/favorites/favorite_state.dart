part of 'favorite_bloc.dart';

enum FavoriteStatus {
  initial,
  loading,
  failed,
  loaded,
}

class FavoriteState extends Equatable {
  final FavoriteStatus pageStatus;
  final List<FavoriteData> listFavorite;

  const FavoriteState({
    this.pageStatus = FavoriteStatus.initial,
    this.listFavorite = const [],
  });

  factory FavoriteState.createDefault() => const FavoriteState();

  FavoriteState copyWith({
    FavoriteStatus? pageStatus,
    List<FavoriteData>? listFavorite,
  }) =>
      FavoriteState(
        pageStatus: pageStatus ?? this.pageStatus,
        listFavorite: listFavorite ?? this.listFavorite,
      );

  bool get canRefresh =>
      [FavoriteStatus.failed, FavoriteStatus.loaded].contains(pageStatus);

  bool get isEmpty => listFavorite.isEmpty;

  @override
  List<Object?> get props => [
        pageStatus,
        listFavorite,
      ];
}
