import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 1.14.h,
            color: AppColors.colBCCCDC,
          ),
        ),
        AppText(
          text: 'or',
          fontSize: 12.sp,
          color: AppColors.col486581,
          fontWeight: FontWeight.w400,
        ).withPadding(padding: const EdgeInsets.all(12)),
        Expanded(
          child: Divider(
            height: 1.14.h,
            color: AppColors.colBCCCDC,
          ),
        ),
      ],
    );
  }
}
