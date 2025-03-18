// ignore_for_file: file_names

import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt timelimiter = 0.obs;

  TimerController(int initialTime) {
    timelimiter.value = initialTime;
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timelimiter.value > 0) {
        timelimiter.value--;
      } else {
        timer.cancel();
      }
    });
  }
}
