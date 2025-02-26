import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/start_test/widget/bottomnavbar.dart';
import '../../config/constants/constants.dart';
import '../questions/questions_screen.dart';

class WaitingScreen extends StatelessWidget {
  WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You're in!",
                      style: TextStyle(
                          fontSize: 35,
                          color: AppColors.white,
                          fontFamily: Fonts.gilroyBold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: BottomNavBarName(),
      ),
    );
  }
}
