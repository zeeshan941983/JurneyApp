import 'package:ibiza/core/constants/constants.dart';

class ConditionsModel {
  String icon;
  String title;
  ConditionsModel({
    required this.icon,
    required this.title,
  });
}

List<ConditionsModel> conditions = [
  ConditionsModel(icon: AppImages.wind, title: 'Windy'),
  ConditionsModel(icon: AppImages.notWindy, title: 'Not Windy'),
  ConditionsModel(icon: AppImages.rain, title: 'Rainy'),
  ConditionsModel(icon: AppImages.cloud, title: 'Cloudy'),
];
