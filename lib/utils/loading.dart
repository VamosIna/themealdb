import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum LoadingType {
  waveDots,
  staggeredDotsWave,
}

enum LoadingTypeColor {
  light(color: Color.fromARGB(0, 0, 0, 0)),
  dark(color: Color.fromARGB(100, 100, 100, 100)),;

  final Color color;
  const LoadingTypeColor({
    required this.color,
  });
}

class DefaultLoading extends StatelessWidget {
  const DefaultLoading({
    this.loadingColor = LoadingTypeColor.dark,
    this.type = LoadingType.waveDots,
    this.color,
    this.size = 48,
    Key? key,
  }) : super(key: key);

  final LoadingTypeColor loadingColor;
  final Color? color;
  final double size;
  final LoadingType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingType.waveDots:
        return Center(
          child: LoadingAnimationWidget.waveDots(
            color: color ?? loadingColor.color,
            size: size,
          ),
        );
      case LoadingType.staggeredDotsWave:
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: color ?? loadingColor.color,
            size: size,
          ),
        );
    }
  }
}
