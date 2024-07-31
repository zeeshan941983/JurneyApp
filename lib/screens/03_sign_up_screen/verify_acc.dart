import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/02_login_screen/provider/login_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyAccView extends StatelessWidget {
  VerifyAccView({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    final formKey = GlobalKey<FormState>();
    return Consumer<LoginProvider>(
      builder: (context, provider, child) => ModalProgressHUD(
        inAsyncCall: provider.state == ViewState.busy,
        progressIndicator: const CustomLoader(),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          30.h.ph,
                          Image.asset(
                            AppImages.logoB,
                            scale: 4,
                          ),
                          56.h.ph,
                          AppText(
                            text: 'Verifiy your email',
                            fontSize: 18.sp,
                            color: AppColors.col222222,
                            fontWeight: FontWeight.w600,
                          ),
                          5.h.ph,
                          AppText(
                            text: 'We have sent an OTP to your provided email address. Please check your email and enter the OTP to proceed.',
                            fontSize: 16.sp,
                            color: AppColors.col222222,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                          ),
                          45.h.ph,
                          Pinput(
                            controller: otpController,
                            defaultPinTheme: defaultPinTheme,
                            separatorBuilder: (index) => const SizedBox(width: 8),
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            forceErrorState: provider.verified == false,
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 22,
                                  height: 1,
                                  color: focusedBorderColor,
                                ),
                              ],
                            ),
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                            errorText: 'Please provide correct OTP',
                            length: 5,
                          ),
                          27.h.ph,
                          AppButton(
                            text: 'Verify',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                final verification = await provider.verifyAccount(otp: otpController.text);
                                if (verification) {
                                  // ignore: use_build_context_synchronously
                                  context.pushAndRemoveAll(AppRoutes.loginScreen);
                                }
                              }
                            },
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const AppText(
                              text: 'Cancel',
                              color: AppColors.col1E99A1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
