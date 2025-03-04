import 'package:flutter/material.dart';
import 'package:kahoot_app/config/constants/constants.dart';
import 'package:kahoot_app/screens/home/widgets/name_textfield.dart';
import 'package:kahoot_app/screens/home/widgets/pin_textfield.dart';
import '../../config/constants/widgets.dart';
import '../../services/participant_api_service.dart';
import '../qr_scan/qr_scan_screen.dart';
import '../waiting_screem/waiting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WaitingScreen(
              quizID: response['data']['quizID'],
              avatar: response['data']['avatar'],
              nickname: response['data']['nickname'],
              score: response['data']['score'],
            ),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Eror: $e')),
      );
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
                        const SizedBox(height: 15),
                        PinTextfield(controller: pinController),
                        const SizedBox(height: 10),
                        NameTextField(controller: nameController),
                        const SizedBox(height: 20),
                        nextButton(onTap: joinQuiz),
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
