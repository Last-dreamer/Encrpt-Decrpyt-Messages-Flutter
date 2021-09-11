import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:openpgp/openpgp.dart';
import 'package:rsa_algoriyhm/view/mainencryption.dart';

import 'shared/button_widget.dart';
import 'shared/input_widget.dart';
import 'shared/title_widget.dart';

class EncryptAndDecrypt extends StatefulWidget {

  const EncryptAndDecrypt({
    required KeyPair? keyPair,
  })  : keyPair = keyPair;

  final KeyPair? keyPair;

  @override
  _EncryptAndDecryptState createState() => _EncryptAndDecryptState();
}

class _EncryptAndDecryptState extends State<EncryptAndDecrypt> {
  String _encrypted = "";
  String _decrypted = "";





  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            InputWidget(
              title: "Encrypt",
              result: _encrypted,
              onPressed: (controller) async {
                try {
                  var encrypted = await OpenPGP.encrypt(
                    controller.text,
                    widget.keyPair!.publicKey,
                  );
                  setState(() {
                    _encrypted = encrypted;
                  });
                } catch (e) {
                  print(e);
                }
              },
            ),
            ButtonWidget(
              title: "Decrypt",
              key: Key("decrypt"),
              result: _decrypted,
              onPressed: () async {
                var decrypted = await OpenPGP.decrypt(
                  _encrypted,
                  widget.keyPair!.privateKey,
                  passphrase,
                );
                setState(() {
                  _decrypted = decrypted;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
