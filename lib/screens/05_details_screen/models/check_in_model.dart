import 'package:ibiza/core/constants/constants.dart';

class CheckInModel {
  String imageIcon, title, subtitle;
  CheckInModel({
    required this.imageIcon,
    required this.title,
    required this.subtitle,
  });
}

List<CheckInModel> listOfCheckin = [
  CheckInModel(
    imageIcon: AppImages.petFoot,
    title: 'Furry friends welcome',
    subtitle: 'Bring your pets along for the stay.',
  ),
  CheckInModel(
    imageIcon: AppImages.checkin,
    title: 'Self check-in',
    subtitle: 'Check yourself in with the lockbox.',
  ),
  CheckInModel(
    imageIcon: AppImages.note,
    title: 'Free cancellation before May 7',
    subtitle: 'Get a full refund if you change your mind.',
  ),
];
