import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class ServiceAddress extends StatelessWidget {
  const ServiceAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Where are you exactly located?',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          8.h.ph,
          AppText(
            text: 'Your address is only shared with guest after they’ve made a reservation',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          10.h.ph,
          TextFormField(
            decoration: fieldDecortation('Country/region'),
          ),
          10.h.ph,
          TextFormField(
            decoration: fieldDecortation('Street address'),
          ),
          10.h.ph,
          TextFormField(
            decoration: fieldDecortation('Appartment,unit'),
          ),
          10.h.ph,
          TextFormField(
            decoration: fieldDecortation('City/town'),
          ),
          10.h.ph,
          TextFormField(
            decoration: fieldDecortation('State/territory'),
          ),
          10.h.ph,
          TextFormField(
            decoration: fieldDecortation('ZIP code'),
          ),
        ],
      ),
    );
  }

  InputDecoration fieldDecortation(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: AppColors.col7A7A7A,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.col7A7A7A,
        ),
      ),
    );
  }
}
