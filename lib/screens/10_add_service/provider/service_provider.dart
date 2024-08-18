import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ibiza/core/api/endpoints.dart';
import 'package:ibiza/core/api/requests.dart';
import 'package:ibiza/core/models/category_model.dart';
import 'package:ibiza/core/view_model/base_view_model.dart';
import 'package:ibiza/screens/04_home_screen/models/sites_model.dart';

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
      maxController.text = _maxNumberOfPeople.toString();
    }
    notifyListeners();
  }

  maxincrment() {
    _maxNumberOfPeople++;
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
      final response = await APIRequests.makeGetRequest(Endpoints.getserviceConditions, {}, {});

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
  List<Category> _serviceOffers = [];
  List<Category> get serviceOffers => _serviceOffers;
  set serviceOffers(List<Category> serOffers) {
    _serviceOffers = serOffers;
    notifyListeners();
  }

  Future<List<Category>>? getServicesOffers() async {
    try {
      final response = await APIRequests.makeGetRequest(Endpoints.activityCategories, {}, {});

      if (response.error) {
        log('Error fetching Offers: ${response.message}');
        await Future.delayed(const Duration(seconds: 2));
        getServicesOffers();
        return [];
      }
    
        log('Response body: ${response.body.runtimeType} - ${response.body}');
       List<Map<String, dynamic>> responseBody = response.body.cast<Map<String, dynamic>>();
      serviceOffers = responseBody.map((c) {
        return Category.fromJson(c);
      }).toList();
      
        log("here is final data ${serviceOffers.length} ${serviceOffers[0].name}");
      notifyListeners();
      return serviceOffers;
    } catch (e) {
      log('Exception occurred: $e');
      await Future.delayed(const Duration(seconds: 2));
      getServicesOffers();
      return [];
    }
  }
 
}
