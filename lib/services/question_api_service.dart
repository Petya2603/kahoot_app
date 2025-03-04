import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class ApiServiceQuestion {
  final String baseUrl = "https://quiz.kamilbilim.com/api";
  final token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDA5OTY0OTcsInVzZXJfaWQiOjN9.TDYVVwLx5Bl78f6Fkl2XdOU2XNLJkri1SAwAYcEz4Ew";
  Future<List<Question>> getQuestionsByQuizId(int quizId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/questions?quizID=$quizId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print('');

    print('Questions Response: ${response.statusCode}');
    print('Questions Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Question.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }

  Future<void> postAnswer(int participantId, int questionId, String userAnswer,
      int timeSpent) async {
    final response = await http.post(
      Uri.parse('$baseUrl/answers'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'participantsID': participantId.toString(),
        'questionsID': questionId.toString(),
        'userAnswer': userAnswer,
        'timeSpent': timeSpent.toString(),
      },
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to post answer');
    }
  }
}
