import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/app_text_field.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/07_account_screen/provider/account_provider.dart';
import 'package:provider/provider.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountProvider>(context);
    final user = provider.userModel;
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
                    text: 'Personal info',
                    fontSize: 14.sp,
                    color: AppColors.col6A6A6A,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              AppText(
                text: "Personal info",
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col101828,
              ),
              18.h.ph,
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 153.h,
                  width: 153.w,
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            user.avatar ?? '',
                            errorListener: (p0) => const CustomLoader(),
                          ),
                          radius: 70.r,
                        ),
                      ),
                      Align(
                        alignment: const Alignment(1.0, 0.7),
                        child: IconButton.filledTonal(
                          onPressed: () async {
                            provider.setState(ViewState.busy);
                            await provider.pickImage();
                            provider.setState(ViewState.idle);
                          },
                          style: ButtonStyle(backgroundColor: WidgetStateColor.resolveWith((states) => AppColors.colFFFFFF)),
                          icon: ImageIcon(
                            const AssetImage(AppImages.edit),
                            size: 20.sp,
                            color: AppColors.col222222,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InfoFieldsWithLabels(
                label: 'Legal Name',
                text: user.username,
              ),
              customDivier,
              25.h.ph,
              InfoFieldsWithLabels(
                label: 'Email address',
                text: user.email,
              ),
              customDivier,
              25.h.ph,
              InfoFieldsWithLabels(
                label: 'Phone numbers',
                text: user.phoneNumber ?? 'Not provided',
              ),
              customDivier,
              25.h.ph,
              InfoFieldsWithLabels(
                label: 'Government ID',
                text: user.governmentId ?? 'Not provided',
              ),
              customDivier,
              25.h.ph,
              InfoFieldsWithLabels(
                label: 'Address',
                text: user.address ?? 'Street, City, State.',
              ),
              customDivier,
              20.h.ph,
              InfoFieldsWithLabels(
                label: 'Emergency contact',
                text: user.emergencyContact ?? '+00 000 000 000',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoFieldsWithLabels extends StatelessWidget {
  const InfoFieldsWithLabels({
    super.key,
    this.label,
    this.text,
    this.btnText,
    this.btnColor,
  });
  final String? label, text, btnText;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              AppText(
                text: label!,
                fontSize: 16.sp,
                color: AppColors.col222222,
                fontWeight: FontWeight.w400,
              ),
            AppText(
              text: '$text',
              fontSize: 14.sp,
              color: AppColors.col6A6A6A,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: AppText(
            text: btnText ?? 'Edit',
            color: btnColor ?? AppColors.col222222,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            textDecoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }
}
