import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class ServicePhotos extends StatelessWidget {
  const ServicePhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'Add some photos of your service',
          fontSize: 20.sp,
          color: AppColors.col222222,
          fontWeight: FontWeight.w600,
        ),
        10.h.ph,
        AppText(
          text: 'You can add 5 photos to get started, You can add more or make changes later',
          fontSize: 14.sp,
          color: AppColors.col6A6A6A,
          fontWeight: FontWeight.w400,
        ),
        10.h.ph,
        Container(
          height: 232.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(width: 1.w, color: AppColors.colD6D6D6),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  const AssetImage(AppImages.photos),
                  size: 64.sp,
                ),
                AppText(
                  text: 'Drag your photos here',
                  fontSize: 16.sp,
                  color: AppColors.col222222,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: 'Choose at least 5 photos',
                  fontSize: 14.sp,
                  color: AppColors.col6A6A6A,
                  fontWeight: FontWeight.w400,
                ),
                TextButton(
                  onPressed: () {},
                  child: AppText(
                    text: 'Upload from your device',
                    fontSize: 14.sp,
                    color: AppColors.col222222,
                    fontWeight: FontWeight.w400,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
        10.h.ph,
        Wrap(
          direction: Axis.horizontal,
          children: [
            Container(
              height: 160.w,
              width: 160.h,
              margin: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                border: Border.all(width: 1.w, color: AppColors.colD6D6D6),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline_rounded,
                      size: 24.sp,
                      color: AppColors.colD6D6D6,
                    ),
                    AppText(
                      text: 'Add more',
                      color: AppColors.col7A7A7A,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      textDecoration: TextDecoration.underline,
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
