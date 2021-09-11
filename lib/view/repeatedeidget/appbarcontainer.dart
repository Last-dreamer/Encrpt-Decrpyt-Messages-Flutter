import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:rsa_algoriyhm/view/createnewkeypair.dart';
import 'package:rsa_algoriyhm/view/exportpublickey.dart';
import 'package:rsa_algoriyhm/view/importpublickeyfile.dart';
import 'package:rsa_algoriyhm/view/publickeyqrcode.dart';
import 'package:rsa_algoriyhm/view/scanpublickeyqr.dart';
import 'package:rsa_algoriyhm/view/settings.dart';
import 'package:sizer/sizer.dart';

class AppBarContainer extends StatefulWidget {
  @override
  _AppBarContainerState createState() => _AppBarContainerState();
}

class _AppBarContainerState extends State<AppBarContainer> {
  String scanner = 'unknown';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 73.h,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            InkWell(
              child: MenuItem(
                text: 'EXPORT PUBLIC KEY',
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExportPublicKey()));
              },
            ),
            Divider(
              color: Colors.white,
              height: 0.3.h,
            ),
            InkWell(
              child: MenuItem(
                text: 'PUBLIC KEY QR CODE',
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PublicKeyQRCode()));
              },
            ),
            Divider(
              color: Colors.white,
              height: 0.3.h,
            ),
            InkWell(
              child: MenuItem(
                text: 'IMPORT PUBLIC KEY FILE',
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ImportPublicKeyFile()));
              },
            ),
            Divider(
              color: Colors.white,
              height: 0.3.h,
            ),
            InkWell(
              child: MenuItem(
                text: 'SCAN PUBLIC KEY QR',
              ),
              onTap: () async {
                // try {
                //   final qecode = await FlutterBarcodeScanner.scanBarcode(
                //       '#ff6200EE', 'cancle', true, ScanMode.QR);

                //   setState(() {
                //     scanner = qecode;
                //     print(scanner);
                //   });
                // } on PlatformException {
                //   scanner = 'failed to get platform version';
                // }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScanPublicKeyQR(
                              qrcode: scanner,
                            )));
              },
            ),
            Divider(
              color: Colors.white,
              height: 0.3.h,
            ),
            InkWell(
              child: MenuItem(
                text: 'CREATE NEW PUBLIC KEY',
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => CreateNewKeyPair()));
              },
            ),
            Divider(
              color: Colors.white,
              height: 0.3.h,
            ),
            InkWell(
              child: MenuItem(
                text: 'SETTINGS',
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Settings()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      width: 70.w,
      height: 7.h,
      color: Colors.grey[350],
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 25),
        child: Text(
          text!,
          style: TextStyle(fontSize: 14.sp, color: Color(0xff6200EE)),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
