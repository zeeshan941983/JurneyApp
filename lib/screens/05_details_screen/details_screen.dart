import 'package:flutter/material.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/screens/05_details_screen/sections/details_section5.dart';
import 'package:provider/provider.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/widgets/app_text_field.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:ibiza/screens/05_details_screen/sections/details_section1.dart';
import 'package:ibiza/screens/05_details_screen/sections/details_section2.dart';
import 'package:ibiza/screens/05_details_screen/sections/details_section3.dart';
import 'package:ibiza/screens/05_details_screen/sections/details_section4.dart';

import '../../core/routes/app_router.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => ModalProgressHUD(
        inAsyncCall: provider.state == ViewState.busy,
        progressIndicator: const CustomLoader(),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.pushName(AppRoutes.accountScreen);
                },
                icon: Icon(
                  Icons.menu,
                  size: 32.sp,
                ),
              ),
              centerTitle: true,
              title: ImageIcon(
                const AssetImage(AppImages.logoB),
                size: 140.h,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  50.h.ph,
                  const DetailsSection1(),
                  10.h.ph,
                  customDivier.withPadding(),
                  const DetailsSection2(),
                  customDivier.withPadding(),
                  const DetailsSection3(),
                  customDivier.withPadding(),
                  const DetailsSection4(),
                  customDivier.withPadding(),
                  const DetailsSection5(),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 80.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 1.h, color: AppColors.colDDDDDD),
                ),
              ),
              child: Center(
                child: AppButton(
                  text: 'Add to Calender',
                  radius: 35.r,
                  height: 40.h,
                  width: 163.w,
                  fontWeight: FontWeight.w500,
                  onTap: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
