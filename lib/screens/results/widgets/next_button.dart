import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/constants/constants.dart';
import '../../../models/quiz_response.dart';
import '../../reiting/reiting_screen.dart';
import '../../waiting_screen/controller/waiting_controller.dart';

class NextButton extends StatelessWidget {
  final QuizResponse quizResponse;
  final int questionID;
  final Color startColor;
  final Color endColor;

  const NextButton({
    super.key,
    required this.quizResponse,
    required this.questionID,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    final WaitingScreenController waitingController = Get.find();
    return GestureDetector(
      onTap: () async {
        if (quizResponse.questionCount == questionID) {
          Get.to(ReitingScreen(quizID: quizResponse.quizID));
        } else {
          waitingController.questionsData.clear();
          await waitingController.fetchQuestions(quizResponse);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 180,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadii.borderRadius15,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: Fonts.gilroyBold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 26),
          ],
        ),
      ),
    );
  }
}
