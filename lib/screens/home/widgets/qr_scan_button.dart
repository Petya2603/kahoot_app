import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/constants.dart';
import '../../qr_scan/qr_scan_screen.dart';

class QRScanButton extends StatelessWidget {
  const QRScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _scanQRCode();
      },
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
    );
  }

  Future<void> _scanQRCode() async {
    final scanData = await Get.to(() => const QRScanScreen());
    if (scanData != null) {
      if (_validateQRCode(scanData)) {
      } else {
        Get.snackbar('Error', 'Invalid QR code');
      }
    }
  }

  bool _validateQRCode(String scanData) {
    return scanData == 'expected_value';
  }
}
