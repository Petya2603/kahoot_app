import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kahoot_app/models/question_next_model.dart';
import 'package:kahoot_app/screens/results/correct/results_correct_screen.dart';
import 'package:kahoot_app/screens/results/incorrect/result_incorrect_screen.dart';

class QuestionController extends GetxController {
  final List<Question> questions;
  final int quizID;
  final int score;
  final String nickname;
  final String avatar;
  final int id;

  QuestionController({
    required this.questions,
    required this.quizID,
    required this.score,
    required this.nickname,
    required this.avatar,
    required this.id,
  });

  final String baseUrl = "https://quiz.kamilbilim.com/api";
  final _currentQuestionIndex = 0.obs;
  final _isAnswered = false.obs;
  final _timeSpent = 0.obs;
  late Timer _timer;

  Question get currentQuestion => questions[_currentQuestionIndex.value];
  bool get isAnswered => _isAnswered.value;
  int get timeSpent => _timeSpent.value;

  @override
  void onInit() {
    super.onInit();
    _timeSpent.value = currentQuestion.timeLimiter;
    _startTimer();
  }

  void _startTimer() {
    _timeSpent.value = currentQuestion.timeLimiter;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeSpent.value > 0) {
        _timeSpent.value--;
      } else {
        _timer.cancel();
        _onTimeOut();
      }
    });
  }

  void _onTimeOut() {
    if (!_isAnswered.value) {
      _isAnswered.value = true;
      Get.offAll(() => ResultIncorrectScreen(
            nickname: nickname,
            score: score,
            message: 'Time is up!',
          ));
    }
  }

  Future<void> onAnswerSelected(int selectedIndex) async {
    if (!_isAnswered.value) {
      _isAnswered.value = true;
      _timer.cancel();
      String userAnswer = "q${selectedIndex + 1}";

      try {
        final response = await postAnswer(
          participantId: id,
          questionId: currentQuestion.questionID,
          userAnswer: userAnswer,
          timeSpent: currentQuestion.timeLimiter - _timeSpent.value,
        );

        final isCorrect = response['isCorrect'];
        final scoreques = response['score'];
        final message = response['message'];

        if (isCorrect) {
          Get.offAll(() => ResultCorrectScreen(
                score: scoreques,
                nickname: nickname,
                message: message,
              ));
        } else {
          Get.offAll(() => ResultIncorrectScreen(
                score: scoreques,
                nickname: nickname,
                message: message,
              ));
        }
      } catch (e) {
        print('Exception: $e');
        Get.snackbar('Error', 'Error submitting answer: $e',
            snackPosition: SnackPosition.BOTTOM);
      }
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
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/answers'),
      );

      request.fields.addAll({
        'participantsID': participantId.toString(),
        'questionsID': questionId.toString(),
        'userAnswer': userAnswer,
        'timeSpent': timeSpent.toString(),
      });

      request.headers.addAll(headers);

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(responseBody);
      } else {
        var errorResponse = jsonDecode(responseBody);
        String errorMessage = errorResponse['errorMessage'] ?? 'Unknown error';

        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
