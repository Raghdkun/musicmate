import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicmate/views/home.dart';



class MainTabVireController extends GetxController with GetSingleTickerProviderStateMixin {

final List<Widget> appTabs = <Tab>[
  Tab(text: "All Songs",),
  Tab(text: "Playlists",),
  // Tab(text: "Generes",),
  // Tab(text: "Favorites",),


];
GlobalKey navigatorKey = GlobalKey();
var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

late TabController tabController ; 

@override
  void onInit() {
    tabController = TabController(length: appTabs.length, vsync: this);
    // Get.put(PlayerController()); 

    super.onInit();
  }

  @override
  void dispose() {
  tabController.dispose(); 
    super.dispose();
  }


}