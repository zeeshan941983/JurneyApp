import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:ibiza/screens/10_add_service/widgets/service_container.dart';
import 'package:provider/provider.dart';

class ServiceType extends StatelessWidget {
  const ServiceType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'Which of these best describe your service?',
          fontSize: 20.sp,
          color: AppColors.col222222,
          fontWeight: FontWeight.w600,
        ),
        Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                    provider.categories.length,
                    (index) => ServicesContainer(
                      icon: provider.categories[index].icon,
                      title: provider.categories[index].name,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
