import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibiza/core/api/endpoints.dart';
import 'package:ibiza/core/api/requests.dart';

import 'package:ibiza/core/constants/storage_keys.dart';

import 'package:ibiza/core/models/aminities.dart';
import 'package:ibiza/core/models/category_model.dart';
import 'package:ibiza/core/models/preview_model.dart';
import 'package:ibiza/core/view_model/base_view_model.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/main.dart';
import 'package:ibiza/screens/04_home_screen/home_screen.dart';
import 'package:ibiza/screens/04_home_screen/models/sites_model.dart';
import 'package:ibiza/screens/10_add_service/widgets/addService_Dialog.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ServiceProvider extends BaseViewModel {
  ///Initialize And Get Important Things
  ServiceProvider() {
    getConditions();
    getServicesOffers();
  }
  ///////////********Contollers ********** */
  ///
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController extraController = TextEditingController();
  TextEditingController reservationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController appartmentController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();

  ///
  bool _addService = false;
  bool get addService => _addService;
  set addService(value) {
    _addService = value;
    notifyListeners();
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int p) {
    _currentPage = p;
    notifyListeners();
  }

  ///Minumum Number of people
  int _minNumberOfPeople = 1;
  int get minnumberOfPeople => _minNumberOfPeople;
  final minController = TextEditingController(text: '1');
  set minnumberOfPeople(int v) {
    _minNumberOfPeople = v;
    notifyListeners();
  }

  mindecrment() {
    if (_minNumberOfPeople > 1) {
      _minNumberOfPeople--;
      minController.text = _minNumberOfPeople.toString();
    }
    notifyListeners();
  }

  minincrment() {
    if (_minNumberOfPeople < _maxNumberOfPeople) {
      selectPeople();
      _minNumberOfPeople++;
      minController.text = _minNumberOfPeople.toString();
    }
    notifyListeners();
  }

  ///Maximm Number of people
  int _maxNumberOfPeople = 1;
  int get maxnumberOfPeople => _maxNumberOfPeople;
  final maxController = TextEditingController(text: '1');
  set maxnumberOfPeople(int v) {
    _maxNumberOfPeople = v;
    notifyListeners();
  }

  maxdecrment() {
    if (_maxNumberOfPeople > _minNumberOfPeople) {
      _maxNumberOfPeople--;
      selectPeople();
      maxController.text = _maxNumberOfPeople.toString();
    }
    notifyListeners();
  }

  maxincrment() {
    _maxNumberOfPeople++;
    selectPeople();
    maxController.text = _maxNumberOfPeople.toString();
    notifyListeners();
  }

  ///Service Conditions
  List<Categories> _serviceCondition = [];
  List<Categories> get serviceCondition => _serviceCondition;
  set serviceCondition(List<Categories> serviceConditions) {
    _serviceCondition = serviceConditions;
    notifyListeners();
  }

  Future<List<Categories>>? getConditions() async {
    try {
      final response = await APIRequests.makeGetRequest(
          Endpoints.getserviceConditions, {}, {});

      if (response.error) {
        log('Error fetching Conditions: ${response.message}');
        await Future.delayed(const Duration(seconds: 2));
        getConditions();
        return [];
      }

      serviceCondition = (response.body as List).map((c) {
        return Categories.fromJSON(c);
      }).toList();
      notifyListeners();
      return serviceCondition;
    } catch (e) {
      log('Exception occurred: $e');
      await Future.delayed(const Duration(seconds: 2));
      getConditions();
      return [];
    }
  }

  ///Amenties/Services Offers
  List<CategoryModel> _serviceOffers = [];
  List<CategoryModel> get serviceOffers => _serviceOffers;
  set serviceOffers(List<CategoryModel> serOffers) {
    _serviceOffers = serOffers;
    notifyListeners();
  }

  Future<List<CategoryModel>> getServicesOffers() async {
    try {
      final response = await APIRequests.makeGetRequest(
          Endpoints.activityCategories, {}, {});

      if (response.error) {
        log('Error fetching Offers: ${response.message}');
        await Future.delayed(const Duration(seconds: 2));
        return [];
      }

      List<Map<String, dynamic>> responseBody =
          response.body.cast<Map<String, dynamic>>();
      serviceOffers = responseBody.map((c) {
        return CategoryModel.fromJson(c);
      }).toList();

      // log("here is final data ${serviceOffers.length} ${serviceOffers[0].name}");
      for (var offer in serviceOffers) {
        log(" Data :${offer.name}");
      }
      log(" length: ${serviceOffers.length}");
      notifyListeners();
      return serviceOffers;
    } catch (e) {
      log('Exception occurred: $e');
      await Future.delayed(const Duration(seconds: 2));
      return [];
    }
  }

  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  List<File> get images => _images;

  Future<void> pickImages() async {
    final pickedFiles = await _picker.pickMultiImage(limit: 5);

    if (_images.length + pickedFiles.length <= 5) {
      for (var pickedFile in pickedFiles) {
        _images.add(File(pickedFile.path));
      }
    } else {
      print('Cannot select more than 5 images.');
    }
    notifyListeners();
  }

