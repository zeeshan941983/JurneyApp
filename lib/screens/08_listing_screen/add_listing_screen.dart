import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/app_text_field.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/07_account_screen/provider/account_provider.dart';
import 'package:ibiza/screens/07_account_screen/views/listing_view.dart';
import 'package:provider/provider.dart';

class AddListingScreen extends StatelessWidget {
  const AddListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
      builder: (context, provider, child) => ModalProgressHUD(
        inAsyncCall: provider.state == ViewState.busy,
        progressIndicator: const CustomLoader(),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: AppColors.colFFFFFF,

            // appBar: AppBar(
            //   backgroundColor: AppColors.colFFFFFF,
            //   leading: IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.menu, size: 32.sp),
            //   ),
            //   actions: [
            //     ImageIcon(
            //       const AssetImage(AppImages.accountlogo),
            //       size: 45.h,
            //     ).withPadding(padding: EdgeInsets.only(right: 15.w)),
            //   ],
            // ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListingContainer(
                      width: 157.w,
                      height: 250.h,
                      title: 'Experiences',
                      description: 'Add or customize your experiences',
                      image: AppImages.r333,
                      verificationText: 'Verification Required',
                      onTap: () {},
                    ),
                    20.h.ph,
                    AppText(
                      text: 'Key details to take care of',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.col222222,
                    ),
                    5.h.ph,
                    AppText(
                      text: 'Create your listing',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.col7A7A7A,
                    ),
                    5.h.ph,
                    const CheckCompleteW(),
                    10.h.ph,
                    customDivier,
                    20.h.ph,
                    AppText(
                      text: 'Confirm your phone number',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.col222222,
                    ),
                    5.h.ph,
                    AppText(
                      text:
                          'We\'ll call or text to confirm your number. Standard messaging rates apply.',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.col7A7A7A,
                    ),
                    5.h.ph,
                    const CheckCompleteW(),
                    10.h.ph,
                    customDivier,
                    20.h.ph,
                    AppText(
                      text: 'Verify your identity',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.col222222,
                    ),
                    5.h.ph,
                    Row(
                      children: [
                        Expanded(
                          child: AppText(
                            text:
                                'This is a simple way to help guests feel confident booking your place.',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.col7A7A7A,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 32.sp,
                          color: AppColors.col222222,
                        )
                      ],
                    ),
                    5.h.ph,
                    AppText(
                      text: 'Required',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.col222222,
                    ),
                    5.h.ph,
                    20.h.ph,
                    AppButton(
                      text: 'Publish Listing',
                      radius: 35.r,
                      onTap: () => context.pushName(AppRoutes.addServiceScreen),
                    ),
                    20.h.ph,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckCompleteW extends StatelessWidget {
  const CheckCompleteW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      child: Row(
        children: [
          Container(
            height: 30.h,
            width: 30.w,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 97, 221, 101),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.check,
                color: AppColors.colFFFFFF,
              ),
            ),
          ),
          10.w.pw,
          AppText(
            text: 'Completed',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.col222222,
          )
        ],
      ),
    );
  }
}
