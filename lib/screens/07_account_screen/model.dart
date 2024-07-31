import '../../core/constants/app_images.dart';

class Model {
  String title;
  String description;
  String image;
  Function() ontab;

  Model(
      {required this.title,
      required this.description,
      required this.image,
      required this.ontab});
}

List<Model> cardList = [
  Model(
      title: "Personal Info",
      description: "Provide personal details and how we can reach you",
      image: AppImages.profile,
      ontab: () {}),
       Model(
      title: "Login & security",
      description: "Update your password and secure your accoun",
      image: AppImages.cards,
      ontab: () {}),
  Model(
      title: "Payment and Payout",
      description: "Review payments,payouts",
      image: AppImages.security,
      ontab: () {}),
  Model(
      title: "Notifications",
      description: "Choose how you want to be contacted",
      image: AppImages.notification,
      ontab: () {}),
 
];
