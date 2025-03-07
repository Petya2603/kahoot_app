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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.white,
            AppColors.background,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                nickname,
                style: const TextStyle(
                  color: AppColors.background,
                  fontSize: 20.0,
                  fontFamily: Fonts.gilroyBold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: AppColors.yellow,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                score.toString(),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20.0,
                  fontFamily: Fonts.gilroyBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
