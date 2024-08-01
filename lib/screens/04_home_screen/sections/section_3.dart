import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibiza/core/constants/extensions.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:ibiza/screens/04_home_screen/sections/section_4.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/widgets/app_text.dart';
import '../home_screen.dart';

class Section3 extends StatelessWidget {
  const Section3({
    super.key,
    required this.homeProvider,
  });
  final HomeProvider homeProvider;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppText(
              text: 'Set your journey by customizing your calendar',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.col1D1D1D,
            ),
          ).withPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AppText(
              text:
                  'Click on any hour empty space to add or customize your activities',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.col6A6A6A,
            ),
          ).withPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BorderButton(
                imageIcon: AppImages.calender,
                text: 'Custom view',
                onTab: () {
                  homeProvider.showDate();
                },
              ),
              IconButton(
                icon: Icon(Icons.restart_alt, size: 20.sp),
                onPressed: () {},
              ).withPadding(padding: EdgeInsets.only(right: 10.sp))
            ],
          ).withPadding(),
          10.ph,
          SizedBox(
            child: SpecialRegionsCalendar(
              homeProvider: homeProvider,
            ),
          ),
          20.ph,
          Align(
            alignment: Alignment.topLeft,
            child: AppText(
              text: 'Summery',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.col1D1D1D,
            ),
          ).withPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AppText(
              text: 'Below is the summary for all the activities  so far.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.col6A6A6A,
            ),
          ).withPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          SizedBox(
            child: Stack(
              children: [
                Container(
                  width: 343.w,
                  margin: EdgeInsets.only(top: 13.5.h),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.colD0D5DD,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      4.h.ph,
                      Container(
                        height: 96.h,
                        width: 311.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1,
                            color: AppColors.colD6D6D6,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AppText(
                                  text:
                                      "${'Taxi to the Hotel Managger'.split(' ').take(3).join(' ')}...",
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 27.h,
                  width: 91.w,
                  margin: EdgeInsets.only(
                    left: 16.w,
                    bottom: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(47.r),
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.colD6D6D6,
                    ),
                  ),
                  child: Center(
                    child: AppText(
                      text: 'Thuesday',
                      color: AppColors.col6A6A6A,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ).withPadding()
        ],
      ),
    );
  }
}
