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
    );
  }
}
