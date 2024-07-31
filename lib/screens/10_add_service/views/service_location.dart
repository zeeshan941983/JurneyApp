import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class ServiceLocation extends StatelessWidget {
  const ServiceLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'Where are you exactly located?',
          fontSize: 20.sp,
          color: AppColors.col222222,
          fontWeight: FontWeight.w600,
        ),
        Expanded(
          child: Image.asset('assets/images/map.png'),
        )
      ],
    );
  }
}
