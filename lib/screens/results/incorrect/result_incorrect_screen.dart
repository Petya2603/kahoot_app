import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/constants/constants.dart';

class ResultIncorrectScreen extends StatelessWidget {
  const ResultIncorrectScreen(
      {super.key,
      required this.nickname,
      required this.score,
      required this.message});
  final int score;
  final String nickname;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Incorrect",
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: Fonts.gilroyBold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SvgPicture.asset(
                  'assets/images/wrong.svg',
                  width: 125,
                  height: 125,
                  colorFilter:
                      const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontFamily: Fonts.gilroyMedium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '+${score.toString()}',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontFamily: Fonts.gilroyMedium,
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
                child: const Text(
                  "Next Question",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontFamily: Fonts.gilroyBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
