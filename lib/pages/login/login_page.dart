import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Login Page",
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFFA92020),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
