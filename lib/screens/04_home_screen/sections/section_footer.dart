import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class SectionFooter extends StatelessWidget {
  SectionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 32.h),
      width: double.infinity,
      color: AppColors.col064549,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.logoW,
            scale: 5,
          ),
          24.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: ImageIcon(
                  const AssetImage(AppImages.facebook),
                  size: 18.sp,
                  color: Colors.white,
                ),
              ).withPadding(padding: EdgeInsets.only(right: 22.w)),
              InkWell(
                onTap: () {},
                child: ImageIcon(
                  const AssetImage(AppImages.twitter),
                  size: 18.sp,
                  color: Colors.white,
                ),
              ).withPadding(padding: EdgeInsets.only(right: 22.w)),
              InkWell(
                onTap: () {},
                child: ImageIcon(
                  const AssetImage(AppImages.instagram),
                  size: 18.sp,
                  color: Colors.white,
                ),
              ).withPadding(padding: EdgeInsets.only(right: 22.w)),
              InkWell(
                onTap: () {},
                child: ImageIcon(
                  const AssetImage(AppImages.linkedIn),
                  size: 18.sp,
                  color: Colors.white,
                ),
              ).withPadding(padding: EdgeInsets.only(right: 22.w)),
              InkWell(
                onTap: () {},
                child: ImageIcon(
                  size: 18.sp,
                  color: Colors.white,
                  const AssetImage(AppImages.youTube),
                ),
              ).withPadding(padding: EdgeInsets.only(right: 22.w)),
            ],
          ),
          24.h.ph,
          ...List.generate(
            _footerStrings.length,
            (index) => TextButton(
              onPressed: () {
                switch (index) {
                  case 0:
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                }
              },
              child: AppText(
                text: _footerStrings[index],
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          25.h.ph,
          Divider(
            height: 0.5.h,
            color: Colors.white,
          ),
          25.h.ph,
          AppText(
            text: 'Copyright © 2024 IBIZAjourney',
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          8.h.ph,
          Row(
            children: [
              AppText(
                text: 'All Rights Reserved | ',
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: 'Terms and Conditions ',
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                textDecoration: TextDecoration.underline,
              ),
              AppText(
                text: '| Privacy Policy',
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                textDecoration: TextDecoration.underline,
              ),
            ],
          )
        ],
      ),
    );
  }

  final List<String> _footerStrings = [
    'Features',
    'Pricing',
    'Case Studies',
    'Reviews',
    'Updates'
  ];
}
