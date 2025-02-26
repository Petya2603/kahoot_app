import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/start_test/waiting_screen.dart';
import 'package:kahoot_app/screens/start_test/widget/name_textfield.dart';
import '../../config/constants/constants.dart';
import '../../config/constants/widgets.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                  "25",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.starttest),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadii.borderRadius40,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Enter a nicname to join the quiz!",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.background,
                              fontFamily: Fonts.gilroyBold),
                        ),
                        const SizedBox(height: 15),
                        NameTextField(
                          controller: nameController,
                        ),
                        const SizedBox(height: 20),
                        nextButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.to(WaitingScreen());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
