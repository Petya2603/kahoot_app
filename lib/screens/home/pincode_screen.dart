import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kahoot_app/config/constants/constants.dart';
import 'package:kahoot_app/screens/home/widgets/name_textfield.dart';
import 'package:kahoot_app/screens/home/widgets/pin_textfield.dart';
import '../../config/constants/widgets.dart';
import '../../config/dialog/showsnacbar.dart';
import '../../services/participant_api_service.dart';
import '../qr_scan/qr_scan_screen.dart';
import '../waiting_screen/waiting_screen.dart';
import '../../models/quiz_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ParticipantService participantService = ParticipantService();
  Future<void> joinQuiz() async {
    final String nickname = nameController.text;
    final String pinCode = pinController.text;
    try {
      var response = await participantService.joinQuiz(
        nickname: nickname,
        pinCode: pinCode,
      );
      if (response['status'] == 'success') {
        final quizResponse = QuizResponse.fromJson(response['data']);
        Get.to(() => WaitingScreen(
              quizResponse: quizResponse,
            ));
      } else {
        showCustomSnackBar(context, response['message']);
      }
    } catch (e) {
      print(e);
      showCustomSnackBar(context, 'Error: $e');
    }
  }

  Future<void> _scanQRCode() async {
    final scannedPin = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => const QRScanScreen(),
      ),
    );

    if (scannedPin != null) {
      pinController.text = scannedPin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: _scanQRCode,
              icon: const Icon(Icons.qr_code, color: AppColors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.language, color: AppColors.white),
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
                        const SizedBox(height: 10),
                        PinTextfield(controller: pinController),
                        const SizedBox(height: 10),
                        NameTextField(controller: nameController),
                        const SizedBox(height: 15),
                        AnimatedNextButton(onTap: joinQuiz),
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
