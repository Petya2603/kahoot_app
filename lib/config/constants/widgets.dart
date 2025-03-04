import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/config/constants/constants.dart';
import '../../screens/questions/controller/quize_controller.dart';

final QuizeScreenController controller = Get.put(QuizeScreenController());
Widget buildImage(String asset, double width, double height,
    {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(asset, fit: BoxFit.contain),
      ),
    ),
  );
}

Widget nextButton({VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(top: 10),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.orange.withOpacity(0.2),
            spreadRadius: 12,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
        color: AppColors.orange,
        borderRadius: BorderRadii.borderRadius30,
      ),
      child: const Icon(Icons.arrow_forward, color: Colors.white),
    ),
  );
}
