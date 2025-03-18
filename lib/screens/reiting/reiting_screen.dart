import 'package:flutter/material.dart';

import '../../config/constants/constants.dart';
import '../../models/quiz_response.dart';

class ReitingScreen extends StatelessWidget {
  const ReitingScreen({super.key, required this.quizResponse});

  final QuizResponse quizResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: const Text('Reintg'),
      ),
      backgroundColor: AppColors.background,
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100]!,
                borderRadius: BorderRadii.borderRadius20,
              ),
            );
          }),
    );
  }
}
