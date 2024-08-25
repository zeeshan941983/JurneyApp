import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/models/aminities.dart';

import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';

import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:ibiza/screens/10_add_service/widgets/service_container.dart';
import 'package:provider/provider.dart';

class ServiceOffers extends StatelessWidget {
  const ServiceOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Tell guests what your service has to offer?',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          5.h.ph,
          AppText(
            text:
                'Your address is only shared with guest after they’ve made a reservation',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          Consumer<ServiceProvider>(
            builder: (context, provider, child) => FutureBuilder<List<Amenity>>(
              future: provider.getAmenities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    provider.getAmenitiesinities.isEmpty) {
                  return const CustomLoader();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final services = snapshot.data;
                  return Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                      services?.length ?? 0,
                      (index) => GestureDetector(
                        onTap: () {
                          provider.setguesServiceAmenity(
                              services?[index].name ?? 'Windy',
                              services?[index].iconURL ?? AppImages.wind,
                              services?[index].id ?? "1");
                        },
                        child: ServicesContainer(
                          icon: services?[index].iconURL ?? AppImages.wind,
                          title: services?[index].name ?? 'Windy',
                          isSelected: provider.selections['Amenity']?.any(
                                (condition) =>
                                    condition.name == services?[index].name,
                              ) ??
                              false,
                        ),
                      ),
                    ),
                  );
                } else {
                  final services = provider.getAmenitiesinities;
                  return Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                      services.length,
                      (index) => GestureDetector(
                        onTap: () {
                          provider.setguesServiceAmenity(services[index].name,
                              services[index].iconURL, services[index].id);
                        },
                        child: ServicesContainer(
                          icon: services[index].iconURL,
                          title: services[index].name,
                          isSelected: provider.selections['Amenity']?.any(
                                (condition) =>
                                    condition.name == services[index].name,
                              ) ??
                              false,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
