import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealmisg/features/bloc/favorites/favorite_bloc.dart';
import 'package:mealmisg/utils/colors.dart';

import '../../../database/db/app_db.dart';
import '../../../route/router.dart';
import '../../../utils/container.dart';
import '../../../utils/loading.dart';
import '../../../utils/text.dart';
import '../../../utils/widget/empty_widget.dart';
import '../detail/route.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteBloc get _viewModel => context.read<FavoriteBloc>();
  late MyDatabase _myDb;
@override
  void initState() {
    super.initState();
    _myDb = MyDatabase();
    getFavorite.call(myDb: _myDb);
  }

  @override
  void dispose() {
    _myDb.close();
    _viewModel.close();
    super.dispose();
  }

  @override
  Future<bool> onBackPressed() async {
    return true;
  }

  @override
  void getFavorite({required MyDatabase myDb}) {
    _viewModel.add(FavoriteGetDataEvent(myDb: myDb));
  }

  Future<void> onRefresh() async {
    getFavorite.call(myDb: _myDb);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: UtilsColors.tfSecondary,
      ),
      body:RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  switch (state.pageStatus) {
                    case FavoriteStatus.initial:
                      return const DefaultLoading();
                    case FavoriteStatus.loading:
                      return const DefaultLoading();
                    case FavoriteStatus.failed:
                      return const DefaultLoading();
                    case FavoriteStatus.loaded:
                      final isEmpty = state.isEmpty;
                      switch (isEmpty) {
                        case true:
                          return const EmptyWidget();
                        case false:
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.listFavorite.length,
                            itemBuilder: (context, index) {
                              final item = state.listFavorite[index];
                              return DefaultContainer(
                                onTap: () async {
                                  final route =
                                  DetailRoute(mealsId: item.mealsId);
                                  await goRouter.push(route.location,
                                      extra: route);
                                  onRefresh.call();
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
                                            child: Image.network(
                                                item.mealsThumbnail),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              children: [
                                                DefaultText.h6(
                                                    text: item.mealsName),
                                                const SizedBox(height: 2),
                                                DefaultText.body2(
                                                  text:
                                                  '${item.mealsCategory} - ${item.mealsArea}',
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
