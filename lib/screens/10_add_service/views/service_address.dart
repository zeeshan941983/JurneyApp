import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:provider/provider.dart';

class ServiceAddress extends StatelessWidget {
  const ServiceAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(
      builder: (context, value, child) => SingleChildScrollView(
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
              text:
                  'Your address is only shared with guest after they’ve made a reservation',
              fontSize: 14.sp,
              color: AppColors.col6A6A6A,
              fontWeight: FontWeight.w400,
            ),
            10.h.ph,
            TextFormField(
              controller: value.countryController,
              decoration: fieldDecortation('Country/region'),
            ),
            10.h.ph,
            TextFormField(
              controller: value.streetController,
              decoration: fieldDecortation('Street address'),
            ),
            10.h.ph,
            TextFormField(
              controller: value.appartmentController,
              decoration: fieldDecortation('Appartment,unit'),
            ),
            10.h.ph,
            TextFormField(
              controller: value.cityController,
              decoration: fieldDecortation('City/town'),
            ),
            10.h.ph,
            TextFormField(
              controller: value.stateController,
              decoration: fieldDecortation('State/territory'),
            ),
            10.h.ph,
            TextFormField(
              controller: value.zipcodeController,
              decoration: fieldDecortation('ZIP code'),
            ),
          ],
        ),
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
