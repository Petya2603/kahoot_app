import 'package:flutter/material.dart';
import '../../../config/constants/constants.dart';

class ResultIncorrectScreen extends StatelessWidget {
  const ResultIncorrectScreen({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Incorrect Answer",
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: Fonts.gilroyBold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const Text(
                "Better luck next time!",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontFamily: Fonts.gilroyMedium,
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: onNext,
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
