import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:provider/provider.dart';

class ServicePeopleCount extends StatelessWidget {
  const ServicePeopleCount({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'How many people can join?',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          5.h.ph,
          AppText(
            text: 'Tell us the number of people who can come to this activity',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          40.h.ph,
          AppText(
            text: 'Minmum Number of People',
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w500,
          ),
          AppText(
            text: 'Set the minimum number of people',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          5.h.ph,
          CounterWidget(
            controller: provider.minController,
            onTapRemove: provider.mindecrment,
            onTapAdd: provider.minincrment,
            onChange: (p0) {
              if (p0.isNotEmpty) provider.minnumberOfPeople = int.parse(p0);
            },
          ),
          if (provider.minnumberOfPeople > provider.maxnumberOfPeople)
            AppText(
              text: 'Minumum Number of People should be less then Maximum Number of People',
              color: Colors.red[300],
              fontSize: 13.sp,
            ),
          40.h.ph,
          AppText(
            text: 'Maximum Number of People',
            fontSize: 16.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w500,
          ),
          AppText(
            text: 'Set the maximum number of people',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          5.h.ph,
          CounterWidget(
            controller: provider.maxController,
            onTapRemove: provider.maxdecrment,
            onTapAdd: provider.maxincrment,
            onChange: (p0) {
              if (p0.isNotEmpty) provider.maxnumberOfPeople = int.parse(p0);
            },
          ),
          if (provider.maxnumberOfPeople < provider.minnumberOfPeople)
            AppText(
              text: 'Maximum Number should be greater then Minumum Number of People',
              color: Colors.red[300],
              fontSize: 13.sp,
            )
        ],
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    this.controller,
    this.onTapAdd,
    this.onTapRemove,
    this.onChange,
  });
  final TextEditingController? controller;
  final VoidCallback? onTapAdd, onTapRemove;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 134.w,
      decoration: BoxDecoration(
        color: AppColors.colFFFFFF,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 1.w, color: AppColors.col7A7A7A),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onTapRemove,
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.col1E99A1,
              size: 21.sp,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChange,
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.col222222,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onTapAdd,
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.col1E99A1,
              size: 21.sp,
            ),
          ),
        ],
      ),
    );
  }
}
