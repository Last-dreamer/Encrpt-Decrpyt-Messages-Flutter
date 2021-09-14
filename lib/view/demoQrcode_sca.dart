import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class QrCodeScreen extends StatefulWidget {
  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Scanner'),
      ),
      body: Column(
        children: [
          BarcodeWidget(
            data: text.text,
            barcode: Barcode.qrCode(),
            color: Colors.white,
          ),
          TextField(
            onSubmitted: (val) {
              setState(() {
                text.text = val;
              });
            },
            controller: text,
          )
        ],
      ),
    );
  }
}
