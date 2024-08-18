import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

import 'package:ibiza/screens/10_add_service/widgets/location_textfield.dart';

class ServiceLocation extends StatelessWidget {
  const ServiceLocation({super.key});

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
          Stack(
            children: [
              Expanded(
                child: Image.asset('assets/images/map.png'),
              ),
              const Positioned.fill(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: LocationTextfield(),
              ))
            ],
          )
        ],
      ),
    );
  }
}
