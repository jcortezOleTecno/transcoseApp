import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vemare/app/view/personal_area/my_orders/bloc/my_orders_cubit.dart';

class QrLector extends StatefulWidget {
  const QrLector({super.key, required this.cubit});
  static const route = '/qrLector';
  final MyOrdersCubit cubit;
  @override
  State<QrLector> createState() => _QrLectorState();
}

class _QrLectorState extends State<QrLector> {

  MobileScannerController cameraController = MobileScannerController();
  bool _isCodeScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: MobileScanner(
                controller: cameraController,
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  if (barcodes.isNotEmpty && !_isCodeScanned){
                    _isCodeScanned = true;
                    widget.cubit.changeTextField(value: barcodes.first.rawValue!);
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
