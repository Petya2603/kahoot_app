import 'package:flutter/material.dart';
import '../../../config/constants/constants.dart';

class BottomNavBarNameQuize extends StatelessWidget {
  const BottomNavBarNameQuize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          "Perman",
          style: TextStyle(
              color: AppColors.background,
              fontSize: 25.0,
              fontFamily: Fonts.gilroyBold),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.black,
            shape: BoxShape.rectangle,
          ),
          child: Text(
            "100",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: Fonts.gilroyBold),
          ),
        ),
      ]),
    );
  }
}
