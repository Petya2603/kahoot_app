import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/questions/controller/quize_controller.dart';
import 'package:kahoot_app/screens/questions/widgets/appbar.dart';
import 'package:kahoot_app/screens/questions/widgets/bottom_nav_bar.dart';
import '../../config/constants/constants.dart';
import '../../models/question_model.dart';
import 'package:kahoot_app/services/question_api_service.dart';
import 'correct_screen.dart';
import 'incorrect_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.questions});
  final List<Question> questions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? _selectedAnswer;
  final QuizeScreenController quizeController =
      Get.put(QuizeScreenController());
  final ApiServiceQuestion _apiService = ApiServiceQuestion();

  @override
  void initState() {
    super.initState();
    quizeController.questions = widget.questions;
    quizeController.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: AppBarTitle(),
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          children: [
            // QuestionCard(question: widget.questions.questionText),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildAnswerButton(widget.questions.first.q1),
                  _buildAnswerButton(widget.questions.first.q2),
                  _buildAnswerButton(widget.questions.first.q3),
                  _buildAnswerButton(widget.questions.first.q4),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: AppColors.white,
        child: BottomNavBarNameQuize(),
      ),
    );
  }

  Widget _buildAnswerButton(String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: _selectedAnswer == null ? () => _selectAnswer(answer) : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedAnswer == answer
              ? (_selectedAnswer == widget.questions.first.correctAnswer
                  ? Colors.green
                  : Colors.red)
              : Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          answer,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  void _selectAnswer(String answer) async {
    setState(() {
      _selectedAnswer = answer;
    });

    final question = widget.questions.first;
    await _apiService.postAnswer(1, question.id, answer, 10);

    if (answer == question.correctAnswer) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CorrectScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IncorrectScreen()),
      );
    }
  }
}
