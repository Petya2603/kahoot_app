import 'package:get/get.dart';
import 'dart:async';
import '../../results/results_screen.dart'; // Import the results screen

class QuizeScreenController extends GetxController {
  var progressValue = 1.0.obs;
  var remainingSeconds = 20.obs;
  Timer? _timer;
  var selectedButtonIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
        progressValue.value = remainingSeconds.value / 20;
      } else {
        _timer?.cancel();
        Get.offAll(const ResultsScreen());
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void selectButton(int index) {
    selectedButtonIndex.value = index;
  }
}
