import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class DetailsSection1 extends StatelessWidget {
  const DetailsSection1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: AppText(
                  text: 'Share',
                  fontSize: 14.sp,
                  color: AppColors.col222222,
                  fontWeight: FontWeight.w600,
                  textDecoration: TextDecoration.underline,
                ),
                icon: ImageIcon(
                  const AssetImage(AppImages.share),
                  size: 16.h,
                  color: AppColors.col222222,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: AppText(
                  text: 'Save',
                  fontSize: 14.sp,
                  color: AppColors.col222222,
                  fontWeight: FontWeight.w600,
                  textDecoration: TextDecoration.underline,
                ),
                icon: ImageIcon(
                  const AssetImage(AppImages.like),
                  size: 16.h,
                  color: AppColors.col222222,
                ),
              ),
            ],
          ),

          AppText(
            text: 'Cappadocia St Nino’s Garden',
            fontSize: 18.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          10.h.ph,

          ///TODO: Change image to Network
          Image.asset(
            images.first,
            height: 316,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          10.h.ph,
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 5.h,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),
          10.h.ph,

          Row(
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage(AppImages.r333),
                radius: 25.r,
              ),
              10.h.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Hosted by Aydin',
                    color: AppColors.col222222,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText(
                    text: 'Superhost · 9 years hosting',
                    color: AppColors.col6A6A6A,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

List<String> images = [
  AppImages.r333,
  AppImages.r34,
  AppImages.r55,
  AppImages.r6,
  AppImages.r77,
];
