import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';

import 'package:ibiza/core/widgets/app_text.dart';

class TextWithTButton extends StatelessWidget {
  const TextWithTButton({
    super.key,
    required this.text,
    required this.btnText,
    this.onTap,
  });
  final String text, btnText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: AppColors.col486581,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        children: [
          WidgetSpan(
            child: InkWell(
              onTap: onTap,
              child: AppText(
                text: btnText,
                color: AppColors.col1E99A1,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
