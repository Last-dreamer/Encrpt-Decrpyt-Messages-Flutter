import 'package:flutter/material.dart';
import 'package:rsa_algoriyhm/view/maindecryption.dart';
import 'package:sizer/sizer.dart';

class EncryptionScreen extends StatefulWidget {
  @override
  _EncryptionScreenState createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  String? _currentSelectedValue;

  var _currencies = [
    "osmething",
    "value 1",
    "value 2",
    "value 3",
    "value 4",
    "value 5",
    "value 6",
    "value 7"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.only(
          //         top: 5.h,
          //       ),
          //       height: 6.h,
          //       width: 20.h,
          //       decoration: BoxDecoration(
          //         color: Color(0xff6200EE).withOpacity(0.0),
          //         border: Border.all(
          //           color: Color(0xff000000).withOpacity(0.12),
          //         ),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Center(
          //         child: Text(
          //           'ENCRYPTION',
          //           style: TextStyle(
          //             fontSize: 14.sp,
          //             color: Color(0xff6200EE),
          //             fontWeight: FontWeight.w700,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.only(
          //         top: 5.h,
          //       ),
          //       height: 6.h,
          //       width: 20.h,
          //       decoration: BoxDecoration(
          //         color: Color(0xff6200EE).withOpacity(0.0),
          //         border: Border.all(
          //           color: Color(0xff000000).withOpacity(0.12),
          //         ),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (ctx) => MainDecryption()));
          //         },
          //         child: Center(
          //           child: Text(
          //             'DECRYPTION',
          //             style: TextStyle(
          //               fontSize: 14.sp,
          //               color: Color(0xff000000).withOpacity(0.38),
          //               fontWeight: FontWeight.w400,
          //             ),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
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
                    print(value);
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
                            child: DropdownButtonHideUnderline(
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
                                items: _currencies.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          TextStyle(color: Color(0xff000000)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      )),
                  Positioned(
                      left: 30,
                      top: 12,
                      child: Container(
                        padding:
                            EdgeInsets.only(bottom: 1.h, left: 1.w, right: 1.w),
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
                    child: Text(
                  'ENCRYPT',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
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
                      'Ciphertext',
                      style:
                          TextStyle(color: Color(0xff000000), fontSize: 12.sp),
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
    );
  }
}
