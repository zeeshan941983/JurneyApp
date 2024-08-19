import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/10_add_service/widgets/discription_textfield.dart';

class SetPrice extends StatefulWidget {
  const SetPrice({super.key});

  @override
  State<SetPrice> createState() => _SetPriceState();
}

class _SetPriceState extends State<SetPrice> {
  bool _isExtraServicesFeeSelected = false;
  int _radiovalue = 1;
  int max = 32;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Now set your price',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          10.h.ph,
          AppText(
            text: 'You can change it anytime',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _radiovalue,
                onChanged: (value) {
                  setState(() {
                    _radiovalue = value!;
                  });
                },
              ),
              const AppText(
                text: "Per hour",
                color: Colors.grey,
                fontSize: 15,
              ),
              Radio(
                value: 2,
                groupValue: _radiovalue,
                onChanged: (value) {
                  setState(() {
                    _radiovalue = value!;
                  });
                },
              ),
              const AppText(
                text: "Per activity",
                color: Colors.grey,
                fontSize: 15,
              ),
              Radio(
                value: 3,
                groupValue: _radiovalue,
                onChanged: (value) {
                  setState(() {
                    _radiovalue = value!;
                  });
                },
              ),
              const AppText(
                text: "Per day",
                color: Colors.grey,
                fontSize: 15,
              ),
            ],
          ),
          5.h.ph,
          Stack(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "\$99",
                    color: Colors.black,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(
                    text: "/hour",
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: SvgPicture.asset("assets/svg/edit.svg"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          5.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _isExtraServicesFeeSelected,
                onChanged: (value) {
                  setState(() {
                    _isExtraServicesFeeSelected = value!;
                  });
                },
              ),
              const AppText(
                text: "Add extra services fee",
                color: Colors.black,
                fontSize: 16,
              ),
            ],
          ),
          5.h.ph,
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "\$99",
                    color: Colors.black,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(
                    text: "/hour",
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 40.w,
                child: IconButton(
                  icon: SvgPicture.asset("assets/svg/edit.svg"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          20.h.ph,
          Container(
            height: 170.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: DiscriptionTextfield(
              max: max,
              hintText:
                  "If you want to avail this service you might need to pay some extra",
              onChanged: (value) {
                setState(() {
                  count = value.length;
                });
              },
            ),
          ),
          5.h.ph,
          Text('$count/$max'),
        ],
      ),
    );
  }
}
// If you want to avail this service you might need to pay some extra