import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // cek apakah GPS aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services disabled');
    }

    // cek permission
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied');
    }

    // ambil posisi
    return await Geolocator.getCurrentPosition();
  }

  /// Get real-time location updates sebagai Stream
  /// [locationSettings] untuk customize accuracy, interval, distance filter, etc.
  Stream<Position> getPositionStream({LocationSettings? locationSettings}) {
    return Geolocator.getPositionStream(
      locationSettings:
          locationSettings ??
          const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 10, // Update hanya jika bergerak >10 meter
          ),
    );
  }
}
