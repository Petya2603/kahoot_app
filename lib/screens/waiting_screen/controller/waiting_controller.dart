import 'package:get/get.dart';

import '../../../config/dialog/showsnacbar.dart';
import '../../../services/question_api_service.dart';
import '../../questions/questions_screen.dart';

class WaitingScreenController extends GetxController {
  final ApiServiceQuestion _apiService = ApiServiceQuestion();
  var isLoading = true.obs;

  void fetchQuestions(
      int quizID, String avatar, String nickname, int score, int id) async {
    try {
      final questions = await _apiService.getQuestionsByQuizId(quizID);
      if (questions.isNotEmpty) {
        isLoading.value = false;
        Get.off(QuestionScreen(
            avatar: avatar,
            questions: questions,
            score: score,
            nickname: nickname,
            quizID: quizID,
            id: id));
      }
    } catch (e) {
      isLoading.value = false;
      showCustomSnackBar(Get.context!, 'Error: $e');
    }
  }
}
