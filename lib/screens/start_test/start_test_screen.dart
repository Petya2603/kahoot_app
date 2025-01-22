import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/screens/questions/questions_screen.dart';
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
                      child: const LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.orange),
                        minHeight: 8,
                        value: 0.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Text(
                          "20 s",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontFamily: Fonts.gilroyBold,
                          ),
                        ),
                      ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: buildImage(Assets.left, 60, 60,
                        onTap: () => Get.back()),
                  ),
                  Expanded(
                    flex: 5,
                    child: ClipRRect(
                      child: SizedBox(
                        width: 240,
                        height: 240,
                        child:
                            Image.asset(Assets.starttest, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildImage(Assets.right, 60, 60,
                        onTap: () => Get.to(const QuizeScreen())),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  "Start test",
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: Fonts.gilroyBold,
                    fontSize: 34,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Enter Name",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.background,
                      fontFamily: Fonts.gilroyBold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.background,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadii.borderRadius15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadii.borderRadius15,
                      borderSide: BorderSide(
                        color: AppColors.background,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              nextButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(const QuizeScreen());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
