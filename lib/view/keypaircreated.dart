import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rsa_algoriyhm/shareprefences/shared_prefrence.dart';
import 'package:rsa_algoriyhm/view/publickeyqrcode.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/appbarcontainer.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/purplebutton.dart';
import 'package:share/share.dart';
import 'package:sizer/sizer.dart';

// import 'mainencryption.dart';
import 'package:rsa_algoriyhm/view/mainencryption.dart';

class KeyPairCreated extends StatefulWidget {
  const KeyPairCreated({Key? key}) : super(key: key);

  @override
  _KeyPairCreatedState createState() => _KeyPairCreatedState();
}

class _KeyPairCreatedState extends State<KeyPairCreated> {
  Future getFilePath() async {
    // Directory? dir = await getExternalStorageDirectory();
    // print(dir!.path);
    String filePath = '';
    final status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      Directory? appDocumentsDirectory =
          await getApplicationSupportDirectory(); // 1

      String appDocumentsPath = appDocumentsDirectory!.path; // 2

      filePath = '$appDocumentsPath/demoTextFile4.txt'; //
    } else {
      print('denied');
    }

    return filePath;
  }

  void saveFile() async {
    File file = File(await getFilePath()); // 1
    final restlt = await file.writeAsString(UserPrefrences.getPubK()); // 2
    print(restlt);
  }

  var _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: AppBarContainer(),
      appBar: AppBar(
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Key Pair Successfully Created',
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    saveFile();
                    print('saved success');
                    _key.currentState!.showSnackBar(
                        SnackBar(content: Text('backup successfully...')));
                  },
                  child: PurpleButton(
                    tittle: 'BACKUP KEY PAIR',
                    icon: Icons.download,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    Share.share(UserPrefrences.getPubK());
                  },
                  child: PurpleButton(
                    tittle: 'SHARE PUBLIC KEY',
                    icon: Icons.share,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => PublicKeyQRCode())),
                  child: PurpleButton(
                    tittle: 'QR PUBLIC KEY',
                    icon: Icons.qr_code,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                    width: 30.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff000000).withOpacity(0.12),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainEncryption(),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'FINISH',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6200EE),
                              fontSize: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
