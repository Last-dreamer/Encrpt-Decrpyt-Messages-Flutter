import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openpgp/openpgp.dart';
import 'package:rsa_algoriyhm/helper/helper.dart';
import 'package:rsa_algoriyhm/shareprefences/shared_prefrence.dart';
import 'package:rsa_algoriyhm/view/creatingnewkeypair.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/purplebutton.dart';
import 'package:sizer/sizer.dart';
import 'package:date_format/date_format.dart';

class CreateNewKey extends StatefulWidget {
  @override
  _CreateNewKeyState createState() => _CreateNewKeyState();
}

class _CreateNewKeyState extends State<CreateNewKey> {
  bool ischeck = false;
  Object bitsValues = 2048;

  String expiryDatePicker = '';
  String username = '';
  String? passphrase;
  Databasehelper databasehelper = Databasehelper.instance;

  @override
  void initState() {
    // UserPrefrences.getBits();
    // UserPrefrences.getUser();
    databasehelper;
    // UserPrefrences.getValidation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
        actions: [
          ElevatedButton(
              onPressed: () {
                // print(
                //     "checking...  ${username} $bitsValues $expiryDatePicker  $passphrase ");
                databasehelper.queryall();
                // databasehelper.query();
                // UserPrefrences.getUser();
                // UserPrefrences.getBits();
                // UserPrefrences.getValidation();
                // UserPrefrences.getPassphrase();
              },
              child: Text('getdata'))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Enter Details',
                  style: TextStyle(
                      color: Colors.grey.shade600.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 8.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Color(0xff000000).withOpacity(0.12))),
                  child: TextField(
                    onChanged: (va) {
                      setState(() {
                        username = va;
                        // UserPrefrences.setUserName(username);
                        print(username);
                      });
                    },
                    decoration: InputDecoration(
                        // hintText: 'User Name (to Identify your Key )',
                        hintText: UserPrefrences.getUser() == null
                            ? 'Please Enter Username'
                            : UserPrefrences.getUser(),
                        hintStyle: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black.withOpacity(0.8)),
                        contentPadding: EdgeInsets.only(
                            top: 14.sp,
                            left: 15.sp,
                            bottom: 1.sp,
                            right: 15.sp),
                        border: InputBorder.none),
                  ),
                ),
                // NameTextField(txt: textEditingController),
                Padding(
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 3.w, top: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'RSA',
                              style: TextStyle(
                                  color: Color(0xFF6200EE),
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/baseline_enhanced_encryption_black_24dp.svg'),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            '2048 bits (default)',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Radio(
                              activeColor: Color((0xFF6200EE)),
                              value: 2048,
                              groupValue: bitsValues,
                              onChanged: (val) {
                                setState(() {
                                  bitsValues = val!;
                                  print(bitsValues.toString());
                                });
                              }),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
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
                          children: [
                            SvgPicture.asset(
                                'assets/baseline_enhanced_encryption_black_24dp.svg'),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text('3072 bits',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black.withOpacity(0.8),
                                    fontWeight: FontWeight.w600)),
                            Spacer(),
                            Radio(
                                activeColor: Color((0xFF6200EE)),
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
                          color: Colors.black,
                          indent: 40.sp,
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/baseline_enhanced_encryption_black_24dp.svg'),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            '4096 bits ',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Radio(
                              activeColor: Color((0xFF6200EE)),
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
                        color: Colors.black,
                        indent: 40.sp,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text(
                        "Valid Unit:",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              activeColor: Colors.blue,
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
                                border: Border.all(color: Colors.grey)),
                            child: InkWell(
                              onTap: () {
                                DatePicker.showDatePicker(context,
                                    onConfirm: (date) {
                                  setState(() {
                                    final datee = formatDate(
                                        date, [yyyy, '-', mm, '-', dd]);
                                    expiryDatePicker = datee;
                                    // UserPrefrences.setValidation(datee);
                                    print(expiryDatePicker);
                                  });
                                },
                                    theme: DatePickerTheme(
                                        doneStyle:
                                            TextStyle(color: Colors.white),
                                        cancelStyle:
                                            TextStyle(color: Colors.white),
                                        backgroundColor: Color(0xFF6200EE),
                                        itemStyle:
                                            TextStyle(color: Colors.white)));
                              },
                              child: Text(UserPrefrences.getValidation() == null
                                  ? 'YY/MM/DD(Default not expire)'
                                  : UserPrefrences.getValidation()),
                            ))
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 6.h,
                      margin: EdgeInsets.fromLTRB(30, 20, 20, 10),
                      padding: EdgeInsets.only(left: 15.sp, right: 5.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: TextField(
                          onSubmitted: (val) {
                            setState(() {
                              passphrase = val;
                              // UserPrefrences.setPassphrase(passphrase!);
                              print(passphrase);
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye),
                              hintText: '***********',
                              hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black.withOpacity(0.8)),
                              border: InputBorder.none)),
                    ),
                    Positioned(
                        left: 30.sp,
                        top: 9.sp,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 1.h, left: 10, right: 10),
                          color: Colors.white,
                          child: Text(
                            'Passphrase',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                        )),
                  ],
                ),
                PassphraseContainer2(),
                InkWell(
                  onTap: () async {
                    // UserPrefrences.setUserName(username);
                    // UserPrefrences.setBits(int.parse(bitsValues.toString()));
                    // UserPrefrences.setValidation(expiryDatePicker);

                    var keyOptions = KeyOptions()
                      ..rsaBits = int.parse(bitsValues.toString());
                    var keyPair = await OpenPGP.generate(
                        options: Options()
                          ..passphrase = passphrase
                          ..keyOptions = keyOptions);

                    UserPrefrences.setPubK(keyPair.publicKey);
                    // UserPrefrences.setPrivK(keyPair.privateKey);
                    // UserPrefrences.setPassphrase()

                    Map<String, dynamic> row = {
                      Databasehelper.userName: username,
                      Databasehelper.publicKey: keyPair.publicKey,
                      Databasehelper.privateKey: keyPair.privateKey,
                      Databasehelper.xdate: expiryDatePicker,
                      Databasehelper.passphrase: passphrase,
                    };
                    var db = Databasehelper.instance.insert(row);
                    print('success ${db}');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctxx) => CreatingNewKeyPair()));
                  },
                  child: PurpleButton(
                    tittle: 'CREATE NEW KEY PAIR',
                    icon: Icons.add,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                )
              ]),
        ),
      ),
    );
  }
}

// class Passphrase1 extends StatelessWidget {
//   @override
//   String? passphrase;

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class PassphraseContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 6.h,
          margin: EdgeInsets.fromLTRB(30, 20, 20, 10),
          padding: EdgeInsets.only(left: 15.sp, right: 5.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
          child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintStyle: TextStyle(
                      fontSize: 12.sp, color: Colors.black.withOpacity(0.8)),
                  hintText: '***********',
                  border: InputBorder.none)),
        ),
        Positioned(
            left: 30.sp,
            top: 9.sp,
            child: Container(
              padding: EdgeInsets.only(bottom: 1.h, left: 10, right: 10),
              color: Colors.white,
              child: Text(
                'Repeat Passphrase',
                style: TextStyle(
                    fontSize: 12.sp, color: Colors.black.withOpacity(0.8)),
              ),
            )),
      ],
    );
  }
}

// class NameTextField extends StatefulWidget {
//   TextEditingController txt = TextEditingController();
//   NameTextField({
//     required this.txt,
//   });

//   @override
//   _NameTextFieldState createState() => _NameTextFieldState();
// }

// // class _NameTextFieldState extends State<NameTextField> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //   }
// // }

class RadioFirst extends StatelessWidget {
  const RadioFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
