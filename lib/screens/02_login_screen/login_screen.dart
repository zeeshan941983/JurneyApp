import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/constants/constants.dart';

import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/app_text_field.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/core/widgets/or_divider.dart';
import 'package:ibiza/core/widgets/social_icon_button.dart';
import 'package:ibiza/core/widgets/text_with_tbutton.dart';
import 'package:ibiza/screens/02_login_screen/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                    child: Form(
                      key: _formKey,
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
                            text: signinwithGoogle,
                          ),
                          18.h.ph,
                          const SocialIconButton(
                            icon: AppImages.apple,
                            text: signInWithApple,
                          ),
                          18.3.h.ph,
                          const OrDivider(),
                          18.3.h.ph,
                          Align(
                            alignment: Alignment.topLeft,
                            child: AppText(
                              text: email,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.44.sp,
                              color: AppColors.col344054,
                            ),
                          ),
                          5.h.ph,
                          AppTextField(
                            hintText: hintMail,
                            controller: emailcontroler,
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return "Please type the email";
                              }
                              return null;
                            },
                          ),
                          18.h.ph,
                          Align(
                            alignment: Alignment.topLeft,
                            child: AppText(
                              text: password,
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
                                return "Please type the password";
                              }
                              return null;
                            },
                            suffix: InkWell(
                              onTap: () => provider.setVisibilty(),
                              child: Icon(
                                provider.obsecure ? Icons.visibility_off_outlined : Icons.visibility_off_outlined,
                                color: AppColors.col627D98,
                                size: 18.sp,
                              ),
                            ),
                          ),
                          27.h.ph,
                          AppButton(
                            text: signIn,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                bool loginUsrS = await provider.loginUser(
                                  email: emailcontroler.text,
                                  password: passwordcontroler.text,
                                );
                                if (loginUsrS) {
                                  // ignore: use_build_context_synchronously
                                  context.pushAndRemoveAll(AppRoutes.homeScreen);
                                } else {
                                  return;
                                }
                              }
                            },
                          ),
                          27.h.ph,
                          TextWithTButton(
                            text: donthaveanAccount,
                            btnText: signUp,
                            onTap: () => context.pushName(AppRoutes.signupScreen),
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
