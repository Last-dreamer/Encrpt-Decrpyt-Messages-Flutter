import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openpgp/openpgp.dart';
import 'package:rsa_algoriyhm/helper/helper.dart';
import 'package:rsa_algoriyhm/shareprefences/shared_prefrence.dart';
import 'package:rsa_algoriyhm/view/mainencryption.dart';

import 'package:rsa_algoriyhm/view/repeatedeidget/appbarcontainer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MainDecryption extends StatefulWidget {
  const MainDecryption({Key? key}) : super(key: key);

  @override
  _MainDecryptionState createState() => _MainDecryptionState();
}


String passPhrase = '';
TextEditingController ciperTextController = TextEditingController();
TextEditingController decController = TextEditingController();
TextEditingController passController = TextEditingController();
String _decrypted = '';

class _MainDecryptionState extends State<MainDecryption> {
  String? _currentSelectedValue;


  String dec = '';

  var db;
  List<String>? userNameFromdb = List.empty(growable: true);
  List allData = List.empty(growable: true);

  List<String>? _currencies = List.empty(growable: true);
  var pubKey;

  Future getData() async {
    userNameFromdb = [];

    allData = [];
    db =  await Databasehelper.instance.queryall();
    db.forEach((element) {
      // _currencies =  element['username'];
      userNameFromdb!.add(element['username']);
      allData.add(element);
      // print("rows  ${element['username'].toString()}");
    });

    _currencies = userNameFromdb;
    print("it's all $_currencies");
  }


