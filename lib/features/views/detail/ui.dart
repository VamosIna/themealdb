import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:drift/drift.dart' as drift;
import 'package:mealmisg/features/bloc/detail/detail_bloc.dart';
import 'package:mealmisg/utils/container.dart';
import 'package:mealmisg/utils/loading.dart';
import 'package:mealmisg/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../database/db/app_db.dart';
import '../../../utils/colors.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailBloc get _viewModel => context.read<DetailBloc>();
  late MyDatabase _myDb;



 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myDb = MyDatabase();
    print("CHECK ${_myDb}");
    getDetail.call(myDb: _myDb);
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

  Future<void> onRefresh() async {
    getDetail.call(myDb: _myDb);
  }

  void getDetail({required MyDatabase myDb}) {
    print("check : ${myDb.favorite.id}");
    _viewModel.add(DetailGetDataEvent(myDb: myDb));
  }

  void toggleFavorite({required BuildContext context}) {
    _viewModel.add(DetailToggleFavoriteEvent(context: context));
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void addOrRemoveFavorite(DetailState state) {
    switch (state.isFavorite) {
      case false:
        addFavorite(state);
        break;
      case true:
        removeFavorite(state);
        break;
    }
  }

  Future<void> addFavorite(DetailState state) async {
    final item = state.mealDetail[0];
    final entity = FavoriteCompanion(
      mealsId: drift.Value(item.idMeal),
      mealsArea: drift.Value(item.strArea),
      mealsName: drift.Value(item.strMeal),
      mealsThumbnail: drift.Value(item.strMealThumb),
      mealsInstruction: drift.Value(item.strInstructions),
      mealsCategory: drift.Value(item.strCategory),
    );

    await _myDb.addFavorite(entity).then((value) {
      toggleFavorite.call(context: context);
    });
  }

  Future<void> removeFavorite(DetailState state) async {
    final item = state.mealDetail[0].idMeal;
    await _myDb.removeFavorite(item).then((value) {
      toggleFavorite.call(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
        backgroundColor: UtilsColors.tfSecondary,
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  switch (state.pageStatus) {
                    case DetailStatus.initial:
                      return const DefaultLoading();
                    case DetailStatus.loading:
                      return const DefaultLoading();
                    case DetailStatus.failed:
                      return const DefaultLoading();
                    case DetailStatus.loaded:
                      final item = state.mealDetail[0];
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultText.h5(
                                  text:
                                  '${item.strMeal} (${item.strArea} Food)'),
                              InkWell(
                                onTap: () => addOrRemoveFavorite(state),
                                child: CircleAvatar(
                                  backgroundColor: UtilsColors.smTransparent,
                                  child: state.isFavorite
                                      ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                      : const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Image.network(item.strMealThumb),
                          const SizedBox(height: 24),
                          const DefaultText.subtitle1(text: 'Category:'),
                          const SizedBox(height: 4),
                          DefaultText.body1(text: item.strCategory),
                          const SizedBox(height: 24),
                          const DefaultText.subtitle1(text: 'Tags:'),
                          const SizedBox(height: 4),
                          DefaultText.body1(text: item.strTags),
                          const SizedBox(height: 24),
                          const DefaultText.subtitle1(text: 'Youtube Link:'),
                          const SizedBox(height: 4),
                          item.strYoutube == null ? SizedBox.shrink() :TextButton(
                            onPressed: (){
                              final Uri _url = Uri.parse(item.strYoutube.toString());
                              _launchInBrowser(_url);
                            },
                            child: DefaultText.body1(text: item.strYoutube),
                          ),
                          const SizedBox(height: 24),
                          const DefaultText.subtitle1(text: 'Description:'),
                          const SizedBox(height: 4),
                          DefaultText.body1(
                            text: item.strInstructions,
                            overflow: TextOverflow.visible,
                          ),
                        ],
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
