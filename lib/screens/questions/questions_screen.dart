import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/questions/widgets/appbar.dart';
import '../../config/constants/constants.dart';
import '../../models/question_next_model.dart';
import '../home/widgets/bottomnavbar.dart';
import 'package:kahoot_app/screens/questions/controller/question_controller.dart';
import 'widgets/optionbutton.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    super.key,
    required this.questions,
    required this.score,
    required this.nickname,
    required this.quizID,
    required this.id,
    required this.avatar,
  });

  final int id;
  final List<Question> questions;
  final int quizID;
  final int score;
  final String nickname;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    final QuestionController controller = Get.put(QuestionController(
      questions: questions,
      score: score,
      nickname: nickname,
      quizID: quizID,
      id: id,
      avatar: avatar,
    ));

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: Obx(() => AppBarTitle(
              id: controller.currentQuestion.questionID,
              timeLimiter: controller.currentQuestion.timeLimiter,
              avatar: avatar,
            )),
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
              height: screenHeight * 0.25,
              child: Center(
                child: Obx(() => Text(
                      controller.currentQuestion.questionText,
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                    itemCount: controller.currentQuestion.options.length,
                    itemBuilder: (context, index) {
                      String option = controller.currentQuestion.options[index];
                      return buildOptionButton(
                        option,
                        option == controller.currentQuestion.correctAnswer,
                        colors[index % 4],
                        index,
                        controller,
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
          score: score,
          nickname: nickname,
        ),
      ),
    );
  }
}
