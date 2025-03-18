class Question {
  final String correctAnswer;
  final List<String> options;
  final int questionID;
  final String questionText;
  final int timeLimiter;
  bool? isAnswered;

  Question({
    required this.correctAnswer,
    required this.options,
    required this.questionID,
    required this.questionText,
    required this.timeLimiter,
    this.isAnswered,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      correctAnswer: json['correctAnswer'],
      options: List<String>.from(json['options']),
      questionID: json['questionID'],
      questionText: json['questionText'],
      timeLimiter: json['timeLimiter'],
      isAnswered: json['isAnswered'],
    );
  }
}
