import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kahoot_app/screens/results/correct/results_correct_screen.dart';
import '../../../models/question_next_model.dart';
import '../../../models/quiz_response.dart';
import '../../results/incorrect/result_incorrect_screen.dart';
import '../../waiting_screen/controller/waiting_controller.dart';

class QuestionController extends GetxController {
  final QuizResponse quizResponse;
  QuestionController({required this.quizResponse});

  String baseUrl = "https://quiz.kamilbilim.com/api";
  RxBool isAnswered = false.obs;
  RxInt timeSpent = 0.obs;
  late Timer _timer;
  RxBool isLoading = true.obs;
  Rx<Question?> currentQuestion = Rx<Question?>(null);

  final WaitingScreenController waitingScreenController =
      Get.put(WaitingScreenController());

  void _startTimer(int duration) {
    timeSpent.value = duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeSpent.value > 0) {
        timeSpent.value--;
      } else {
        _timer.cancel();
        _onTimeOut();
      }
    });
  }

  void _stopTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  void _onTimeOut() async {
    if (!isAnswered.value) {
      isAnswered.value = true;
      _stopTimer();
      await _submitAnswer("0", currentQuestion.value!.timeLimiter);
      String message = "Time's up!";
      Get.off(() => ResultIncorrectScreen(
            questionID: currentQuestion.value!.questionID,
            score: quizResponse.score,
            message: message,
            quizResponse: quizResponse,
          ));
    }
  }

  Future<void> onAnswerSelected(int selectedIndex) async {
    if (!isAnswered.value && currentQuestion.value != null) {
      isAnswered.value = true;
      _stopTimer();
      String userAnswer = "q${selectedIndex + 1}";
      await _submitAnswer(
          userAnswer, currentQuestion.value!.timeLimiter - timeSpent.value);
    }
  }

  Future<void> _submitAnswer(String userAnswer, int timeSpent) async {
    try {
      final response = await postAnswer(
        participantId: quizResponse.id,
        questionId: currentQuestion.value!.questionID,
        userAnswer: userAnswer,
        timeSpent: timeSpent,
      );
      final isCorrect = response['isCorrect'];
      final scoreques = response['score'];
      final message = response['message'];
      quizResponse.score = scoreques;

      if (isCorrect) {
        Get.off(() => ResultCorrectScreen(
              questionID: currentQuestion.value!.questionID,
              score: scoreques,
              message: message,
              quizResponse: quizResponse,
            ));
      } else {
        Get.off(() => ResultIncorrectScreen(
              questionID: currentQuestion.value!.questionID,
              score: scoreques,
              message: message,
              quizResponse: quizResponse,
            ));
      }
    } catch (e) {
      Get.snackbar('Error', 'Error submitting answer: $e');
    }
  }

  Future<Map<String, dynamic>> postAnswer({
    required int participantId,
    required int questionId,
    required String userAnswer,
    required int timeSpent,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var response = await http.post(
        Uri.parse('$baseUrl/answers'),
        headers: headers,
        body: jsonEncode({
          'participantsID': participantId,
          'questionsID': questionId,
          'userAnswer': userAnswer,
          'timeSpent': timeSpent,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to submit answer');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void loadQuestions(List<Question> questions) {
    if (questions.isNotEmpty) {
      currentQuestion.value = questions.first;
      isAnswered.value = false;
      _startTimer(currentQuestion.value!.timeLimiter);
    }
  }

  @override
  void onClose() {
    _stopTimer();
    super.onClose();
  }
}
