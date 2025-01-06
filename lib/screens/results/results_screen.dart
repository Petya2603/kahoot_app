import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/quize/quize_screen.dart';
import '../../config/constants/constants.dart';
import '../../config/constants/widgets.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Nice Work",
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: Fonts.gilroyBold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 20),
              const Image(image: AssetImage(Assets.check)),
              const SizedBox(height: 20),
              const Text(
                "You Earned 10 pts",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontFamily: Fonts.gilroyMedium,
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(const QuizeScreen()); // Use Get.offAll for better performance
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
                child: const Text(
                  "Next Stage",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontFamily: Fonts.gilroyBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
