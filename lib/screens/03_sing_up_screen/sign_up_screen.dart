import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/constants/constants.dart';

import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/app_text_field.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/core/widgets/or_divider.dart';
import 'package:ibiza/core/widgets/social_icon_button.dart';
import 'package:ibiza/core/widgets/text_with_tbutton.dart';
import 'package:ibiza/screens/02_login_screen/provider/login_provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        40.h.ph,
                        Image.asset(
                          AppImages.logoB,
                          scale: 4,
                        ),
                        36.h.ph,
                        const SocialIconButton(
                          icon: AppImages.google,
                          text: 'Sign up with Google',
                        ),
                        18.h.ph,
                        const SocialIconButton(
                          icon: AppImages.apple,
                          text: 'Sign up with Apple',
                        ),
                        18.3.h.ph,
                        const OrDivider(),
                        18.3.h.ph,
                        Align(
                          alignment: Alignment.topLeft,
                          child: AppText(
                            text: 'Email',
                            fontWeight: FontWeight.w600,
                            fontSize: 11.44.sp,
                            color: AppColors.col344054,
                          ),
                        ),
                        5.h.ph,
                        const AppTextField(
                          hintText: 'Name@example.com',
                        ),
                        18.h.ph,
                        Align(
                          alignment: Alignment.topLeft,
                          child: AppText(
                            text: 'Password',
                            fontWeight: FontWeight.w600,
                            fontSize: 11.44.sp,
                            color: AppColors.col344054,
                          ),
                        ),
                        5.h.ph,
                        AppTextField(
                          hintText: '*********',
                          obscureText: provider.obsecure,
                          suffix: InkWell(
                            onTap: () => provider.setVisibilty(),
                            child: Icon(
                              Icons.visibility_off_outlined,
                              color: AppColors.col627D98,
                              size: 18.sp,
                            ),
                          ),
                        ),
                        27.h.ph,
                        AppButton(
                          text: 'Sign Up',
                          onTap: () {},
                        ),
                        27.h.ph,
                        TextWithTButton(
                          text: 'Already have an Account? ',
                          btnText: 'Login',
                          onTap: () => Navigator.pop(context),
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
    );
  }
}
