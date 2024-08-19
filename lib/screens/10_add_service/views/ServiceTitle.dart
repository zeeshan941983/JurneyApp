import 'package:flutter/material.dart';

import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/10_add_service/widgets/discription_textfield.dart';

class ServiceTitle extends StatefulWidget {
  const ServiceTitle({super.key});

  @override
  State<ServiceTitle> createState() => _ServiceTitleState();
}

class _ServiceTitleState extends State<ServiceTitle> {
  int count = 0;
  int max = 32;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Now let’s give your service a title',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          10.h.ph,
          AppText(
            text:
                'Short titles work best. Have fun with it - you can always change it later',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          10.h.ph,
          Container(
            height: 232.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: DiscriptionTextfield(
              max: max,
              onChanged: (value) {
                setState(() {
                  count = value.length;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$count/$max"),
          ),
        ],
      ),
    );
  }
}
