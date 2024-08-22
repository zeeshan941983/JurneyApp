import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibiza/core/constants/constants.dart';

class CommonReservationContainer extends StatelessWidget {
  final String title;
  final String icon;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? color;
  const CommonReservationContainer(
      {super.key,
      required this.title,
      required this.icon,
      required this.subtitle,
      this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90.h,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(width: 1.w, color: Colors.grey),
        ),
        child: Center(
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: SvgPicture.asset(icon, width: 22.w),
          ),
        ),
      ),
    );
  }
}
