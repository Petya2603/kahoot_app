import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/constants/constants.dart';
import '../controller/question_controller.dart';
import '../controller/timeController.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.id,
    required this.timeLimiter,
    required this.avatar,
  });
  final int id;
  final int timeLimiter;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    final TimerController timerController =
        Get.put(TimerController(timeLimiter));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(avatar),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Obx(() => LinearProgressIndicator(
                          value: timerController.timelimiter.toDouble() /
                              timeLimiter,
                          backgroundColor: Colors.white,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.orange),
                          minHeight: 8,
                        ))),
                Obx(() => Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "${timerController.timelimiter} s",
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
        Text(
          "Question $id",
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

