import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'search_controller.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(Home());
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Image.asset(
            "assets/karaok app.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
