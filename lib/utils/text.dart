import 'package:flutter/material.dart';
import 'package:mealmisg/utils/colors.dart';
import 'package:mealmisg/utils/texts.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final TextStyle? style;
  final int? maxLines;
  final double? minFontSize;
  final TextOverflow? overflow;

  const DefaultText({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style,
  }) : super(key: key);

  const DefaultText.h1({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = h1,
  }) : super(key: key);

  const DefaultText.h2({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = h2,
  }) : super(key: key);

  const DefaultText.h3({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = h3,
  }) : super(key: key);

  const DefaultText.h4({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = h4,
  }) : super(key: key);

  const DefaultText.h5({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = h5,
  }) : super(key: key);

  const DefaultText.h6({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = h6,
  }) : super(key: key);

  const DefaultText.subtitle1({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = subtitle1,
  }) : super(key: key);

  const DefaultText.subtitle2({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = subtitle2,
  }) : super(key: key);

  const DefaultText.body1({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = body1,
  }) : super(key: key);

  const DefaultText.body2({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = body2,
  }) : super(key: key);

  const DefaultText.caption1({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = caption1,
  }) : super(key: key);

  const DefaultText.caption2({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = caption2,
  }) : super(key: key);

  const DefaultText.caption3({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = caption3,
  }) : super(key: key);

  const DefaultText.caption4({
    Key? key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.minFontSize,
    this.textAlign = TextAlign.start,
    this.style = caption4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (style ?? const TextStyle(color: UtilsColors.smTextLightPrimary))
          .copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      ),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
