// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:kahoot_app/screens/waiting_screem/waiting_screen.dart';
// import 'package:kahoot_app/screens/home/widgets/name_textfield.dart';
// import '../../config/constants/constants.dart';
// import '../../config/constants/widgets.dart';
// import '../../services/participant_api_service.dart';

// class StartScreen extends StatefulWidget {
//   const StartScreen({super.key, required this.pinCode, required this.quizId});
//   final String pinCode;
//   final int quizId;
//   @override
//   State<StartScreen> createState() => _StartScreenState();
// }

// class _StartScreenState extends State<StartScreen> {
//   final TextEditingController nameController = TextEditingController();
//   // final ApiServiceParticipant _apiService = ApiServiceParticipant();
//   final _formKey = GlobalKey<FormState>();
//   // Future<void> joinQuiz() async {
//   //   final nickname = nameController.text;

//   //   try {
//   //     await _apiService.joinQuiz(widget.pinCode, nickname);
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => WaitingScreen(quizId: widget.quizId, name: nickname),
//   //       ),
//   //     );
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Failed to join quiz: $e')),
//   //     );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.background,
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Question",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//                 Text(
//                   "25",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: AppColors.background,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 180,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(Assets.starttest),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
//                   decoration: const BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadii.borderRadius40,
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "Enter a nicname to join the quiz!",
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: AppColors.background,
//                               fontFamily: Fonts.gilroyBold),
//                         ),
//                         const SizedBox(height: 15),
//                         NameTextField(
//                           controller: nameController,
//                         ),
//                         const SizedBox(height: 20),
//                         nextButton(
//                           onTap: () {
//                             if (_formKey.currentState!.validate()) {
//                               // joinQuiz();
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
