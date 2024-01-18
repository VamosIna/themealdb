import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/feature/domain/meals.dart';
import '../../../core/feature/usecase/get_meals_list.dart';

part 'food_list_event.dart';
part 'food_list_state.dart';

@injectable
class FoodListBloc extends Bloc<FoodListEvent, FoodListState>  {
  FoodListBloc(
    this._getCategoriesListUseCase,
  ) : super(FoodListState.createDefault()) {
    on<FoodListGetDataEvent>(_getData);
  }

  @override
  String get key => 'home-bloc';

  final GetCategoriesListUseCase _getCategoriesListUseCase;

  Future<void> _getData(
    FoodListGetDataEvent event,
    Emitter<FoodListState> emit,
  ) async {
    emit(state.copyWith(pageStatus: FoodListStatus.loading));

    final result = await _getCategoriesListUseCase.execute();
    await result.fold(
      (l) async => emit(state.copyWith(pageStatus: FoodListStatus.failed)),
      (r) async {
        emit(
          state.copyWith(
            pageStatus: FoodListStatus.loaded,
            mealsList: r.meals,
          ),
        );
      },
    );
  }
}
