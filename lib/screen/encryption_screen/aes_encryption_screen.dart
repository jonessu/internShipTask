import 'package:flutter/material.dart';
import 'package:intershiptasks/data/models/encryption_model.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class aesEncrptDemo extends StatefulWidget {
  aesEncrptDemo({Key? key}) : super(key: key);

  @override
  _aesEncrptDemoState createState() => _aesEncrptDemoState();
}

class _aesEncrptDemoState extends State<aesEncrptDemo> {
  TextEditingController tec = TextEditingController();
  var encryptedText;
  late String plainText = "";
  @override
  Widget build(BuildContext context) {
    // futureKeyPair = getKeyPair();
    // futureKeyPair.then((value) {
    //   keyPair = value;

    //   encryptText =
    //       encrypt("jones", (keyPair.publicKey) as crypto.RSAPublicKey);
    //   print(encryptText);
    //   decryptText =
    //       decrypt(encryptText, (keyPair.privateKey) as crypto.RSAPrivateKey);
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text_Widget(
          text: "AES Encrypt",
          font_size: SizeResource.size20,
          colour: ColorResource.colorwhite,
          font_family: FontFamilyResource.PoppinsMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: tec,
            ),
          ),
          Column(
            children: [
              Text(
                "PLAIN TEXT",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(plainText == null ? "" : plainText),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "ENCRYPTED TEXT",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(encryptedText == null
                    ? ""
                    : encryptedText is encrypt.Encrypted
                        ? encryptedText.base64.toString()
                        : encryptedText.toString()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  plainText = tec.text;
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.aesEncryptAES(plainText);
                  });

                  tec.clear();
                },
                child: Text("Encrypt"),
              ),
              SizedBox(
                width: 15,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.aesDecryptAES(encryptedText);
                    print("Type: " + encryptedText.runtimeType.toString());
                  });
                },
                child: Text("Decrypt"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