////***********Services**********/////
  ///
  String avalibilities = '';
  void getavalibitlities(String avalibility) {
    avalibilities = avalibility;
    notifyListeners();
  }

  void clearall() {
    _selections.clear();
    _images.clear();
    titleController.clear();
    discriptionController.clear();
    addressController.clear();
    priceController.clear();
    extraController.clear();
    _currentPage = 0;
    maxController.clear();
    _address = '';
    countryController.clear();
    streetController.clear();
    appartmentController.clear();
    cityController.clear();
    stateController.clear();
    zipcodeController.clear();

    notifyListeners();
  }

  List<dynamic> _services = [];
  List<dynamic> get services => _services;

  Future<Map<String, dynamic>> setServices(BuildContext context) async {
    try {
      PreviewService previewData = PreviewService(
        title: titleController.text,
        address:
            '{"description":"${"${countryController.text}${streetController.text}${appartmentController.text}${cityController.text}${stateController.text}${zipcodeController.text}"}","location":{"lat":${_currentPosition!.latitude},"lng":${_currentPosition!.longitude}}}',
        category: _selections['serviceData'].categoryId,
        subCategory: _selections['serviceData'].subCategory,
        images: [for (var image in _images) image],
        conditions: [
          selections['conditions']?[0].id,
        ],
        description: discriptionController.text,
        extraMessage: extraController.text,
        availabilities: avalibilities.isEmpty
            ? '[{"dayOfWeek":"Saturday","timeSlots":[{"start":"11:00","end":"12:00"},{"start":"14:00","end":"16:00"}]},{"dayOfWeek":"Tuesday","timeSlots":[{"start":"06:00","end":"08:00"}]}]'
            : avalibilities,
        pricingModel: _selections['serviceData'].pricemodel,
        peopleCanJoin: maxnumberOfPeople.toString(),
        price: price.toString(),
        reservationConfirmation: 'true',
        amenities: selections['Amenity']?[0].id,
        extras: "0.00",
      );
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(USER_TOKEN);
      List<http.MultipartFile> imageFiles = await previewData.getImageFiles();

      final response = await APIRequests.makeMultipartPostRequest(
        Endpoints.services,
        token,
        previewData.toFields(),
        imageFiles,
      );

      if (response.statusCode == 201) {
        log('Service created successfully+${_selections['serviceData'].pricemodel}');
        print(response.body);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));

        clearall();
      } else {
        print('Failed to create service: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      log(e.toString());
    }
    return {};
  }

  void onCalendarTapped(CalendarTapDetails details, BuildContext context) {
    if (details.targetElement == CalendarElement.calendarCell) {
      showAddAppointmentServicesDialog(details.date!, context);
    }
  }

////***********Services End**********/////
  ////*********Get aminities****** */
  List<Amenity> _getAmenities = [];
  List<Amenity> get getAmenitiesinities => _getAmenities;
  Future<List<Amenity>> getAmenities() async {
    try {
      final response =
          await APIRequests.makeGetRequest(Endpoints.getserviceOffers, {}, {});

      if (response.error) {
        log('Error fetching Offers: ${response.message}');
        await Future.delayed(const Duration(seconds: 2));
        return [];
      }

      List<Map<String, dynamic>> responseBody =
          response.body.cast<Map<String, dynamic>>();
      _getAmenities = responseBody.map((c) {
        return Amenity.fromJson(c);
      }).toList();

      notifyListeners();
      return _getAmenities;
    } catch (e) {
      log('Exception occurred: $e');
      await Future.delayed(const Duration(seconds: 2));
      return [];
    }
  }

  ///

  /////*****************service type add for payment pyout  */
  final Map<String, dynamic> _selections = {};

  Map<String, dynamic> get selections => _selections;

  void selectOption(
      {required String option,
      required String serviceName,
      required String iconofServiceName,
      required String priceModel,
      required String categoryId,
      required String subcategory}) {
    _selections.clear();
    _selections['serviceData'] = ServiceSelection(
        serviceName: serviceName,
        selectedOption: option,
        iconofServiceName: iconofServiceName,
        pricemodel: priceModel,
        categoryId: categoryId,
        subCategory: subcategory);
    notifyListeners();
    log(_selections.length.toString());
  }

  void deselectOption(int index) {
    _selections.remove(index);
    notifyListeners();
  }

  void addReservation(int reservation) {
    _selections['reservation'] = ReservationService(reservationNo: reservation);
    log(_selections.length.toString());
    notifyListeners();
  }

  ///save aminties
  void setguesServiceAmenity(String amentiy, String icon, String id) {
    if (_selections['Amenity'] == null) {
      _selections['Amenity'] = <GetAmenity>[];
    }
    List<GetAmenity> aminitiesList = _selections['Amenity'];
    bool exists = aminitiesList.any((c) => c.name == amentiy);
    if (!exists) {
      aminitiesList.add(GetAmenity(id: id, name: amentiy, iconURL: icon));
    }

    if (aminitiesList.length > 2) {
      aminitiesList.removeAt(0);
    }

    notifyListeners();
    log(aminitiesList.map((c) => c.name).join(', '));
  }

  /////
  ////save consitions
  void selectCondition(String condition, String geticon, String id) {
    if (_selections['conditions'] == null) {
      _selections['conditions'] = <GetConditions>[];
    }

    List<GetConditions> conditionsList = _selections['conditions'];

    bool exists = conditionsList.any((c) => c.conditions == condition);

    if (!exists) {
      conditionsList.add(GetConditions(
        id: id,
        icon: geticon,
        conditions: condition,
      ));
    }

    if (conditionsList.length > 2) {
      conditionsList.removeAt(0);
    }

    notifyListeners();

    log(conditionsList.map((c) => c.conditions).join(', '));
  }

