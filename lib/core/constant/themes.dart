import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(

    scaffoldBackgroundColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme:  AppBarTheme(
      backgroundColor: Colors.transparent,
      // color: Colors.white,
      toolbarHeight: 65,
      elevation: 0.0,
      centerTitle: true,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      dividerColor: Colors.black,
      indicatorColor: Colors.black
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),

    
    fontFamily: "Ubuntu",
    
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),
      bodyLarge: TextStyle(
          height: 2,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17),
      bodyMedium: TextStyle(
          height: 2,
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold),
    ),
    primaryColor: Colors.white,
    );

ThemeData themeArabic = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      toolbarHeight: 65,
      elevation: 0.0,
      centerTitle: true,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
    
    fontFamily: "BalooBhaijaan2",
    primarySwatch: Colors.blue,

    textTheme: const TextTheme(

      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black,),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black,),
      bodyLarge: TextStyle(
          height: 2,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17),
      bodyMedium: TextStyle(
          height: 2,
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold),
    ),
    
    primaryColor: Colors.white);

