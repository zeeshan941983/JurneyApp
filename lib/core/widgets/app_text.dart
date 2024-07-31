import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';


class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.fontFamily,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.textDecoration,
  });

  final String text;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? height;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: textDecoration,
        decorationColor: color ?? AppColors(0xFFFFFFFF),
        fontSize: fontSize ?? 18.sp,
        fontFamily: fontFamily ?? outfit,
        color: color ?? AppColors(0xFFFFFFFF),
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
