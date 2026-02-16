import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFDEE5E8),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Image.asset("images/logos/header_bpkad.png"),
                      SizedBox(height: 10),
                      Image.asset("images/logos/logoapps.png"),
                      SizedBox(height: 10),
                      Text(
                        "BPKAD CHECKIN",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Aplikasi monitoring kehadiran",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "dan jam kerja anda",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text("Username", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: const Color(0xFFD7DDE6),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: const Color(0xFF2D98BC),
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Icon(
                        Icons.person_outline,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                    hintText: 'Masukkan nama username',
                    hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: const Color(0xFFD7DDE6),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: const Color(0xFF2D98BC),
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Icon(Icons.lock_outline, color: Color(0xFF9CA3AF)),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 20),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                    hintText: 'Masukkan password',
                    hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1468BC),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 21.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "MASUK",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "Copyright © 2026",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        "Bidang Sekretariat BPKAD Kabupaten Buol",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ada masalah? ",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Text(
                            "Hubungi support IT",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
