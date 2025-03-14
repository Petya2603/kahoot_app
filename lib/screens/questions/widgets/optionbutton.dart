import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/constants/constants.dart';
import '../controller/question_controller.dart';

Widget buildOptionButton(String optionText, bool isCorrect, Color color,
    int index, QuestionController controller) {
  RxBool isTapped = false.obs;
  RxDouble rotation = 0.0.obs;
  RxDouble translationX = 0.0.obs;

  return Obx(() => GestureDetector(
        onTap: () {
          if (!controller.isAnswered) {
            isTapped.value = true;
            rotation.value += 1;
            translationX.value = 10;
            Future.delayed(const Duration(milliseconds: 100), () {
              translationX.value = -10;
            });
            Future.delayed(const Duration(milliseconds: 200), () {
              translationX.value = 5;
            });
            Future.delayed(const Duration(milliseconds: 300), () {
              translationX.value = 0;
            });

            Future.delayed(const Duration(milliseconds: 500), () {
              controller.onAnswerSelected(index);
              isTapped.value = false;
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          height: isTapped.value ? 90 : 70,
          transform: Matrix4.translationValues(translationX.value, 0, 0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isTapped.value
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    )
                  ]
                : [],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 5,
                left: 10,
                child: Obx(() => AnimatedRotation(
                      turns: rotation.value,
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 250),
                        scale: isTapped.value ? 1.5 : 1,
                        child: shapes[index % 4],
                      ),
                    )),
              ),
              Center(
                child: Text(
                  optionText,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: Fonts.gilroyBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ));
}
