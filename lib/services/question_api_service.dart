import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_next_model.dart';

class ApiServiceQuestion {
  final String baseUrl = "https://quiz.kamilbilim.com/api";

  Future<List<Question>> getQuestionsByQuizId(int quizId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/questions_next?quizID=$quizId'),
    );
    print('Questions Response: ${response.statusCode}');
    print('Questions Body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> questionData = jsonDecode(response.body);
        return [Question.fromJson(questionData)];
      } catch (e) {
        throw Exception('Failed to parse question data: $e');
      }
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
