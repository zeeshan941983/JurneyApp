import 'dart:io';

import 'package:http/http.dart' as http;

class PreviewService {
  final String title;
  final String address;
  final String category;
  final String subCategory;
  final String peopleCanJoin;
  final String description;
  final String price;
  final String reservationConfirmation;
  final String availabilities;
  final String pricingModel;
  final String amenities;
  final String extraMessage;
  final List<String> conditions;
  final String extras;

  final List<File> images;

  PreviewService({
    required this.extraMessage,
    required this.amenities,
    required this.title,
    required this.address,
    required this.category,
    required this.subCategory,
    required this.peopleCanJoin,
    required this.description,
    required this.price,
    required this.reservationConfirmation,
    required this.availabilities,
    required this.pricingModel,
    required this.conditions,
    required this.extras,
    required this.images,
  });

  Map<String, String> toFields() {
    return {
      'title': title,
      'address': address,
      'category': category,
      'subCategory': subCategory,
      'peopleCanJoin': peopleCanJoin,
      'description': description,
      'price': price,
      'reservation_confirmation': reservationConfirmation,
      'availabilities': availabilities,
      'pricingModel': pricingModel,
      'extras': extras,
      'conditions[]': conditions.join(','),
    };
  }

  Future<List<http.MultipartFile>> getImageFiles() async {
    List<http.MultipartFile> imageFiles = [];
    for (var image in images) {
      imageFiles.add(
        await http.MultipartFile.fromPath(
          'images',
          image.path,
        ),
      );
    }

    return imageFiles;
  }
}
