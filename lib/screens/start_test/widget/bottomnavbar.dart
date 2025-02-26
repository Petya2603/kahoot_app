import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/constants.dart';
import '../../questions/questions_screen.dart';

class BottomNavBarName extends StatelessWidget {
  const BottomNavBarName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          onTap: () {
            Get.to(QuizeScreen());
          },
          child: Text(
            "Perman",
            style: TextStyle(
                color: AppColors.background,
                fontSize: 25.0,
                fontFamily: Fonts.gilroyBold),
          ),
        ),
      ),
    );
  }
}
