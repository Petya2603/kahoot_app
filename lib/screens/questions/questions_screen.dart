import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/home/widgets/bottomnavbar.dart';
import 'package:kahoot_app/screens/questions/controller/question_controller.dart';
import 'package:kahoot_app/screens/questions/widgets/appbar.dart';
import '../../config/constants/constants.dart';
import '../../models/quiz_response.dart';

import '../waiting_screen/controller/waiting_controller.dart';
import 'widgets/optionbutton.dart';

class QuestionScreen extends StatelessWidget {
  final QuizResponse quizResponse;

  QuestionScreen({
    super.key,
    required this.quizResponse,
  });

  final WaitingScreenController waitingScreenController =
      Get.put(WaitingScreenController());

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final QuestionController questionController =
        Get.put(QuestionController(quizResponse: quizResponse));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: Obx(() {
          final question = questionController.currentQuestion.value;
          if (question == null) {
            return const Text(
              "Loading...",
              style: TextStyle(
                  color: AppColors.white, fontFamily: Fonts.gilroyMedium),
            );
          }
          return AppBarTitle(
              id: question.questionID,
              timeLimiter: questionController.timeSpent.value.toInt(),
              avatar: quizResponse.avatar,
              questionColumn: quizResponse.questionCount);
        }),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Obx(() {
          final question = questionController.currentQuestion.value;
          if (question == null) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          return Column(
            children: [
              SizedBox(
                height: screenHeight * 0.15,
                child: Center(
                  child: Text(
                    question.questionText,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontFamily: Fonts.gilroyBold,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenHeight * 0.015,
                    crossAxisSpacing: screenWidth * 0.03,
                    childAspectRatio: 1,
                  ),
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    final option = question.options[index];
                    return buildOptionButton(
                      option,
                      option == question.correctAnswer,
                      colors[index % 4],
                      index,
                      questionController,
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.background,
        child: BottomNavBarName(
          score: quizResponse.score,
          nickname: quizResponse.nickname,
        ),
      ),
    );
  }
}
