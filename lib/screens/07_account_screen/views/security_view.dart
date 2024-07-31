import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/app_text_field.dart';
import 'package:ibiza/screens/07_account_screen/provider/account_provider.dart';
import 'package:ibiza/screens/07_account_screen/views/personal_info_view.dart';
import 'package:provider/provider.dart';

class SecurityView extends StatefulWidget {
  const SecurityView({super.key});

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
      builder: (context, provider, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.h.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () => provider.onCardClicked(0),
                    iconAlignment: IconAlignment.end,
                    label: AppText(
                      text: 'Account',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.col6A6A6A,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      size: 15.sp,
                      color: AppColors.col6A6A6A,
                    ),
                  ),
                  AppText(
                    text: 'Login & Security',
                    fontSize: 14.sp,
                    color: AppColors.col6A6A6A,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              AppText(
                text: "Login & Security",
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col101828,
              ),
              18.h.ph,
              AppText(
                text: "Profile",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col101828,
              ),
              20.h.ph,
              const InfoFieldsWithLabels(
                label: 'Legal Name',
                text: 'Jhon Hero',
              ),
              customDivier,
              const InfoFieldsWithLabels(
                label: 'Change Password',
                text: '********',
              ),
              customDivier,
              25.h.ph,
              AppText(
                text: "Social Accounts",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col101828,
              ),
              20.h.ph,
              const InfoFieldsWithLabels(
                label: 'Facebook',
                text: 'Not Connected',
              ),
              customDivier,
              25.h.ph,
              const InfoFieldsWithLabels(
                label: 'Google',
                text: 'Connected',
                btnText: 'Connect',
                btnColor: AppColors.col1E99A1,
              ),
              customDivier,
              25.h.ph,
              AppText(
                text: "Account",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col101828,
              ),
              20.h.ph,
              const InfoFieldsWithLabels(
                text: 'Deactivate your account',
                btnText: 'Decactiate',
                btnColor: AppColors.colF86767,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
