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
    final QuestionController questionController = Get.put(QuestionController(
      quizResponse: quizResponse,
    ));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: AppBarTitle(
          id: waitingScreenController.questionsData[0].questionID,
          timeLimiter: waitingScreenController.questionsData[0].timeLimiter,
          avatar: quizResponse.avatar,
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.15,
              child: Center(
                child: Obx(() => Text(
                      waitingScreenController.questionsData[0].questionText,
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontFamily: Fonts.gilroyBold,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
            Expanded(
              child: Obx(() => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: screenHeight * 0.015,
                      crossAxisSpacing: screenWidth * 0.03,
                      childAspectRatio: 1,
                    ),
                    itemCount:
                        waitingScreenController.questionsData[0].options.length,
                    itemBuilder: (context, index) {
                      final option = waitingScreenController
                          .questionsData[0].options[index];
                      final isCorrect = option ==
                          waitingScreenController
                              .questionsData[0].correctAnswer;

                      return buildOptionButton(
                        option,
                        isCorrect,
                        colors[index % 4],
                        index,
                        questionController,
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.background,
        child: BottomNavBarName(
          nickname: quizResponse.nickname,
        ),
      ),
    );
  }
}
