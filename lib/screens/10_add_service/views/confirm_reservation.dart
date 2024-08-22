import 'package:flutter/material.dart';

import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:ibiza/screens/10_add_service/widgets/common_reservation_container.dart';
import 'package:provider/provider.dart';

class ConfirmReservation extends StatefulWidget {
  const ConfirmReservation({super.key});

  @override
  State<ConfirmReservation> createState() => _ConfirmReservationState();
}

class _ConfirmReservationState extends State<ConfirmReservation> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Decide how you will confirm reservations',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          10.h.ph,
          AppText(
            text: 'Share what makes your service special',
            fontSize: 14.sp,
            color: AppColors.col6A6A6A,
            fontWeight: FontWeight.w400,
          ),
          10.h.ph,
          CommonReservationContainer(
            title: "Use instant book",
            icon: "assets/svg/light.svg",
            subtitle: "Guests can book automatically.",
            color: value.selections.containsKey('reservation') &&
                    value.selections['reservation']!.reservationNo == 1
                ? Colors.grey.shade100
                : Colors.white,
            onTap: () {
              value.addReservation(1);
            },
          ),
          20.h.ph,
          CommonReservationContainer(
            title: "Approve or decline requests",
            icon: "assets/svg/requestMsg.svg",
            subtitle: "Guests must ask if they can book.",
            color: value.selections.containsKey('reservation') &&
                    value.selections['reservation']!.reservationNo == 2
                ? Colors.grey.shade100
                : Colors.white,
            onTap: () {
              value.addReservation(2);
            },
          ),
        ],
      ),
    );
  }
}
