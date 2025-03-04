import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kahoot_app/screens/home/widgets/bottomnavbar.dart';
import '../../config/constants/constants.dart';
import '../../models/question_model.dart';
import '../../services/question_api_service.dart';
import '../questions/questions_screen.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({
    super.key,
    required this.quizID,
    required this.avatar,
    required this.nickname,
    required this.score,
  });
  final int quizID;
  final String avatar;
  final String nickname;
  final int score;

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  final ApiServiceQuestion _apiService = ApiServiceQuestion();
  List<Question> _questions = [];
  bool _isLoading = true;
  Future<void> _fetchQuestions() async {
    try {
      final questions = await _apiService.getQuestionsByQuizId(widget.quizID);
      if (questions.isNotEmpty) {
        setState(() {
          _questions = questions;
          _isLoading = false;
        });
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreen(questions: _questions),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _fetchQuestions();
    });
    Timer.periodic(const Duration(seconds: 3), (timer) {
      _fetchQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.nickname,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontFamily: Fonts.gilroyBold,
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.avatar),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You're in!",
                      style: TextStyle(
                          fontSize: 35,
                          color: AppColors.white,
                          fontFamily: Fonts.gilroyBold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Questions are loading...',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontFamily: Fonts.gilroyBold),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: BottomNavBarName(score: widget.score),
      ),
    );
  }
}
