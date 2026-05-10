import 'package:bpkad_checkin/services/location_service.dart';
import 'package:bpkad_checkin/services/location_storage_service.dart';
import 'package:bpkad_checkin/services/office_location_service.dart';
import 'package:bpkad_checkin/services/work_time_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';

/// Background task name untuk workmanager
const String backgroundLocationTaskName = 'background_location_task';

/// Callback function untuk workmanager (harus top-level)
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      print('🔄 Background location task dimulai...');

      // Cek apakah jam kerja
      final isWorkingTime = WorkTimeService.isWorkingTime();
      print('⏰ Jam kerja? $isWorkingTime');

      if (!isWorkingTime) {
        print('❌ Bukan jam kerja, skip background task');
        return false;
      }

      // Ambil lokasi - gunakan last known position dulu (faster)
      Position? position;
      try {
        // Try last known position dulu (cache, no GPS required)
        position = await Geolocator.getLastKnownPosition().timeout(
          const Duration(seconds: 5),
          onTimeout: () => null,
        );

        // Jika last known position tidak ada, ambil current position
        if (position == null) {
          print('📍 Last known position tidak ada, ambil current...');
          position =
              await Geolocator.getCurrentPosition(
                timeLimit: const Duration(seconds: 10),
              ).timeout(
                const Duration(seconds: 15),
                onTimeout: () => throw Exception('Location timeout'),
              );
        }
      } catch (e) {
        print('❌ Error ambil lokasi: $e');
        // Jika gagal ambil lokasi, return false tapi jangan crash
        return false;
      }

      if (position == null) {
        print('❌ Position masih null setelah retry');
        return false;
      }

      print('📍 Lokasi: ${position.latitude}, ${position.longitude}');

      // Cek apakah dalam radius kantor
      final isInsideOffice = OfficeLocationService.isInsideOffice(
        position.latitude,
        position.longitude,
      );
      print('🏢 Dalam radius kantor? $isInsideOffice');

      // Jika jam kerja DAN dalam radius kantor, simpan lokasi
      if (isWorkingTime && isInsideOffice) {
        final locationData = LocationData(
          latitude: position.latitude,
          longitude: position.longitude,
          timestamp: DateTime.now(),
          isInsideOffice: isInsideOffice,
          isWorkingTime: isWorkingTime,
        );

        await LocationStorageService.saveLocation(locationData);

        print(
          '✅ Lokasi tersimpan! Total: ${LocationStorageService.getLocationCount()}',
        );

        return true;
      } else {
        print(
          '⚠️ Kondisi tidak memenuhi (bukan jam kerja atau tidak dalam radius)',
        );
        return false;
      }
    } catch (e, stackTrace) {
      print('❌ Unexpected error di background task: $e');
      print('📋 Stack trace: $stackTrace');
      return false;
    }
  });
}

/// Service untuk mengelola background location task
class BackgroundLocationService {
  /// Initialize workmanager
  static Future<void> initializeWorkmanager() async {
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    print('✅ Workmanager initialized');
  }

  /// Register periodic background location task
  /// interval: dalam menit (minimum 15 menit untuk production)
  static Future<void> startBackgroundLocationTracking({
    int intervalMinutes = 15,
  }) async {
    try {
      // Cancel existing task dulu untuk avoid duplicate
      await Workmanager().cancelByTag(backgroundLocationTaskName);

      await Workmanager().registerPeriodicTask(
        backgroundLocationTaskName,
        backgroundLocationTaskName,
        frequency: Duration(minutes: intervalMinutes),
        constraints: Constraints(
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresDeviceIdle: false,
        ),
        backoffPolicy: BackoffPolicy.exponential,
        initialDelay: Duration(minutes: 1),
      );
      print(
        '✅ Background location tracking started (interval: ${intervalMinutes}m)',
      );
    } catch (e) {
      print('❌ Error starting background task: $e');
      rethrow;
    }
  }

  /// Stop background location tracking
  static Future<void> stopBackgroundLocationTracking() async {
    try {
      await Workmanager().cancelByTag(backgroundLocationTaskName);
      print('🛑 Background location tracking stopped');
    } catch (e) {
      print('❌ Error stopping background task: $e');
    }
  }

  /// Cancel all tasks
  static Future<void> cancelAllTasks() async {
    try {
      await Workmanager().cancelAll();
      print('🛑 Semua background tasks dibatalkan');
    } catch (e) {
      print('❌ Error canceling all tasks: $e');
    }
  }
}
