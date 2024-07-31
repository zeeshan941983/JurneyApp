import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:ibiza/screens/04_home_screen/sections/section_1.dart';
import 'package:ibiza/screens/04_home_screen/sections/section_2.dart';
import 'package:ibiza/screens/04_home_screen/sections/section_footer.dart';
import 'package:provider/provider.dart';
import 'sections/section_3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => ModalProgressHUD(
        inAsyncCall: provider.state == ViewState.busy,
        progressIndicator: const CustomLoader(),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Section1(),
                  Section2(),
                  Section3(homeProvider: provider),
                  SectionFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
   const BorderButton({
    super.key,
    required this.imageIcon,
    required this.text,
    required this.onTab,
  });
  final String imageIcon, text;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 125.w,
        height: 36.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: AppColors.colDDDDDD,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageIcon(
              AssetImage(imageIcon),
              size: 18.sp,
            ),
            AppText(
              text: text,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.col6A6A6A,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18.sp,
              color: AppColors.col6A6A6A,
            ),
          ],
        ),
      ),
    );
  }
}
