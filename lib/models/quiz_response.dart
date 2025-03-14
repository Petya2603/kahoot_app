class QuizResponse {
  final int id;
  final int quizID;
  final String avatar;
  final String nickname;
  final int score;
  final int questionCount;

  QuizResponse({
    required this.id,
    required this.quizID,
    required this.avatar,
    required this.nickname,
    required this.score,
    required this.questionCount,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      id: json['id'],
      quizID: json['quizID'],
      avatar: json['avatar'],
      nickname: json['nickname'],
      score: json['score'],
      questionCount: json['questionCount'],
    );
  }
}
