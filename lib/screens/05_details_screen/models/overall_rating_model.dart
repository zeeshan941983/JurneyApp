import 'package:ibiza/core/constants/app_images.dart';

class OverAllRatingModel {
  String rating, name, image;
  OverAllRatingModel({
    required this.rating,
    required this.name,
    required this.image,
  });
}

List<OverAllRatingModel> listOfOverAllratingModel = [
  OverAllRatingModel(rating: '5.0', name: 'Cleanliness', image: AppImages.cleanliness),
  OverAllRatingModel(rating: '5.0', name: 'Accuracy', image: AppImages.check),
  OverAllRatingModel(rating: '5.0', name: 'Check-in', image: AppImages.key),
  OverAllRatingModel(rating: '5.0', name: 'Communication', image: AppImages.msg),
  OverAllRatingModel(rating: '5.0', name: 'Communication', image: AppImages.location),
  OverAllRatingModel(rating: '5.0', name: 'value', image: AppImages.bookmark),
];
