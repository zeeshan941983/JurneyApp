import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';

import 'package:ibiza/screens/10_add_service/widgets/location_textfield.dart';
import 'package:provider/provider.dart';

class ServiceLocation extends StatefulWidget {
  const ServiceLocation({super.key});

  @override
  State<ServiceLocation> createState() => _ServiceLocationState();
}

class _ServiceLocationState extends State<ServiceLocation> {
  // GoogleMapController? _mapController;

  @override
  void initState() {
    Provider.of<ServiceProvider>(context, listen: false).getCurentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<ServiceProvider>(context);

    if (locationProvider.currentPosition == null) {
      return Column(
        children: [
          AppText(
            text: 'Where are you exactly located?',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      );
    }

    if (locationProvider.locationError != null) {
      return Column(
        children: [
          AppText(
            text: 'Where are you exactly located?',
            fontSize: 20.sp,
            color: AppColors.col222222,
            fontWeight: FontWeight.w600,
          ),
          Center(child: Text('Error: ${locationProvider.locationError}')),
        ],
      );
    }
    return SingleChildScrollView(
      child: Consumer<ServiceProvider>(
        builder: (context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Where are you exactly located?',
              fontSize: 20.sp,
              color: AppColors.col222222,
              fontWeight: FontWeight.w600,
            ),
            Stack(
              children: [
                Consumer<HomeProvider>(
                  builder: (context, value, child) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 500,
                        child: GoogleMap(
                          onMapCreated: (controller) {
                            // _mapController = controller;
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              locationProvider.currentPosition!.latitude,
                              locationProvider.currentPosition!.longitude,
                            ),
                            zoom: 14.0,
                          ),
                          markers: {
                            Marker(
                              markerId: const MarkerId('currentLocation'),
                              position: LatLng(
                                locationProvider.currentPosition!.latitude,
                                locationProvider.currentPosition!.longitude,
                              ),
                              infoWindow:
                                  const InfoWindow(title: 'You are here'),
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: LocationTextfield(),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
