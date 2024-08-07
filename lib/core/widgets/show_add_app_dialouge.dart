import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/models/add_activity_model.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/core/widgets/show_activity_dialouge.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void showAddAppointmentDialog(
  DateTime selectedDate,
  BuildContext context,
) {
  final focus = FocusNode();

  focus.requestFocus();
  // Duration duration = const Duration(hours: 1);
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<HomeProvider>(
        builder: (context, provider, child) => AlertDialog(
          titlePadding: EdgeInsets.only(left: 10.w, top: 10.h),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageIcon(
                const AssetImage(AppImages.clock),
                size: 24.sp,
              ),
              AppText(
                text: DateFormat('EEEE, MMMM dd,  \n hh:mm a')
                    .format(selectedDate),
                color: AppColors.col7A7A7A,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: DateFormat('\n hh:mm a')
                    .format(selectedDate.add(provider.duration)),
                color: AppColors.col7A7A7A,
                fontSize: 14.sp,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 33.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: AppColors.colF4F4F4,
                      borderRadius: BorderRadius.circular(35.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppText(
                            text: provider.populardata?.title ?? '',
                            color: AppColors.col7A7A7A,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        10.w.ph,
                        AppText(
                          text: '\$${provider.populardata?.price ?? 0}/hour',
                          color: AppColors.col7A7A7A,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  ExpansionTile(
                    backgroundColor: AppColors.colF4F4F4,
                    iconColor: AppColors.col1E99A1,
                    collapsedIconColor: AppColors.col1E99A1,
                    title: AppText(
                      text: 'Change Duration',
                      color: AppColors.col1E99A1,
                      fontSize: 14.sp,
                    ),
                    children: [
                      // DurationPicker(
                      //   height: 200.h,
                      //   baseUnit: BaseUnit.hour,
                      //   snapToMins: 200,
                      //   lowerBound: const Duration(minutes: 100),
                      //   duration: provider.duration,
                      //   onChange: (val) {
                      //     provider.setDuration(val);
                      //   },
                      // ),

                      SizedBox(
                        height: 65.h,
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          useMagnifier: true,
                          onSelectedItemChanged: (index) {
                            print(index * 30);
                            provider.setDuration(Duration(minutes: index * 30));
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              final hours = index ~/ 2;
                              final minutes = (index % 2) * 30;
                              final displayText = minutes == 0
                                  ? '$hours h'
                                  : '$hours : ${minutes ~/ 30 * 30} h';
                              return InkWell(
                                onTap: () {
                                  // provider.setDuration(Duration(minutes: index * 30));
                                },
                                child: Center(
                                  child: Text(
                                    displayText,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ),
                              );
                            },
                            childCount:
                                24 * 2, // 24 hours, half-hour increments
                          ),
                        ),
                      )
                    ],
                  ),
                  15.h.ph,
                  AppButton(
                    height: 40.h,
                    radius: 35.r,
                    textSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    text: 'Add Activity',
                    onTap: () => showActivityDialouge(context),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            AppButton(
              height: 40.h,
              radius: 35.r,
              width: 83.w,
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              text: 'Save',
              onTap: () {
                String formattedDate = provider.setdateformate(selectedDate);

                String weekofday = DateFormat('EEEE').format(selectedDate);
                // print(provider.getStartOfWeek(provider.date));
                String week = provider.getStartOfWeek(selectedDate);
                String selecteddate = provider.setdateformate(selectedDate);
                String Weekofday = provider.setDaysFromDate(selectedDate);
                String starttime = provider.setTimeForm(selectedDate);
                String endTime = provider.setTimeForm(
                  selectedDate.add(
                    provider.duration,
                  ),
                );
                print(provider.populardata!.id);
                if (formKey.currentState!.validate()) {
                  String? subject = provider.populardata?.title;
                  if (subject != "") {
                    final Appointment newAppointment = Appointment(
                      subject: subject!,
                      startTime: selectedDate,
                      endTime: selectedDate.add(
                        provider.duration,
                      ),
                      color: getRandomColorWithOpacity(0.6),
                    );

                    WeekActivity weekActivity = WeekActivity(
                        week: week,
                        slot: Slot(
                            date: selecteddate,
                            dayOfWeek: Weekofday,
                            timeSlots: [
                              TimeSlotAddActivity(
                                  start: starttime,
                                  end: endTime,
                                  activity: "66a0ceea9e093522a6fb3776",
                                  availExtraService: true)
                            ]));
                    provider.getActivityToCalendar(weekActivity);
                    // Provider.of<HomeProvider>(context, listen: false)
                    //     .setAppointment(newAppointment);

                    Navigator.of(context).pop();
                  }
                }
                provider.clearPopularData();
              },
            )
          ],
        ),
      );
    },
  );
}

Color getRandomColorWithOpacity(double opacity) {
  final Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    opacity,
  );
}
