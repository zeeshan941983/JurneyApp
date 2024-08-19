import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class CalendarActivityAdd extends StatefulWidget {
  const CalendarActivityAdd({super.key});

  @override
  State<CalendarActivityAdd> createState() => _CalendarActivityAddState();
}

class _CalendarActivityAddState extends State<CalendarActivityAdd> {
  int _radiovalue = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Set days and hours of your activity',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          10.h.ph,
          AppText(
            text: 'You can set the availability in multiple days and hours.',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          10.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                  value: 1,
                  groupValue: _radiovalue,
                  onChanged: (val) {
                    setState(() {
                      _radiovalue = val!;
                    });
                  }),
              AppText(
                text: "Manual time",
                fontSize: 15.sp,
                color: Colors.grey,
              ),
              Radio(
                  value: 2,
                  groupValue: _radiovalue,
                  onChanged: (val) {
                    setState(() {
                      _radiovalue = val!;
                    });
                  }),
              AppText(
                text: "Fixed time",
                fontSize: 15.sp,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
