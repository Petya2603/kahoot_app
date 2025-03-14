import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../models/quiz_response.dart';
import '../../waiting_screen/controller/waiting_controller.dart';

class ResultCorrectScreen extends StatelessWidget {
  final int score;
  final String message;
  final QuizResponse quizResponse;

  const ResultCorrectScreen({
    super.key,
    required this.score,
    required this.message,
    required this.quizResponse,
  });

  @override
  Widget build(BuildContext context) {
    final WaitingScreenController waitingController = Get.find();

    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Nice Work!",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GilroyBold',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 206, 7),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/correct.svg',
                    width: 100,
                    height: 100,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'GilroyMedium',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                '+${score.toString()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'GilroyMedium',
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     waitingController.getData(quizResponse.quizID);
              //     if (quizResponse.quizID == 2) {
              //       print('question iddd    $quizResponse.quizID');
              //       waitingController.sendQuestionsToScreen(quizResponse);
              //     } else {
              //       print('question iddd    $quizResponse.quizID');
              //       print('tazeden');
              //     }
              //   },
              //   child: const Text('Next'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
