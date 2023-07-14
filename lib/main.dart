import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'search/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Night',
        // theme: ThemeData(),
        home: Splash() //Home() //Search(),
        );
  }
}
