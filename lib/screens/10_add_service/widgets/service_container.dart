import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class ServicesContainer extends StatelessWidget {
  const ServicesContainer({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.isPreview,
    this.isSelected = false,
  });

  final String icon;
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final bool? isPreview;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65.h,
        width: isPreview != true ? 155.w : double.infinity,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            width: 0.93.w,
            color: isSelected ? Colors.grey.shade300 : AppColors.colD6D6D6,
          ),
          color: isSelected ? Colors.grey.shade300 : Colors.white,
        ),
        child: isPreview != true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    NetworkImage(icon),
                    size: 30.sp,
                  ),
                  AppText(
                    text: title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.col222222,
                  ),
                ],
              )
            : Row(
                children: [
                  20.w.pw,
                  ImageIcon(
                    NetworkImage(icon),
                    size: 40.sp,
                  ),
                  20.w.pw,
                  Expanded(
                    child: AppText(
                      text: title,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.col222222,
                    ),
                  ),
                  20.w.pw,
                  Container(
                    padding: EdgeInsets.only(
                        top: 0, bottom: 0, left: 5.dg, right: 5.dg),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    child: Text(
                      subtitle ?? "no subtitle",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
