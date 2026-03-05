import 'package:bpkad_checkin/bloc/splash/splash_bloc.dart';
import 'package:bpkad_checkin/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bpkad_checkin/pages/home/home_wrapper.dart';

void main() {
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
