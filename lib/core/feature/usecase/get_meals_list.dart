import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mealmisg/core/feature/domain/list_meals.dart';

import '../../failure/failure.dart';
import '../impl/home_repository.dart';

@injectable
class GetCategoriesListUseCase {
  final MealsRepository _repository;

  const GetCategoriesListUseCase(this._repository);

  Future<Either<Failure, ListCategoriesData>> execute() async {
    return _repository.getMealsList();
  }
}
