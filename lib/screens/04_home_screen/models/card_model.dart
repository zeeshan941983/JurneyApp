import 'package:ibiza/core/constants/app_images.dart';

class ActivityModel {
  final String image, place;
  final String? hostedBy;
  final double price;
  final double distance;
  final DateTime date;
  final double? review;
  ActivityModel({
    required this.image,
    required this.place,
    required this.distance,
    required this.date,
    required this.price,
    this.review,
    this.hostedBy,
  });
}

List<ActivityModel> activityModelList = [
  ActivityModel(
    image: AppImages.grass,
    place: 'Sainaj, India',
    hostedBy: 'Hugo',
    distance: 45,
    date: DateTime.now(),
    price: 76,
    review: 3.4,
  ),
  ActivityModel(
    image: AppImages.homeBg,
    place: 'Seuol, Korea',
    distance: 4545,
    date: DateTime.now(),
    hostedBy: 'Hugo',
    price: 736,
    review: 3.0,
  ),
  ActivityModel(
    image: AppImages.grass,
    place: 'kashmair, Pakistan',
    hostedBy: 'Hugo',
    distance: 45,
    date: DateTime.now(),
    price: 233,
    review: 3.0,
  ),
  ActivityModel(
    image: AppImages.grass,
    place: 'Hunza, Pakistan',
    hostedBy: 'Hugo',
    distance: 23,
    date: DateTime.now(),
    price: 2345,
    review: 5.0,
  ),
  ActivityModel(
    image: AppImages.grass,
    place: 'Lake, Pakistan',
    hostedBy: 'Hugo',
    distance: 456,
    date: DateTime.now(),
    price: 236,
    review: 2.0,
  ),
];
