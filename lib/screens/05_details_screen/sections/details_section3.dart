import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/show_all_button.dart';
import 'package:ibiza/screens/05_details_screen/models/services_offers.dart';

class DetailsSection3 extends StatelessWidget {
  const DetailsSection3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'What this place offers',
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.col222222,
          ),
          ...List.generate(
            listOfservicesOffers.length,
            (index) {
              final service = listOfservicesOffers[index];
              return Row(
                children: [
                  ImageIcon(
                    AssetImage(service.imageIcon),
                    size: 24.sp,
                    color: Colors.black,
                  ),
                  10.w.pw,
                  AppText(
                    text: service.service,
                    color: AppColors.col222222,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    textDecoration: service.available ? TextDecoration.none : TextDecoration.lineThrough,
                  ),
                ],
              ).withPadding(padding: EdgeInsets.symmetric(vertical: 5.h));
            },
          ),
          20.h.ph,
          const ShowAllButton(text: 'Show All 50 amenties'),
          10.h.ph,
        ],
      ),
    );
  }
}
