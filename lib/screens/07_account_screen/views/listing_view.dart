import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/07_account_screen/provider/account_provider.dart';
import 'package:provider/provider.dart';

class ListingView extends StatefulWidget {
  const ListingView({super.key});

  @override
  State<ListingView> createState() => _ListingViewState();
}

class _ListingViewState extends State<ListingView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
      builder: (context, provider, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            15.h.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () => provider.onCardClicked(0),
                  iconAlignment: IconAlignment.end,
                  label: AppText(
                    text: 'Account',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.col6A6A6A,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 15.sp,
                    color: AppColors.col6A6A6A,
                  ),
                ),
                AppText(
                  text: 'Your listing',
                  fontSize: 14.sp,
                  color: AppColors.col6A6A6A,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "Your listing",
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.col101828,
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateColor.resolveWith((states) => AppColors.colE2E2E2),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: AppColors.col7A7A7A,
                    size: 14.sp,
                  ),
                ),
              ],
            ),
            10.h.ph,
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                hintText: 'Search listing by name or location',
                suffixIcon: ImageIcon(
                  const AssetImage(AppImages.search),
                  size: 10.sp,
                  color: AppColors.col7A7A7A,
                ).withPadding(padding: EdgeInsets.symmetric(horizontal: 10.w)),
                suffixIconConstraints: BoxConstraints(minHeight: 44.h, minWidth: 44.w),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.colDDDDDD, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 249.h,
                ),
                itemBuilder: (context, index) => ListingContainer(
                  title: 'Experiences',
                  description: 'Add or customize your experiences',
                  image: AppImages.r333,
                  verificationText: 'Verification Required',
                  onTap: () => context.pushName(AppRoutes.addListingScreen),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListingContainer extends StatelessWidget {
  const ListingContainer({
    super.key,
    required this.image,
    required this.description,
    required this.title,
    required this.verificationText,
    this.onTap,
    this.height,
    this.width,
  });
  final VoidCallback? onTap;
  final String image, title, description, verificationText;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 9.h),
        decoration: BoxDecoration(
          color: AppColors.colFFFFFF,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              offset: Offset(0, 3.5.h),
              blurRadius: 14.r,
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 157.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.r),
                  topRight: Radius.circular(14.r),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: const Alignment(0.5, -0.9),
                    child: Container(
                      height: 20.h,
                      width: 116.w,
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppColors.colFFFFFF,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5.h,
                            width: 5.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.colF86767,
                            ),
                          ),
                          4.h.pw,
                          AppText(
                            text: verificationText,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.col222222,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            5.h.ph,
            AppText(
              text: title,
              color: AppColors.col222222,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ).withPadding(padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h)),
            AppText(
              text: description,
              color: AppColors.col6A6A6A,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ).withPadding(padding: EdgeInsets.symmetric(horizontal: 8.w))
          ],
        ),
      ),
    );
  }
}