////////////////////////////////////////////////////////////////
  void deselectCondition(String condition) {
    List<GetConditions>? conditionsList = _selections['conditions'];

    if (conditionsList != null) {
      conditionsList.removeWhere((c) => c.conditions == condition);
      notifyListeners();
      log(conditionsList.map((c) => c.conditions).join(', '));
    }
  }

  void selectPeople() {
    _selections['people'] = PeopleSelection(
        minpeople: _minNumberOfPeople, maxpeople: _maxNumberOfPeople);
    notifyListeners();
    log(_selections['people'].maxpeople.toString());
  }

//*******************set price section */
  bool _isExtraServicesFeeSelected = false;
  int _radiovalue = 1;
  String _maxc = "32";
  final int _count = 0;
  bool get isextraSerivice => _isExtraServicesFeeSelected;
  int get radioValue => _radiovalue;
  String get max => _maxc;
  int get count => _count;
  int price = 99;
  void changeradio(int radio) {
    _radiovalue = radio;

    notifyListeners();
  }

  void isextraSerivicechanger(bool value) {
    _isExtraServicesFeeSelected = value;
    notifyListeners();
  }

  void changemax(String value) {
    _maxc = value;
    notifyListeners();
  }

  String _updatePriceType(int value) {
    switch (value) {
      case 1:
        return 'hour';

      case 2:
        return 'activity';

      case 3:
        return 'day';

      default:
        return 'hour';
    }
  }

  void selectPriceSection() {
    _selections['priceSection'] = PriceSection(
        descriptionLength: 1,
        maxDescriptionLength: int.parse(_maxc),
        isExtraServicesFeeSelected: isextraSerivice,
        basePrice: double.parse(price.toString()),
        priceType: _updatePriceType(radioValue));
    notifyListeners();
    log(_selections['priceSection'].basePrice.toString());
  }

  ///

  ///
  //****************************************************//
  ///            get current Location
  //****************************************************//
  Position? _currentPosition;
  String? _locationError;

  Position? get currentPosition => _currentPosition;
  String? get locationError => _locationError;
  String _address = '';
  String get address => _address;
  Future<void> getCurentLocation() async {
    try {
      await _checkPermission();
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      getAddressFromLatLng(
          _currentPosition!.latitude, _currentPosition!.longitude);
      notifyListeners();
    } catch (e) {
      _locationError = e.toString();
      notifyListeners();
    }
  }

  Future<void> _checkPermission() async {
    PermissionStatus permission = await Permission.location.status;

    if (permission != PermissionStatus.granted) {
      PermissionStatus newPermission = await Permission.location.request();
      if (newPermission != PermissionStatus.granted) {
        throw Exception("Location permission denied");
      }
    }
  }

  Future<void> refreshLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    notifyListeners();
  }

  Future<void> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks[0];
      log("place: ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}");
      _address =
          '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';

      notifyListeners();
    } catch (e) {
      _address = 'Failed to get address';
      notifyListeners();
      print(e);
    }
  }

  ///
}

class ServiceSelection {
  final String serviceName;
  final String selectedOption;
  final String iconofServiceName;
  final String pricemodel;
  final String categoryId;
  final String subCategory;

  ServiceSelection(
      {required this.serviceName,
      required this.selectedOption,
      required this.iconofServiceName,
      required this.pricemodel,
      required this.categoryId,
      required this.subCategory});
}

class ReservationService {
  final int reservationNo;

  ReservationService({
    required this.reservationNo,
  });
}

class GetConditions {
  final String id;
  final String conditions;
  final String icon;
  GetConditions({
    required this.id,
    required this.icon,
    required this.conditions,
  });
}

class PeopleSelection {
  final int minpeople;
  final int maxpeople;

  PeopleSelection({
    required this.maxpeople,
    required this.minpeople,
  });
}

class PriceSection {
  final String priceType;
  final double basePrice;
  bool isExtraServicesFeeSelected;
  int descriptionLength;
  int maxDescriptionLength;

  PriceSection({
    required this.descriptionLength,
    required this.maxDescriptionLength,
    required this.isExtraServicesFeeSelected,
    required this.basePrice,
    required this.priceType,
  });
}

class GetAmenity {
  final String id;
  final String name;
  final String iconURL;

  GetAmenity({
    required this.id,
    required this.name,
    required this.iconURL,
  });
}
