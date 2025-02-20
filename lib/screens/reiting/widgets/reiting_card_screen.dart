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
    return ListTile(
      leading: _buildRankCircle(),
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
    );
  }

  Widget _buildRankCircle() {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300]!,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$rank',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
