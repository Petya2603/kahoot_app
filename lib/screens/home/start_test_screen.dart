import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/quize/quize_screen.dart';
import '../../config/constants/constants.dart';
import '../../config/constants/widgets.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, top: 10),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white, width: 3.0),
                color: AppColors.blue,
                borderRadius: BorderRadii.borderRadius50,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.orange),
                        minHeight: 8,
                        value: 0.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Text(
                          "20 s",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontFamily: Fonts.gilroyBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Question",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "25",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: buildImage(Assets.left, 60, 60, onTap: () => Get.back()),
              ),
              Expanded(
                flex: 5,
                child: ClipRRect(
                  child: SizedBox(
                    width: 260,
                    height: 260,
                    child: Image.asset(Assets.starttest, fit: BoxFit.contain),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: buildImage(Assets.right, 60, 60,
                    onTap: () => Get.to(const QuizeScreen())),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Start test",
              style: TextStyle(
                color: AppColors.white,
                fontFamily: Fonts.gilroyBold,
                fontSize: 34,
              ),
            ),
          ),
          const SizedBox(height: 15),
          nextButton(
            onTap: () => Get.to(const QuizeScreen()),
          ),
        ],
      ),
    );
  }
}
