import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kahoot_app/config/constants/constants.dart';
import '../../../models/quiz_response.dart';
import '../widgets/next_button.dart';

class ResultIncorrectScreen extends StatefulWidget {
  const ResultIncorrectScreen({
    super.key,
    required this.score,
    required this.message,
    required this.quizResponse,
    required this.questionID,
  });

  final int score;
  final String message;
  final QuizResponse quizResponse;
  final int questionID;

  @override
  ResultIncorrectScreenState createState() => ResultIncorrectScreenState();
}

class ResultIncorrectScreenState extends State<ResultIncorrectScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
    _colorAnimation = ColorTween(begin: Colors.red[200], end: Colors.red[400])
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _colorAnimation.value,
          body: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Incorrect",
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
                      color: Color.fromARGB(255, 237, 22, 6),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/wrong.svg',
                        width: 100,
                        height: 100,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
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
                  const SizedBox(height: 20),
                  NextButton(
                    quizResponse: widget.quizResponse,
                    questionID: widget.questionID,
                    startColor: const Color.fromARGB(255, 237, 22, 6),
                    endColor: const Color.fromARGB(255, 245, 78, 78),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
