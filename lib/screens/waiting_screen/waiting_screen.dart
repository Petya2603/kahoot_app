import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/home/widgets/bottomnavbar.dart';
import 'package:kahoot_app/screens/waiting_screen/controller/waiting_controller.dart';
import '../../config/constants/constants.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({
    super.key,
    required this.quizID,
    required this.avatar,
    required this.nickname,
    required this.id,
    required this.score,
    required this.questionCount,
  });
  final int id;
  final int quizID;
  final String avatar;
  final String nickname;
  final int score;
  final int questionCount;

  @override
  Widget build(BuildContext context) {
    final WaitingScreenController controller =
        Get.put(WaitingScreenController());

    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!controller.isLoading.value) {
        timer.cancel();
      } else {
        controller.fetchQuestions(
            id, quizID, avatar, nickname, score, questionCount);
      }
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nickname,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontFamily: Fonts.gilroyBold,
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(avatar),
              radius: 25,
            ),
          ],
        ),
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
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Obx(() => controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Questions are loading...',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontFamily: Fonts.gilroyBold),
                            )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.background,
        child: BottomNavBarName(
          nickname: nickname,
        ),
      ),
    );
  }
}
