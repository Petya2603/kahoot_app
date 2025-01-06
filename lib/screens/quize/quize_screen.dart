import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/quize/controller/quize_controller.dart';
import '../../config/constants/constants.dart';
import '../../config/constants/widgets.dart';

class QuizeScreen extends StatelessWidget {
  const QuizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizeScreenController controller = Get.put(QuizeScreenController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background,
          title: Row(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Obx(() => Container(
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
                      ),
                    ],
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Question",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Center(
              child: Container(
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
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(Assets.pencil)),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.orange,
                      ),
                    ),
                    const Text(
                      "What is this thing?",
                      style: TextStyle(
                          fontFamily: Fonts.gilroySemiBold,
                          fontSize: 28,
                          color: AppColors.background),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildButton(0, 'Book'),
            const SizedBox(height: 20),
            buildButton(1, 'Pencil'),
            const SizedBox(height: 20),
            buildButton(2, 'Eraser'),
          ],
        ));
  }
}
