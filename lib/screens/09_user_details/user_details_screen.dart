import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/07_account_screen/provider/account_provider.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
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
            appBar: AppBar(
              backgroundColor: AppColors.colFFFFFF,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, size: 32.sp),
              ),
              actions: [
                ImageIcon(
                  const AssetImage(AppImages.user),
                  size: 24.h,
                ).withPadding(padding: EdgeInsets.only(right: 15.w)),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    listOfMenues.length,
                    (index) => Container(
                      height: 33.h,
                      width: 71.w,
                      decoration: BoxDecoration(
                        color: AppColors.colF5F5F5,
                        borderRadius: BorderRadius.circular(26.r),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: const Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> listOfMenues = [
  'Today',
  'Listing',
  'Inbox',
  'Menu',
];
