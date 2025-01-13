import 'package:get/get.dart';
import 'dart:async';
import '../../results/results_screen.dart'; // Import the results screen

class QuizeScreenController extends GetxController {
  var progressValue = 1.0.obs;
  var remainingSeconds = 20.obs;
  Timer? _timer;
  var selectedButtonIndex = (-1).obs;
  List<String> questions = [
    "What is this thing?",
    "What is the capital of France?",
    "What is 2+2?"
  ];
  List<List<String>> options = [
    ["Book", "Pencil", "Eraser"],
    ["Paris", "London", "Berlin"],
    ["3", "4", "5"],
  ];
  List<int> correctAnswerIndex = [1, 0, 1];
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

  void selectButton(int index, int questionIndex) {
    selectedButtonIndex.value = index;
    if (_validateAnswer(index, questionIndex)) {
      Get.to(const ResultsScreen());
    } else {
      Get.offAll(const ResultsScreen());
    }
  }

  bool _validateAnswer(int selectedIndex, int questionIndex) {
    return selectedIndex == correctAnswerIndex[questionIndex];
  }
}
