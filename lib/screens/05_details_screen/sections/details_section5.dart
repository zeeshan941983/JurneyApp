import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/05_details_screen/models/overall_rating_model.dart';

class DetailsSection5 extends StatelessWidget {
  const DetailsSection5({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 106.h,
                width: 138.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText(
                      text: 'Overall Rating',
                      fontSize: 14.sp,
                      color: AppColors.col222222,
                      fontWeight: FontWeight.w600,
                    ),
                    ...List.generate(
                      5,
                      (index) => Row(
                        children: [
                          AppText(
                            text: '${index + 1}',
                            fontSize: 12.sp,
                            color: AppColors.col222222,
                            fontWeight: FontWeight.w400,
                          ),
                          4.w.pw,
                          Expanded(
                            child: Container(
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: index == 4
                                    ? AppColors.col222222
                                    : AppColors.colDDDDDD,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              15.w.pw,
              ...List.generate(
                listOfOverAllratingModel.length,
                (index) {
                  final rating = listOfOverAllratingModel[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: OverAllRatingBox(
                      name: rating.name,
                      image: rating.image,
                      rating: rating.rating,
                    ),
                  );
                },
              )
            ],
          ),
          10.h.ph,
          AppText(
            text: 'Meet your Host',
            fontSize: 22.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          10.h.ph,
          Container(
            height: 214.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 30.h),
            decoration: BoxDecoration(
              color: AppColors.colFFFFFF,
              borderRadius: BorderRadius.circular(21.25.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 5.32),
                  spreadRadius: 0,
                  blurRadius: 17.74,
                )
              ],
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 46.r,
                              backgroundImage:
                                  const AssetImage(AppImages.homeBg),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                AppImages.hostbdge,
                                scale: 3.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.h.ph,
                      AppText(
                        text: 'Aydin',
                        fontSize: 26.sp,
                        color: AppColors.col222222,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                      AppText(
                        text: '🥇 Superhost',
                        fontSize: 12.sp,
                        color: AppColors.col222222,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HostTexts(text1: '53', text2: 'Reviews'),
                      HostTexts(text1: '4.5', text2: 'Rating'),
                      Expanded(
                          child: HostTexts(text1: '9', text2: 'Years hosting')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          10.h.ph,
          Center(
            child: AppButton(
              text: 'Message Host',
              radius: 8.r,
              width: 158.w,
              color: AppColors.col222222,
              onTap: () {},
            ),
          ),
          20.h.ph,
          AppText(
            text: 'Aydin is a Superhost',
            fontSize: 18.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          AppText(
            text:
                'Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.',
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w400,
          ),
          15.h.ph,
          AppText(
            text: 'Host Details',
            fontSize: 18.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          5.h.ph,
          AppText(
            text: 'Response rate: 100%\nResonds with an hour',
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w400,
          ),
          15.h.ph,
          Row(
            children: [
              ImageIcon(
                const AssetImage(AppImages.school),
                size: 24.sp,
              ),
              10.w.pw,
              AppText(
                text: 'Where I went to school: Ürgüp',
                fontSize: 16.sp,
                color: AppColors.col222222,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Row(
            children: [
              ImageIcon(
                const AssetImage(AppImages.work),
                size: 24.sp,
              ),
              10.w.pw,
              AppText(
                text: 'My work: accommodation',
                fontSize: 16.sp,
                color: AppColors.col222222,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          15.h.ph,
          AppText(
            text:
                'I was born in this region and am still living in Ortahisar. l live in a local cave house and my job is small…',
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w400,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: AppText(
              text: 'Show More',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              textDecoration: TextDecoration.underline,
              color: AppColors.col222222,
            ),
            label: Icon(
              Icons.keyboard_arrow_right,
              size: 20.sp,
              color: AppColors.col222222,
            ),
          ),
          20.h.ph,
        ],
      ),
    );
  }
}

class HostTexts extends StatelessWidget {
  const HostTexts({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: text1,
            fontSize: 26.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          AppText(
            text: text2,
            fontSize: 12.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          const Divider(
            thickness: 1,
            color: AppColors.colDDDDDD,
          ),
        ],
      ),
    );
  }
}

class OverAllRatingBox extends StatelessWidget {
  const OverAllRatingBox({
    super.key,
    required this.name,
    required this.image,
    required this.rating,
  });

  final String name, image, rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106.h,
      width: 138.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          VerticalDivider(thickness: 1.w, color: AppColors.colDDDDDD),
          10.w.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppText(
                text: name,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col222222,
              ),
              AppText(
                text: rating,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col222222,
              ),
              ImageIcon(
                AssetImage(image),
                size: 32.sp,
                color: AppColors.col222222,
              )
            ],
          )
        ],
      ),
    );
  }
}
