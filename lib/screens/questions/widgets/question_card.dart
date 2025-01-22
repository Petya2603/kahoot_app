import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/constants.dart';
import '../controller/quize_controller.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({super.key});
  final QuizeScreenController controller = Get.put(QuizeScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 260,
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage(Assets.pencil)),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.orange,
              ),
            ),
          ),
          Obx(
            () => Expanded(
              flex: 2,
              child: Text(
                controller.questions[controller.currentQuestionIndex.value],
                style: const TextStyle(
                    fontFamily: Fonts.gilroySemiBold,
                    fontSize: 22,
                    color: AppColors.background),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
