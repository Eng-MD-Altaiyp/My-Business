import 'package:business/first%20page/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';



void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MaterialApp(
        title: "Business",
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
