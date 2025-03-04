class Participant {
  final String nickname;
  final String pinCode;

  Participant({
    required this.nickname,
    required this.pinCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'pinCode': pinCode,
    };
  }
}
