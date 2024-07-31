import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';

import 'package:lottie/lottie.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppImages.circleLoader,
      height: 170.h,
      width: 170.w,
    );
  }
}
