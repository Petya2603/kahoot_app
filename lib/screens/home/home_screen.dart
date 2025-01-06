import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/config/constants/constants.dart';
import 'package:kahoot_app/screens/home/start_test_screen.dart';

import '../../config/constants/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _pinController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.white, width: 3.0),
              color: AppColors.blue,
              borderRadius: BorderRadii.borderRadius50,
            ),
          )
        ],
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 225,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.quize),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadii.borderRadius40,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Pin",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: Fonts.gilroyBold,
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _pinController,
                      decoration: const InputDecoration(
                        hintText: "Enter Pin",
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
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadii.borderRadius15,
                          borderSide: BorderSide(
                            color: AppColors.red,
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
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a pin';
                        } else if (value.length != 4) {
                          return 'Pin must be 4 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 83,
                        ),
                        backgroundColor: AppColors.background,
                      ),
                      child: const Text(
                        "Scan QR code",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: Fonts.gilroyBold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          nextButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                Get.to(const StartScreen());
              }
            },
          ),
        ],
      ),
    );
  }
}
