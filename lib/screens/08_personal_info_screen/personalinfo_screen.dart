import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../core/constants/enums.dart';
import '../../core/widgets/custom_loader.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => ModalProgressHUD(
        inAsyncCall: provider.state == ViewState.busy,
        progressIndicator: const CustomLoader(),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: AppColors.colFFFFFF,
            appBar: AppBar(
              backgroundColor: AppColors.colFFFFFF,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  size: 32.sp,
                ),
              ),
              actions: [
                ImageIcon(
                  const AssetImage(AppImages.accountlogo),
                  size: 45.h,
                ).withPadding(padding: EdgeInsets.only(right: 15.w)),
              ],
            ),
            body: SingleChildScrollView(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
     
                ],
              ).withPadding(
                  padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              )),
            ),
          ),
        ),
      ),
    );
  }
}