  @override
  void initState() {
    getData();
    super.initState();

  }

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 5.h,
                  ),
                  height: 6.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: Color(0xff6200EE).withOpacity(0.0),
                    border: Border.all(
                      color: Color(0xff000000).withOpacity(0.12),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => MainEncryption()));
                    },
                    child: Center(
                      child: Text(
                        'ENCRYPTION',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff000000).withOpacity(0.38),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5.h,
                  ),
                  height: 6.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: Color(0xff6200EE).withOpacity(0.0),
                    border: Border.all(
                      color: Color(0xff000000).withOpacity(0.12),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'DECRYPTIONS',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff6200EE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  height: 25.h,
                  margin: EdgeInsets.fromLTRB(30, 20, 20, 10),
                  padding: EdgeInsets.symmetric(horizontal: 5.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff6200EE), width: 2),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  child: TextField(
                    controller: ciperTextController,
                     maxLines: 100,
                      onChanged: (value) {
                        dec = value;
                      },
                      decoration: InputDecoration(
                          // suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: 'Ciphertext...',
                          hintStyle: TextStyle(
                            color: Color(0xff707070),
                          ),
                          border: InputBorder.none)),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //       '7532262427635482\$1224e1b1690703b83fd0ab6677c89a00dfce57fc2f345ebd2b2993bf0d8bb267449d08839213dc234dd23c7a181077e00080ced90weg09u3wegw4'),
                  // ),
                ),
                Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(left: 1.w, right: 1.w),
                      color: Color(0xffF5F5F5),
                      child: Text(
                        'Ciphertext',
                        style: TextStyle(
                            color: Color(0xff6200EE),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp),
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                Passphrase1(),
                Stack(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        width: 33.5.w,
                        height: 6.h,
                        margin: EdgeInsets.fromLTRB(13, 20, 20, 10),
                        padding: EdgeInsets.symmetric(horizontal: 11.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xff000000).withOpacity(0.12),
                              width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                // labelStyle: textStyle,
                                // errorStyle: TextStyle(
                                //     color: Colors.redAccent, fontSize: 16.0),
                                hintText: 'Please',
                                hintStyle: TextStyle(
                                    color: Color(0xff000000), fontSize: 12.sp),
                                hintMaxLines: 5,
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(5.0)),
                                border: InputBorder.none,
                              ),
                              // isEmpty: _currentSelectedValue == '',
                              child: FutureBuilder(
                                future: getData(),
                                builder: (context, snapshot) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Text(
                                        'Default',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 12.sp),
                                      ),

                                      value: _currentSelectedValue,
                                      isDense: true,
                                      // onChanged: (String newValue) {
                                      //   setState(() {
                                      //     _currentSelectedValue = newValue;
                                      //     state.didChange(newValue);
                                      //   });
                                      // },
                                      onChanged: (value1) {
                                        setState(() {
                                          _currentSelectedValue = value1;
                                          state.didChange(value1);
                                        });
                                      },
                                      items: _currencies!.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Color(0xff000000)
                                                    .withOpacity(0.74)),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                },
                              )
                            );
                          },
                        )),
                    Positioned(
                        left: 25,
                        top: 10,
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 10, left: 1.w, right: 1.w),
                          color: Colors.white60,
                          child: Text(
                            'Private Key',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.sp),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            Container(
              height: 6.h,
              width: 27.w,

              // margin: EdgeInsets.fromLTRB(30, 20, 20, 10),
              margin: EdgeInsets.fromLTRB(250, 3, 2, 10),
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              decoration: BoxDecoration(
                color: Color(0xff6200EE),
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () async {
                  // var pass = passPhrase == UserPrefrences.getPassphrase() ? 'success': 'failed';
                  // print("its pass $pass");
                  // print("its pass ${UserPrefrences.getPrivK()}");

                  var check;
                  var pass;
                  allData.forEach((e) {
                    if(e['username'] == _currentSelectedValue){
                      check = e['privateKey'];
                      pass = e['passphrase'];
                      print("check  123 ${check}");
                      print("passphrass  123 ${pass}");
                    }

                    // print(" pubKey ${pubKey.toString().substring(35, 540)}");
                  });
                  print('passPhrase ${passPhrase}');
                  if(passPhrase == pass){
                    print('getting here');
                    var decrypted = await OpenPGP.decrypt(
                      dec,
                      check,
                      pass,
                    );
                    print(' its decccc ${decrypted}');
                    setState(() {
                      _decrypted = decrypted;
                    });
                  }
                  print("its dec $dec");
                },
                child: Center(
                    child: Text(
                  'DECRYPT',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  height: 22.h,
                  margin: EdgeInsets.fromLTRB(30, 10, 20, 10),
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF2F2F2), width: 2),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  child: TextFormField(
                    controller: decController,
                      onChanged: (newValue) {
                        _decrypted = newValue;
                      },
                      maxLines: 100,
                      decoration: InputDecoration(border: InputBorder.none)),
                ),
                Positioned(
                    left: 50,
                    top: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 1.w, right: 1.w),
                      // color: Color(0xffF5F5F5),
                      child: Text(
                        'Plaintext ' + '\n' + _decrypted,
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'COPY',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 0.h, left: 2.h),
                //   height: 5.5.h,
                //   width: 13.h,
                //   decoration: BoxDecoration(
                //     color: Color(0xff6200EE).withOpacity(0.0),
                //     border: Border.all(
                //       color: Color(0xff000000).withOpacity(0.12),
                //     ),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Center(
                //     child: Text(
                //       'SHARE',
                //       style: TextStyle(
                //         fontSize: 12.sp,
                //         color: Color(0xff000000).withOpacity(0.38),
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 0.h, left: 2.h, right: 5.w),
                  height: 5.5.h,
                  width: 15.h,
                  decoration: BoxDecoration(
                    color: Color(0xff6200EE).withOpacity(0.0),
                    border: Border.all(
                      color: Color(0xff000000),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: GestureDetector(
                      onTap: () {
                       setState(() {
                         passPhrase = '';
                         passController.clear();
                         decController.clear();
                         ciperTextController.clear();
                         dec = '';
                         _decrypted = '';
                       });
                      },
                      child: Center(
                        child: Text(
                          'CLEAR ALL',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff000000).withOpacity(0.38),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Passphrase1 extends StatelessWidget {
  const Passphrase1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 50.w,
          height: 6.h,
          margin: EdgeInsets.fromLTRB(30, 20, 1, 10),
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xff000000).withOpacity(0.12), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
          child: TextField(
            onChanged: (value) {
              passPhrase = value;
            },
              controller: passController,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black, fontSize: 12.sp),
                  hintText: '***********',
                  border: InputBorder.none)),
        ),
        Positioned(
            left: 50,
            top: 12,
            child: Container(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              color: Colors.white60,
              child: Text(
                'Passphrase',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            )),
      ],
    );
  }
}
