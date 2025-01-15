import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/config/constants/constants.dart';
import 'package:kahoot_app/screens/home/widgets/pin_textfield.dart';
import 'package:kahoot_app/screens/home/widgets/qr_scan_button.dart';
import 'package:kahoot_app/screens/start_test/start_test_screen.dart';

import '../../config/constants/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 225,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.quize),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
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
                          ),
                        ),
                        const SizedBox(height: 15),
                        PinTextfield(
                          controller: pinController,
                        ),
                        const SizedBox(height: 20),
                        nextButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.to(StartScreen());
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const QRScanButton(),
                        const SizedBox(height: 15),
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
