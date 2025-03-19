class ParticipantResponse {
  final int? id;
  final int? quizID;
  final String avatar;
  final String nickname;
  final int score;

  ParticipantResponse({
    required this.id,
    required this.quizID,
    required this.avatar,
    required this.nickname,
    required this.score,
  });

  factory ParticipantResponse.fromJson(Map<String, dynamic> json) {
    return ParticipantResponse(
      id: json['id'],
      quizID: json['quizID'],
      avatar: json['avatar'],
      nickname: json['nickname'],
      score: json['score'],
    );
  }
}
