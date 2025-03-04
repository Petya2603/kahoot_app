import 'package:flutter/material.dart';

import '../../../config/constants/constants.dart';

class BottomNavBarName extends StatelessWidget {
  final int score;

  const BottomNavBarName({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          score.toString(),
          style: const TextStyle(
              color: AppColors.background,
              fontSize: 25.0,
              fontFamily: Fonts.gilroyBold),
        ),
      ),
    );
  }
}
