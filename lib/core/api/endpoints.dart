class Endpoints {
  static const String url = "https://www.ibizajourney.com/api";
  static const String user = "$url/user";
  static const String categories = "$url/categories";
  static const String popularService = "$url/services/popular";
  static const String subcategories = "$categories/SubCategories";
  static String catSubCtegories(v) => "$categories/$v/sub-categories";
  static const String addActivityToCallender = "$url/calender";
  //Registeration
  static const String register = "$user/register";
  static const String login = "$user/login";
  static const String logout = "$user/logout";
  static const String changePswd = "$user/change-password";
  static const String verifyAcc = "$user/verify-account";
  static const String changeAvatar = "$user/change-avatar";
  static const String changePhone = "$user/change-phone";
  static const String changeUser = "$user/change-username";
  static const String changeAddress = "$user/change-address";

  static const String getCalender = "$url/calender";
  static const String getserviceConditions = "$url/conditions";
  static const String getserviceOffers = "$url/amenities";
}
