import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../route/router.dart';
import '../../../utils/colors.dart';
import '../../../utils/container.dart';
import '../../../utils/loading.dart';
import '../../../utils/text.dart';
import '../../bloc/food_list/food_list_bloc.dart';
import '../detail/route.dart';


class FoodListScreen extends StatefulWidget {
  const FoodListScreen({Key? key}) : super(key: key);

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  FoodListBloc get _viewModel => context.read<FoodListBloc>();

  @override
  void initState() {
    getData.call();
  }

  @override
  Future<bool> onBackPressed() async {
    return true;
  }

  Future<void> onRefresh() async {
    getData.call();
  }

  @override
  getData() {
    _viewModel.add(FoodListGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Meal'),
        backgroundColor: UtilsColors.tfSecondary,
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<FoodListBloc, FoodListState>(
                builder: (context, state) {
                  switch (state.pageStatus) {
                    case FoodListStatus.initial:
                      return const DefaultLoading();
                    case FoodListStatus.loading:
                      return const DefaultLoading();
                    case FoodListStatus.failed:
                      return const DefaultLoading();
                    case FoodListStatus.loaded:
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.mealsList.length,
                        itemBuilder: (context, index) {
                          final item = state.mealsList[index];
                          return DefaultContainer(
                            onTap: () {
                              final route = DetailRoute(mealsId: item.idMeal);
                              goRouter.push(route.location, extra: route);
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.network(item.strMealThumb),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          children: [
                                            DefaultText.h6(text: item.strMeal),
                                            const SizedBox(height: 2),
                                            DefaultText.body2(
                                              text:
                                              '${item.strCategory} - ${item.strArea}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.chevron_right, size: 24),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
