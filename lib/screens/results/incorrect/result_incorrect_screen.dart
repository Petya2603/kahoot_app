import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/models/question_next_model.dart';

import '../../questions/controller/question_controller.dart';

class ResultIncorrectScreen extends StatefulWidget {
  const ResultIncorrectScreen({
    super.key,
    required this.nickname,
    required this.score,
    required this.message, required List<Question> questionsr, required int quizIDr, required int scoreqr, required String nicknamer, required String avatarr, required int idr, required int questionCountr,
  });

  final int score;
  final String nickname;
  final String message;

  @override
  // ignore: library_private_types_in_public_api
  _ResultIncorrectScreenState createState() => _ResultIncorrectScreenState();
}

class _ResultIncorrectScreenState extends State<ResultIncorrectScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.red[200],
      end: Colors.red[400],
    ).animate(_controller);
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
                      fontFamily: 'GilroyMedium',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '+${widget.score.toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'GilroyMedium',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     final QuestionController controller = Get.find();
                  //     await controller.fetchNextQuestion();
                  //     Get.back();
                  //   },
                  //   child: const Text('Next Question'),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
