import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ibiza/core/api/endpoints.dart';
import 'package:ibiza/core/api/requests.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/constants/storage_keys.dart';
import 'package:ibiza/core/models/user_model.dart';
import 'package:ibiza/core/view_model/base_view_model.dart';

class LoginProvider extends BaseViewModel {
  bool _obsecure = false;
  bool get obsecure => _obsecure;
  setVisibilty() {
    _obsecure = !_obsecure;
    notifyListeners();
  }

  String _authtoken = '';
  // String get authtoken => _authtoken;
  // setauthtoken(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _authtoken = token;
  //   prefs.setString(USER_TOKEN, _authtoken);
  //   notifyListeners();
  // }

  // getAuthtoken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _authtoken = prefs.getString(USER_TOKEN) ?? '';
  //   notifyListeners();
  // }

  Future<bool> registerUser(
    BuildContext context, {
    required String email,
    required String password,
    required String username,
  }) async {
    setState(ViewState.busy);
    try {
      final data = await APIRequests.makePostRequest(
        Endpoints.register,
        {
          'Content-Type': 'application/x-www-form-urlencoded',
          'isAppUser': 'true',
        },
        {
          'username': username,
          'email': email,
          'password': password,
        },
        expectedStatus: 201,
      );
      Fluttertoast.showToast(msg: data.body['message']);

      if (!data.error && data.statusCode == 201) {
        _authtoken = data.body['data'];
        // setauthtoken(_authtoken);
        setState(ViewState.idle);
        return true;
      } else {
        log('Failed to Sign Up: ${data.message}');
        setState(ViewState.idle);
        return false;
      }
    } catch (e) {
      log('Failed to Sign Up: $e');
      setState(ViewState.idle);
      return false;
    }
  }

  ///OTP Verification
  bool? _verified;
  bool? get verified => _verified;
  set verified(v) => _verified = v;
  Future<bool> verifyAccount({
    required String otp,
  }) async {
    setState(ViewState.busy);
    try {
      final data = await APIRequests.makePostRequest(
        Endpoints.verifyAcc,
        {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': "Bearer $_authtoken",
        },
        {'token': otp},
        expectedStatus: 200,
      );
      Fluttertoast.showToast(msg: data.body['message']);

      if (!data.error && data.statusCode == 200) {
        _verified = true;
        setState(ViewState.idle);

        return true;
      } else {
        _verified = false;
        log('Failed to Sign Up: ${data.message}');
        setState(ViewState.idle);
        return false;
      }
    } catch (e) {
      log('Failed to Sign Up: $e');
      _verified = false;
      setState(ViewState.idle);
      return false;
    }
  }

  ///Login
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    setState(ViewState.busy);
    try {
      final data = await APIRequests.makePostRequestlogin(
        Endpoints.login,
        {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        {
          'email': email,
          'password': password,
        },
        expectedStatus: 200,
      );

      if (!data.error && data.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(USER_TOKEN, data.body['token']);
        final token = prefs.getString(USER_TOKEN);
        if (token != null) {
          log("TOKEN $token");
          final loggedinUser = await APIRequests.makeGetRequest(
            Endpoints.user,
            {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization': 'Bearer $token',
            },
            {
              'email': email,
              'password': password,
            },
          );
          setState(ViewState.idle);
          log('--------------1-------------');

          log('--------------2-------------');
          log('user: ${loggedinUser.body['user']}');
          log('--------------2.1-------------');
          final userdata = UserModel.fromJson(loggedinUser.body['user']);
          log('--------------3-------------');
          log(userdata.toString());
          log('--------------4-------------');
          prefs.setString(
            USER_PROFILE,
            json.encode(userdata.toJson()),
          );
          log('--------------5-------------');
          return true;
        } else {
          return false;
        }
      } else {
        Fluttertoast.showToast(msg: data.body['message']);
        log('Failed to Sign in: ${data.message}');
        setState(ViewState.idle);
        return false;
      }
    } catch (e) {
      log('Failed to Sign in: $e');
      setState(ViewState.idle);
      return false;
    }
  }

  ///TODO:Setting up the Shared-Prefrences for the AuthTokens
}
