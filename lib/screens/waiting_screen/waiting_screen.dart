import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/home/widgets/bottomnavbar.dart';
import 'package:kahoot_app/screens/waiting_screen/controller/waiting_controller.dart';
import '../../config/constants/constants.dart';
import '../../models/quiz_response.dart';
import '../questions/questions_screen.dart';
import 'widget/appbar.dart';

class WaitingScreen extends StatefulWidget {
  final QuizResponse quizResponse;

  const WaitingScreen({super.key, required this.quizResponse});

  @override
  // ignore: library_private_types_in_public_api
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  final WaitingScreenController controller = Get.put(WaitingScreenController());

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!controller.isLoading.value) {
        timer.cancel();
      } else {
        controller.fetchQuestions(widget.quizResponse).then((_) {
          if (controller.questionsData.isNotEmpty) {
            Get.to(() => QuestionScreen(quizResponse: widget.quizResponse));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(quizResponse: widget.quizResponse),
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
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
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.background,
        child: BottomNavBarName(
          nickname: widget.quizResponse.nickname,
        ),
      ),
    );
  }
}
