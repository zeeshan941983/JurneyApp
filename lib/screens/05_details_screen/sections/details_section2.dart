import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/app_text_field.dart';
import 'package:ibiza/screens/05_details_screen/models/check_in_model.dart';

class DetailsSection2 extends StatelessWidget {
  const DetailsSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            listOfCheckin.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage(listOfCheckin[index].imageIcon),
                    size: 24.sp,
                  ),
                  10.w.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: listOfCheckin[index].title,
                        fontSize: 16.sp,
                        color: AppColors.col222222,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        text: listOfCheckin[index].subtitle,
                        fontSize: 14.sp,
                        color: AppColors.col6A6A6A,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          customDivier.withPadding(),
          AppText(
            text: 'You will not want to leave this attractive place, which is the only one of its kind.',
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w400,
          ),
          10.h.ph,
          AppText(
            text: 'Registration number',
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          AppText(
            text: '50-0420',
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
