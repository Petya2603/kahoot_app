import 'package:flutter/material.dart';

import '../../config/constants/constants.dart';

class ReitingScreen extends StatelessWidget {
  const ReitingScreen({super.key, required this.score, required this.nickname});
  final int score;
  final String nickname;

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
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
    );
  }
}
