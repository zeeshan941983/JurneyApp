import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.suffix,
    this.obscureText,
    this.validator,
  });
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool? obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      validator: validator,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.col344054,
      ),
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        suffixIcon: suffix,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.col829AB1,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 8.w,
        ),
        constraints: BoxConstraints(
          maxHeight: 39.3.h,
          minHeight: 30.h,
        ),
        fillColor: AppColors.colF0F4F8,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

Divider customDivier = const Divider(color: AppColors.colDDDDDD, thickness: 1);
