import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';

class ServiceCalendar extends StatefulWidget {
  const ServiceCalendar({super.key});

  @override
  State<ServiceCalendar> createState() => _ServiceCalendarState();
}

class _ServiceCalendarState extends State<ServiceCalendar> {
  final List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  final List<String> times = [
    "6:00",
    "7:00",
    "8:00",
    "9:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00"
  ];

  int _selectedDayIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 600.h,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDayIndex = index;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDayIndex == index
                        ? AppColors.col1E99A1
                        : Colors.white,
                    foregroundColor: _selectedDayIndex == index
                        ? Colors.white
                        : Colors.black,
                    side: BorderSide(color: Colors.grey.shade300),
                    maximumSize: Size(45.w, 20.h),
                    minimumSize: Size(45.w, 20.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: AppText(
                    text: days[index],
                    fontSize: 10.sp,
                    color: _selectedDayIndex == index
                        ? AppColors.colFFFFFF
                        : AppColors.col1E99A1,
                  ),
                ).withPadding(
                  padding: EdgeInsets.only(
                    left: 1.5.sp,
                  ),
                );
              }),
            ),
            Expanded(
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: 40.h,
                          color: Colors.teal,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                              child: Text("TIME",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11))),
                        ),
                      ),
                      ...days.map((day) => TableCell(
                            child: Container(
                              height: 40.h,
                              color: Colors.teal,
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(day,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 11))),
                            ),
                          )),
                    ],
                  ),
                  ...times.map((time) => TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 30.h,
                              child: Center(child: Text(time)),
                            ),
                          ),
                          ...days.map((day) {
                            bool isHighlighted =
                                (day == "Tue" && time == "8:00") ||
                                    (day == "Thu" && time == "8:00");
                            return TableCell(
                              child: Container(
                                color: isHighlighted
                                    ? Colors.teal[200]
                                    : Colors.transparent,
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: isHighlighted
                                      ? const Text("Rent Quad\nExcru..",
                                          style: TextStyle(color: Colors.black))
                                      : const SizedBox.shrink(),
                                ),
                              ),
                            );
                          }),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
