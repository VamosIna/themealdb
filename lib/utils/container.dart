import 'package:flutter/material.dart';
import 'package:mealmisg/utils/colors.dart';

class DefaultContainer extends StatelessWidget {
  final double thickness;
  final double? width;
  final double? height;
  final Color borderColor;
  final Color color;
  final double borderRadius;
  final Widget? child;
  final String? bgImage;
  final VoidCallback? onTap;

  const DefaultContainer({
    Key? key,
    this.thickness = 1,
    this.width,
    this.height,
    this.borderColor = UtilsColors.smGrey,
    this.color = UtilsColors.smWhite,
    this.borderRadius = 10,
    this.child,
    this.bgImage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: bgImage != null
              ? DecorationImage(
                  image: AssetImage(bgImage!),
                  fit: BoxFit.cover,
                )
              : null,
          color: color,
          border: Border.all(
            width: thickness,
            color: thickness > 0 ? borderColor : UtilsColors.smTransparent,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
