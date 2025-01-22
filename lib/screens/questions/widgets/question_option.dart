import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/constants.dart';
import '../controller/quize_controller.dart';

class QuestionOption extends StatelessWidget {
  QuestionOption({super.key});
  final QuizeScreenController controller = Get.put(QuizeScreenController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: List.generate(
          controller.options[controller.currentQuestionIndex.value].length,
          (index) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (controller.selectedButtonIndex.value == -1) {
                    controller.selectedButton(index);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.selectedButtonIndex.value == index
                      ? AppColors.orange
                      : AppColors.background,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 140),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
                child: Text(
                  controller.options[controller.currentQuestionIndex.value]
                      [index],
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontFamily: Fonts.gilroyBold),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
