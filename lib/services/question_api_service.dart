import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_next_model.dart';

class ApiServiceQuestion {
  final String baseUrl = "https://quiz.kamilbilim.com/api";

  Future<List<Question>> fetchQuestions(quizId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/questions_next?quizID=$quizId'),
    );
    if (response.statusCode == 200) {
      print('API Response: ${response.body}');
      final dynamic jsonData = jsonDecode(response.body);

      if (jsonData is List) {
        List<Question> questionsData =
            jsonData.map((json) => Question.fromJson(json)).toList();
        return questionsData;
      } else if (jsonData is Map<String, dynamic>) {
        List<Question> questionsData = [Question.fromJson(jsonData)];
        return questionsData;
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
