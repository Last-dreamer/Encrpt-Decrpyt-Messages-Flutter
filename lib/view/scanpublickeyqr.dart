import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart' as barcode;
import 'package:rsa_algoriyhm/view/repeatedeidget/appbarcontainer.dart';
import 'package:sizer/sizer.dart';

class ScanPublicKeyQR extends StatefulWidget {
  final String? qrcode;

  ScanPublicKeyQR({this.qrcode});

  @override
  _ScanPublicKeyQRState createState() => _ScanPublicKeyQRState();
}

class _ScanPublicKeyQRState extends State<ScanPublicKeyQR> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  barcode.QRViewController? controller;
  String? result;

  void _onQRViewCreated(barcode.QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code;
        print(result);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppBarContainer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text('SCAN PUBLIC KEY QR'),
        centerTitle: true,
        backgroundColor: Color(0xFF6200EE),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.h),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //   height: 50.h,
            //   width: 85.w,
            //   child: Text(widget.qrcode == null
            //       ? 'Scan the qr code '
            //       : "${widget.qrcode}"),
            // ),
            // // SizedBox(
            // //   height: 2.h,
            // ),
            Container(
                height: 47.h,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Color(0xFF6200EE),
                )),
                width: MediaQuery.of(context).size.width * 0.8,
                child: barcode.QRView(
                    formatsAllowed: [barcode.BarcodeFormat.qrcode],
                    cameraFacing: barcode.CameraFacing.back,
                    overlay: barcode.QrScannerOverlayShape(
                        borderWidth: 2.w,
                        borderColor: Color(0xFF6200EE),
                        cutOutSize: MediaQuery.of(context).size.width * 0.8),
                    overlayMargin: EdgeInsets.all(10),
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated)),
            //     Expanded(
            // flex: 1,
            // child: Center(
            //   child: (result != null)
            //       ? Text(
            //           'Barcode Type: ${BarcodeType.QrCode(result.format)}   Data: ${result.code}')
            //       : Text('Scan a code'),
            // ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 7.h,
              width: 50.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border:
                      Border.all(color: Color(0xff000000).withOpacity(0.12))),
              child: Text(
                result == null ? 'Scan code ' : '$result',
                style: TextStyle(
                    color: Color(0xff6200EE),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 7.h,
              width: 25.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border:
                      Border.all(color: Color(0xff000000).withOpacity(0.12))),
              child: Text(
                'FINISH',
                style: TextStyle(
                    color: Color(0xff6200EE),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
