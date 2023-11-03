import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicmate/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    //  if (myServices.sharedPreferences.getString("step") == "2") {
    //   return const RouteSettings(name: AppRoute.home);
    // }
    // if (myServices.sharedPreferences.getString("step") == "1") {
    //   return const RouteSettings(name: AppRoute.splashscreen);
    // }
    return null;
  }
}