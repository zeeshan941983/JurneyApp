import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ibiza/core/models/most_popular_post.dart';
import 'package:ibiza/screens/01_splas_screen/splash_screen.dart';
import 'package:ibiza/screens/02_login_screen/login_screen.dart';
import 'package:ibiza/screens/03_sign_up_screen/sign_up_screen.dart';
import 'package:ibiza/screens/04_home_screen/home_screen.dart';
import 'package:ibiza/screens/05_details_screen/details_screen.dart';
import 'package:ibiza/screens/07_account_screen/views/listing_view.dart';
import 'package:ibiza/screens/09_user_details/user_details_screen.dart';
import 'package:ibiza/screens/08_listing_screen/add_listing_screen.dart';
import 'package:ibiza/screens/10_add_service/add_service.dart';
import 'package:ibiza/screens/11_Dashboard_screen/dashboard_screen.dart';

import '../../screens/07_account_screen/account_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';
  static const String homeScreen = '/homeScreen';
  static const String detailsScreen = '/detailsScreen';
  static const String accountScreen = '/accountScreen';
  static const String addListingScreen = '/addListingScreen';
  static const String userDetailsScreen = '/userDetailsScreen';
  static const String addServiceScreen = '/addServiceScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String listingView = '/listingView';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return _buildPageRoute(
          const SplashScreen(),
          settings,
          'Navigate to $SplashScreen()',
        );
      case loginScreen:
        return _buildPageRoute(
          LoginScreen(),
          settings,
          'Navigate to $LoginScreen()',
        );
      case signupScreen:
        return _buildPageRoute(
          SignUpScreen(),
          settings,
          'Navigate to $SignUpScreen()',
        );
      case homeScreen:
        return _buildPageRoute(
          const HomeScreen(),
          settings,
          'Navigate to $HomeScreen()',
        );
      case detailsScreen:
        final DocumentModel documentModel = settings.arguments as DocumentModel;
        return _buildPageRoute(
          DetailsScreen(
            popularSerivce: documentModel,
          ),
          settings,
          'Navigate to $DetailsScreen()',
        );

      case accountScreen:
        return _buildPageRoute(
          const AccountScreen(),
          settings,
          'Navigate to $AccountScreen()',
        );
      case addListingScreen:
        return _buildPageRoute(
          const AddListingScreen(),
          settings,
          'Navigate to $AddListingScreen()',
        );
      case userDetailsScreen:
        return _buildPageRoute(
          const UserDetailsScreen(),
          settings,
          'Navigate to $UserDetailsScreen()',
        );
      case addServiceScreen:
        return _buildPageRoute(
          const AddServiceScreen(),
          settings,
          'Navigate to $AddServiceScreen()',
        );
      case dashboardScreen:
        return _buildPageRoute(
          const DashboardScreen(),
          settings,
          'Navigate to $DashboardScreen()',
        );
      case listingView:
        return _buildPageRoute(
          const ListingView(),
          settings,
          'Navigate to $listingView()',
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page Nor Found'),
            ),
          ),
        );
    }
  }

  static PageRouteBuilder _buildPageRoute(
    Widget page,
    RouteSettings settings,
    String? message,
  ) {
    log(message.toString());
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: CustomRouteSettings(
        name: settings.name,
        arguments: settings.arguments,
        customSetting: message,
      ),
    );
  }
}

class CustomRouteSettings extends RouteSettings {
  final String? customSetting;

  const CustomRouteSettings({
    super.name,
    super.arguments,
    this.customSetting,
  });
}
