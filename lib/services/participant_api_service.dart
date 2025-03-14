import 'dart:convert';
import 'package:http/http.dart' as http;

class ParticipantService {
  final String baseUrl = "https://quiz.kamilbilim.com/api";

  Future<dynamic> joinQuiz({
    required String? nickname,
    required String? pinCode,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/participants/join'),
      );

      request.fields.addAll({
        'nickname': nickname ?? '',
        'pinCode': pinCode?.toString() ?? '',
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
}
