import 'package:flutter/material.dart';

import '../../../config/constants/constants.dart';

class Waiting extends StatelessWidget {
  Waiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bekleyin...',
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.06,
        fontFamily: Fonts.gilroyBold,
        color: AppColors.white,
      ),
      textAlign: TextAlign.center,
    );
    ;
  }
}
