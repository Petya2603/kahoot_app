import 'package:flutter/material.dart';
import '../../../config/constants/constants.dart';
import '../../../models/quiz_response.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final QuizResponse quizResponse;

  const CustomAppBar({super.key, required this.quizResponse});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            quizResponse.nickname,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontFamily: Fonts.gilroyBold,
            ),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(quizResponse.avatar),
            radius: 25,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
