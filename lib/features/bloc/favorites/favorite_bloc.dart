import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../database/db/app_db.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

@singleton
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState.createDefault()) {
    on<FavoriteGetDataEvent>(_getData);
  }

  @override
  String get key => 'favorite-bloc';

  Future<void> _getData(
    FavoriteGetDataEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(state.copyWith(pageStatus: FavoriteStatus.loading));

    final result = await event.myDb.getFavoriteList();
    emit(
      state.copyWith(
        pageStatus: FavoriteStatus.loaded,
        listFavorite: result,
      ),
    );
  }
}
