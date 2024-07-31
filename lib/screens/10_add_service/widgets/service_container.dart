import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class ServicesContainer extends StatelessWidget {
  const ServicesContainer({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon, title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.h,
      width: 155.w,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 0.93.w, color: AppColors.colD6D6D6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            NetworkImage(icon),
            size: 30.sp,
          ),
          AppText(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.col222222,
          )
        ],
      ),
    );
  }
}
