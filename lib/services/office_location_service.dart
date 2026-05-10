import 'package:geolocator/geolocator.dart';

class OfficeLocationService {
  // rumah sigma 2 -0.8892838560545611, 119.88376843390456
  static const double kantorLat = -0.889283;
  static const double kantorLng = 119.883768;

  // rumah sigma
  // static const double kantorLat = -0.889700;
  // static const double kantorLng = 119.883734;

  // kantor bpkad
  // static const double kantorLat = 1.163483;
  // static const double kantorLng = 121.429668;
  static const radius = 50;

  static bool isInsideOffice(double lat, double lng) {
    final distance = Geolocator.distanceBetween(lat, lng, kantorLat, kantorLng);

    return distance <= radius;
  }
}
