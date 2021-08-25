import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intershiptasks/data/models/encryption_model.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/pointycastle.dart' as crypto;

class rsaEncryptDemo extends StatefulWidget {
  rsaEncryptDemo() : super();

  @override
  _rsaEncryptDemoState createState() => _rsaEncryptDemoState();
}

class _rsaEncryptDemoState extends State<rsaEncryptDemo> {
  TextEditingController tec = TextEditingController();
  var encryptedText;
  late String plainText = "", rsaEncrptText = "";
  var rsaDecryptText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text_Widget(
          text: "RSA Encrypt",
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
                child: Text(plainText == "" ? "" : plainText.toString()),
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
                child:
                    Text(encryptedText == null ? "" : rsaEncrptText.toString()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  plainText = tec.text;
                  rsaEncrypt(plainText);
                  //setState(() {
                  // encryptedText =
                  //     MyEncryptionDecryption.rsaEncryptRSA(plainText);
                  // print("djkldjkd" + encryptedText);
                  //});

                  tec.clear();
                  print("djkldjkld");
                },
                child: Text("Encrypt"),
              ),
              SizedBox(
                width: 15,
              ),
              RaisedButton(
                onPressed: () {
                  Decrypt();
                  // setState(() {
                  //   encryptedText =
                  //       MyEncryptionDecryption.rsaDecryptRSA(encryptedText);
                  //   print("Type: " + encryptedText.runtimeType.toString());
                  // });
                },
                child: Text("Decrypt"),
              )
            ],
          ),
        ],
      ),
    );
  }

  void rsaEncrypt(String plainText) async {
    final publicPem = await rootBundle.loadString('assets/public.pem');
    final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
    final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: publicKey));
    print(publicKey.hashCode);
    print(encrypter.hashCode);
    setState(() {
      encryptedText = encrypter.encrypt(plainText);
      rsaEncrptText = encryptedText.base64;
      print("RSA" + rsaEncrptText);
    });
  }

  // ignore: non_constant_identifier_names
  void Decrypt() async {
    final privatePem = await rootBundle.loadString('assets/private.pem');
    final privateKey = RSAKeyParser().parse(privatePem) as RSAPrivateKey;
    final encrypter = encrypt.Encrypter(encrypt.RSA(privateKey: privateKey));
    print(privateKey.hashCode);
    print(encrypter.hashCode);
    setState(() {
      rsaDecryptText = encrypter.decrypt(encryptedText);
      print(rsaEncrptText);
    });
  }
}
