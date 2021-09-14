import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openpgp/openpgp.dart';
import 'package:rsa_algoriyhm/helper/helper.dart';
import 'package:rsa_algoriyhm/shareprefences/shared_prefrence.dart';
import 'package:rsa_algoriyhm/view/maindecryption.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/appbarcontainer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

const passphrase = 'test';


class MainEncryption extends StatefulWidget {
  @override
  _MainEncryptionState createState() => _MainEncryptionState();
}

class _MainEncryptionState extends State<MainEncryption> {
  KeyPair? _defaultKeyPair;
  var encrypted;

  var db;
  List<String>? userNameFromdb = List.empty(growable: true);
  List allData = List.empty(growable: true);

  List<String>? _currencies = List.empty(growable: true);
  var pubKey;

  
  @override
  void initState() {
    // _currencies = userNameFromdb;
    super.initState();
    getData();
    // initKeyPair();
  }

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

  // Future<void> initKeyPair() async {
  //   var keyOptions = KeyOptions()..rsaBits = 2048;
  //   var keyPair = await OpenPGP.generate(
  //       options: Options()
  //         ..passphrase = passphrase
  //         ..keyOptions = keyOptions);
  //   print("my key pair ${keyPair.publicKey} ");
  //   setState(() {
  //     _defaultKeyPair = keyPair;
  //   });
  // }

  String? _currentSelectedValue;
  String enc = '';

  String _encrypted = "";



  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  child: Center(
                    child: Text(
                      'ENCRYPTION',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff6200EE),
                        fontWeight: FontWeight.w700,
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
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => MainDecryption()));
                    },
                    child: Center(
                      child: Text(
                        'DECRYPTION',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff000000).withOpacity(0.38),
                          fontWeight: FontWeight.w400,
                        ),
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
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff6200EE), width: 2),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  child: TextField(
                      onChanged: (value) {
                        enc = value;
                      },
                      decoration: InputDecoration(

                          // suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: 'Input text..|',
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                          ),
                          border: InputBorder.none)),
                ),
                Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(left: 1.w, right: 1.w),
                      color: Color(0xffF5F5F5),
                      child: Text(
                        'Plaintext',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6200EE),
                            fontSize: 12.sp),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.bottomCenter,
                        width: 54.5.w,
                        height: 7.h,
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                        // child: TextField(
                        //     decoration: InputDecoration(
                        //         suffixIcon: Icon(Icons.remove_red_eye),
                        //         hintText: 'Select...',
                        //         border: InputBorder.none)),

                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                // labelStyle: textStyle,
                                // errorStyle: TextStyle(
                                //     color: Colors.redAccent, fontSize: 16.0),
                                hintText: 'Please',
                                hintStyle: TextStyle(color: Colors.black),
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
                                          'Select...',
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
                                        items: _currencies!.map((value) {
                                          return DropdownMenuItem<String>(
                                            value: value.toString(),
                                            child: Text(
                                              value.toString(),
                                              style:
                                              TextStyle(color: Color(0xff000000)),
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
                        left: 30,
                        top: 12,
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 1.h, left: 1.w, right: 1.w),
                          color: Colors.white,
                          child: Text(
                            'Add recipient',
                            style: TextStyle(
                                color: Color(0xff000000), fontSize: 12.sp),
                          ),
                        )),
                  ],
                ),
                Container(
                  height: 8.h,
                  width: 30.w,
                  // margin: EdgeInsets.fromLTRB(30, 20, 20, 10),
                  margin: EdgeInsets.fromLTRB(1, 20, 1, 10),
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  decoration: BoxDecoration(
                    color: Color(0xff6200EE),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: GestureDetector(
                    onTap: () async {


                      var pkey;
                      var len;
                      if(_currentSelectedValue !=null){
                        pubKey  = await Databasehelper.instance.getPubKey(_currentSelectedValue!);
                         len = pubKey.toString().length;
                        pkey = pubKey.toString().substring(1, len-1).length;
                        print("pubKey ${ pubKey.toString().substring(1, len-1).length}");
                        // print("pubKey ${ pubKey}");
                      }
                      try {
                        var check;


                        allData.forEach((e) {
                          if(e['username'] == _currentSelectedValue){
                            check = e['publicKey'];
                            print("check  123 ${check}");
                          }

                          // print("check ${check}");
                          print("check ${check == pubKey.toString().substring(1, len)}");
                          // print(" pubKey ${pubKey.toString().substring(35, 540)}");
                        });
                        encrypted = await OpenPGP.encrypt(
                          enc,
                          check
                        );
                        setState(() {
                          _encrypted = encrypted;
                        });
                        print('something is working');
                        // UserPrefrences.setEnc(encrypted);
                      } catch (e) {
                        print("it's error $e");
                      }
                    },
                    child: Text(
                      'ENCRYPT',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
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
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF2F2F2), width: 2),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  child: TextField(
                      decoration: InputDecoration(border: InputBorder.none)),
                ),
                Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(left: 1.w, right: 1.w),
                      color: Color(0xffF5F5F5),
                      child: Text(
                        'Ciphertext'+'\n'+ _encrypted,
                        style: TextStyle(
                            color: Color(0xff000000), fontSize: 12.sp),
                      ),
                    )),
              ],
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
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: _encrypted)).then((_){
                        _scaffoldKey.currentState!.showSnackBar(
                            SnackBar(content:Text("Encrypted Text has been copied to clipboard")));
                      });
                    },
                    child: Center(
                      child: Text(
                        'COPY',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff000000).withOpacity(0.38),
                          fontWeight: FontWeight.w400,
                        ),
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
                      'SHARE',
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
                      'CLEAR ALL',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff000000).withOpacity(0.38),
                        fontWeight: FontWeight.w400,
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


