import 'package:get/get.dart';
import 'dart:async';
import '../../reiting/reiting_screen.dart';
import '../../results/correct/results_correct_screen.dart';
import '../../results/incorrect/result_incorrect_screen.dart';

class QuizeScreenController extends GetxController {
  var progressValue = 1.0.obs;
  var remainingSeconds = 20.obs;
  Timer? _timer;
  var selectedButtonIndex = (-1).obs;
  var currentQuestionIndex = 0.obs;
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
    if (currentQuestionIndex.value >= questions.length) {
      _timer?.cancel();
      return;
    }
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
        progressValue.value = remainingSeconds.value / 20;
      } else {
        _timer?.cancel();
        Get.offAll(() => ResultIncorrectScreen(onNext: _goToNextQuestion));
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void selectedButton(int index) {
    _timer?.cancel();
    selectedButtonIndex.value = index;
    if (_validateAnswer(index)) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.to(() => ResultCorrectScreen(onNext: _goToNextQuestion));
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Get.to(() => ResultIncorrectScreen(onNext: _goToNextQuestion));
      });
    }
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedButtonIndex.value = -1;
      remainingSeconds.value = 20;
      _startTimer();
      Get.back();
    } else {
      _timer?.cancel();
      Get.offAll(() => const ReitingScreen());
    }
  }

  bool _validateAnswer(int selectedIndex) {
    return selectedIndex == correctAnswerIndex[currentQuestionIndex.value];
  }
}
