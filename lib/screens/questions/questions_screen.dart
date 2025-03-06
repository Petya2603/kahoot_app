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
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Obx(() => Text(
                      controller.currentQuestion.questionText,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Obx(() => GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16),
                    children: controller.currentQuestion.options
                        .asMap()
                        .entries
                        .map((entry) {
                      int idx = entry.key;
                      String option = entry.value;
                      Color color;
                      switch (idx % 4) {
                        case 0:
                          color = const Color.fromARGB(255, 9, 89, 203);
                          break;
                        case 1:
                          color = const Color.fromARGB(255, 225, 13, 48);
                          break;
                        case 2:
                          color = const Color.fromARGB(255, 213, 150, 0);
                          break;
                        case 3:
                        default:
                          color = const Color.fromARGB(255, 20, 107, 4);
                          break;
                      }
                      return buildOptionButton(
                        option,
                        option == controller.currentQuestion.correctAnswer,
                        color,
                        idx,
                        controller,
                      );
                    }).toList(),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: BottomNavBarName(
          score: score,
          nickname: nickname,
        ),
      ),
    );
  }
}
