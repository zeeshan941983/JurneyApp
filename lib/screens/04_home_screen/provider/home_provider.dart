import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibiza/core/api/endpoints.dart';
import 'package:ibiza/core/api/requests.dart';
import 'package:ibiza/core/api/response_model.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/constants/enums.dart';
import 'package:ibiza/core/constants/storage_keys.dart';
import 'package:ibiza/core/models/add_activity_model.dart';
import 'package:ibiza/core/models/calender_model.dart';
import 'package:ibiza/core/models/most_popular_post.dart';
import 'package:ibiza/core/view_model/base_view_model.dart';
import 'package:ibiza/core/widgets/show_add_app_dialouge.dart';
import 'package:ibiza/screens/04_home_screen/models/card_model.dart';
import 'package:ibiza/screens/04_home_screen/models/sites_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeProvider extends BaseViewModel {
  ///------------Section 1 Provider----------------
  HomeProvider() {
    getCategories();
    getCalenders();
    getPopularService();
  }
  final TextEditingController searchController = TextEditingController();
  List<Categories> _categories = [];

  late List<DocumentModel> _filteredDocuments = popularServiceModel.documents;

  List<DocumentModel> get filteredDocuments => _filteredDocuments;
//filteredDocuments popular services
  void filterDocuments(String query) {
    if (query.isEmpty) {
      _filteredDocuments = popularServiceModel.documents.toList();
    } else {
      _filteredDocuments = popularServiceModel.documents
          .where((doc) => doc.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  clearcontroller() {
    searchController.clear();
    searchController.text = '';
    filterDocuments('');
    notifyListeners();
  }

  List<Categories> get categories => _categories;
  set categories(List<Categories> cat) {
    _categories = cat;
    notifyListeners();
  }

  getCategories() async {
    try {
      final response =
          await APIRequests.makeGetRequest(Endpoints.categories, {}, {});

      if (response.error) {
        log('Error fetching categories: ${response.message}');
        await Future.delayed(const Duration(seconds: 2));
        getCategories();
        return;
      }

      categories = (response.body as List).map((c) {
        return Categories.fromJSON(c);
      }).toList();

      notifyListeners();
    } catch (e) {
      log('Exception occurred: $e');
      await Future.delayed(const Duration(seconds: 2));
      getCategories();
    }
  }

  ///
  ///------------Section 3 Provider----------------

  int get selectedDays => _selectedDayIndices.length;
  final Set<int> _selectedDayIndices = {};
  Set<int> get selectedDayIndices => _selectedDayIndices;

  void toggleDaySelection(int index) {
    if (_selectedDayIndices.contains(index)) {
      _selectedDayIndices.remove(index);
    } else {
      _selectedDayIndices.add(index);
    }
    notifyListeners();
  }

  DataSource events = DataSource([]);
  List<Appointment> _listOfUserAppointments = [];
  void onCalendarTapped(CalendarTapDetails details, BuildContext context) {
    if (details.targetElement == CalendarElement.calendarCell) {
      showAddAppointmentDialog(details.date!, context);
    }
  }

  DateTime date = DateTime.now();

  Future<void> getCalenders() async {
    final prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString('GUEST_COOKIE');
    ResponseModel response = ResponseModel.empty();
    if (cookie != null) {
      response = await APIRequests.makeGetRequest(Endpoints.getCalender, {
        'Cookie': cookie,
      }, {});
    } else {
      response =
          await APIRequests.makeGetRequest(Endpoints.getCalender, {}, {});
      prefs.setString(
          'GUEST_COOKIE', response.header['set-cookie']?.split(';').first);
      getCalenders();
    }
    if (response.error) {
      Fluttertoast.showToast(msg: response.message.toString());
      return;
    }
    final data = response.body['data'];
    if (data != null) {
      final calenders = CalenderModel.fromJson(convertStringToJson(data));
      _listOfUserAppointments = getAppointments(calenders);
      log(_listOfUserAppointments.length.toString());
      setUserAppointments();
      notifyListeners();
    }
  }

  List<Appointment> getAppointments(CalenderModel calendar) {
    List<Appointment> appointment = [];
    for (var week in calendar.weeks) {
      for (var day in week.days) {
        for (var time in day.timeSlots) {
          final startTime = getDateTimeFromWeekDayTime(
            day.date,
            time.start,
          );
          final endTime = getDateTimeFromWeekDayTime(
            day.date,
            time.end,
          );
          appointment.add(Appointment(
            id: time.activity.id,
            subject: time.activity.title,
            location: time.activity.address.description,
            startTime: startTime,
            endTime: endTime,
            color: getRandomColorWithOpacity(0.6),
          ));
          notifyListeners();
        }
      }
    }
    return appointment;
  }

  setUserAppointments() {
    events.notifyListeners(
        CalendarDataSourceAction.add, _listOfUserAppointments);
    notifyListeners();
  }

  setAppointment(Appointment newAppointment) {
    events.appointments?.add(newAppointment);
    events.notifyListeners(CalendarDataSourceAction.add, [newAppointment]);
    notifyListeners();
  }

  ///==============Section 4 ===================
  bool showCustomDate = false;

  showDate() {
    showCustomDate = !showCustomDate;
    notifyListeners();
  }

  ///==============Search Filters====================
  List<ActivityModel> _filteredActivities = activityModelList;
  List<ActivityModel> get filteredCards => _filteredActivities;

  void filterCards(String query) {
    if (query.isEmpty) {
      _filteredActivities = activityModelList;
    } else {
      _filteredActivities = activityModelList
          .where(
              (card) => card.place.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  ///===============Add new Activity=====================
  ActivityModel? _activityData;
  ActivityModel? get activityData => _activityData;
  addActivity(ActivityModel activity) {
    _activityData = activity;
    notifyListeners();
  }

/////========add popular activity=======
  DocumentModel? _popularModel;
  DocumentModel? get populardata => _popularModel;
  addpopular(DocumentModel popular) {
    _popularModel = popular;
    notifyListeners();
  }

  clearPopularData() {
    _popularModel = null;

    notifyListeners();
  }

  ///--------------getActivtityToCalendaar-----
  void getActivityToCalendar(WeekActivity weekActivity) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(USER_TOKEN);
    try {
      final response = await APIRequests.makePostRequest(
          Endpoints.getCalender,
          {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          weekActivity.toJson());

      if (!response.error) {
        print('Success: ${response.body}');
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  ///
  changeState({Function? fun}) {
    fun;
    notifyListeners;
  }

  Duration _duration = const Duration(hours: 1);
  Duration get duration => _duration;
  void setDuration(Duration newDuration) {
    _duration = newDuration;
    notifyListeners();
  }

  ///GET POPULAR SERVICE
  late PopularModel _popularServiceModel;
  PopularModel get popularServiceModel => _popularServiceModel;
  final List<double> _distanceBetween = [];
  List<double> get distanceBetween => _distanceBetween;

  getPopularService() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(USER_TOKEN);
    log("TOKEN $token");
    final popularService = await APIRequests.makeGetRequest(
      Endpoints.popularService,
      {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token',
      },
      {},
    );
    setState(ViewState.idle);
    log('--------------1-------------');
    log('popularService: ${popularService.body}');
    log('--------------2.1-------------');
    final Map<String, dynamic> jsonData = jsonDecode(popularService.body);
    _popularServiceModel = PopularModel.fromJson(jsonData);
    List<double> latList = [];
    List<double> lngList = [];
    log("before loop");
    for (int i = 0; i < popularServiceModel.documents.length; i++) {
      log("inside loop");
      Map<String, dynamic> addressMap =
          jsonDecode(popularServiceModel.documents[i].address);
      double lat = double.parse(addressMap['lat'].toString());
      double lng = double.parse(addressMap['lng'].toString());
      lngList.add(lng);
      latList.add(lat);
      final distance = Geolocator.distanceBetween(
          33.98052, 71.54901, latList[i], lngList[i]);
      double lastvalue = distance / 1000;
      _distanceBetween.add(double.parse(lastvalue.toStringAsFixed(2)));
      print('Distance to point $i: ${distance / 1000} km');
      print('Distance to point $i: ${distanceBetween.length} km');
    }
    log('--------------3-------------');
    log("DoucmentData ${popularServiceModel.documents}");
    log('--------------4-------------');
  }

  ///DELETE USER ACCOUNT
  deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(USER_TOKEN);
    if (token != null) {
      log("TOKEN $token");
      final res = await APIRequests.makeDeleteRequest(
          Endpoints.user, {}, {'token': token});
      log(res.body.toString());
      prefs.clear();
      if (!res.error) {}
    }
  }

  ///LOGOUT the User
  Future<bool> logoutUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(USER_TOKEN);
      if (token != null && token.isNotEmpty) {
        final data = await APIRequests.makeGetRequest(
            Endpoints.logout, {'Authorization': token}, {});
        log(data.toString());
        if (data.error) {
          // logoutUser();
          return false;
        }

        Fluttertoast.showToast(msg: data.body['message']);
        prefs.clear();
        return true;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to Logout user $e');
      return false;
    }
    return false;
  }

////==========genral providers==========///
  ///getDateTimeFromWeekDayTime
  String getStartOfWeek(DateTime date) {
    int daysToSubtract = date.weekday % 7;
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    return formatter.format(date.subtract(Duration(days: daysToSubtract)));
  }

////getDateFrom eg 2024-05-29
  String setdateformate(DateTime date) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

////getTimeFrom 12:00
  String setTimeForm(DateTime date) {
    DateFormat sDateFormate = DateFormat('hh:mm');
    return sDateFormate.format(date);
  }
  ////getdaysFrom

  String setDaysFromDate(DateTime date) {
    String formate = DateFormat('EEEE').format(date);
    return formate;
  }

  ///

  ///
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> appointments) {
    this.appointments = appointments;
  }
}
