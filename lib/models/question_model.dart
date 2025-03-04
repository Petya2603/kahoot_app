class Question {
  final int id;
  final String questionText;
  final String q1;
  final String q2;
  final String q3;
  final String q4;
  final String correctAnswer;
  final int timeLimiter;

  Question({
    required this.id,
    required this.questionText,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.correctAnswer,
    required this.timeLimiter,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionText: json['questionText'],
      q1: json['q1'],
      q2: json['q2'],
      q3: json['q3'],
      q4: json['q4'],
      correctAnswer: json['correctAnswer'],
      timeLimiter: json['timeLimiter'],
    );
  }
}
