import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OfficeMapCard extends StatelessWidget {
  final double? lat;
  final double? lng;
  final double? officeLat;
  final double? officeLng;
  final VoidCallback? onRefresh;
  final bool loading;

  const OfficeMapCard({
    super.key,
    this.lat,
    this.lng,
    this.officeLat,
    this.officeLng,
    this.onRefresh,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    // Validate coordinates
    bool isValidCoordinate(double? value) {
      return value != null && !value.isNaN && !value.isInfinite;
    }

    bool hasValidCoordinates =
        isValidCoordinate(lat) &&
        isValidCoordinate(lng) &&
        isValidCoordinate(officeLat) &&
        isValidCoordinate(officeLng);

    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: loading || !hasValidCoordinates
            ? Skeletonizer(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Stack(
                      children: [
                        FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(lat!, lng!),
                            initialZoom: 18,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
                              userAgentPackageName: 'com.example.bpkad_checkin',
                            ),
                            CircleLayer(
                              circles: [
                                CircleMarker(
                                  point: LatLng(officeLat!, officeLng!),
                                  radius: 50,
                                  useRadiusInMeter: true,
                                  color: Colors.blue.withValues(alpha: 0.4),
                                  borderColor: Colors.blue,
                                  borderStrokeWidth: 2,
                                ),
                              ],
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(lat!, lng!),
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    "images/logos/marker2.png",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 15,
                          left: 10,
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  0.85,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lat: ${lat!.toStringAsFixed(5)}, Lng: ${lng!.toStringAsFixed(5)}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: onRefresh,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.refresh,
                                          size: 16,
                                          color: Colors.blue.shade500,
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          "Perbaharui",
                                          style: TextStyle(
                                            color: Colors.blue.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
