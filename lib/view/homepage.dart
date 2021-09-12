import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rsa_algoriyhm/encriptionScreen.dart';
import 'package:rsa_algoriyhm/view/createnewkey.dart';
import 'package:rsa_algoriyhm/view/mainencryption.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/purplebutton.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainEncryption(),));
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
