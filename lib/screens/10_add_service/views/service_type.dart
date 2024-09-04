import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:ibiza/screens/10_add_service/widgets/bubble_message.dart';
import 'package:ibiza/screens/10_add_service/widgets/service_container.dart';
import 'package:provider/provider.dart';

class ServiceType extends StatefulWidget {
  const ServiceType({super.key});

  @override
  State<ServiceType> createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  int? expandedIndex;

  double data(int index) {
    switch (index) {
      case 0:
        return 80.0;
      case 1:
        return 80.0;
      case 2:
        return 170.0;
      case 3:
        return 170.0;
      case 4:
        return 260.0;
      case 5:
        return 260.0;
      case 6:
        return 350.0;
      case 7:
        return 350.0;
      case 8:
        return 440.0;
      case 9:
        return 440.0;
      case 10:
        return 560.0;
      case 11:
        return 560.0;
      default:
        return 100.0;
    }
  }

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
        Consumer2<HomeProvider, ServiceProvider>(
          builder: (context, provider, serviceOptionsProvider, child) {
            return Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                        serviceOptionsProvider.serviceOffers.length,
                        (index) {
                          final isExpanded = expandedIndex == index;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : index;
                                    log(serviceOptionsProvider
                                        .serviceOffers[index].priceModel[0].id);
                                    if (!isExpanded) {
                                      serviceOptionsProvider.selectOption(
                                          '',
                                          serviceOptionsProvider
                                              .serviceOffers[index].name,
                                          serviceOptionsProvider
                                              .serviceOffers[index].iconURL,
                                          serviceOptionsProvider
                                              .serviceOffers[index]
                                              .priceModel[0]
                                              .id);
                                    }
                                  });
                                },
                                child: ServicesContainer(
                                  icon: provider.categories[index].icon,
                                  title: provider.categories[index].name,
                                ),
                              ),
                              if (isExpanded) const SizedBox(height: 100),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: List.generate(
                          serviceOptionsProvider.serviceOffers.length,
                          (index) {
                            final isExpanded = expandedIndex == index;

                            return isExpanded
                                ? Padding(
                                    padding: EdgeInsets.only(top: data(index)),
                                    child: BubbleMessage(
                                      subCategories: serviceOptionsProvider
                                          .serviceOffers[index].subCategories,
                                      istrue: index % 2 == 0,
                                      selectedOption: serviceOptionsProvider
                                          .selections['serviceData']
                                          ?.selectedOption,
                                      onOptionSelected: (option) {
                                        serviceOptionsProvider.selectOption(
                                            option,
                                            serviceOptionsProvider
                                                .serviceOffers[index].name,
                                            serviceOptionsProvider
                                                .serviceOffers[index].iconURL,
                                            serviceOptionsProvider
                                                .serviceOffers[index]
                                                .priceModel[0]
                                                .id);
                                      },
                                    ),
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
