import 'package:get/get.dart';
import '../../../models/question_next_model.dart';
import '../../../models/quiz_response.dart';
import '../../../services/question_api_service.dart';
import '../../questions/questions_screen.dart';

class WaitingScreenController extends GetxController {
  final ApiServiceQuestion apiService = ApiServiceQuestion();
  RxBool isLoading = true.obs;

  RxList<Question> questionsData = <Question>[].obs;

  Future<void> fetchQuestions(QuizResponse quizResponse) async {
    try {
      List<Question> newQuestions =
          await apiService.fetchQuestions(quizResponse.quizID);
      questionsData.addAll(newQuestions);
      sendQuestionsToScreen(quizResponse);
      print('All questions: ${questionsData.length}');
    } catch (e) {
      print(' $e');
    }
  }

  void sendQuestionsToScreen(QuizResponse quizResponse) {
    isLoading.value = false;
    Get.to(QuestionScreen(
      quizResponse: quizResponse,
    ));
    print("QuestionScreendaky ID ${quizResponse.id}");
  }
}
