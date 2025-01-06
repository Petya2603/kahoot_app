import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/config/constants/constants.dart';
import 'package:kahoot_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: AppColors.background,
        fontFamily: Fonts.gilroyRegular,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
