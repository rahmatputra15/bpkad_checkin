import 'dart:convert';

class LocationData {
  final double latitude;
  final double longitude;
  final DateTime timestamp;
  final bool isInsideOffice;
  final bool isWorkingTime;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    required this.isInsideOffice,
    required this.isWorkingTime,
  });

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
    'timestamp': timestamp.toIso8601String(),
    'isInsideOffice': isInsideOffice,
    'isWorkingTime': isWorkingTime,
  };

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
    latitude: json['latitude'] as double,
    longitude: json['longitude'] as double,
    timestamp: DateTime.parse(json['timestamp'] as String),
    isInsideOffice: json['isInsideOffice'] as bool,
    isWorkingTime: json['isWorkingTime'] as bool,
  );

  @override
  String toString() =>
      'LocationData(lat: $latitude, lng: $longitude, time: $timestamp)';
}

/// Service untuk menyimpan lokasi ke local storage
class LocationStorageService {
  static const String storageKey = 'saved_locations';
  static final List<LocationData> _locations = [];

  static Future<void> saveLocation(LocationData location) async {
    _locations.add(location);
    print('📍 Lokasi disimpan: $location');
  }

  static List<LocationData> getAllLocations() {
    return List.unmodifiable(_locations);
  }

  static Future<void> clearLocations() async {
    _locations.clear();
    print('🗑️ Semua lokasi dihapus');
  }

  static int getLocationCount() {
    return _locations.length;
  }

  /// Untuk production, gunakan shared_preferences
  /// atau database lokal seperti drift/hive
  static String getLocationsAsJson() {
    return jsonEncode(_locations.map((loc) => loc.toJson()).toList());
  }
}
