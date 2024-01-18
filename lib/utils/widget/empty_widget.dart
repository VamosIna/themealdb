import 'package:flutter/material.dart';

import '../text.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          Icon(Icons.no_meals_sharp, size: 64),
          SizedBox(height: 12),
          DefaultText.subtitle2(text: 'Yahh!'),
          SizedBox(height: 2),
          DefaultText.body2(
            overflow: TextOverflow.visible,
            text:
                'Makanan favorite kosong nih, coba klik tombol love melalui\nmenu food list terlebih dahulu',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
