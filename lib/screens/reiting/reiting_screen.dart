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
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: scores.length,
                itemBuilder: (context, index) {
                  final score = scores[index];
                  return ReitingCardScreen(
                      rank: index + 1,
                      name: score['name'],
                      score: score['score']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
