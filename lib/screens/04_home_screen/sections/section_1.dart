import 'package:flutter/material.dart';

import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/constants/enums.dart';

import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';

import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/core/widgets/list_card.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';

import 'package:provider/provider.dart';

class Section1 extends StatefulWidget {
  const Section1({
    super.key,
  });

  @override
  State<Section1> createState() => _Section1State();
}

class _Section1State extends State<Section1> with TickerProviderStateMixin {
  TabController? _tabcontroller;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      await provider.getCategories();

      setState(() {
        _tabcontroller = TabController(
          length:
              provider.categories.isNotEmpty ? provider.categories.length : 0,
          vsync: this,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return Container(
      height: MediaQuery.sizeOf(context).height + 100.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.homeBg),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              10.h.ph,
              // AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () =>
                        context.pushName(AppRoutes.userDetailsScreen),
                    icon: const Icon(Icons.menu),
                    iconSize: 32.sp,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () async {
                      provider.setState(ViewState.busy);
                      await provider.deleteUser();
                      provider.setState(ViewState.idle);
                      // await provider.getCategories();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    iconSize: 32.sp,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Image.asset(
                    AppImages.logoW,
                    scale: 6.5,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      size: 32.sp,
                      color: Colors.white,
                    ),
                  ),
                  // InkWell(
                  //   onTap: () => context.pushName(AppRoutes.accountScreen),
                  //   child: ImageIcon(
                  //     const AssetImage(AppImages.user),
                  //     size: 32.sp,
                  //     color: AppColors.colFFFFFF,
                  //   ),
                  // ),
                ],
              ).withPadding(padding: EdgeInsets.symmetric(horizontal: 8.w)),
              24.h.ph,

              // TabBar

              Container(
                height: 64.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(47.r),
                ),
                child: _tabcontroller == null
                    ? const Center(child: CustomLoader())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              final selectedIndex = _tabcontroller?.index;
                              if (selectedIndex != 0) {
                                _tabcontroller?.animateTo(selectedIndex! - 1);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_left_rounded,
                                color: AppColors.col1E99A1,
                                size: 18.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBar(
                              controller: _tabcontroller,
                              isScrollable: true,
                              indicatorSize: TabBarIndicatorSize.label,
                              dividerHeight: 0,
                              indicatorWeight: 3.h,
                              tabs: List.generate(
                                provider.categories.length,
                                (index) => Tab(
                                  icon: ImageIcon(
                                    NetworkImage(
                                        provider.categories[index].icon),
                                    size: 24.sp,
                                  ),
                                  text: provider.categories[index].name,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              final selectedIndex = _tabcontroller?.index;
                              if (selectedIndex !=
                                  (provider.categories.length - 1)) {
                                _tabcontroller?.animateTo(selectedIndex! + 1);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: AppColors.col1E99A1,
                                size: 18.sp,
                              ),
                            ),
                          )
                        ],
                      ),
              ),
              24.h.ph, 24.h.ph,
              AppText(
                text: 'Never Stop Exploring the World'.toUpperCase(),
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ).withPadding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
              24.h.ph,
              AppButton(
                text: 'Explore',
                height: 34.47.h,
                width: 108.94.w,
                radius: 18.r,
                onTap: () {},
              ),
              24.h.ph,
              Align(
                alignment: Alignment.topLeft,
                child: AppText(
                  text: 'MOST POPULAR',
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ).withPadding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
              16.h.ph,
              SizedBox(
                height: 307.h,
                child: provider.popularServiceModel.documents.isNotEmpty
                    ? ListView.builder(
                        controller: _scrollController,
                        itemCount:
                            provider.popularServiceModel.documents.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final popularService =
                              provider.popularServiceModel.documents[index];

                          String imageUrl = popularService.images.isNotEmpty
                              ? popularService.images.first
                              : 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png';

                          return InkWell(
                            onTap: () => context.pushName(
                                AppRoutes.detailsScreen,
                                arguments: popularService),
                            child: ListCard(
                              image: imageUrl,
                              place: popularService.title,
                              price: popularService.price.toDouble(),
                              distance: 200.0,
                              date: DateTime.now(),
                              isDarkBG: true,
                            ).withPadding(),
                          );
                        },
                      )
                    : const Center(
                        child: Text("No popular services available")),
              ),

              20.h.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      double offset = _scrollController.offset + 1 * 50;
                      _scrollController.animateTo(
                        offset,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.ease,
                      );
                    },
                    icon: ImageIcon(
                      const AssetImage(AppImages.arrowLeft),
                      size: 43.sp,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      double offset = _scrollController.offset - 1 * 50;
                      _scrollController.animateTo(
                        offset,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.ease,
                      );
                    },
                    icon: ImageIcon(
                      const AssetImage(AppImages.arrowRight),
                      size: 43.sp,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 1.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
