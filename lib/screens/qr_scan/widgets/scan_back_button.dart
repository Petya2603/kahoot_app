import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/constants.dart';

class ScanBackButton extends StatelessWidget {
  const ScanBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 83,
            ),
            backgroundColor: AppColors.background,
          ),
          child: const Text(
            "Back",
            style: TextStyle(
              fontSize: 18,
              fontFamily: Fonts.gilroyBold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
