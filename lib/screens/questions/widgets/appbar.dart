import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../config/constants/constants.dart';
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

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Obx(
                      () => LinearProgressIndicator(
                        value: timerController.timelimiter.toDouble() /
                            timeLimiter,
                        backgroundColor: Colors.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.orange),
                        minHeight: 8,
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Text(
                        "${timerController.timelimiter} s",
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontFamily: Fonts.gilroyBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "20 / $id",
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
                  Text(
                    "${timeLimiter}s",
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontFamily: Fonts.gilroyRegular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
