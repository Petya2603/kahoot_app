import 'dart:ui';

import 'package:flutter/material.dart';

import '../controller/question_controller.dart';

Widget buildOptionButton(String optionText, bool isCorrect, Color color,
    int index, QuestionController controller) {
  return GestureDetector(
    onTap: () {
      if (!controller.isAnswered) {
        controller.onAnswerSelected(index);
      }
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            optionText,
            style: const TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
