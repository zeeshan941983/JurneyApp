import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SpecialRegionsCalendar extends StatefulWidget {
  const SpecialRegionsCalendar({super.key, required this.homeProvider});
  final HomeProvider homeProvider;

  @override
  State<SpecialRegionsCalendar> createState() => _SpecialRegionsCalendarState();
}

class _SpecialRegionsCalendarState extends State<SpecialRegionsCalendar> {
  final CalendarController calendarController = CalendarController();
  final List<CalendarView> _allowedViews = <CalendarView>[
    CalendarView.day,
    CalendarView.week,
    // CalendarView.workWeek,
    // CalendarView.timelineDay,
  ];

  List<TimeRegion> regions = <TimeRegion>[];
  List<int> selectedDays = [];

  @override
  void initState() {
    calendarController.view = CalendarView.week;
    super.initState();
  }

  DateTime _getDateForDay(int dayOfWeek) {
    final now = calendarController.displayDate!;
    final daysToAdd = (dayOfWeek - now.weekday + 7) % 7;
    return now.add(Duration(days: daysToAdd));
  }

  void _updateSelectedDays(int day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
      calendarController.view =
          selectedDays.isEmpty ? CalendarView.week : CalendarView.day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return Column(
      children: [
        Visibility(
          visible: widget.homeProvider.showCustomDate,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                final isSelected = selectedDays.contains(index);
                return ElevatedButton(
                  onPressed: () {
                    _updateSelectedDays(index);
                    if (selectedDays.isNotEmpty) {
                      calendarController.displayDate =
                          _getDateForDay(selectedDays.first);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isSelected ? AppColors.col1E99A1 : Colors.white,
                    foregroundColor: isSelected ? Colors.white : Colors.black,
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
                    color:
                        isSelected ? AppColors.colFFFFFF : AppColors.col1E99A1,
                  ),
                ).withPadding(
                  padding: EdgeInsets.only(left: 1.5.sp, right: 1.5.sp),
                );
              }),
            ).withPadding(padding: EdgeInsets.only(bottom: 10.sp, left: 5.sp)),
          ),
        ),
        Container(
          height: 0.759.sh,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.w, color: AppColors.col1E99A1),
          ),
          child: SfCalendar(
            showNavigationArrow: true,
            showWeekNumber: true,
            showTodayButton: true,
            showDatePickerButton: true,
            controller: calendarController,
            allowedViews: _allowedViews,
            specialRegions: regions,
            viewNavigationMode: ViewNavigationMode.none,
            allowViewNavigation: false,
            allowAppointmentResize: false,
            onAppointmentResizeEnd: (appointmentResizeEndDetails) {},
            allowDragAndDrop: true,
            showCurrentTimeIndicator: true,
            viewHeaderStyle: const ViewHeaderStyle(
              backgroundColor: Colors.teal,
              dateTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
              dayTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
            view: selectedDays.isEmpty ? CalendarView.week : CalendarView.day,
            backgroundColor: Colors.white,
            timeRegionBuilder: _getSpecialRegionWidget,
            timeSlotViewSettings: TimeSlotViewSettings(
              timeFormat: "HH:mm",
              dayFormat: 'EEE',
              allDayPanelColor: Colors.amber,
              timelineAppointmentHeight: 100,
              numberOfDaysInView:
                  selectedDays.isEmpty ? 7 : selectedDays.length,
              startHour: 0,
              endHour: 24,
              nonWorkingDays: selectedDays.isEmpty ? [7] : selectedDays,
            ),
            dataSource: widget.homeProvider.events,
            onTap: (calendarTapDetails) {
              widget.homeProvider.onCalendarTapped(calendarTapDetails, context);
            },
            weekNumberStyle: const WeekNumberStyle(
              textStyle: TextStyle(
                  color: AppColors.col064549,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSpecialRegionWidget(
      BuildContext context, TimeRegionDetails details) {
    if (details.region.text == 'Lunch') {
      return Container(
        color: details.region.color,
        alignment: Alignment.center,
        child: Icon(
          Icons.restaurant,
          color: Colors.grey.withOpacity(0.5),
        ),
      );
    } else if (details.region.text == 'Not Available') {
      return Container(
        color: details.region.color,
        alignment: Alignment.center,
        child: Icon(
          Icons.block,
          color: Colors.grey.withOpacity(0.5),
        ),
      );
    }

    return Container(color: details.region.color);
  }
}
