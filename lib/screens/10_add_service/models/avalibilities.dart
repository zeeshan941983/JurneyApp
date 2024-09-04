import 'dart:convert';

class TimeSlot {
  String start;
  String end;

  TimeSlot({required this.start, required this.end});

  Map<String, String> toMap() {
    return {
      'start': start,
      'end': end,
    };
  }
}

class Availability {
  String dayOfWeek;
  List<TimeSlot> timeSlots;

  Availability({required this.dayOfWeek, required this.timeSlots});

  Map<String, dynamic> toMap() {
    return {
      'dayOfWeek': dayOfWeek,
      'timeSlots': timeSlots.map((slot) => slot.toMap()).toList(),
    };
  }

  static String toJson(List<Availability> availabilityList) {
    List<Map<String, dynamic>> jsonList =
        availabilityList.map((avail) => avail.toMap()).toList();
    return jsonEncode(jsonList);
  }
}
