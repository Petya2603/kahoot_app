import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../models/question_next_model.dart';
import '../../waiting_screen/controller/waiting_controller.dart';

class ResultCorrectScreen extends StatefulWidget {
  const ResultCorrectScreen({
    super.key,
    required this.nickname,
    required this.score,
    required this.message,
    required this.questionsr,
    required this.quizIDr,
    required this.scoreqr,
    required this.nicknamer,
    required this.avatarr,
    required this.idr,
    required this.questionCountr,
  });

  final int score;
  final String nickname;
  final String message;
//
  final List<Question> questionsr;
  final int quizIDr;
  final int scoreqr;
  final String nicknamer;
  final String avatarr;
  final int idr;
  final int questionCountr;

  @override
  // ignore: library_private_types_in_public_api
  _ResultCorrectScreenState createState() => _ResultCorrectScreenState();
}

class _ResultCorrectScreenState extends State<ResultCorrectScreen>
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
      begin: Colors.green[300],
      end: const Color.fromARGB(255, 46, 186, 53),
    ).animate(_controller);
  }

  // ignore: non_constant_identifier_names
  final WaitingScreenController waitingScreenController =
      Get.put(WaitingScreenController());
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
                  ElevatedButton(
                    onPressed: () {
                      waitingScreenController.getData(widget.quizIDr);
                      // waitingScreenController.sendQuestionsToScreen();
                      // Get.offAll(() => WaitingScreen(
                      //       quizID: widget.quizIDr,
                      //       avatar: widget.avatarr,
                      //       nickname: widget.nicknamer,
                      //       id: widget.idr,
                      //       score: widget.scoreqr,
                      //       questionCount: widget.questionCountr,
                      //     ));
                    },
                    child: const Text('Sonraki Soru'),
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
