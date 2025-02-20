import 'package:flutter/material.dart';
import 'package:kahoot_app/screens/reiting/widgets/reiting_card_screen.dart';

import '../../config/constants/constants.dart';

class ReitingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> scores;

  const ReitingScreen({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    scores.sort((a, b) => b['score'].compareTo(a['score']));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.background,
      body: ListView.builder(
        itemCount: scores.length,
        itemBuilder: (context, index) {
          final score = scores[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100]!,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ReitingCardScreen(
                rank: index + 1, name: score['name'], score: score['score']),
          );
        },
      ),
    );
  }
}
