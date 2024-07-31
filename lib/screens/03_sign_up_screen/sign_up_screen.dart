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
import 'package:ibiza/screens/03_sign_up_screen/verify_acc.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController namecontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                              text: 'User Name',
                              fontWeight: FontWeight.w600,
                              fontSize: 11.44.sp,
                              color: AppColors.col344054,
                            ),
                          ),
                          5.h.ph,
                          AppTextField(
                            hintText: 'e.g. Jhon Doe',
                            controller: namecontroler,
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                          18.h.ph,
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
                          AppTextField(
                            hintText: 'Name@example.com',
                            controller: emailcontroler,
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
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
                            controller: passwordcontroler,
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'Please enter password';
                              } else if (p0.length < 8) {
                                return 'Password must be 8 characterrs';
                              }
                              return null;
                            },
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
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                final regis = await provider.registerUser(
                                  context,
                                  email: emailcontroler.text,
                                  password: passwordcontroler.text,
                                  username: namecontroler.text,
                                );
                                if (regis == true) {
                                  // ignore: use_build_context_synchronously
                                  context.push(VerifyAccView());
                                } else {
                                  return;
                                }
                              }
                            },
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
      ),
    );
  }
}
