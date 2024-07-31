import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/04_home_screen/models/card_model.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

showActivityDialouge(BuildContext context) {
  final controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  showDialog(
    context: context,
    builder: (context) => Consumer<HomeProvider>(
      builder: (context, provider, child) => Material(
        type: MaterialType.card,
        color: Colors.transparent,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.7,
          width: MediaQuery.sizeOf(context).width * 0.7,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 150.h),
          padding: EdgeInsets.only(left: 10.w, top: 20.h, right: 10.w, bottom: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                onChanged: (value) {
                  provider.filterCards(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search Activity',
                  suffixIcon: Icon(
                    Icons.search,
                    size: 25.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: AppColors.col7A7A7A),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              5.h.ph,
              Align(
                alignment: Alignment.topLeft,
                child: AppText(
                  text: 'You might also like',
                  color: AppColors.col1D1D1D,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              5.h.ph,
              provider.filteredCards.isEmpty
                  ? Center(
                      child: AppText(
                        text: 'Activity Not Found',
                        color: AppColors.col7A7A7A,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Expanded(
                      child: Scrollbar(
                        radius: const Radius.elliptical(5, 5),
                        thumbVisibility: true,
                        trackVisibility: true,
                        interactive: true,
                        controller: scrollController,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => 5.h.ph,
                          controller: scrollController,
                          itemCount: provider.filteredCards.length,
                          itemBuilder: (context, index) => ActivityContainer(
                            data: provider.filteredCards[index],
                            onTap: () {
                              provider.addActivity(provider.filteredCards[index]);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    ),
  );
}

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({
    super.key,
    required this.data,
    required this.onTap,
  });

  final ActivityModel data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      width: double.infinity.w,
      margin: EdgeInsets.only(right: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 1.w, color: AppColors.colDDDDDD),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.42.r),
            child: Image.asset(
              data.image,
              height: 80.h,
              width: 85.w,
              fit: BoxFit.cover,
            ),
          ),
          5.pw,
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText(
                  text: data.place.split('').take(54).join(),
                  color: AppColors.col1D1D1D,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: '${data.distance} Kilometer away',
                  color: AppColors.col7A7A7A,
                  fontSize: 12.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                ),
                AppText(
                  text: 'Hosted by ${data.hostedBy}',
                  color: AppColors.col7A7A7A,
                  fontSize: 12.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Rating ',
                    style: TextStyle(
                      color: AppColors.col7A7A7A,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: outfit,
                    ),
                    children: [
                      TextSpan(
                        text: '${data.review}',
                        style: TextStyle(
                          color: AppColors.colDB8332,
                          fontSize: 10.sp,
                          fontFamily: outfit,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // 5.h.ph,
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.w,
                  child: AppText(
                    text: '\$${data.price}/hour',
                    color: AppColors.col1D1D1D,
                    fontSize: 12.sp,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppButton(
                  text: 'Add',
                  height: 29.h,
                  width: 70.w,
                  radius: 37.r,
                  onTap: onTap,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
