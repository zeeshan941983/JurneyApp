import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/list_card.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Section2 extends StatelessWidget {
  Section2({
    super.key,
  });

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'AMAZING VIEWS',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col1D1D1D,
              ),
              TextButton(
                onPressed: () {},
                child: AppText(
                  text: 'View All',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.col6A6A6A,
                  textDecoration: TextDecoration.underline,
                ),
              )
            ],
          ).withPadding(),
          SizedBox(
            height: 307.h,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: provider.popularServiceModel.documents.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final popularSerivce =
                      provider.popularServiceModel.documents[index];
                  String imageUrl = popularSerivce.images.isNotEmpty
                      ? popularSerivce.images.first
                      : 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png';
                  return InkWell(
                    onTap: () => context.pushName(AppRoutes.detailsScreen),
                    child: ListCard(
                      image: imageUrl,
                      place: popularSerivce.title,
                      price: popularSerivce.price.toDouble(),
                      distance: provider.distanceBetween[index],
                      date: DateTime.now(),
                      isDarkBG: false,
                    ).withPadding(),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'NEWLY ADDED',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.col1D1D1D,
              ),
              TextButton(
                onPressed: () {},
                child: AppText(
                  text: 'View All',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.col6A6A6A,
                  textDecoration: TextDecoration.underline,
                ),
              )
            ],
          ).withPadding(),
          SizedBox(
            height: 307.h,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: provider.popularServiceModel.documents.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final popularSerivce =
                      provider.popularServiceModel.documents[index];
                  String imageUrl = popularSerivce.images.isNotEmpty
                      ? popularSerivce.images.first
                      : 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png';
                  return InkWell(
                    onTap: () => context.pushName(AppRoutes.detailsScreen),
                    child: ListCard(
                      image: imageUrl,
                      place: popularSerivce.title,
                      price: popularSerivce.price.toDouble(),
                      distance: provider.distanceBetween[index],
                      date: DateTime.now(),
                      isDarkBG: false,
                    ).withPadding(),
                  );
                }),
          ),
          20.h.ph,
        ],
      ),
    );
  }
}
