import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rsa_algoriyhm/view/creatingnewkeypair.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/appbarcontainer.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/purplebutton.dart';
import 'package:sizer/sizer.dart';

import 'createnewkey.dart';

class CreateNewKeyPair extends StatefulWidget {
  const CreateNewKeyPair({Key? key}) : super(key: key);

  @override
  _CreateNewKeyPairState createState() => _CreateNewKeyPairState();
}

class _CreateNewKeyPairState extends State<CreateNewKeyPair> {
  bool ischeck = false;
  Object bitsValues = 2048;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppBarContainer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text('CREATE NEW KEY PAIR'),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                // NameTextField(
                //   txt: 'User Name (to Identify your Key)',
                // ),
                Container(
                  margin: EdgeInsets.only(left: 16.sp, top: 0.6.sp),
                  child: Text(
                    'Optional / Recommended',
                    style: TextStyle(
                        fontSize: 8.sp,
                        color: Color(0xff000000).withOpacity(0.60)),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                // NameTextField(
                //   txt: 'Personal (Private Key Name)',
                // ),
                Container(
                  margin: EdgeInsets.only(left: 16.sp, top: 0.6.sp),
                  child: Text(
                    'Optional / Recommended',
                    style: TextStyle(
                        fontSize: 8.sp,
                        color: Color(0xff000000).withOpacity(0.60)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 80.w),
                    child: Text(
                      'RSA',
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0xff6200EE)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                          'assets/baseline_enhanced_encryption_black_24dp.svg'),
                      Container(
                        margin: EdgeInsets.only(right: 18.w),
                        child: Text(
                          '2048 bits (default)',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xff000000).withOpacity(0.87)),
                        ),
                      ),
                      Radio(
                          value: 2048,
                          groupValue: bitsValues,
                          onChanged: (val) {
                            setState(() {
                              bitsValues = val!;
                              print(bitsValues);
                            });
                          })
                    ],
                  ),
                  Divider(
                    color: Color(0xff000000).withOpacity(0.12),
                    indent: 40.sp,
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                            'assets/baseline_enhanced_encryption_black_24dp.svg'),
                        Container(
                          margin: EdgeInsets.only(right: 38.w),
                          child: Text(
                            '3072 bits',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xff000000).withOpacity(0.87)),
                          ),
                        ),
                        Radio(
                            value: 3072,
                            groupValue: bitsValues,
                            onChanged: (val) {
                              setState(() {
                                bitsValues = val!;
                                print(bitsValues);
                              });
                            })
                      ],
                    ),
                    Divider(
                      color: Color(0xff000000).withOpacity(0.12),
                      indent: 40.sp,
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                          'assets/baseline_enhanced_encryption_black_24dp.svg'),
                      Container(
                        margin: EdgeInsets.only(right: 38.w),
                        child: Text(
                          '4096 bits ',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xff000000).withOpacity(0.87)),
                        ),
                      ),
                      Radio(
                          value: 4096,
                          groupValue: bitsValues,
                          onChanged: (val) {
                            setState(() {
                              bitsValues = val!;
                              print(bitsValues);
                            });
                          })
                    ],
                  ),
                  Divider(
                    color: Color(0xff000000).withOpacity(0.12),
                    indent: 40.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Valid until:',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff000000).withOpacity(0.60)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.scale(
                  scale: 1.sp,
                  child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      activeColor: Colors.blue,
                      side: BorderSide(
                        color: Color(0xff000000).withOpacity(0.38),
                        width: 2,
                      ),
                      value: ischeck,
                      onChanged: (val) {
                        setState(() {
                          ischeck = val!;
                        });
                      }),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 6.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Color(0xff000000).withOpacity(0.12),
                  )),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(bottom: 1.h, left: 8.sp),
                        hintText: 'YY/MM/DD (default not expire)',
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
            // Passphrase1(),
            PassphraseContainer2(),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctxx) => CreatingNewKeyPair())),
              child: PurpleButton(
                tittle: 'CREATE NEW KEY PAIR',
                icon: Icons.add,
              ),
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}
