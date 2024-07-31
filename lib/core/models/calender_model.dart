import 'dart:convert';

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
    List<TimeSlot> timeSlotsList = list.map((i) => TimeSlot.fromJson(i)).toList();

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
  final Address address;
  final int price;

  Activity({
    required this.id,
    required this.title,
    required this.address,
    required this.price,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      title: json['title'],
      address: Address.fromJson(jsonDecode(json['address'])),
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'address': jsonEncode(address.toJson()),
      'price': price,
    };
  }
}
