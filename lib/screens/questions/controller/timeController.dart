import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  final RxInt timelimiter;
  Timer? _timer;

  TimerController(int initialTime) : timelimiter = initialTime.obs;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timelimiter.value > 0) {
        timelimiter.value--;
        print("Remaining Time: ${timelimiter.value}"); // Konsola yazdır
      } else {
        _timer?.cancel(); // Timer'ı durdur
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    _timer?.cancel(); // Widget dispose olduğunda timer'ı temizle
    super.onClose();
  }
}
