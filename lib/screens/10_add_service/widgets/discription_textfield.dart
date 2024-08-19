import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';

class DiscriptionTextfield extends StatelessWidget {
  final int max;
  final String? hintText;

  final Function(String)? onChanged;

  const DiscriptionTextfield(
      {super.key, required this.max, this.onChanged, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // setState(() {
        //   count = value.length;
        // });
      },
      maxLines: null,
      maxLength: max,
      minLines: 1,
      decoration: InputDecoration(
        hintText: hintText ?? "",
        hintStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        counterText: "",
      ),
      style: TextStyle(fontSize: 16.sp),
      keyboardType: TextInputType.multiline,
    );
  }
}
