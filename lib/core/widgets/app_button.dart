import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
    this.radius,
    this.textSize,
    this.fontWeight,
    this.color,
    this.textColor,
  });
  final String text;
  final VoidCallback onTap;
  final double? height, width, radius, textSize;
  final FontWeight? fontWeight;
  final Color? color, textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: radius,
      child: Container(
        height: height ?? 42.h,
        width: width,
        decoration: BoxDecoration(
          color: color ?? AppColors.col1E99A1,
          borderRadius: BorderRadius.circular(radius ?? 9.15.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.col101828.withOpacity(0.05),
              offset: const Offset(0, 1.14),
              blurRadius: 2.29,
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: AppText(
            text: text,
            fontSize: textSize ?? 16.sp,
            fontWeight: fontWeight ?? FontWeight.w600,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
