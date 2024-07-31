import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/custom_app_bar.dart';
import 'package:ibiza/screens/07_account_screen/provider/account_provider.dart';
import 'package:provider/provider.dart';
import '../../core/constants/enums.dart';
import '../../core/widgets/custom_loader.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
      builder: (context, provider, child) => ModalProgressHUD(
        inAsyncCall: provider.state == ViewState.busy,
        progressIndicator: const CustomLoader(),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: PopScope(
            canPop: provider.selectedPage == 0,
            onPopInvoked: (didPop) {
              if (provider.selectedPage != 0) {
                provider.onCardClicked(0);
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.colFFFFFF,
              appBar: CustomAppbar(
                onTapLeading: () {},
                onTapAccount: () {},
              ),
              body: provider.pages[provider.selectedPage],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    this.description,
    this.image,
    this.title,
    this.onTap,
    super.key,
  });
  final String? title;
  final String? description;
  final String? image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 15.r,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),
        margin: EdgeInsets.only(bottom: 17.h),
        height: 105.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.colFFFFFF,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image!, scale: 2.8),
            AppText(
              text: title!,
              fontSize: 14.sp,
              color: AppColors.col222222,
              fontWeight: FontWeight.w600,
            ),
            AppText(
              text: description!,
              fontSize: 12.sp,
              color: AppColors.col6A6A6A,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}

class Model {
  String title;
  String description;
  String image;

  Model({required this.title, required this.description, required this.image});
}

List<Model> cardList = [
  Model(
    title: "Personal Info",
    description: "Provide personal details and how we can reach you",
    image: AppImages.profile,
  ),
  Model(
    title: "Login & security",
    description: "Update your password and secure your accoun",
    image: AppImages.cards,
  ),
  Model(
    title: "Payment and Payout",
    description: "Review payments,payouts",
    image: AppImages.security,
  ),
  Model(
    title: "Notifications",
    description: "Choose how you want to be contacted",
    image: AppImages.notification,
  ),
];
