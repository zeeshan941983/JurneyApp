import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:intl/intl.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.image,
    required this.place,
    required this.price,
    required this.distance,
    required this.date,
    this.isDarkBG = false,
  });

  final String image, place;
  final double price;
  final double? distance;
  final DateTime date;
  final bool isDarkBG;

  @override
  Widget build(BuildContext context) {
    print(image);
    return SizedBox(
      width: 158.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 131.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                onError: (error, stackTrace) {},
              ),
            ),
          ),
          4.h.ph,
          AppText(
            text: place,
            color: isDarkBG ? Colors.white : Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          3.h.ph,
          AppText(
            text: '${distance ?? 'Unknown'} Kilometer away',
            color: isDarkBG ? AppColors.colCECECE : AppColors.col7A7A7A,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          3.h.ph,
          AppText(
            text: DateFormat('MMMM dd, yyyy').format(date),
            color: isDarkBG ? AppColors.colCECECE : AppColors.col7A7A7A,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          2.h.ph,
          RichText(
            text: TextSpan(
              text: '$price\$',
              style: TextStyle(
                color: isDarkBG ? Colors.white : Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: ' night',
                  style: TextStyle(
                    color: isDarkBG ? AppColors.colCECECE : AppColors.col7A7A7A,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          6.h.ph,
          Align(
            alignment: Alignment.center,
            child: AppButton(
              text: 'Add to Calendar',
              height: 32.h,
              radius: 35.r,
              textSize: 12.sp,
              fontWeight: FontWeight.w400,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
