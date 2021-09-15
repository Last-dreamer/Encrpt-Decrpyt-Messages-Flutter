import 'dart:io';
import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsa_algoriyhm/encriptionScreen.dart';
import 'package:rsa_algoriyhm/view/createnewkey.dart';
import 'package:rsa_algoriyhm/view/mainencryption.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/purplebutton.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  // void function(String str1, String char) {

  //   final s = str1.characters.where((e) => e.contains(char));
  //   print(s.length);
  // }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? file;
  String? text;
  Future importFile() async {
    // final result = await FilePicker.platform.pickFiles(
    //   allowMultiple: false,
    // );
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'txt'],
    );

    if (result != null) {
      setState(() {
        file = File(result.files.first.path);
        print(file);
      });
      final data = await rootBundle.loadString('${file!.uri}');
      setState(() {
        print('Dataaaaaaa  $data');
        text = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              "The private Key is needed to decrypt or sign.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "The public key can be used by other to verify your identy or encrypt to you",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 6.h,
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => CreateNewKey())),
              child: PurpleButton(
                tittle: 'CREATE NEW KEY PAIR',
                icon: Icons.add,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 28.sp),
              alignment: Alignment.center,
              width: 30.w,
              height: 6.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Colors.grey.shade500.withOpacity(0.8),
                      width: 0.7)),
              child: GestureDetector(
                onTap: () {
                  print('working');
                  importFile();

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => MainEncryption(),
                  //     ));
                },
                child: Text(
                  "IMPORT",
                  style: TextStyle(
                      color: Colors.grey.shade500.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
