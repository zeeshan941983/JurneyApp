import 'dart:convert';
import 'dart:developer';

class CalenderModel {
  final List<Week> weeks;

  CalenderModel({
    required this.weeks,
  });

  factory CalenderModel.fromJson(List<dynamic> json) {
    List<Week> weeksList = json.map((i) => Week.fromJson(i)).toList();

    return CalenderModel(
      weeks: weeksList,
    );
  }

  List<Map<String, dynamic>> toJson() {
    return weeks.map((e) => e.toJson()).toList();
  }
}

class Week {
  final String week;
  final List<Day> days;

  Week({
    required this.week,
    required this.days,
  });

  factory Week.fromJson(Map<String, dynamic> json) {
    var list = json['days'] as List;
    List<Day> daysList = list.map((i) => Day.fromJson(i)).toList();

    return Week(
      week: json['week'],
      days: daysList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'week': week,
      'days': days.map((e) => e.toJson()).toList(),
    };
  }
}

class Day {
  final String date;
  final String dayOfWeek;
  final List<TimeSlot> timeSlots;

  Day({
    required this.date,
    required this.dayOfWeek,
    required this.timeSlots,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    var list = json['timeSlots'] as List;
    List<TimeSlot> timeSlotsList =
        list.map((i) => TimeSlot.fromJson(i)).toList();

    return Day(
      date: json['date'],
      dayOfWeek: json['dayOfWeek'],
      timeSlots: timeSlotsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'dayOfWeek': dayOfWeek,
      'timeSlots': timeSlots.map((e) => e.toJson()).toList(),
    };
  }
}

class TimeSlot {
  final String id;
  final String start;
  final String end;
  final Activity activity;

  TimeSlot({
    required this.id,
    required this.start,
    required this.end,
    required this.activity,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json['_id'],
      start: json['start'],
      end: json['end'],
      activity: Activity.fromJson(json['activity']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'start': start,
      'end': end,
      'activity': activity.toJson(),
    };
  }
}

class Address {
  final double lat;
  final double lng;
  final String description;

  Address({
    required this.lat,
    required this.lng,
    required this.description,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      lat: json['lat'],
      lng: json['lng'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
      'description': description,
    };
  }
}

class Activity {
  final String id;
  final String title;
  final Address? address; // Nullable
  final int price;
  final int? extras; // Nullable, to handle cases where extras might be null
  final String?
      extraMessage; // Nullable, to handle cases where extra_message might be null

  Activity({
    required this.id,
    required this.title,
    this.address,
    required this.price,
    this.extras,
    this.extraMessage,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    log('Parsing Activity with json: $json');

    String? addressString = json['address'];
    Address? addressObj;

    if (addressString != null) {
      try {
        addressObj = Address.fromJson(jsonDecode(addressString));
      } catch (e) {
        log('Error parsing address: $e');
        addressObj = null;
      }
    }

    return Activity(
      id: json['_id'],
      title: json['title'],
      address: addressObj,
      price: json['price'],
      extras: json['extras'], // Assuming this can be null
      extraMessage: json['extra_message'], // Assuming this can be null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'address': address != null ? jsonEncode(address!.toJson()) : null,
      'price': price,
      'extras': extras,
      'extra_message': extraMessage,
    };
  }
}
