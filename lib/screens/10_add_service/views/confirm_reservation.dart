import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class ConfirmReservation extends StatefulWidget {
  const ConfirmReservation({super.key});

  @override
  State<ConfirmReservation> createState() => _ConfirmReservationState();
}

class _ConfirmReservationState extends State<ConfirmReservation> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Decide how you will confirm reservations',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          10.h.ph,
          AppText(
            text: 'Share what makes your service special',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          10.h.ph,
          Container(
            height: 90.h,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: Center(
              child: ListTile(
                title: Text(
                  "Use instant book",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Guests can book automatically.",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: SvgPicture.asset("assets/svg/light.svg", width: 22.w),
              ),
            ),
          ),
          20.h.ph,
          Container(
            height: 90.h,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: Center(
              child: ListTile(
                title: Text(
                  "Approve or decline requests",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Guests must ask if they can book.",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing:
                    SvgPicture.asset("assets/svg/requestMsg.svg", width: 24.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
