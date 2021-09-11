import 'package:flutter/material.dart';
import 'package:rsa_algoriyhm/view/createnewkeypair.dart';
import 'package:rsa_algoriyhm/view/repeatedeidget/appbarcontainer.dart';
import 'package:sizer/sizer.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppBarContainer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text('SETTINGS'),
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: null,
                child: Text('SETTINGS',
                    style:
                        TextStyle(color: Color(0xff6200EE), fontSize: 14.sp))),
            TxtButton(
              txt: 'Your Keys',
              func: () => Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Settings())),
            ),
            TxtButton(
              txt: 'Delete existing keys',
              func: () => Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Settings())),
            ),
            TxtButton(
              txt: 'List all recipient keys',
              func: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => CreateNewKeyPair())),
            ),
            TxtButton(
              txt: 'Factory default app',
              func: () => Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Settings())),
            ),
          ],
        ),
      ),
    );
  }
}

class TxtButton extends StatelessWidget {
  final String? txt;
  final Function? func;
  const TxtButton({Key? key, this.txt, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => func,
        child: Text(
          txt!,
          style: TextStyle(fontSize: 14.sp, color: Color(0xff707070)),
        ));
  }
}
