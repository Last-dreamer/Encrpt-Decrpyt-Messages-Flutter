import 'package:flutter/material.dart';
import 'package:rsa_algoriyhm/shareprefences/shared_prefrence.dart';

import 'package:rsa_algoriyhm/view/homepage.dart';
import 'package:rsa_algoriyhm/view/publickeyqrcode.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefrences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, o, t) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle:
                  TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w600)),
          // This is the theme of your application.
          fontFamily: 'Roboto',
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
