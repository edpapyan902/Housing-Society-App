import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_app/UI/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Houseing App',
      theme: ThemeData(accentColor: Color(0xFF5E68C6)),
      home: SplashScreen(),
    );
  }
}
