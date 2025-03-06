import 'package:flutter/material.dart';

import '../../../config/constants/constants.dart';

class BottomNavBarName extends StatelessWidget {
  final int score;
  final String nickname;

  const BottomNavBarName({
    super.key,
    required this.score,
    required this.nickname,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        nickname,
        style: const TextStyle(
            color: AppColors.background,
            fontSize: 25.0,
            fontFamily: Fonts.gilroyBold),
      ),
      Text(
        score.toString(),
        style: const TextStyle(
            color: AppColors.background,
            fontSize: 25.0,
            fontFamily: Fonts.gilroyBold),
      ),
    ]);
  }
}
