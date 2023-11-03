import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/splash/splashscreeen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController()); 
    return Material(
      child: Container(
        color: Colors.black,
        child:const Center(
          child: Text("Music Mate",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
