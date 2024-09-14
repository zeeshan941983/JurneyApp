import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ibiza/core/api/endpoints.dart';
import 'package:ibiza/core/api/requests.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/constants/storage_keys.dart';
import 'package:ibiza/core/models/user_model.dart';
import 'package:ibiza/core/view_model/base_view_model.dart';
import 'package:ibiza/screens/07_account_screen/views/account_view.dart';
import 'package:ibiza/screens/07_account_screen/views/listing_view.dart';
import 'package:ibiza/screens/07_account_screen/views/personal_info_view.dart';
import 'package:ibiza/screens/07_account_screen/views/security_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountProvider extends BaseViewModel {
  AccountProvider() {
    getUserData();
  }
  final List<Widget> pages = const [
    AccountView(),
    PersonalInfoView(),
    SecurityView(),
    // ListingView(),
  ];

  int _selectedPage = 0;
  int get selectedPage => _selectedPage;

  onCardClicked(int index) {
    _selectedPage = index;
    notifyListeners();
  }

  UserModel _userModel = UserModel.empty();
  UserModel get userModel => _userModel;

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString(USER_PROFILE);
    if (userDataString != null) {
      final userDataMap = json.decode(userDataString) as Map<String, dynamic>;
      _userModel = UserModel.fromJson(userDataMap);
    }
    notifyListeners();
  }

  Future<File?> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        await updateAvatar(File(image.path));
      }
    } catch (e) {
      log('Error picking image: $e');
    }
    return null;
  }

  ///Update Profile Avatar
  updateAvatar(File image) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(USER_TOKEN);
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.MultipartRequest('POST', Uri.parse(Endpoints.changeAvatar));
    request.files.add(await http.MultipartFile.fromPath('avatar', image.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log(await response.stream.bytesToString());
    } else {
      log(response.reasonPhrase.toString());
    }
  }

  ///UPDate USer name
  updateUserName(String userName) async {
    setState(ViewState.busy);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(USER_TOKEN);
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token'
    };
    final body = {'username': userName};

    final data =
        await APIRequests.makePostRequest(Endpoints.changeUser, headers, body);
    setState(ViewState.busy);
  }
}
