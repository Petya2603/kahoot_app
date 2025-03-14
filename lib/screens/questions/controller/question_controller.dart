import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kahoot_app/screens/results/correct/results_correct_screen.dart';
import '../../../models/quiz_response.dart';
import '../../waiting_screen/controller/waiting_controller.dart';

class QuestionController extends GetxController {
  final QuizResponse quizResponse;

  QuestionController({
    required this.quizResponse,
  });

  String baseUrl = "https://quiz.kamilbilim.com/api";
  RxBool isAnswered = false.obs;
  RxInt timeSpent = 0.obs;
  late Timer _timer;
  RxBool isLoading = true.obs;

  final WaitingScreenController waitingScreenController =
      Get.put(WaitingScreenController());

  @override
  void onInit() async {
    super.onInit();
    timeSpent.value = waitingScreenController.questionsData[0].timeLimiter;
    _startTimer();
  }

  void _startTimer() {
    timeSpent.value = waitingScreenController.questionsData[0].timeLimiter;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeSpent.value > 0) {
        timeSpent.value--;
      } else {
        _timer.cancel();
        _onTimeOut();
      }
    });
  }

  void _onTimeOut() {
    if (!isAnswered.value) {
      isAnswered.value = true;
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

  Future<void> onAnswerSelected(int selectedIndex) async {
    if (!isAnswered.value) {
      isAnswered.value = true;
      _timer.cancel();
      String userAnswer = "q${selectedIndex + 1}";

      try {
        final response = await postAnswer(
          participantId: quizResponse.id,
          questionId: waitingScreenController.questionsData[0].questionID,
          userAnswer: userAnswer,
          timeSpent: timeSpent.value,
        );

        final isCorrect = response['isCorrect'];
        final scoreques = response['score'];
        final message = response['message'];

        if (isCorrect) {
          Get.offAll(() => ResultCorrectScreen(
                score: scoreques,
                message: message,
                quizResponse: quizResponse,
              ));
        } else {
          // Get.offAll(() => ResultIncorrectScreen(
          //       score: scoreques,
          //       nickname: quizResponse.nickname,
          //       message: message,
          //     ));
        }
      } catch (e) {
        print('erorrr $e');
        Get.snackbar('Error', 'Error submitting answer: $e',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
