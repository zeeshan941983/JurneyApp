import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:ibiza/screens/10_add_service/views/service_location.dart';
import 'package:ibiza/screens/10_add_service/views/service_people_count.dart';
import 'package:ibiza/screens/10_add_service/widgets/common_reservation_container.dart';
import 'package:ibiza/screens/10_add_service/widgets/discription_textfield.dart';
import 'package:ibiza/screens/10_add_service/widgets/service_container.dart';
import 'package:provider/provider.dart';

class FullPreviewPage extends StatefulWidget {
  const FullPreviewPage({super.key});

  @override
  State<FullPreviewPage> createState() => _FullPreviewPageState();
}

class _FullPreviewPageState extends State<FullPreviewPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ServiceProvider>().selectPriceSection();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Full preview',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.h.ph,
              Wrap(
                children: [
                  ...value.images.asMap().entries.map((entry) {
                    final index = entry.key;
                    final image = entry.value;
                    final imageWidth = index == 0 ? 350.0 : 160.0;

                    return Container(
                      height: 160.0,
                      width: imageWidth,
                      margin: EdgeInsets.all(5.dg),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.0, color: AppColors.colD6D6D6),
                        borderRadius: BorderRadius.circular(24.0),
                        image: DecorationImage(
                          image: FileImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              10.h.ph,
              const AppText(
                text: "Main title goes here",
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              5.h.ph,
              const AppText(
                text:
                    'Lorem ipsum dolor sit amet consectetur Dui mollis sed id leo maana Est pulla praesent aliquam vitae genean tincidunt sed et laoreet Leo enim quis phasellus lectus pretium',
                fontSize: 16.0,
                color: Colors.grey,
              ),
              10.h.ph,
              const Divider(),
              10.h.ph,
              // Type of reservation section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: 'Type of reservation',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  10.h.ph,
                  if (value.selections.containsKey('reservation') &&
                      value.selections['reservation'] != null &&
                      value.selections['reservation']!.reservationNo == 1)
                    const CommonReservationContainer(
                      title: "Use instant book",
                      icon: "assets/svg/light.svg",
                      subtitle: "Guests can book automatically.",
                    ),
                  if (value.selections.containsKey('reservation') &&
                      value.selections['reservation'] != null &&
                      value.selections['reservation']!.reservationNo == 2)
                    const CommonReservationContainer(
                      title: "Approve or decline requests",
                      icon: "assets/svg/requestMsg.svg",
                      subtitle: "Guests must ask if they can book.",
                    ),
                  10.h.ph,
                  const Text(
                    'Guests can book automatically.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              10.h.ph,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Type of service',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.h.ph,
                  ServicesContainer(
                    isPreview: true,
                    icon: value.selections["serviceData"]?.iconofServiceName ??
                        '',
                    title: value.selections["serviceData"]?.serviceName ??
                        'Unknown Service',
                    subtitle:
                        value.selections["serviceData"]?.selectedOption ?? '',
                  ),
                  // Text(value.selections["serviceData"]?.pricemodel),
                  10.h.ph,
                  const Divider(),
                  10.h.ph,
                  // Amenities section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Amenities',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      8.h.ph,
                      Row(
                        children: [
                          ServicesContainer(
                            icon: value.selections['Amenity']?[0].iconURL ??
                                AppImages.wind,
                            title:
                                value.selections['Amenity']?[0].name ?? 'Windy',
                          ),
                          ServicesContainer(
                            icon: value.selections['Amenity']?[1].iconURL ??
                                AppImages.wind,
                            title:
                                value.selections['Amenity']?[1].name ?? 'Windy',
                          ),
                        ],
                      ),
                      15.h.ph,
                      const Divider(),
                      15.h.ph,
                      const Text(
                        'Condition',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      8.h.ph,
                      Row(
                        children: [
                          ServicesContainer(
                            icon: value.selections['conditions']?[0].icon ??
                                AppImages.wind,
                            title:
                                value.selections['conditions']?[0].conditions ??
                                    'Windy',
                          ),
                          ServicesContainer(
                            icon: value.selections['conditions']?[1].icon ??
                                AppImages.wind,
                            title:
                                value.selections['conditions']?[1].conditions ??
                                    'Windy',
                          ),
                        ],
                      ),
                      8.h.ph,
                      const Divider(),
                      15.h.ph,
                      AppText(
                        text: 'Minimum Number of People',
                        fontSize: 16.sp,
                        color: AppColors.col222222,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        text: 'Set the minimum number of people',
                        fontSize: 14.sp,
                        color: AppColors.col6A6A6A,
                        fontWeight: FontWeight.w400,
                      ),
                      5.h.ph,
                      CounterWidget(
                        controller: TextEditingController(
                            text: value.minnumberOfPeople.toString()),
                      ),
                      8.h.ph,
                      AppText(
                        text: 'Maximum Number of People',
                        fontSize: 16.sp,
                        color: AppColors.col222222,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        text: 'Set the maximum number of people',
                        fontSize: 14.sp,
                        color: AppColors.col6A6A6A,
                        fontWeight: FontWeight.w400,
                      ),
                      5.h.ph,
                      CounterWidget(
                        controller: TextEditingController(
                            text: value.maxnumberOfPeople.toString()),
                      ),
                      8.h.ph,
                      const Divider(),
                      8.h.ph,
                      const ServiceLocation(),
                      //********set your price section */
                      8.h.ph,
                      const Divider(),
                      8.h.ph,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Now set your price',
                            fontSize: 20.sp,
                            color: AppColors.col222222,
                            fontWeight: FontWeight.w600,
                          ),
                          10.h.ph,
                          AppText(
                            text: 'You can change it anytime',
                            fontSize: 14.sp,
                            color: AppColors.col6A6A6A,
                            fontWeight: FontWeight.w400,
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: value.radioValue,
                                onChanged: (newValue) {},
                              ),
                              const AppText(
                                text: "Per hour",
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              Radio(
                                value: 2,
                                groupValue: value.radioValue,
                                onChanged: (newValue) {},
                              ),
                              const AppText(
                                text: "Per activity",
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              Radio(
                                value: 3,
                                groupValue: value.radioValue,
                                onChanged: (newValue) {},
                              ),
                              const AppText(
                                text: "Per day",
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          5.h.ph,
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    text:
                                        "\$${value.selections['priceSection']?.basePrice ?? '00'}",
                                    color: Colors.black,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const AppText(
                                    text: "/hour",
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: SvgPicture.asset("assets/svg/edit.svg"),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          5.h.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: value.selections['priceSection']
                                        ?.isExtraServicesFeeSelected ??
                                    false,
                                onChanged: (newValue) {},
                              ),
                              const AppText(
                                text: "Add extra services fee",
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          5.h.ph,
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    text:
                                        "\$${value.selections['priceSection']?.basePrice ?? '00'}",
                                    color: Colors.black,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  AppText(
                                    text: "/hour",
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 20.w,
                                child: IconButton(
                                  icon: SvgPicture.asset("assets/svg/edit.svg"),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          20.h.ph,
                          Container(
                            height: 170.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              border:
                                  Border.all(width: 1.w, color: Colors.grey),
                            ),
                            child: DiscriptionTextfield(
                              controller: value.extraController,
                              max: int.parse(value.selections['priceSection']
                                      ?.maxDescriptionLength
                                      ?.toString() ??
                                  '0'),
                              hintText:
                                  "If you want to avail this service you might need to pay some extra",
                            ),
                          ),
                          5.h.ph,
                          Text('${value.count}/${value.max}'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
