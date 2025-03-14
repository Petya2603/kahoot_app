import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_next_model.dart';

class ApiServiceQuestion {
  final String baseUrl = "https://quiz.kamilbilim.com/api";

  Future<List<Question>> getQuestionsByQuizId(int quizId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/questions_next?quizID=$quizId'),
    );

    if (response.statusCode == 200) {
      try {
        final dynamic questionData = jsonDecode(response.body);
        if (questionData is List) {
          return questionData.map((q) => Question.fromJson(q)).toList();
        } else if (questionData is Map<String, dynamic>) {
          return [Question.fromJson(questionData)];
        } else {
          throw Exception('Unexpected response format');
        }
      } catch (e) {
        throw Exception('Failed to parse question data: $e');
      }
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
