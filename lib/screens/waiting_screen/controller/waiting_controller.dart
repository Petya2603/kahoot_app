import 'package:get/get.dart';
import '../../../models/question_next_model.dart';
import '../../../services/question_api_service.dart';
import '../../questions/questions_screen.dart';

class WaitingScreenController extends GetxController {
  final ApiServiceQuestion apiService = ApiServiceQuestion();

  var isLoading = true.obs;

  List<Question> questionsData = [];

  Future<void> fetchQuestions(
    int id,
    int quizID,
    String avatar,
    String nickname,
    int score,
    int questionCount,
  ) async {
    try {
      await getData(quizID);
      filterQuestions();
      sendQuestionsToScreen(id, avatar, nickname, score, quizID, questionCount);
    } catch (e) {
      isLoading.value = false;
      print('Eroorrrr : $e');
    }
  }

  Future<void> getData(int quizID) async {
    final questions = await apiService.getQuestionsByQuizId(quizID);

    if (questions.isNotEmpty) {
      questionsData = questions.map((q) {
        q.isAnswered = false;
        print("Question ID ${q.questionID} ");
        return q;
      }).toList();
    } else {
      isLoading.value = false;
      print('No questions available.');
      return;
    }
  }

  void filterQuestions() {
    questionsData = questionsData.where((q) => q.isAnswered == false).toList();
  }

  void sendQuestionsToScreen(
    int id,
    String avatar,
    String nickname,
    int score,
    int quizID,
    int questionCount,
  ) {
    isLoading.value = false;
    Get.off(QuestionScreen(
      id: id,
      avatar: Uri.parse(avatar).toString(),
      questions: questionsData,
      score: score,
      nickname: nickname,
      quizID: quizID,
      questionCount: questionCount,
    ));
    print("QuestionScreendaky ID $id");
  }
}
