import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/04_home_screen/models/sites_model.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:ibiza/screens/10_add_service/widgets/service_container.dart';
import 'package:provider/provider.dart';

class ServiceCondition extends StatelessWidget {
  const ServiceCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'Decide the conditions for this activity',
          fontSize: 20.sp,
          color: AppColors.col222222,
          fontWeight: FontWeight.w600,
        ),
        5.h.ph,
        AppText(
          text: 'Select those condition which are suitable for this activity',
          fontSize: 14.sp,
          color: AppColors.col6A6A6A,
          fontWeight: FontWeight.w400,
        ),
        Consumer<ServiceProvider>(
          builder: (context, provider, child) => FutureBuilder<List<Categories>>(
            future: provider.getConditions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting && provider.serviceCondition.isEmpty) {
                return const CustomLoader();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final conditions = snapshot.data;
                return Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                    conditions?.length ?? 0,
                    (index) => ServicesContainer(
                      icon: conditions?[index].icon ?? AppImages.wind,
                      title: conditions?[index].name ?? 'Windy',
                    ),
                  ),
                );
              } else {
                final conditions = provider.serviceCondition;
                return Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                    conditions.length,
                    (index) => ServicesContainer(
                      icon: conditions[index].icon,
                      title: conditions[index].name,
                    ),
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
