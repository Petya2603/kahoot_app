import 'package:flutter/material.dart';

import '../../../config/constants/constants.dart';

class ReitingCardScreen extends StatelessWidget {
  const ReitingCardScreen(
      {super.key, required this.name, required this.score, required this.rank});
  final String name;
  final int score;
  final int rank;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.background,
          child: Text(
            "$rank",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        trailing: Text(
          "$score pts",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.background,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
