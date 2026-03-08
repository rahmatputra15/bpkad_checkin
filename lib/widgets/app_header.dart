import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String userImage;
  final String appName;
  final Color backgroundColor;

  const AppHeader({
    super.key,
    this.userImage = "images/user_test.jpg",
    this.appName = "BPKAD\nCHECKIN",
    this.backgroundColor = const Color(0xFFDEE5E8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Image.asset("images/logos/logoapps.png", height: 60),
            SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BPKAD",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
                Text(
                  "CHECKIN",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(userImage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
