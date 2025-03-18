import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../config/constants/constants.dart';
import '../../../models/quiz_response.dart';
import '../../reiting/reiting_screen.dart';
import '../../waiting_screen/controller/waiting_controller.dart';

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
              GestureDetector(
                onTap: () async {
                  if (widget.quizResponse.questionCount == widget.questionID) {
                    Get.to(ReitingScreen(
                      quizResponse: widget.quizResponse,
                    ));
                  } else {
                    (await waitingController
                        .fetchQuestions(widget.quizResponse));
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 206, 7),
                        Color(0xFFB2FF59)
                      ],
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
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.gilroyMedium,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded,
                          color: Colors.white, size: 26),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
