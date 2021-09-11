import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'keypaircreated.dart';

class CreatingNewKeyPair extends StatelessWidget {
  const CreatingNewKeyPair({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF6200EE),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Creating Key Pair...',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'The process to creating a key pair require large amounts of random numbers. This might take several minutes.',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              CircularProgressIndicator(
                color: Color(0xFF6200EE),
              ),
              SizedBox(
                height: 5.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => KeyPairCreated()));
                  },
                  child: Text('Next')),
            ],
          ),
        ),
      ),
    );
  }
}
