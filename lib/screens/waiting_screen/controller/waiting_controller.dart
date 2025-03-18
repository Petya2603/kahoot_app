import 'package:get/get.dart';
import '../../../models/question_next_model.dart';
import '../../../models/quiz_response.dart';
import '../../../services/question_api_service.dart';
import '../../questions/questions_screen.dart';
import '../../questions/controller/question_controller.dart';

class WaitingScreenController extends GetxController {
  final ApiServiceQuestion apiService = ApiServiceQuestion();
  RxBool isLoading = true.obs;
  RxList<Question> questionsData = <Question>[].obs;
  Set<int> seenQuestionIds = {};

  Future<void> fetchQuestions(QuizResponse quizResponse) async {
    List<Question> newQuestions =
        await apiService.fetchQuestions(quizResponse.quizID);
    newQuestions = newQuestions
        .where((q) => !seenQuestionIds.contains(q.questionID))
        .toList();
    if (newQuestions.isNotEmpty) {
      seenQuestionIds.addAll(newQuestions.map((q) => q.questionID));
      questionsData.addAll(newQuestions);
      sendQuestionsToScreen(quizResponse);
    }
  }

  void sendQuestionsToScreen(QuizResponse quizResponse) {
    isLoading.value = false;
    final QuestionController questionController =
        Get.put(QuestionController(quizResponse: quizResponse));
    questionController.loadQuestions(questionsData);
    Get.to(() => QuestionScreen(quizResponse: quizResponse));
  }
}
