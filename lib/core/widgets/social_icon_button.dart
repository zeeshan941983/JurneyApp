import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';

import 'package:ibiza/core/widgets/app_text.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.icon,
    required this.text,
  });
  final String text, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.14.w,
          color: AppColors.colD0D5DD,
        ),
        borderRadius: BorderRadius.circular(9.15.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.29.h),
            color: AppColors.col101828.withOpacity(0.05),
            blurRadius: 1.29,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            scale: 4,
          ),
          13.w.pw,
          AppText(
            text: text,
            fontWeight: FontWeight.w500,
            color: AppColors.col344054,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
}
