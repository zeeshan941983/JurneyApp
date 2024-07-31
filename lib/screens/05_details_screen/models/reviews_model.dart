import 'package:ibiza/core/constants/app_images.dart';

class ReviewModel {
  String name, image, duration, review;
  double stars;
  DateTime date;
  ReviewModel({
    required this.name,
    required this.image,
    required this.duration,
    required this.review,
    required this.stars,
    required this.date,
  });
}

List<ReviewModel> reviews = [
  ReviewModel(
    name: 'Sawako',
    image: AppImages.homeBg,
    duration: 'one night',
    review: 'It was really nice place. I enjoyed peaceful nature and delicious dishes. They told me kindly so I was able to relax. Also the cat is cute:)',
    stars: 4.5,
    date: DateTime(2023, 12),
  ),
  ReviewModel(
    name: 'Sawako',
    image: AppImages.homeBg,
    duration: 'one night',
    review: 'It was really nice place. I enjoyed peaceful nature and delicious dishes. They told me kindly so I was able to relax. Also the cat is cute:)',
    stars: 4.5,
    date: DateTime(2023, 12),
  ),
  ReviewModel(
    name: 'Sawako',
    image: AppImages.homeBg,
    duration: 'one night',
    review: 'It was really nice place. I enjoyed peaceful nature and delicious dishes. They told me kindly so I was able to relax. Also the cat is cute:)',
    stars: 4.5,
    date: DateTime(2023, 12),
  ),
];
