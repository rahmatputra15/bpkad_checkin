import 'package:bpkad_checkin/bloc/splash/splash_bloc.dart';
import 'package:bpkad_checkin/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(NavigateToLogin());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NavigateToLoginState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F8),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Image.asset("images/logos/logoapps.png"),
                      SizedBox(height: 10),
                      Text(
                        "BPKAD CHECKIN",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Aplikasi monitoring kehadiran",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "dan jam kerja anda",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: Text(
                    "Version 1.0.0",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
                SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //       width: 25,
                //       height: 25,
                //       child: CircularProgressIndicator(
                //         valueColor: AlwaysStoppedAnimation<Color>(
                //           Color(0xFFAAAAAA),
                //         ),
                //         strokeWidth: 4,
                //       ),
                //     ),
                //     SizedBox(width: 15),
                //     Text(
                //       "Memuat halaman",
                //       style: TextStyle(
                //         fontSize: 14,
                //         color: Colors.black54,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
