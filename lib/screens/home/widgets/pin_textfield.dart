import 'package:flutter/material.dart';
import '../../../config/constants/constants.dart';

class PinTextfield extends StatelessWidget {
  const PinTextfield({super.key, this.controller});
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "Enter Pin",
        hintStyle: TextStyle(
          fontSize: 18,
          fontFamily: Fonts.gilroyBold,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.background,
            width: 2.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadii.borderRadius15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadii.borderRadius15,
          borderSide: BorderSide(
            color: AppColors.background,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadii.borderRadius15,
          borderSide: BorderSide(
            color: AppColors.red,
            width: 2.0,
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
          return 'Please enter a pin';
        }
        return null;
      },
    );
  }
}
