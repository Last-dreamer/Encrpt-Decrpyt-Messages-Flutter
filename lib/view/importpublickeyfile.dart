import 'package:flutter/material.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/appbarcontainer.dart';
import 'package:sizer/sizer.dart';

class ImportPublicKeyFile extends StatelessWidget {
  const ImportPublicKeyFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 3.h),
              child: Text(
                'IMPORT PUBLIC KEY FILE',
                style: TextStyle(
                  color: Color(0xff6200EE),
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff707070), width: 1),
                borderRadius: BorderRadius.circular(2),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('---- BEGIN PUBLIC KEY ----'),
                    Text(
                      'tx+RGi7N2lUbp728MXGwdnL9od4cItzky/zVdLZE2cycOa18xBK9cOWmcKS\n0A8FYBxEQWJ/q9YVUgZbFKfYGaGQxsER+A0w/fX8ALuk78ktP31K69LcQgxIsl7r\nNzxsoOQKJ/CIxOGMMxczYTiEoLvQhapFQMs3FL96didKr/QbrfB1WT6s3838SEa\nfgZvLef1YB2xmfhbT9OXFE3FXvh2UPBtx+RGi7N2lUbp728MXGwdnL9od4cItzky/zVdLZE2cycOa18xBK9cOWmcKS\n0A8FYBxEQWJ/q9YVUgZbFKfYGaGQxsER+A0w/fX8ALuk78ktP31K69LcQgxIsl7r\nNzxsoOQKJ/CIxOGMMxczYTiEoLvQhapFQMs3FL96didKr/QbrfB1WT6s3838SEaX\nfgZvLef1YB2xmfhbT9OXFE3FXvh2UPB',
                      style: TextStyle(
                        color: Color(0xff323232),
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      '---- END PUBLIC KEY ----',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0.h, left: 4.h),
                  height: 5.5.h,
                  width: 11.h,
                  decoration: BoxDecoration(
                    color: Color(0xff6200EE).withOpacity(0.0),
                    border: Border.all(
                      color: Color(0xff000000).withOpacity(0.12),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'PASTE',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff000000).withOpacity(0.38),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.h, left: 2.h),
                  height: 5.5.h,
                  width: 13.h,
                  decoration: BoxDecoration(
                    color: Color(0xff6200EE).withOpacity(0.0),
                    border: Border.all(
                      color: Color(0xff000000).withOpacity(0.12),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'OPEN',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff000000).withOpacity(0.38),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.h, left: 4.h),
                  height: 5.5.h,
                  width: 15.h,
                  decoration: BoxDecoration(
                    color: Color(0xff6200EE).withOpacity(0.0),
                    border: Border.all(
                      color: Color(0xff000000).withOpacity(0.12),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff000000).withOpacity(0.38),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
