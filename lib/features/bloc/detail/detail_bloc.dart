import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mealmisg/core/feature/usecase/get_meals_detail.dart';
import 'package:mealmisg/database/db/app_db.dart';

import '../../../core/feature/domain/meals.dart';


part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends Bloc<DetailEvent, DetailState>  {
  DetailBloc(
    this._getDetailUseCase, {
    @factoryParam DetailState? initialValue,
  }) : super(initialValue ?? DetailState.createDefault()) {
    on<DetailGetDataEvent>(_getData);
    on<DetailToggleFavoriteEvent>(_toggleFavorite);
  }

  @override
  String get key => 'home-bloc';

  final GetDetailUseCase _getDetailUseCase;

  Future<void> _getData(
    DetailGetDataEvent event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(pageStatus: DetailStatus.loading));

    final result = await _getDetailUseCase.execute(i: state.mealsId);
    await result.fold(
      (l) async => emit(state.copyWith(pageStatus: DetailStatus.failed)),
      (r) async {
        final isFavorite = await event.myDb.getFavoriteId(state.mealsId);

        emit(
          state.copyWith(
            pageStatus: DetailStatus.loaded,
            mealDetail: r.meals,
            isFavorite: isFavorite != null,
          ),
        );
      },
    );
  }

  Future<void> _toggleFavorite(
    DetailToggleFavoriteEvent event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(isFavorite: !state.isFavorite));
    String message = !state.isFavorite ? 'dihilangkan' : 'ditambahkan';
    // Messenger.showSuccess(
    //   'Berhasil $message dari list favorite',
    //   context: event.context,
    // );
    print('Berhasil $message dari list favorite');
  }
}
