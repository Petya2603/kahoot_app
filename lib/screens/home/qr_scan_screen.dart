// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import '../../config/constants/constants.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: AppColors.background,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 83,
                  ),
                  backgroundColor: AppColors.background,
                ),
                child: const Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: Fonts.gilroyBold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      Get.back(result: scanData.code);
    });
  }
}
