import 'package:flutter/material.dart';

import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:ibiza/screens/10_add_service/widgets/discription_textfield.dart';
import 'package:provider/provider.dart';

class CreateDiscription extends StatefulWidget {
  const CreateDiscription({super.key});

  @override
  State<CreateDiscription> createState() => _CreateDiscriptionState();
}

class _CreateDiscriptionState extends State<CreateDiscription> {
  int count = 0;
  int max = 500;
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Create your description',
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
              height: 232.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(width: 1.w, color: Colors.grey),
              ),
              child: DiscriptionTextfield(
                controller: value.discriptionController,
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
      ),
    );
  }
}
