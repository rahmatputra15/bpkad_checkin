import 'package:bpkad_checkin/bloc/splash/splash_bloc.dart';
import 'package:bpkad_checkin/pages/splash/splash.dart';
import 'package:bpkad_checkin/services/background_location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize workmanager for background location tracking
    await BackgroundLocationService.initializeWorkmanager();

    // Start background location tracking every 15 minutes
    // Untuk testing, ubah ke 1-5 menit buat testing lebih cepat
    await BackgroundLocationService.startBackgroundLocationTracking(
      intervalMinutes: 15,
    );
  } catch (e) {
    print('⚠️ Error initializing background task: $e');
    // Continue running app meski background task setup gagal
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins", useMaterial3: true),
      home: BlocProvider(
        create: (context) => SplashBloc(),
        child: const SplashPage(),
      ),
    );
  }
}
