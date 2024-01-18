import 'package:flutter/material.dart';
import 'package:mealmisg/utils/colors.dart';

import '../../../route/router.dart';
import '../../../utils/container.dart';
import '../../../utils/text.dart';
import '../favorites/route.dart';
import '../food_list/route.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 24),
                const SizedBox(height: 16),
                const DefaultText.h4(text: 'Welcome!'),
                const SizedBox(height: 24),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    final route = FoodListRoute();
                    goRouter.push(route.location, extra: route);
                  },
                  child: DefaultContainer(
                    color: UtilsColors.tfSecondaryLighter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.food_bank_outlined, size: 36),
                        SizedBox(width: 12),
                        DefaultText.subtitle1(text: 'Meal List'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    final route = FavoriteRoute();
                    goRouter.push(route.location, extra: route);
                  },
                  child:  DefaultContainer(
                    color: Colors.black45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, size: 36,color: Colors.red,),
                        SizedBox(width: 12),
                        DefaultText.subtitle1(text: 'Favorites'),
                      ],
                    ),
                  ),
                ),
          ],
        ),
        // child: ListView(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: [
        //
        //   ],
        // ),
      ),
    );
  }
}
