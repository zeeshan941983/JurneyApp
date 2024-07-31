import 'package:ibiza/core/constants/constants.dart';

class ServicesOffers {
  String imageIcon, service;
  bool available;
  ServicesOffers({
    required this.imageIcon,
    required this.service,
    required this.available,
  });
}

List<ServicesOffers> listOfservicesOffers = [
  ServicesOffers(
    imageIcon: AppImages.checkin,
    service: 'Garden view',
    available: true,
  ),
  ServicesOffers(
    imageIcon: AppImages.petFoot,
    service: 'Wifi - 21 Mbps',
    available: false,
  ),
  ServicesOffers(
    imageIcon: AppImages.note,
    service: 'Free Wasger - in building',
    available: true,
  ),
  ServicesOffers(
    imageIcon: AppImages.boat,
    service: 'Pet Allowed',
    available: false,
  ),
  ServicesOffers(
    imageIcon: AppImages.calender,
    service: 'Shared patio or balcony',
    available: true,
  ),
  ServicesOffers(
    imageIcon: AppImages.clock,
    service: 'Smoke Alarm',
    available: false,
  ),
  ServicesOffers(
    imageIcon: AppImages.checkin,
    service: 'Garden view',
    available: true,
  ),
  ServicesOffers(
    imageIcon: AppImages.petFoot,
    service: 'Wifi - 21 Mbps',
    available: false,
  ),
  ServicesOffers(
    imageIcon: AppImages.note,
    service: 'Free Wasger - in building',
    available: true,
  ),
  ServicesOffers(
    imageIcon: AppImages.boat,
    service: 'Pet Allowed',
    available: false,
  ),
  ServicesOffers(
    imageIcon: AppImages.calender,
    service: 'Shared patio or balcony',
    available: true,
  ),
  ServicesOffers(
    imageIcon: AppImages.clock,
    service: 'Smoke Alarm',
    available: false,
  ),
];
