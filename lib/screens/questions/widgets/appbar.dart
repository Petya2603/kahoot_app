import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../config/constants/constants.dart';
import '../controller/timeController.dart';

class AppBarTitle extends StatefulWidget {
  const AppBarTitle({
    super.key,
    required this.id,
    required this.timeLimiter,
    required this.avatar,
    required this.questionColumn,
  });

  final int id;
  final int timeLimiter;
  final String avatar;
  final int questionColumn;

  @override
  State<AppBarTitle> createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  late TimerController timerController;

  @override
  void initState() {
    super.initState();
    timerController = Get.put(TimerController(widget.timeLimiter));
    timerController.startTimer(); // Timer'ı başlat
  }

  @override
  void dispose() {
    timerController.stopTimer(); // Timer'ı durdur
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatar), // avatar'ı kontrol et
            radius: 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadii.borderRadius10,
                    child: Obx(() {
                      var remainingTime = timerController.timelimiter.value;
                      var totalTime =
                          widget.timeLimiter; // totalTime sabit kalmalı

                      // totalTime sıfırsa veya geçersizse, progressValue'yu 0.0 yap
                      var progressValue =
                          (totalTime > 0) ? (remainingTime / totalTime) : 0.0;

                      // progressValue'yu 0.0 ile 1.0 arasında sınırla
                      if (progressValue > 1.0) {
                        progressValue = 1.0;
                      } else if (progressValue < 0.0) {
                        progressValue = 0.0;
                      }

                      print("Remaining Time: $remainingTime");
                      print("Total Time: $totalTime");
                      print("Progress Value: $progressValue"); // Konsola yazdır

                      Color progressColor;
                      if (remainingTime > 10) {
                        progressColor = AppColors.orange;
                      } else if (remainingTime > 5) {
                        progressColor = const Color.fromARGB(255, 205, 70, 47);
                      } else if (remainingTime > 2) {
                        progressColor = AppColors.red;
                      } else {
                        progressColor = AppColors.white;
                      }

                      print("Progress Color: $progressColor"); // Konsola yazdır

                      return LinearProgressIndicator(
                        value: progressValue,
                        backgroundColor: Colors.white,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(progressColor),
                        minHeight: 8,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${widget.questionColumn} / ${widget.id}",
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.gilroyBold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/timer.svg',
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                        AppColors.white, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 5),
                  Obx(() => Text(
                        "${timerController.timelimiter}s",
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontFamily: Fonts.gilroyRegular,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
