import 'package:flutter/material.dart';
import 'package:kahoot_app/screens/questions/widgets/appbar.dart';
import 'package:kahoot_app/screens/questions/widgets/bottom_nav_bar.dart';
import 'package:kahoot_app/screens/questions/widgets/question_card.dart';
import 'package:kahoot_app/screens/questions/widgets/question_option.dart';
import '../../config/constants/constants.dart';

class QuizeScreen extends StatelessWidget {
  const QuizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: AppBarTitle(),
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          children: [
            QuestionCard(),
            const SizedBox(height: 20),
            QuestionOption(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: BottomNavBarNameQuize(),
      ),
    );
  }
}
