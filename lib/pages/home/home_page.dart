import 'package:bpkad_checkin/bloc/location/location_bloc.dart';
import 'package:bpkad_checkin/bloc/location/location_event.dart';
import 'package:bpkad_checkin/bloc/location/location_state.dart';
import 'package:bpkad_checkin/services/location_service.dart';
import 'package:bpkad_checkin/widgets/location_status.dart';
import 'package:bpkad_checkin/widgets/office_map_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpkad_checkin/widgets/app_header.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // static const double kantorLat = -0.889700;
  // static const double kantorLng = 119.883770;
  static const double kantorLat = 1.163483;
  static const double kantorLng = 121.429668;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LocationBloc(LocationService())..add(GetLocationEvent()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F8),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 20,
                children: [
                  AppHeader(
                    userImage: "images/user_test.jpg",
                    backgroundColor: Color(0xFFDEE5E8),
                  ),
                  BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, state) {
                      if (state is LocationLoading) {
                        return Column(
                          children: [
                            LocationStatus(
                              dalamRadius: false,
                              meter: 0,
                              loading: true,
                            ),
                            const SizedBox(height: 20),
                            const OfficeMapCard(loading: true),
                          ],
                        );
                      }

                      if (state is LocationLoaded) {
                        final distance = Distance();
                        final lat = state.latitude;
                        final lng = state.longitude;

                        double meter = 0;
                        try {
                          meter = distance.as(
                            LengthUnit.Meter,
                            LatLng(lat, lng),
                            LatLng(kantorLat, kantorLng),
                          );
                          // Validate meter value
                          if (meter.isNaN || meter.isInfinite) {
                            meter = 0;
                          }
                        } catch (e) {
                          meter = 0;
                        }

                        bool dalamRadius = meter <= 100;

                        return Column(
                          spacing: 20,
                          children: [
                            LocationStatus(
                              dalamRadius: dalamRadius,
                              meter: meter,
                            ),
                            OfficeMapCard(
                              lat: state.latitude,
                              lng: state.longitude,
                              officeLat: kantorLat,
                              officeLng: kantorLng,
                              onRefresh: () {
                                context.read<LocationBloc>().add(
                                  GetLocationEvent(),
                                );
                              },
                            ),
                          ],
                        );
                      }

                      if (state is LocationError) {
                        return Text(state.message);
                      }

                      return const SizedBox();
                    },
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF06B4A6),
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 5,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "OTOMATIS CHECK IN",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.check_sharp, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 15,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFDEE5E8),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          height: 100,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Waktu Kerja",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "08.00 - 16.00",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "7 jam kerja",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFDEE5E8),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          height: 100,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Jam Hari Ini",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "3 jam 45 menit",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
