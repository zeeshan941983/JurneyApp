import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';

extension NumExtensions on num {
  SizedBox get ph => SizedBox(height: toDouble().h);
  SizedBox get pw => SizedBox(width: toDouble().w);
}

extension StringExtensions on String {
  EdgeInsets get padding => const EdgeInsets.all(8.0);
}

extension NavigationExtensions on BuildContext {
  void push(Widget page) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushReplacement(Widget page) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushName(String route, {Object? arguments}) {
    Navigator.pushNamed(this, route, arguments: arguments);
  }

  void pushReplacementName(String route, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, route, arguments: arguments);
  }

  void pushAndRemoveAll(String route, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      route,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }
}

extension ColorExtensions on Color {
  Color darken(double factor) {
    return this;
  }
}

extension ListExtensions<T> on List<T> {
  T? safeGet(int index) => (index >= 0 && index < length) ? this[index] : null;
}

extension DateTimeExtensions on DateTime {
  String formattedDate() => "${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-${year.toString()}";
}

extension WidgetExtensions on Widget {
  Widget withPadding({EdgeInsetsGeometry? padding}) => Padding(padding: padding ?? const EdgeInsets.all(8.0), child: this);
}

extension FutureExtensions<T> on Future<T> {
  // ignore: use_function_type_syntax_for_parameters
  Future<T> catchErrorAndPrint(dynamic onError(error)) {
    return catchError((error) {
      log('Error: $error');
      return Future.error(error);
    });
  }
}

DateTime getDateTimeFromWeekDayTime(String dateOfDay, String time) {
  DateTime date = DateTime.parse(dateOfDay);
  DateTime dateTime = DateTime(date.year, date.month, date.day);
  dateTime = dateTime.add(Duration(hours: int.parse(time.substring(0, 2)), minutes: int.parse(time.substring(3, 5))));

  return dateTime;
}
