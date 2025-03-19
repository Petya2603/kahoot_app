import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/participant_reiting.dart';

class ApiServiceParticipant {
  final String baseUrl = "https://quiz.kamilbilim.com/api";

  Future<List<ParticipantResponse>> fetchQuestions(int quizId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/participants?quizID=$quizId'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      if (jsonData['data'] is List) {
        List<ParticipantResponse> participantData = (jsonData['data'] as List)
            .map((json) => ParticipantResponse.fromJson(json))
            .toList();
        return participantData;
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
