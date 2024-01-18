// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mealmisg/core/api/meal_api.dart' as _i6;
import 'package:mealmisg/core/api/retrofit_modul.dart' as _i12;
import 'package:mealmisg/core/client/api_dio.dart' as _i3;
import 'package:mealmisg/core/feature/impl/home_repository.dart' as _i7;
import 'package:mealmisg/core/feature/usecase/get_meals_detail.dart' as _i9;
import 'package:mealmisg/core/feature/usecase/get_meals_list.dart' as _i8;
import 'package:mealmisg/features/bloc/detail/detail_bloc.dart' as _i10;
import 'package:mealmisg/features/bloc/favorites/favorite_bloc.dart' as _i4;
import 'package:mealmisg/features/bloc/food_list/food_list_bloc.dart' as _i11;
import 'package:mealmisg/features/bloc/home/home_bloc.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initCoreGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final retrofitInjectableModule = _$RetrofitInjectableModule();
    gh.factory<_i3.ApiDio>(() => _i3.ApiDio());
    gh.singleton<_i4.FavoriteBloc>(_i4.FavoriteBloc());
    gh.singleton<_i5.HomeBloc>(_i5.HomeBloc());
    gh.factory<_i6.MealsApi>(
        () => retrofitInjectableModule.getMealsApi(gh<_i3.ApiDio>()));
    gh.factory<_i7.MealsRepository>(
        () => _i7.MealsRepository(api: gh<_i6.MealsApi>()));
    gh.factory<_i8.GetCategoriesListUseCase>(
        () => _i8.GetCategoriesListUseCase(gh<_i7.MealsRepository>()));
    gh.factory<_i9.GetDetailUseCase>(
        () => _i9.GetDetailUseCase(gh<_i7.MealsRepository>()));
    gh.factoryParam<_i10.DetailBloc, _i10.DetailState?, dynamic>((
      initialValue,
      _,
    ) =>
        _i10.DetailBloc(
          gh<_i9.GetDetailUseCase>(),
          initialValue: initialValue,
        ));
    gh.factory<_i11.FoodListBloc>(
        () => _i11.FoodListBloc(gh<_i8.GetCategoriesListUseCase>()));
    return this;
  }
}

class _$RetrofitInjectableModule extends _i12.RetrofitInjectableModule {}
