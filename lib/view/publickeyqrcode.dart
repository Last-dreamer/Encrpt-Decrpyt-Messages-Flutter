import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:rsa_algoriyhm/view/exportpublickey.dart';
import 'package:rsa_algoriyhm/view/publickeyqrcodetwo.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/appbarcontainer.dart';
import 'package:sizer/sizer.dart';

// import '../publickeyqrcode2.dart';

class PublicKeyQRCode extends StatefulWidget {
  @override
  _PublicKeyQRCodeState createState() => _PublicKeyQRCodeState();
}

class _PublicKeyQRCodeState extends State<PublicKeyQRCode> {
  String? qrcodeString;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppBarContainer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text('PUBLIC KEY QR CODE'),
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
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5.h,
                width: 28.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color(0xff000000).withOpacity(0.12))),
                child: Text(
                  'PART 1/3',
                  style: TextStyle(
                    color: Color(0xff6200EE),
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Container(
                  height: 50.h,
                  width: 60.w,
                  // alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(image: AssetImage('assets/qr1.png')),
                  // ),
                  child: BarcodeWidget(
                      color: Colors.black,
                      data: '$qrcodeString',
                      barcode: Barcode.qrCode())),
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    qrcodeString = value;
                    print(qrcodeString);
                  });
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PublicKeyQRCodeTwo()));
                },
                child: Container(
                  height: 5.h,
                  width: 23.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff000000).withOpacity(0.12))),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      color: Color(0xff6200EE),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
