import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/constants.dart';
import '../controller/quize_controller.dart';

class AppBarTitle extends StatelessWidget {
  AppBarTitle({super.key});
  final QuizeScreenController controller = Get.put(QuizeScreenController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Obx(() => LinearProgressIndicator(
                        value: controller.progressValue.value,
                        backgroundColor: Colors.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.orange),
                        minHeight: 8,
                      )),
                ),
                Obx(() => Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "${controller.remainingSeconds.value} s",
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontFamily: Fonts.gilroyBold),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Obx(
          () => Text(
            "${controller.currentQuestionIndex.value + 1} of ${controller.questions.length}",
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
