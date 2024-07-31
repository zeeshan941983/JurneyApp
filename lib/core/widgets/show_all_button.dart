import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class ShowAllButton extends StatelessWidget {
  const ShowAllButton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 48.h,
        width: 208.w,
        decoration: BoxDecoration(
          color: AppColors.colFFFFFF,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1.w, color: AppColors.col222222),
        ),
        child: Center(
          child: AppText(
            text: text,
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
