import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/config/constants/constants.dart';
import 'package:kahoot_app/screens/home/widgets/pin_textfield.dart';
import 'package:kahoot_app/screens/home/widgets/qr_scan_button.dart';
import 'package:kahoot_app/screens/start_test/start_test_screen.dart';

import '../../config/constants/widgets.dart';
import '../qr_scan/qr_scan_screen.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: AppColors.white)),
              child: IconButton(
                  onPressed: () async {
                    await _scanQRCode();
                  },
                  icon: Icon(
                    Icons.qr_code,
                    color: AppColors.white,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: AppColors.white)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.language,
                    color: AppColors.white,
                  )),
            )
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
                      image: AssetImage(Assets.quize),
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
                      children: [
                        const Text(
                          "Enter the PIN you see on the big screen.",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.background,
                              fontFamily: Fonts.gilroyBold),
                        ),
                        const SizedBox(height: 15),
                        PinTextfield(
                          controller: pinController,
                        ),
                        const SizedBox(height: 20),
                        nextButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.off(StartScreen());
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

  Future<void> _scanQRCode() async {
    final scanData = await Get.to(() => const QRScanScreen());
    if (scanData != null) {
      if (_validateQRCode(scanData)) {
        Get.to(StartScreen());
      } else {
        Get.snackbar('Error', 'Invalid QR code');
      }
    }
  }

  bool _validateQRCode(String scanData) {
    return scanData == 'expected_value';
  }
}
