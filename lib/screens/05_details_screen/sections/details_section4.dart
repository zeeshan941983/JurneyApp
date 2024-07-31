import 'package:flutter/material.dart';
import 'package:ibiza/core/widgets/show_all_button.dart';
import 'package:ibiza/screens/05_details_screen/models/reviews_model.dart';
import 'package:intl/intl.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class DetailsSection4 extends StatelessWidget {
  const DetailsSection4({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.rateflagl,
                height: 132.h,
              ),
              AppText(
                text: '5.0',
                fontSize: 94.34.sp,
                color: AppColors.col222222,
                fontWeight: FontWeight.w600,
              ),
              Image.asset(
                AppImages.rateflagr,
                height: 132.h,
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: AppText(
              text: 'Guest favorite',
              fontSize: 22.sp,
              color: AppColors.col222222,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
          AppText(
            text: 'One of the most loved homes on Airbnb based on ratings, reviews, and reliability',
            fontSize: 18.sp,
            textAlign: TextAlign.center,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          40.h.ph,
          ...List.generate(
            reviews.length,
            (index) {
              final review = reviews[index];
              return ReviewBox(review: review).withPadding(padding: EdgeInsets.symmetric(vertical: 10.h));
            },
          ),
          ShowAllButton(text: 'Show All ${reviews.length} reviews'),
          10.h.ph,
        ],
      ),
    );
  }
}

class ReviewBox extends StatelessWidget {
  const ReviewBox({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(review.image),
                radius: 24.r,
              ),
              10.w.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: review.name,
                    fontSize: 16.sp,
                    color: AppColors.col222222,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText(
                    text: '4 months on ibizaJourney',
                    fontSize: 14.sp,
                    color: AppColors.col222222,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              ...List.generate(
                review.stars.toInt(),
                (index) => Icon(
                  Icons.star,
                  color: AppColors.col222222,
                  size: 8.5.sp,
                ),
              ),
              5.w.pw,
              AppText(
                text: ' ·   ${DateFormat('MMMM yyyy').format(review.date)}',
                color: AppColors.col222222,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              5.w.pw,
              AppText(
                text: ' ·   Stayed ${review.duration}',
                color: AppColors.col6A6A6A,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              )
            ],
          ).withPadding(),
          AppText(
            text: review.review,
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
