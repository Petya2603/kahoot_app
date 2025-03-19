import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../config/constants/constants.dart';
import '../../../models/quiz_response.dart';
import '../../waiting_screen/controller/waiting_controller.dart';
import '../widgets/next_button.dart';

class ResultCorrectScreen extends StatefulWidget {
  final int score;
  final String message;
  final QuizResponse quizResponse;
  final int questionID;
  const ResultCorrectScreen({
    super.key,
    required this.score,
    required this.message,
    required this.quizResponse,
    required this.questionID,
  });

  @override
  State<ResultCorrectScreen> createState() => _ResultCorrectScreenState();
}

class _ResultCorrectScreenState extends State<ResultCorrectScreen> {
  final WaitingScreenController waitingController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                  fontFamily: Fonts.gilroyBold,
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
                widget.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: Fonts.gilroyMedium,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                '+${widget.score.toString()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: Fonts.gilroyMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              NextButton(
                quizResponse: widget.quizResponse,
                questionID: widget.questionID,
                startColor: const Color.fromARGB(255, 0, 206, 7),
                endColor: const Color(0xFFB2FF59),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
