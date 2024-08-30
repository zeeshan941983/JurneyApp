import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ibiza/core/api/endpoints.dart';
import 'package:ibiza/core/api/requests.dart';

import 'package:ibiza/core/constants/storage_keys.dart';

import 'package:ibiza/core/models/aminities.dart';
import 'package:ibiza/core/models/category_model.dart';
import 'package:ibiza/core/models/preview_model.dart';
import 'package:ibiza/core/view_model/base_view_model.dart';
import 'package:ibiza/screens/04_home_screen/models/sites_model.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class ServiceProvider extends BaseViewModel {
  ///Initialize And Get Important Things
  ServiceProvider() {
    getConditions();
    getServicesOffers();
  }

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
  List<dynamic> _services = [];
  List<dynamic> get services => _services;

  Future<Map<String, dynamic>> setServices() async {
    try {
      PreviewService previewData = PreviewService(
        title: 'Example Title',
        address:
            '{"description":"528A Commercial Rd, London E1 0HY, UK","location":{"lat":51.513086693162236,"lng":-0.042528380008144635}}',
        category: '605c72ef9b1e8f001f8c7f2b',
        subCategory: '605c72ef9b1e8f001f8c7f2c',
        images: [for (var image in _images) image],
        conditions: ['60a79adfd3214e31a4b9c8f8'],
        description: 'Example description',
        extraMessage: 'Additional message',
        availabilities:
            '[{"dayOfWeek":"Saturday","timeSlots":[{"start":"11:00","end":"12:00"},{"start":"14:00","end":"16:00"}]},{"dayOfWeek":"Tuesday","timeSlots":[{"start":"06:00","end":"08:00"}]}]',
        pricingModel: '60a79adfd3214e31a4b9c8f8',
        peopleCanJoin: '2',
        price: '9999',
        reservationConfirmation: 'true',
        amenities: "",
        extras: '8989',
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
        log('Service created successfully');
        print(response.body);
      } else {
        print('Failed to create service: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      log(e.toString());
    }
    return {};
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
      String option, String serviceName, String iconofServiceName) {
    _selections.clear();
    _selections['serviceData'] = ServiceSelection(
      serviceName: serviceName,
      selectedOption: option,
      iconofServiceName: iconofServiceName,
    );
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
  void selectCondition(String condition, String geticon) {
    if (_selections['conditions'] == null) {
      _selections['conditions'] = <GetConditions>[];
    }

    List<GetConditions> conditionsList = _selections['conditions'];

    bool exists = conditionsList.any((c) => c.conditions == condition);

    if (!exists) {
      conditionsList.add(GetConditions(icon: geticon, conditions: condition));
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
}

class ServiceSelection {
  final String serviceName;
  final String selectedOption;
  final String iconofServiceName;

  ServiceSelection({
    required this.serviceName,
    required this.selectedOption,
    required this.iconofServiceName,
  });
}

class ReservationService {
  final int reservationNo;

  ReservationService({
    required this.reservationNo,
  });
}

class GetConditions {
  final String conditions;
  final String icon;
  GetConditions({
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
