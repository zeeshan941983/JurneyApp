import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/custom_app_bar.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:ibiza/screens/10_add_service/views/service_address.dart';
import 'package:ibiza/screens/10_add_service/views/service_condition.dart';
import 'package:ibiza/screens/10_add_service/views/service_location.dart';
import 'package:ibiza/screens/10_add_service/views/service_offers.dart';
import 'package:ibiza/screens/10_add_service/views/service_people_count.dart';
import 'package:ibiza/screens/10_add_service/views/service_photos.dart';
import 'package:ibiza/screens/10_add_service/views/service_type.dart';
import 'package:provider/provider.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<AddServiceScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(
      builder: (context, provider, child) => ModalProgressHUD(
        inAsyncCall: provider.state == ViewState.busy,
        progressIndicator: const CustomLoader(),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: AppColors.colFFFFFF,
            appBar: CustomAppbar(onTapLeading: () {}, onTapAccount: () {}),
            body: provider.addService
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              if (_pageController.page != 0) {
                                _pageController.previousPage(duration: Durations.extralong3, curve: Curves.ease);
                              } else {
                                provider.addService = false;
                              }
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 30.sp,
                              color: AppColors.col292D32,
                            ),
                          ),
                        ),
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (p) => provider.currentPage = p,
                            children: const [
                              ServiceType(),
                              ServiceLocation(),
                              ServiceAddress(),
                              ServicePeopleCount(),
                              ServiceCondition(),
                              ServiceOffers(),
                              ServicePhotos()
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: AppButton(
                            text: 'Next',
                            width: 98.w,
                            height: 45.h,
                            radius: 35.r,
                            onTap: () => _pageController.nextPage(duration: Durations.extralong3, curve: Curves.ease),
                          ),
                        ),
                        15.h.ph,
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'It’s easy to get startedon IBIZAJourney',
                        fontWeight: FontWeight.w600,
                        fontSize: 32.sp,
                        textAlign: TextAlign.center,
                        color: AppColors.col1D1D1D,
                      ),
                      20.h.ph,
                      AppButton(
                        text: "Let's Begin",
                        width: 129.w,
                        height: 45.h,
                        radius: 35.r,
                        fontWeight: FontWeight.w500,
                        onTap: () => provider.addService = true,
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
