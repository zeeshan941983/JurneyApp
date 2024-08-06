import 'dart:convert';

// Define the TimeSlot class
class TimeSlot {
  String start;
  String end;
  String activity;
  bool availExtraService;

  TimeSlot({
    required this.start,
    required this.end,
    required this.activity,
    required this.availExtraService,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      start: json['start'],
      end: json['end'],
      activity: json['activity'],
      availExtraService: json['availExtraService'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'end': end,
      'activity': activity,
      'availExtraService': availExtraService,
    };
  }
}

// Define the Slot class
class Slot {
  String date;
  String dayOfWeek;
  List<TimeSlot> timeSlots;

  Slot({
    required this.date,
    required this.dayOfWeek,
    required this.timeSlots,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    var list = json['timeSlots'] as List;
    List<TimeSlot> timeSlotList =
        list.map((i) => TimeSlot.fromJson(i)).toList();

    return Slot(
      date: json['date'],
      dayOfWeek: json['dayOfWeek'],
      timeSlots: timeSlotList,
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

// Define the Week class
class Week {
  String week;
  Slot slot;

  Week({
    required this.week,
    required this.slot,
  });

  factory Week.fromJson(Map<String, dynamic> json) {
    return Week(
      week: json['week'],
      slot: Slot.fromJson(json['slot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'week': week,
      'slot': slot.toJson(),
    };
  }
}

// Function to parse JSON string to Week object
Week parseWeek(String jsonStr) {
  final jsonData = jsonDecode(jsonStr);
  return Week.fromJson(jsonData);
}

// Function to convert Week object to JSON string
String weekToJson(Week week) {
  final jsonData = week.toJson();
  return jsonEncode(jsonData);
}

void main() {
  // Example JSON string
  String jsonString = '''
  {
      "week": "2024-06-30",
      "slot":{
        "date":"2024-05-29",
        "dayOfWeek": "Friday",
        "timeSlots": [
          {
            "start": "15:00",
            "end": "19:30",
            "activity": "66a0ceea9e093522a6fb3776",
            "availExtraService": true
          }
        ]
      }
  }
  ''';

  // Parse JSON string to Week object
  Week week = parseWeek(jsonString);

  // Print Week object
  print('Week: ${week.week}');
  print('Slot Date: ${week.slot.date}');
  print('Slot DayOfWeek: ${week.slot.dayOfWeek}');
  print('First TimeSlot Start: ${week.slot.timeSlots[0].start}');
  print('First TimeSlot End: ${week.slot.timeSlots[0].end}');

  // Convert Week object to JSON string
  String jsonStringFromObject = weekToJson(week);
  print('JSON String from Object: $jsonStringFromObject');
}
