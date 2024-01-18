import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mealmisg/core/feature/domain/list_meals.dart';

import '../../failure/failure.dart';
import '../impl/home_repository.dart';

@injectable
class GetDetailUseCase {
  final MealsRepository _repository;

  const GetDetailUseCase(this._repository);

  Future<Either<Failure, ListCategoriesData>> execute(
      {required String i}) async {
    return _repository.getMealsDetail(i: i);
  }
}
